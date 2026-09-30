# 11 · Troubleshooting

[← 10 · Roadmap](10-roadmap.md) · [🏠 Home](../README.md) · [📚 All guides](README.md) · [12 · Zabbix Monitoring →](12-zabbix-monitoring.md)

---

| Symptom | Likely cause | What to check / do |
|---|---|---|
| "Access through untrusted domain" | The address you typed isn't in `trusted_domains` | Add it with `occ config:system:set trusted_domains N --value="host:port"` ([guide](06-remote-access-tailscale.md)) |
| `docker compose up` fails with "port is already allocated" | Something else uses 8080 | `sudo ss -tulpn \| grep 8080`, then pick another host port in `compose.yaml` |
| Installer complains it can't write to the data directory | Wrong owner on the bind-mounted folder | `sudo chown -R 33:33 /mnt/storage/nextcloud/data` |
| Nextcloud can't reach the database | `db` not ready yet, or wrong values in `.env` | `sudo docker compose logs db`; check `MYSQL_*` values; the database host is `db`, not `localhost` |
| Files go to the system disk instead of the HDD | HDD not mounted when the container started | `findmnt /mnt/storage`; if missing run `sudo mount -a`, then `sudo docker compose restart app`. **Check this before uploading data** |
| Server boots but `/mnt/storage` is empty | Disk missing/failed (`nofail` let boot continue) | `lsblk -f`, `sudo dmesg \| tail`, re-check the UUID in `/etc/fstab` |
| Phone can't reach the Tailscale IP | Phone or server not connected | `tailscale status` on both; confirm the same account/tailnet |
| Can't reach Nextcloud from another LAN PC | Wrong IP (DHCP changed it) or firewall | `ip addr` on the server; consider a DHCP reservation |
| Password / `.env` changes not applied | Database was already initialised with the old values | Environment variables only seed the DB on **first** start; change passwords inside MariaDB, or recreate the volume (destroys data!) |


---

[← 10 · Roadmap](10-roadmap.md) · [🏠 Home](../README.md) · [📚 All guides](README.md) · [12 · Zabbix Monitoring →](12-zabbix-monitoring.md)
