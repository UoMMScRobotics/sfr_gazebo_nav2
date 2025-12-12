#!/bin/bash
set -e

# Update and upgrade apt-get
sudo apt-get update
sudo apt-get upgrade -y

# https://ros2-tutorial.readthedocs.io/en/latest/cybersecurity/cryptography.html
sudo apt-get install -y age

# Remove APT files
rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
