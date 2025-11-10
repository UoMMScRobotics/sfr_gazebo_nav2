#!/bin/bash
set -e

## Create ros2_tutorial_workspace external
mkdir -p "$HOME"/ros2_tutorial_workspace/src/external

## Add ros_gz_project_template
#### Clone repository
cd "$HOME"/ros2_tutorial_workspace/src/external
git clone --depth 1 https://github.com/gazebosim/ros_gz_project_template.git

# Build external examples
source /opt/ros/jazzy/setup.bash
cd "$HOME"/ros2_tutorial_workspace
export GZ_VERSION=harmonic
colcon build
rm -rf build log

# Add env to bash_rc
echo "# Add GZ_VERSION for ros_gz_project_template" > "$HOME"/.bashrc
echo "export GZ_VERSION=harmonic" > "$HOME"/.bashrc
