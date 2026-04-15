#!/usr/bin/env bash
set -euo pipefail

# ──────────────────────────────────────────────
# EduSmart — Build & Deploy to Local Server
#
# Prerequisites:
#   - SSH key auth (ssh-copy-id root@192.168.100.102)
#   - PM2 installed on server
#
# Usage: ./local-deploy.sh
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

SSH="ssh -o ConnectTimeout=10 ${REMOTE_USER}@${REMOTE_HOST}"

# ── Build ──────────────────────────────────────
log "Building for production..."
pnpm build
ok "Build complete ($(du -sh build/ | cut -f1))"

# ── Copy to server ─────────────────────────────
log "Copying to ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH} ..."
$SSH "mkdir -p ${REMOTE_PATH}"
scp -r build/* "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/"
ok "Files copied."

# ── Start with PM2 ────────────────────────────
log "Starting ${APP_NAME} on port ${PORT}..."
$SSH bash -s <<REMOTE
set -e
pm2 delete "${APP_NAME}" 2>/dev/null || true
pm2 serve "${REMOTE_PATH}" ${PORT} --spa --name "${APP_NAME}"
pm2 save
REMOTE
ok "PM2 started."

# ── Verify ─────────────────────────────────────
log "Verifying..."
sleep 2

STATUS=$($SSH "pm2 jlist" 2>/dev/null \
	| node -e "
		try {
			const apps = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
			const app = apps.find(a => a.name === '${APP_NAME}');
			console.log(app ? app.pm2_env.status : 'NOT_FOUND');
		} catch { console.log('PARSE_ERROR'); }
	" 2>/dev/null || echo "ERROR")

if [ "$STATUS" = "online" ]; then
	ok "PM2: online"
else
	die "PM2: ${STATUS} — debug: ssh ${REMOTE_USER}@${REMOTE_HOST} 'pm2 logs ${APP_NAME}'"
fi

HTTP_CODE=$($SSH "curl -s -o /dev/null -w '%{http_code}' http://localhost:${PORT}" 2>/dev/null || echo "000")

if [ "$HTTP_CODE" = "200" ]; then
	ok "HTTP 200 — site is live"
else
	warn "HTTP ${HTTP_CODE} — check: ssh ${REMOTE_USER}@${REMOTE_HOST} 'pm2 logs ${APP_NAME}'"
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  ${GREEN}http://${REMOTE_HOST}:${PORT}${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
