#!/bin/bash
sudo apt-get update -y &&
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
fonts-powerline \
gh \
git \
finger \
neofetch \
glances \
net-tools \
gnupg \
parted \
htop \
mtr \
ncdu \
tmux \
whois \
gnupg2 \
unzip \
cloud-guest-utils \
lsof \
netcat-openbsd \
dnsutils \
nmap \
gnupg-agent \
software-properties-common &&
sudo hostnamectl set-hostname i2lab-aws