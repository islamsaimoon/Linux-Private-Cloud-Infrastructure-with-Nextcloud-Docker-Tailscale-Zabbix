#!/usr/bin/env bash
# preflight-check.sh - read-only server assessment BEFORE deploying anything.
# These are the same commands used in docs/01-server-baseline.md, in one place.
# It changes nothing on the system.
set -u

section() { printf '\n\033[1;34m=== %s ===\033[0m\n' "$1"; }

section "OS / kernel / architecture (hostnamectl)"
hostnamectl

section "Memory (free -h)"
free -h

section "Filesystem usage (df -h)"
df -h

section "Block devices and filesystems (lsblk -f)"
lsblk -f

section "Network addresses (ip addr)"
ip addr

section "Listening ports (ss -tulpn) - look for 80, 3306, 8080, 10050, 10051"
sudo ss -tulpn

section "Docker installed?"
if command -v docker >/dev/null 2>&1; then docker --version; else echo "Docker is not installed yet"; fi
