#!/usr/bin/env bash
# [🟨OPTIONAL] Uninstall old docker versions
sudo apt-get remove docker docker-engine docker.io containerd runc
# Refresh latest version
sudo apt-get update
# Install pre-req
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
# Add docker official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# x86 and amd_64 HERE WE CHANGE
echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
hirsute stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Install docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
# Give docker permissions
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Check version
docker --version

# Check if installed
sudo docker run hello-world

# If still fails, reboot OS

# Downloand docker compose stable
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable to binary
sudo chmod +x /usr/local/bin/docker-compose

# Check version
docker-compose --version
