#!/usr/bin/env bash
set -euo pipefail

# ──────────────────────────────────────────────
# EduSmart — Build & Deploy to Local Server
# ──────────────────────────────────────────────

REMOTE_HOST="192.168.100.102"
REMOTE_USER="root"
REMOTE_PATH="/root/edusmart"
APP_NAME="edusmart"
PORT=3000

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()  { echo -e "${CYAN}[deploy]${NC} $1"; }
ok()   { echo -e "${GREEN}[ok]${NC} $1"; }
warn() { echo -e "${YELLOW}[warn]${NC} $1"; }
die()  { echo -e "${RED}[error]${NC} $1" >&2; exit 1; }

# ── Detect SSH auth method ────────────────────
SSH_CMD="ssh"
SCP_CMD="scp"

# Test if key-based auth works (no password needed)
if ssh -o BatchMode=yes -o ConnectTimeout=5 "${REMOTE_USER}@${REMOTE_HOST}" "echo ok" &>/dev/null; then
	log "SSH key auth detected."
else
	# Need password — use sshpass
	if ! command -v sshpass &>/dev/null; then
		die "sshpass not found. Install with: brew install hudochenkov/sshpass/sshpass"
	fi
	log "SSH key auth not available. Using password auth."
	echo -ne "${CYAN}[deploy]${NC} Enter password for ${REMOTE_USER}@${REMOTE_HOST}: "
	read -rs SSHPASS
	export SSHPASS
	echo ""
	SSH_CMD="sshpass -e ssh"
	SCP_CMD="sshpass -e scp"
fi

# Helper to run SSH commands
run_ssh() {
	$SSH_CMD -o StrictHostKeyChecking=accept-new "${REMOTE_USER}@${REMOTE_HOST}" "$@"
}

# ── Step 1: Build ──────────────────────────────
log "Building for production..."
pnpm build
ok "Build complete ($(du -sh build/ | cut -f1))"

# ── Step 2: Copy build to server ───────────────
log "Deploying to ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH} ..."
run_ssh "mkdir -p ${REMOTE_PATH}"
$SCP_CMD -r build/* "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/"
ok "Files copied."

# ── Step 3: Run with PM2 ──────────────────────
log "Starting ${APP_NAME} on port ${PORT} with PM2..."
run_ssh bash -s <<REMOTE
set -e

# Stop existing if running
pm2 delete "${APP_NAME}" 2>/dev/null || true

# Serve static site with PM2
pm2 serve "${REMOTE_PATH}" ${PORT} --spa --name "${APP_NAME}"
pm2 save

echo ""
pm2 status
REMOTE

ok "PM2 started."

# ── Step 4: Verify ─────────────────────────────
log "Verifying..."
sleep 2

# Check PM2 status
STATUS=$(run_ssh "pm2 jlist" 2>/dev/null \
	| node -e "
		try {
			const data = require('fs').readFileSync('/dev/stdin','utf8');
			const apps = JSON.parse(data);
			const app = apps.find(a => a.name === '${APP_NAME}');
			if (!app) { console.log('NOT_FOUND'); process.exit(0); }
			console.log(app.pm2_env.status);
		} catch(e) { console.log('PARSE_ERROR'); }
	" 2>/dev/null || echo "ERROR")

if [ "$STATUS" = "online" ]; then
	ok "PM2 status: ${STATUS}"
else
	die "PM2 status: ${STATUS}. SSH in to debug: pm2 logs ${APP_NAME}"
fi

# Check HTTP response
HTTP_CODE=$(run_ssh "curl -s -o /dev/null -w '%{http_code}' http://localhost:${PORT}" 2>/dev/null || echo "000")

if [ "$HTTP_CODE" = "200" ]; then
	ok "HTTP ${HTTP_CODE} — site is live"
else
	warn "HTTP ${HTTP_CODE} — may need a moment. Try: curl http://${REMOTE_HOST}:${PORT}"
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  ${GREEN}Live at http://${REMOTE_HOST}:${PORT}${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
