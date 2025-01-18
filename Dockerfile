FROM debian:bookworm-slim

# Define the map of tools as environment variables
ENV TOOLS="getsops/sops:sops siderolabs/talos:talosctl budimanjojo/talhelper:talhelper truecharts/public:clustertool go-task/task:task fluxcd/flux2:flux"

# Install dependencies, nanolayer, and tools in a single RUN command
RUN apt update && apt -y upgrade && apt install -y curl git && \
    # install nanolayer
    curl -sfL https://github.com/devcontainers-extra/nanolayer/releases/download/v0.5.6/nanolayer-x86_64-unknown-linux-gnu.tgz | tar fxvz - -C /usr/local/bin && \
    chmod 700 /usr/local/bin/nanolayer && \
    # install helm
    curl -fsSL -o /tmp/get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 /tmp/get_helm.sh && \
    /tmp/get_helm.sh && \
    rm /tmp/get_helm.sh && \
    # install kubectl
    curl -LO --output-dir /usr/local/bin "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod 700 /usr/local/bin/kubectl

# Copy the install script
COPY ./scripts/install_nanolayer_tools.sh /usr/local/bin/install_nanolayer_tools.sh
RUN chmod +x /usr/local/bin/install_nanolayer_tools.sh

# Run the install script
RUN /usr/local/bin/install_nanolayer_tools.sh
