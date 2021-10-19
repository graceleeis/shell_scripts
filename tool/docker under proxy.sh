#!/usr/bin/env bash
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo touch /etc/systemd/system/docker.service.d/proxy.conf
echo \
"[Service]
Environment="HTTP_PROXY=http://proxy.example.com:8080/"
Environment="HTTPS_PROXY=http://proxy.example.com:8080/"
Environment="NO_PROXY=localhost,127.0.0.1,.example.com"\ " > /etc/systemd/system/docker.service.d/proxy.conf

sudo systemctl daemon-reload
sudo systemctl restart docker

