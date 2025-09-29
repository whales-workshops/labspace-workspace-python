FROM dockersamples/labspace-workspace-base:latest

USER root
# ------------------------------------
# Install Python
# ------------------------------------
RUN <<EOF
apt update
apt install -y software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt update
apt install -y python3.11 python3.11-pip python3.11-venv python3.11-dev python3.11-distutils
rm -rf /var/lib/apt/lists/*
# Create symlinks
ln -sf /usr/bin/python3.11 /usr/bin/python
ln -sf /usr/bin/pip3.11 /usr/bin/pip
# Ensure ensurepip is available
python3.11 -m ensurepip --upgrade
EOF

USER 1000
RUN code-server --install-extension orta.vscode-jest && \
    rm -rf /home/coder/.local/share/code-server/CachedExtensionVSIXs/.trash/*