docker run -it \
           --rm \
           -v "$(pwd)/../ros2_ws":/home/ros2_user/ros2_ws \
           --env="DISPLAY" \
           --env="QT_X11_NO_MITSHM=1" \
           --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
           --name="ros2_container" \
           --network=host \
           ros2_image bash


# if you need access to usb port with your container, add the follow line and change the port name
# --device=/dev/ttyACM0 \
