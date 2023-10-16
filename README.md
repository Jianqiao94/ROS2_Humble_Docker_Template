# ROS2 Humble Docker Template

Use this Docker template for a quick setup of the ROS2 Humble environment.

## Repository Overview

- **docker/**:
  - **Dockerfile**: Defines the Docker image using ROS2 Humble, with user `ros2_user` and workspace `~/ros2_ws`.
  - **build_image.sh**: Builds the Docker image as `ros2_image`.
  - **run_container.sh**: Initiates a container named `ros2_container` from the `ros2_image`. 
  - **shell_container.sh**: Opens a shell in the `ros2_container`, ideal for multiple terminal sessions.
  
- **ros2_ws/**: The ROS2 workspace. Any files added here are automatically synchronized with the Docker container. Add ROS2 packages here for Docker container access.

## Quickstart

1. **Build the Image**: Go to `docker` and run:
   \```
   ./build_image.sh
   \```
2. **Start the Container**: From `docker`, execute:
   \```
   ./run_container.sh
   \```
3. **Additional Shell (Optional)**: For a new shell inside the running container, use:
   \```
   ./shell_container.sh
   \```

## Testing ROS2

1. Launch a Docker container with:
   \```
   ./run_container.sh
   \```
2. Inside the container, initiate the ROS2 publisher:
   \```
   ros2 run demo_nodes_cpp talker
   \```
3. In a new terminal, access the container:
   \```
   ./shell_container.sh
   ros2 run demo_nodes_cpp listener
   \```

## Docker Permissions

Ensure your user has appropriate permissions by adding it to the Docker group:

\```bash
sudo usermod -aG docker $USER
\```

After executing the above command, you might need to log out and log back in for the group changes to take effect.


