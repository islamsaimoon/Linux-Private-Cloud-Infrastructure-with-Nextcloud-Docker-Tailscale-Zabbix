#!/usr/bin/env bash
# healthcheck.sh - quick daily look at the private cloud. Read-only.
# Usage: ./scripts/healthcheck.sh
set -u
STORAGE_MOUNT="/mnt/storage"
DATA_DIR="/mnt/storage/nextcloud/data"
APP_CONTAINER="nextcloud-app"

ok()   { printf '\033[32m[ OK ]\033[0m %s\n' "$1"; }
fail() { printf '\033[31m[FAIL]\033[0m %s\n' "$1"; }

# 1. HDD mounted?
if findmnt -rn "$STORAGE_MOUNT" >/dev/null; then ok "HDD mounted at $STORAGE_MOUNT"; else fail "HDD NOT mounted at $STORAGE_MOUNT"; fi

# 2. Disk usage
df -h "$STORAGE_MOUNT" | tail -1 | awk '{printf "       size %s, used %s, free %s (%s used)\n",$2,$3,$4,$5}'
[ -d "$DATA_DIR" ] && sudo du -sh "$DATA_DIR" | awk '{print "       Nextcloud data: "$1}'

# 3. Containers running?
for c in nextcloud-app nextcloud-db nextcloud-redis; do
  if [ "$(sudo docker inspect -f '{{.State.Running}}' "$c" 2>/dev/null)" = "true" ]; then ok "container $c running"; else fail "container $c not running"; fi
done

# 4. Web port answering?
code=$(curl -s -o /dev/null -w '%{http_code}' http://localhost:8080/status.php || true)
if [ "$code" = "200" ]; then ok "http://localhost:8080/status.php -> 200"; else fail "port 8080 returned HTTP $code"; fi

# 5. Nextcloud's own status
sudo docker exec -u www-data "$APP_CONTAINER" php occ status 2>/dev/null || fail "occ status failed"

# 6. Tailscale
if command -v tailscale >/dev/null; then tailscale status | head -3; fi
