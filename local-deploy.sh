#!/usr/bin/env bash
set -euo pipefail

# ──────────────────────────────────────────────
# EduSmart — Local Server Deploy Script
# Builds locally, deploys to remote via SSH/SCP,
# and runs with PM2 in SPA mode.
# ──────────────────────────────────────────────

# Config
REMOTE_HOST="192.168.100.102"
REMOTE_USER="root"
REMOTE_PATH="/root/edusmart"
APP_NAME="edusmart"
PORT=3000
SSH_OPTS="-o BatchMode=no -o ConnectTimeout=10"
SCP_OPTS="-o BatchMode=no"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

log()  { echo -e "${CYAN}[deploy]${NC} $1"; }
ok()   { echo -e "${GREEN}[ok]${NC} $1"; }
warn() { echo -e "${YELLOW}[warn]${NC} $1"; }
die()  { echo -e "${RED}[error]${NC} $1" >&2; exit 1; }

# ── Step 1: Build ──────────────────────────────
log "Building EduSmart for production..."
pnpm build
ok "Build complete → ./build/"

BUILD_SIZE=$(du -sh build/ | cut -f1)
log "Build size: ${BUILD_SIZE}"

# ── Step 2: Test SSH connectivity ──────────────
log "Testing SSH connection to ${REMOTE_USER}@${REMOTE_HOST}..."
if ! ssh ${SSH_OPTS} "${REMOTE_USER}@${REMOTE_HOST}" "echo 'connected'" > /dev/null 2>&1; then
	die "Cannot connect to ${REMOTE_USER}@${REMOTE_HOST}. Check SSH access."
fi
ok "SSH connection established."

# ── Step 3: Prepare remote directory ───────────
log "Preparing remote directory ${REMOTE_PATH}..."
ssh ${SSH_OPTS} "${REMOTE_USER}@${REMOTE_HOST}" bash -s <<REMOTE_PREP
set -e
mkdir -p ${REMOTE_PATH}

# Check if Node.js is installed
if ! command -v node &>/dev/null; then
    echo "[remote] Installing Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
    apt-get install -y nodejs
fi

# Check if PM2 is installed
if ! command -v pm2 &>/dev/null; then
    echo "[remote] Installing PM2 globally..."
    npm install -g pm2 serve
fi

# Check if 'serve' is available
if ! command -v serve &>/dev/null; then
    echo "[remote] Installing serve globally..."
    npm install -g serve
fi

echo "[remote] Ready."
REMOTE_PREP
ok "Remote server prepared."

# ── Step 4: Copy build to remote ───────────────
log "Deploying build artifacts to ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}..."

# Use rsync if available (faster, incremental), fall back to scp
if command -v rsync &>/dev/null; then
	rsync -avz --delete ${SCP_OPTS} build/ "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/"
else
	# Clean remote first, then copy
	ssh ${SSH_OPTS} "${REMOTE_USER}@${REMOTE_HOST}" "rm -rf ${REMOTE_PATH}/*"
	scp -r ${SCP_OPTS} build/* "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/"
fi
ok "Files deployed to ${REMOTE_PATH}."

# ── Step 5: Start/restart with PM2 ─────────────
log "Starting ${APP_NAME} with PM2 on port ${PORT}..."
ssh ${SSH_OPTS} "${REMOTE_USER}@${REMOTE_HOST}" bash -s <<REMOTE_PM2
set -e

# Stop existing app if running
if pm2 describe ${APP_NAME} &>/dev/null; then
    echo "[remote] Stopping existing ${APP_NAME}..."
    pm2 stop ${APP_NAME}
    pm2 delete ${APP_NAME}
fi

# Start with PM2 serve (SPA mode)
cd ${REMOTE_PATH}
pm2 serve ${REMOTE_PATH} ${PORT} --spa --name "${APP_NAME}"

# Save PM2 process list for auto-restart on reboot
pm2 save

# Setup PM2 startup if not already configured
if [ ! -f /etc/systemd/system/pm2-root.service ]; then
    pm2 startup systemd -u root --hp /root 2>/dev/null || true
fi

echo ""
pm2 status
REMOTE_PM2

ok "Deployment complete!"
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  EduSmart is live!${NC}"
echo -e ""
echo -e "  URL:  ${CYAN}http://${REMOTE_HOST}:${PORT}${NC}"
echo -e ""
echo -e "  Manage with SSH:"
echo -e "    ssh ${REMOTE_USER}@${REMOTE_HOST}"
echo -e "    pm2 status          # check running apps"
echo -e "    pm2 logs ${APP_NAME}  # view logs"
echo -e "    pm2 restart ${APP_NAME} # restart"
echo -e "    pm2 stop ${APP_NAME}    # stop"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
