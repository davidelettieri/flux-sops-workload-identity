FROM mcr.microsoft.com/devcontainers/base:bullseye

RUN export DEBIAN_FRONTEND=noninteractive \
    && curl -LO https://github.com/getsops/sops/releases/download/v3.10.2/sops-v3.10.2.linux.amd64 \
    && mv sops-v3.10.2.linux.amd64 /usr/local/bin/sops \
    && chmod +x /usr/local/bin/sops \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
