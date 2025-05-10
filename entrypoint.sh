#!/bin/bash
set -e

# Ensure SSH run directory exists
mkdir -p /var/run/sshd

# Start SSH daemon in foreground
exec /usr/sbin/sshd -D
