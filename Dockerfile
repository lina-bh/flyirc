FROM docker.io/tailscale/tailscale:latest AS tailscale
FROM ghcr.io/lina-bh/upgrade:latest AS upgrade
FROM docker.io/thelounge/thelounge:latest
USER 0
COPY --from=tailscale /usr/local/bin/tailscaled /usr/local/bin
COPY --from=tailscale /usr/local/bin/tailscale /usr/local/bin
COPY --from=upgrade /upgrade /usr/local/bin
COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD []
