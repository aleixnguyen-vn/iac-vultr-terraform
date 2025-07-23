#!/bin/bash
# Update & install docker and git
apt update
apt update && apt install -y ca-certificates curl gnupg lsb-release && mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && apt update && apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && usermod -aG docker $USER && newgrp docker

# Docker without sudo
usermod -aG docker root

# Clone the project repo
mkdir /home/deploy
git clone https://github.com/aleixnguyen-vn/docker-nginx-github.git /home/deploy
cd /home/deploy/ && mv .env.example .env


# Enable firewall
ufw allow ssh
ufw allow http
ufw --force enable
