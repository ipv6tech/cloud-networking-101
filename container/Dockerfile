FROM debian:slim
LABEL maintainer="Scott Taylor <scott@ipv6tech.net>"
RUN apt-get update -y \
    && apt-get install -y \
    nano \
    curl \
    git \
    gh \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*