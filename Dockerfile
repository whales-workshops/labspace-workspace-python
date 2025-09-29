FROM dockersamples/labspace-workspace-base:latest

USER root
# ------------------------------------
# Install Python
# ------------------------------------
RUN <<EOF
apt update
apt install -y software-properties-common curl
add-apt-repository ppa:deadsnakes/ppa -y
apt update
apt install -y python3.11 python3.11-venv python3.11-dev
rm -rf /var/lib/apt/lists/*
# Install pip manually for Python 3.11
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11 --break-system-packages
# Create symlinks
ln -sf /usr/bin/python3.11 /usr/bin/python
ln -sf /usr/local/bin/pip3.11 /usr/bin/pip
EOF

USER 1000
RUN code-server --install-extension orta.vscode-jest && \
    rm -rf /home/coder/.local/share/code-server/CachedExtensionVSIXs/.trash/*