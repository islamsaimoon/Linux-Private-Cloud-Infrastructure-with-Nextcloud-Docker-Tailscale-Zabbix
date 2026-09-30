# 01 · Server Baseline & Pre-Deployment Assessment

[🏠 Home](../README.md) · [📚 All guides](README.md) · [02 · Storage & HDD →](02-storage-hdd.md)

---

> **Golden rule of sysadmin work:** understand the machine *before* you change it.

The server already ran Zabbix, so the first job was to find out what was on it and what would conflict with a new service.

## What I found

| Item | Observed value |
|---|---|
| Operating system | Zorin OS 18.1 |
| Kernel | Linux 7.0.0-31-generic |
| Architecture | x86-64 |
| RAM | ~7.6 GiB |
| System disk | ~223.6 GB (`/dev/sda`) |
| Storage HDD | ~931.5 GB (`/dev/sdb`) |
| LAN address during setup | `192.168.x.x/23` (DHCP) |
| Web server | Apache on port **80** |
| Database | MariaDB on `localhost:3306` |
| Zabbix server / agent | TCP **10051** / **10050** |
| SSH / XRDP | TCP **22** / **3389** |

### Why this mattered

Apache already owned port 80 and MariaDB already served Zabbix. Installing Nextcloud straight onto the host would risk port clashes and dependency/database conflicts with a working monitoring system. That finding drove the main design decision: **run Nextcloud in Docker** (see [`docs/07-how-it-works.md`](07-how-it-works.md)).

## Commands used

```bash
hostnamectl
free -h
df -h
lsblk
ip addr
sudo ss -tulpn
docker --version
```

| Command | What it does | Why I ran it |
|---|---|---|
| `hostnamectl` | Prints hostname, OS, kernel and architecture | Confirm the platform (Zorin OS, x86-64) |
| `free -h` | Shows RAM and swap. `-h` = human-readable (GiB/MiB) | Check the box has enough memory for three more containers |
| `df -h` | Shows used/free space per mounted filesystem | See how full the system disk is |
| `lsblk` | Lists block devices (disks, partitions) as a tree | Find the spare 1 TB HDD (`sdb`) |
| `ip addr` | Shows network interfaces and IP addresses | Learn the LAN address used to open Nextcloud |
| `sudo ss -tulpn` | Lists listening sockets. **t**cp, **u**dp, **l**istening only, show **p**rocess, **n**umeric ports (no name lookup). `sudo` is needed to see other users' processes | Find used ports (80, 3306, 10050, 10051…) so 8080 could be chosen safely |
| `docker --version` | Prints the Docker version if installed | Decide whether Docker had to be installed |

> **Tip:** `scripts/preflight-check.sh` runs all of these read-only in one go.


---

[🏠 Home](../README.md) · [📚 All guides](README.md) · [02 · Storage & HDD →](02-storage-hdd.md)
