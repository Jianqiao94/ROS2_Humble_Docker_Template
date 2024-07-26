#!/bin/bash
xhost +local:root

# Run the Docker container with the appropriate options
docker run -it \
    --rm \
    -v "$(pwd)/../ros2_ws":/home/ros2_user/ros2_ws \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    $DEVICE_OPTION \
    --name="ros2_container" \
    --network=host \
    ros2_humble bash


# if you need access to usb port with your container, add the follow line and change the port name
# --device=/dev/ttyACM0 \
