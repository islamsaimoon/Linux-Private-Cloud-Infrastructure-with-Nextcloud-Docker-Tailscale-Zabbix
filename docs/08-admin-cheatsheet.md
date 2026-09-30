# 08 · Daily Administration Cheat Sheet

[← 07 · How It Works](07-how-it-works.md) · [🏠 Home](../README.md) · [📚 All guides](README.md) · [09 · Security & Gaps →](09-security-and-production-gaps.md)

---

## Stack control (run in `/opt/nextcloud`)

| Task | Command |
|---|---|
| Go to project | `cd /opt/nextcloud` |
| Stack status | `sudo docker compose ps` |
| All containers on the host | `sudo docker ps` |
| Start stack | `sudo docker compose up -d` |
| Stop and remove containers (data volumes and HDD files are kept) | `sudo docker compose down` |
| Restart everything | `sudo docker compose restart` |
| Restart app only | `sudo docker compose restart app` |
| Nextcloud logs | `sudo docker compose logs app` |
| Follow logs live (`-f`, Ctrl+C to exit) | `sudo docker compose logs -f app` |
| Database / Redis logs | `sudo docker compose logs db` · `sudo docker compose logs redis` |

> ⚠️ `docker compose down -v` also deletes named volumes (**including the database**). Never add `-v` unless you truly mean it.

## Storage and system

| Task | Command |
|---|---|
| Is the HDD mounted? | `findmnt /mnt/storage` |
| HDD capacity | `df -h /mnt/storage` |
| Nextcloud data size | `sudo du -sh /mnt/storage/nextcloud/data` |
| Memory | `free -h` |
| Listening ports | `sudo ss -tulpn` |
| Only the ports that matter here | `sudo ss -tulpn \| grep -E ':80\|:8080\|:10050\|:10051'` |

## Tailscale

| Task | Command |
|---|---|
| Status of the tailnet | `tailscale status` |
| This server's Tailscale IP | `tailscale ip -4` |

## Nextcloud `occ`

```bash
sudo docker exec -u www-data nextcloud-app php occ status
sudo docker exec -u www-data nextcloud-app php occ user:list
sudo docker exec -u www-data nextcloud-app php occ config:system:get trusted_domains
```

| Command | Purpose |
|---|---|
| `occ status` | Version, installed state, maintenance mode |
| `occ user:list` | All Nextcloud accounts |
| `occ config:system:get trusted_domains` | Which addresses Nextcloud accepts |

## One-shot health check

```bash
./scripts/healthcheck.sh
```


---

[← 07 · How It Works](07-how-it-works.md) · [🏠 Home](../README.md) · [📚 All guides](README.md) · [09 · Security & Gaps →](09-security-and-production-gaps.md)
