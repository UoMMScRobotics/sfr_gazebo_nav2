#!/bin/bash
set -e

# Install MoveIt 2 (https://moveit.ai/install-moveit2/binary/)
sudo apt-get install -y ros-jazzy-moveit

## Clone moveit tutorials. There's currently no "jazzy" branch (https://github.com/moveit/moveit2_tutorials/issues/1033)
# Not compatible with their own binaries. Needs build from source. Compilation error on arm64.
# cd "$HOME"/ros2_tutorial_workspace/src/external
# git clone -b main https://github.com/moveit/moveit2_tutorials
