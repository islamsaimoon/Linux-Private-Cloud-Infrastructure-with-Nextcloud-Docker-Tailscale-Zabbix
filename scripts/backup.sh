#!/usr/bin/env bash
# backup.sh - STARTER backup script (roadmap item, see docs/10-roadmap.md).
# STATUS: example only. It has NOT been restore-tested. A backup is not proven
# until a restore works - do that test before trusting it.
#
# Backs up: MariaDB dump + Nextcloud config volume + user data.
# Destination should be a DIFFERENT disk/machine than /dev/sdb1 (RAID is not backup).
set -euo pipefail

DEST="${1:?Usage: $0 /path/to/backup/destination}"
STAMP="$(date +%F_%H%M)"
OUT="$DEST/nextcloud-$STAMP"
PROJECT_DIR="/opt/nextcloud"
mkdir -p "$OUT"

cd "$PROJECT_DIR"
set -a; . ./.env; set +a

echo "[1/4] Maintenance mode ON (consistent snapshot)"
sudo docker exec -u www-data nextcloud-app php occ maintenance:mode --on

echo "[2/4] Database dump"
sudo docker exec nextcloud-db sh -c \
  'mariadb-dump --single-transaction -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' \
  | gzip > "$OUT/db.sql.gz"

echo "[3/4] Config + app volume, user data"
sudo docker run --rm -v nextcloud_html:/src:ro -v "$OUT":/dst alpine \
  tar czf /dst/nextcloud_html.tar.gz -C /src .
sudo rsync -a /mnt/storage/nextcloud/data/ "$OUT/data/"

echo "[4/4] Maintenance mode OFF"
sudo docker exec -u www-data nextcloud-app php occ maintenance:mode --off

echo "Backup written to $OUT"
