# 09 · Security, Backup & Production Gaps

[← 08 · Admin Cheat Sheet](08-admin-cheatsheet.md) · [🏠 Home](../README.md) · [📚 All guides](README.md) · [10 · Roadmap →](10-roadmap.md)

---

This is a **learning lab / personal-use** deployment. It should **not** yet be described as a production or commercial storage service. Being honest about the gaps is part of doing the project professionally.

| Area | Current lab | Recommended improvement |
|---|---|---|
| Web encryption | HTTP on `:8080`, reached over Tailscale (the tunnel itself is encrypted) | HTTPS with a trusted certificate behind a reverse proxy |
| Storage redundancy | Single HDD | Mirrored storage (RAID1) **plus** independent backups |
| Backups | Not yet automated | Database + config + user-data backups with restore tests |
| Public exposure | None (private Tailscale access only) | If ever public: hardened reverse proxy, firewall, rate limiting, monitoring |
| Disk health | Checked manually | SMART monitoring with alerts |
| Power protection | Not covered | UPS with graceful shutdown |
| Monitoring | Zabbix exists | Add Docker, Nextcloud, database, disk and endpoint checks |
| Secrets | Local `.env` (mode 600) | Proper secret management and rotation |

> **RAID is not a backup.** A mirror protects availability against some disk failures. Backups protect against deletion, corruption, ransomware and configuration mistakes.

## Good practices already followed

- Baseline inspected before any change; existing data on the HDD was preserved.
- `nofail` on the data-disk mount and `--verify` before `mount -a`.
- Only one port published; database and cache not reachable from the network.
- No router port forwarding; remote access only through Tailscale.
- Secrets kept out of Git (`.env` ignored, `.env.example` committed).
- Nextcloud's `trusted_domains` protection kept enabled and extended deliberately.


---

[← 08 · Admin Cheat Sheet](08-admin-cheatsheet.md) · [🏠 Home](../README.md) · [📚 All guides](README.md) · [10 · Roadmap →](10-roadmap.md)
