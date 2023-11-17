# Load a pre-configured ROS 2 environment with the 'Humble' release
FROM osrf/ros:humble-desktop

# Set the username in the container.
ARG UNAME=ros2_user 

# Define User ID (UID) and Group ID (GID) for the user inside the container.
ARG UID=1001
ARG GID=1001
ENV UNAME ${UNAME}

# Set frontend to noninteractive in apt-get to skip any interactive post-install configuration steps
ENV DEBIAN_FRONTEND=noninteractive

# Install VNC Server and a lightweight desktop environment
RUN apt-get update && apt-get install -y \
    x11vnc \
    xvfb \
    openbox \
    lxde-core \
    lxterminal \
    xterm \
    && rm -rf /var/lib/apt/lists/*

# Reset DEBIAN_FRONTEND environment variable
ENV DEBIAN_FRONTEND=

# Set environmental variable for display
ENV DISPLAY :20

# Creates a new group with the specified GID and name (UNAME).
RUN groupadd -g $GID $UNAME

# Adds a new user with specified UID and GID
RUN useradd -m -u $UID -g $GID -s /bin/bash $UNAME
RUN echo "$UNAME:password" | chpasswd && adduser $UNAME sudo

# Set up VNC server
RUN mkdir /home/$UNAME/.vnc \
    && chown -R $UNAME:$GID /home/$UNAME/.vnc
COPY xstartup /home/$UNAME/.vnc/xstartup
RUN chown $UNAME:$GID /home/$UNAME/.vnc/xstartup \
    && chmod +x /home/$UNAME/.vnc/xstartup
# RUN echo "password" | vncpasswd -f > /home/$UNAME/.vnc/passwd \
#     && chown $UNAME:$GID /home/$UNAME/.vnc/passwd \
#     && chmod 600 /home/$UNAME/.vnc/passwd

# Switches the active user, not the root user
USER $UNAME

# Set the working directory in the container
WORKDIR /home/$UNAME/ros2_ws

EXPOSE 5920
