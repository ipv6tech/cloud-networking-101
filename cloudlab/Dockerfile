FROM debian:bookworm
LABEL maintainer="Scott Taylor <scott@ipv6tech.net>"
LABEL org.opencontainers.image.source = "https://github.com/ipv6tech/cloud-networking-101"
RUN apt-get update -y \
    && apt-get install -y \
    nano \
    curl \
    git \
    gh \
    awscli \
    azure-cli \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*