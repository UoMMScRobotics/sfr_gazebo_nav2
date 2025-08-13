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

## Create ros2_tutorial_workspace external
mkdir -p "$HOME"/ros2_tutorial_workspace/src/external

## Add ros_gz_project_template
#### Clone repository
cd "$HOME"/ros2_tutorial_workspace/src/external
git clone --depth 1 https://github.com/gazebosim/ros_gz_project_template.git

# Install nav2 (https://docs.nav2.org/getting_started/index.html)
sudo apt-get install -y ros-jazzy-navigation2
sudo apt-get install -y ros-jazzy-nav2-bringup
sudo apt-get install -y ros-jazzy-nav2-minimal-tb*

# Install MoveIt 2 (https://moveit.ai/install-moveit2/binary/)
sudo apt-get install -y ros-jazzy-moveit

## Clone moveit tutorials. There's currently no "jazzy" branch (https://github.com/moveit/moveit2_tutorials/issues/1033)
cd "$HOME"/ros2_tutorial_workspace/src/external
git clone -b main https://github.com/moveit/moveit2_tutorials

# Build external examples
source /opt/ros/jazzy/setup.bash
cd "$HOME"/ros2_tutorial_workspace
export GZ_VERSION=harmonic
colcon build
rm -rf build log

# Add env to bash_rc
echo "# Add GZ_VERSION for ros_gz_project_template" > "$HOME"/.bashrc
echo "export GZ_VERSION=harmonic" > "$HOME"/.bashrc

# Remove APT files
rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
