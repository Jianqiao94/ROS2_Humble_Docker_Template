# ROS2 Humble Docker Template

This repository provides an easy-to-use Docker template to set up a ROS2 Humble environment. The template is organized into two main directories: `ros2_ws` and `docker`.

## Repository Structure

- **docker/**: This directory contains Docker-related files.
  - **Dockerfile**: This file defines the Docker image, based on the ROS2 Humble distribution. It sets up a predefined user (`ros2_user`) and a working directory (`~/ros2_ws`).
  - **build_image.sh**: This script builds the Docker image, tagging it as `ros2_image`.
  - **run_container.sh**: This script runs a Docker container from the `ros2_image`, naming the container `ros2_container`.
  - **shell_container.sh**: This script opens a new shell session in the running `ros2_container`. This is useful for opening multiple terminal sessions inside the same container.

- **ros2_ws/**: This directory is a placeholder for your ROS2 workspace. Place your ROS2 packages here, and they will be accessible from within the Docker container.

## Usage Guide

1. **Building the Docker Image**: Navigate to the `docker` directory and execute the `build_image.sh` script with `sudo ./build_image.sh`.

2. **Running the Docker Container**: From the `docker` directory, run the `run_container.sh` script to start the Docker container with `sudo ./run_container.sh`.

3. **Opening a New Shell in the Docker Container (Optional)**: To open a new shell session in the running Docker container, use the `shell_container.sh` script with `sudo ./shell_container.sh`.

## Testing Your ROS2 Environment 

After accessing the Docker container, you can test the ROS2 environment by running a simple ROS2 publisher and subscriber. 

1. Start a new Docker container with `sudo ./run_container.sh`.
2. Inside the container, start the ROS2 publisher with `ros2 run demo_nodes_cpp talker`.
3. Open a new terminal, then use the `shell_container.sh` script to access the running Docker container with `sudo ./shell_container.sh`.
4. Inside the new terminal session in the container, start the ROS2 subscriber with `ros2 run demo_nodes_cpp listener`.

## Acknowledgements
This docker setup methodology was inspired and refined with the help of our dear colleague Toon Daemen. Thank you, Toon!

