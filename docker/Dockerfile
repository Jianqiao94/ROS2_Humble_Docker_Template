
FROM osrf/ros:humble-desktop

# Define a user to execute the script
ARG UNAME=ros2_user
ARG UID=1001
ARG GID=1001
ENV UNAME ${UNAME}
RUN groupadd -g $GID $UNAME
RUN useradd -m -u $UID -g $GID -s /bin/bash $UNAME
RUN echo "$UNAME:password" | chpasswd && adduser $UNAME sudo
USER $UNAME

#COPY ./sudoers /etc/sudoers

# Set the working directory in the container
WORKDIR /home/$UNAME/ros2_ws

EXPOSE 11011-11310 
# Forward the roscore port
EXPOSE 11311
# forward browser port
