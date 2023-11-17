docker run -it \
           --rm \
           -v "$(pwd)/../ros2_ws":/home/ros2_user/ros2_ws \
           --name="ros2_container" \
           -p 5920:5920 \
           -e USER=ros2_user \
           -e DISPLAY=:20 \
           ros2_image \
           bash -c "Xvfb :20 -screen 0 1920x1080x24 & sleep 5; x11vnc -rfbport 5920 -display :20 -passwd 123 -forever -create & sleep 2; openbox & tail -F /home/ros2_user/.vnc/*.log"



# if you need access to usb port with your container, add the follow line and change the port name
# --device=/dev/ttyACM0 \
