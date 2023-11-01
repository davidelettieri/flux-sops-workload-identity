FROM mcr.microsoft.com/devcontainers/base:bullseye

RUN export DEBIAN_FRONTEND=noninteractive \
    && curl -LO https://github.com/getsops/sops/releases/download/v3.8.1/sops-v3.8.1.linux.amd64 \
    && mv sops-v3.8.1.linux.amd64 /usr/local/bin/sops \
    && chmod +x /usr/local/bin/sops \
    && curl -LO https://dl.k8s.io/release/v1.26.6/bin/linux/amd64/kubectl
