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
    gnupg \
    software-properties-common \
    wget \
    sudo

RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null \
    && wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list \
    && sudo apt update -y \
    && sudo apt-get install terraform -y

RUN apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*