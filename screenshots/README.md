# Screenshots

Real captures from the running lab, already redacted and embedded throughout [`../docs`](../docs). A couple of "nice to have" ones are still missing — add them here with the file names below if you'd like the docs to link them automatically.

## ✅ Already captured (and used in the docs)

| File | Used in | Shows |
|---|---|---|
| `02-storage.png` | [docs/02](../docs/02-storage-hdd.md) | `lsblk -f` + `df -h` — the mounted HDD |
| `04-docker-containers.png` | [docs/04](../docs/04-nextcloud-stack.md) | `docker compose ps` — all three containers `Up` |
| `05-nextcloud-dashboard.png` | [docs/04](../docs/04-nextcloud-stack.md) | Nextcloud dashboard after setup |
| `06-user-quota.png` | [docs/05](../docs/05-users-quotas.md) | Editing an account's quota |
| `06a-accounts-list.png` | [docs/05](../docs/05-users-quotas.md) | All four accounts and their quotas |
| `06b-quota-in-use.png` | [docs/05](../docs/05-users-quotas.md) | A user's quota bar in the Files app |
| `07-tailscale.png` | [docs/06](../docs/06-remote-access-tailscale.md) | Both devices connected to the tailnet |
| `08-mobile-access.jpg` | [docs/06](../docs/06-remote-access-tailscale.md) | Nextcloud open on a phone, over Tailscale |
| `09-zabbix-overview.png` | [docs/12](../docs/12-zabbix-monitoring.md) | Zabbix dashboard: version, free space, CPU, database |
| `10-zabbix-user-quotas.png` | [docs/12](../docs/12-zabbix-monitoring.md) | Per-user quota history in Zabbix |

## 🕳️ Still missing (optional)

| Priority | File name | What to capture | Used by |
|---|---|---|---|
| Medium | `01-server-info.png` | `hostnamectl` + `free -h` | [docs/01](../docs/01-server-baseline.md) |
| Medium | `03-fstab.png` | `/etc/fstab` with the new HDD line | [docs/02](../docs/02-storage-hdd.md) |
| Low | `11-nextcloud-setup-screen.png` | The Nextcloud installer with DB host `db` | [docs/04](../docs/04-nextcloud-stack.md) |

## 🔒 Privacy checklist before you publish a new one

Blur or crop **all** of the following:

- passwords, `.env` values, API keys, tokens
- e-mail addresses and account names (including in Tailscale, Zabbix and browser tabs)
- your real Tailscale IP / tailnet name and public IP
- private file names, customer or company data
- open browser tabs and bookmarks bars (they leak more than you expect)
- disk UUIDs, if you prefer not to publish them

Every screenshot already in this folder has had usernames, real e-mail addresses, disk UUIDs and Tailscale IPs blacked out before being committed — see the diffs in [`../CHANGELOG.md`](../CHANGELOG.md) if you're curious what was removed.

The diagrams in [`../images`](../images) are generated illustrations and contain no private data.
