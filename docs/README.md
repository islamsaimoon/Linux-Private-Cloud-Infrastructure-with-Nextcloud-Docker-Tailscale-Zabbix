# 📚 Documentation Index

A step-by-step build log for the [Self-Hosted Nextcloud Private Cloud](../README.md) project. Read in order top to bottom, or jump straight to what you need — every page links to the one before and after it.

| # | Guide | Covers |
|---|---|---|
| 01 | [Server baseline](01-server-baseline.md) | Assessing the host before touching anything: `hostnamectl`, `free`, `df`, `lsblk`, `ip`, `ss` |
| 02 | [Storage & HDD mounting](02-storage-hdd.md) | Safe disk discovery, `/etc/fstab`, UUID mounts, `nofail` |
| 03 | [Docker installation](03-docker-install.md) | Installing Docker + Compose, the `hello-world` test |
| 04 | [Nextcloud stack](04-nextcloud-stack.md) | `compose.yaml`, bind mounts vs. volumes, first login |
| 05 | [Users & quotas](05-users-quotas.md) | Creating accounts, setting quotas, logical vs. physical capacity |
| 06 | [Remote access with Tailscale](06-remote-access-tailscale.md) | VPN access, `trusted_domains`, mobile verification |
| 07 | [How it works](07-how-it-works.md) | The upload flow, why Linux, why Docker |
| 08 | [Admin cheat sheet](08-admin-cheatsheet.md) | Daily commands, all in one place |
| 09 | [Security & production gaps](09-security-and-production-gaps.md) | What's missing before this could be "production" |
| 10 | [Roadmap](10-roadmap.md) | What's done, what's next |
| 11 | [Troubleshooting](11-troubleshooting.md) | Common errors and fixes |
| 12 | [Zabbix monitoring](12-zabbix-monitoring.md) | Watching Nextcloud (version, free space, quotas) from the existing Zabbix server |

**Diagrams:** all referenced inline, also browsable directly in [`../images`](../images).
**Real screenshots:** in [`../screenshots`](../screenshots), with a privacy checklist for anyone forking this.

[← Back to the main README](../README.md)
