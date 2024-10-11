FROM mcr.microsoft.com/devcontainers/base:bookworm
RUN apt-get update -y \
    && apt-get install -y \
    nano \
    curl \
    git \
    gh \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*