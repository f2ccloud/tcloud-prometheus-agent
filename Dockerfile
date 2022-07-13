FROM docker.io/bitnami/minideb:bullseye
ENV HOME="/" \
    OS_ARCH="amd64" \
    OS_FLAVOUR="debian-11" \
    OS_NAME="linux"

COPY entrypoint.sh /entrypoint.sh
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Install required system packages and dependencies
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && install_packages ca-certificates curl wget
RUN wget "https://rig-1258344699.cos.ap-guangzhou.myqcloud.com/prometheus-agent/prometheus-agent" -O /usr/bin/prometheus && \
    chmod +x /usr/bin/prometheus && \
    mkdir /etc/prometheus && chown -R 1001:1001 /etc/prometheus && \
    mkdir -p /var/queue && chown -R 1001:1001 /var/queue

EXPOSE 9090

WORKDIR /etc/prometheus
USER 1001
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD ["/entrypoint.sh"]
