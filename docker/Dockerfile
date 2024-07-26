# Load the ROS 2 Humble Docker image for ARM Raspberry Pi with Ubuntu Focal (20.04)
FROM osrf/ros:humble-desktop

# Update the package list and install the required dependencies
# Cleanup is done in the same layer to reduce image size
RUN apt-get update && apt-get install -y \
    python3-pip \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libxkbcommon-x11-0 \
    ros-humble-cv-bridge \
    ros-humble-image-transport \
    ros-humble-rviz2 \
    && rm -rf /var/lib/apt/lists/*

# Set the username, user ID, and group ID
ARG UNAME=ros2_user
ARG UID=1001
ARG GID=1001

# Define environment variables
ENV UNAME=${UNAME}

# Create a new group with the specified group ID and name
RUN groupadd -g $GID $UNAME

# Add a new user with the specified user ID and group ID
# The -m option creates a home directory for the user
# The -s /bin/bash sets the default shell to bash
RUN useradd -m -u $UID -g $GID -s /bin/bash $UNAME

# Set the password for the user and add the user to the sudo group
RUN echo "$UNAME:password" | chpasswd && adduser $UNAME sudo

# Set the working directory and fix permissions on the workspace directory as root
WORKDIR /home/$UNAME/ros2_ws
RUN chown -R $UID:$GID /home/$UNAME/ros2_ws

# Switch to the newly created user
USER $UNAME


# Expose necessary ports
EXPOSE 11011-11310
EXPOSE 11311

# Set the entrypoint to bash
CMD ["bash"]
