# In Docker, an image is a lightweight, standalone, executable package that includes everything needed to run a piece of software (blueprint)
# A container is a runtime instance of an image – what the image becomes in memory when executed 




# Load a pre-configured ROS 2 environment with the 'Humble' release
FROM osrf/ros:humble-desktop

# set the username in the container, used to create a user with a specific user and group ID inside the container.
ARG UNAME=ros2_user 

# User ID and Group ID, 
ARG UID=1001
ARG GID=1001

# define name of environment
ENV UNAME ${UNAME}

# Creates a new group with the specified group ID and name
RUN groupadd -g $GID $UNAME

# Adds a new user with the specified user ID and group ID
# The -m option creates a home directory for the user;
# The -s /bin/bash sets the default shell to bash.
RUN useradd -m -u $UID -g $GID -s /bin/bash $UNAME

# Sets the password for the user to "password" and adds the user to the sudo group
RUN echo "$UNAME:password" | chpasswd && adduser $UNAME sudo

# Switches the current user to the newly created user
USER $UNAME

#COPY ./sudoers /etc/sudoers

# Sets the working directory in the container
WORKDIR /home/$UNAME/ros2_ws

EXPOSE 11011-11310 
# Forward the roscore port
EXPOSE 11311
# forward browser port
