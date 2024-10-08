FROM mcr.microsoft.com/devcontainers/base:bookworm
RUN apt-get update -y \
    && apt-get install -y \
    nano \
    nmap \
    inetutils-ping \
    traceroute \
    ncdu \
    curl \
    git \
    net-tools\
    mtr \
    tmux \
    gh \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*