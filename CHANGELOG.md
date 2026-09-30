# Changelog

All notable changes to this lab are recorded here, newest first.
Format loosely follows [Keep a Changelog](https://keepachangelog.com/).

## [Unreleased]
### Planned
- HTTPS with a reverse proxy and clean hostname
- Automated backups (MariaDB dump + config + user data) and a documented restore test
- SMART disk-health monitoring for `/dev/sdb`
- Per-container Docker health checks and an HTTP check on port 8080 from Zabbix
- Firewall review for LAN / Tailscale access

## [1.1.0] - Zabbix monitoring added
### Added
- Zabbix host "Nextcloud Private Cloud" added to the existing Zabbix server
- Overview dashboard: version, web server, free space, database, active users, CPU load
- Per-user quota-history dashboard for all four accounts
- Real screenshots and full documentation added for every stage of the build (`docs/`, `screenshots/`)
- New "Ports & Services Map" diagram

## [1.0.0] - Lab v1 (working private cloud)
### Added
- Server baseline assessment (OS, RAM, disks, ports) before any change
- Dedicated ext4 HDD (`/dev/sdb1`) mounted at `/mnt/storage` by UUID with `nofail`
- Docker Engine + Docker Compose v2
- Nextcloud stack: `nextcloud:apache`, `mariadb:11.4`, `redis:7-alpine`
- User data bind-mounted from `/mnt/storage/nextcloud/data`
- Admin + test user with a 1 GB quota
- Tailscale remote access from phone, Tailscale address added to `trusted_domains`
- Coexistence with the existing Zabbix / Apache / MariaDB services (no port conflicts)
