# 03 · Docker & Docker Compose Installation

[← 02 · Storage & HDD](02-storage-hdd.md) · [🏠 Home](../README.md) · [📚 All guides](README.md) · [04 · Nextcloud Stack →](04-nextcloud-stack.md)

---

## 3.1 Install Docker

```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable --now docker
docker --version
```

| Command | What it does |
|---|---|
| `apt update` | Refreshes the list of available packages (installs nothing) |
| `apt install docker.io -y` | Installs Docker Engine from the Ubuntu-based repositories. `-y` answers "yes" to the confirmation prompt |
| `systemctl enable --now docker` | `enable` = start Docker at every boot; `--now` = also start it right now |
| `docker --version` | Confirms the client is installed |

> `docker.io` is the package name in Debian/Ubuntu repositories. Docker Inc. also publishes its own `docker-ce` packages; this lab uses the distribution package for simplicity.

### Test the whole Docker pipeline

```bash
sudo docker run --rm hello-world
```

| Part | Meaning |
|---|---|
| `docker run` | Create and start a container |
| `--rm` | Delete the container automatically when it exits |
| `hello-world` | A tiny official test image |

Seeing **"Hello from Docker!"** proves the client, the daemon, image pulling and container execution all work.

## 3.2 Install Docker Compose

```bash
sudo apt install docker-compose-v2 -y
docker compose version
```

Compose lets you describe a multi-container application in one file (`compose.yaml`) and manage it with one command.

**Versions observed in this lab:** Docker `29.1.3`, Docker Compose `2.40.3`.


---

[← 02 · Storage & HDD](02-storage-hdd.md) · [🏠 Home](../README.md) · [📚 All guides](README.md) · [04 · Nextcloud Stack →](04-nextcloud-stack.md)
