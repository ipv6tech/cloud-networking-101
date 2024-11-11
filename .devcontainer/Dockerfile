FROM mcr.microsoft.com/devcontainers/base:bookworm

LABEL org.opencontainers.image.authors="Scott Taylor <scott@ipv6tech.net>"

#LABEL org.opencontainers.image.source="https://github.com/ipv6tech/cloud-networking-101"

# Install required packages
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
    apt-transport-https \ 
    ca-certificates \
    wget \
    pipx \
    sudo

#Install Opentofu
RUN curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh \
    && chmod +x install-opentofu.sh \
    && ./install-opentofu.sh --install-method deb \
    && rm -f install-opentofu.sh

# Install Terraform
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

# Install gcloud cli
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | \
    sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
    sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && sudo apt-get update -y \
    && sudo apt-get install google-cloud-sdk -y

# Change default shell to zsh
RUN chsh -s /bin/zsh vscode

USER vscode

# Install OCI CLI
RUN sudo apt install pipx -y \
    && pipx install oci-cli

# Clean up
RUN sudo apt-get clean -y \
    && sudo rm -rf /var/lib/apt/lists/*