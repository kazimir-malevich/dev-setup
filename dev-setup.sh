#!/bin/bash

# Update and upgrade system
sudo apt update 
sudo apt upgrade -y

# Install packages 
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
   
# Add PPA and install Helix editor
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix

# Install JDK 11
sudo apt install openjdk-11-jdk -y

# Install git
sudo apt install git -y

# Install chromium browser
sudo apt install chromium-browser -y

sudo apt autoremove
