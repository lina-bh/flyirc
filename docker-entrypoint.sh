#!/bin/sh
TS_STATE_DIR=/var/opt/thelounge/tailscale
mkdir -p "$TS_STATE_DIR"
tailscaled --statedir="$TS_STATE_DIR" --tun=userspace-networking &
upgrade ':8080' &
thelounge start
