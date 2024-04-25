#!/bin/bash

echo -e "\033[1;34m----------------------------------------\033[0m"
echo -e "\033[1;32mStarting ROS2 Environment \033[0m"
echo -e "\033[1;34m----------------------------------------\033[0m"

ROS2_WS_DIR="/home/ros2_user/ros2_ws"

# Source the ROS2 distribution setup
echo -e "\033[1;33mSourcing ROS2 distribution environment...\033[0m"
source /opt/ros/humble/setup.bash

# Build the Retain Interface with colcon
echo -e "\033[1;33mBuilding Retain Interface. This may take a few minutes...\033[0m"
colcon build --symlink-install --packages-select retainvil_interfaces
echo -e "\033[1;32mBuilding complete!\033[0m\n"

# Source the ROS2 customlized setup
echo -e "\033[1;33mSourcing ROS2 environment...\033[0m"
SOURCE_FILE="$ROS2_WS_DIR/install/setup.bash"
if [ -f "$SOURCE_FILE" ]; then
  source "$SOURCE_FILE"
  echo -e "\033[1;32mROS2 environment sourced successfully!\033[0m\n\n\n"
else
  echo -e "\033[1;31mError: ROS2 environment file not found at $SOURCE_FILE. Exiting.\033[0m"
  exit 1
fi

# Change to the ROS2 workspace directory
echo -e "\033[1;33mChanging to ROS2 workspace directory...\033[0m"
cd $ROS2_WS_DIR
