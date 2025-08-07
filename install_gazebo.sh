#!/bin/bash
set -e

# https://gazebosim.org/docs/harmonic/install_ubuntu/
sudo apt-get update
sudo apt-get install -y curl lsb-release gnupg

# Install gazebo harmonic (https://gazebosim.org/docs/harmonic/install/)
sudo curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
sudo apt-get update
sudo apt-get install -y gz-harmonic

## Install pairing ROS pairing libraries
sudo apt-get install -y ros-jazzy-ros-gz

# Install nav2 (https://docs.nav2.org/getting_started/index.html)
sudo apt install ros-jazzy-navigation2
sudo apt install ros-jazzy-nav2-bringup
sudo apt install ros-jazzy-nav2-minimal-tb*

# Remove APT files
rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
