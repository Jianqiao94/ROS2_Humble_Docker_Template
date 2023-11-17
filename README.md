# ROS2 Docker Container with VNC

## Motivation

Running GUI applications in Docker, especially those requiring complex graphical interfaces like ROS2 tools (RViz, rqt, etc.), can be challenging with X11 forwarding. X11, while functional, is not always stable in containerized environments and requires direct interaction with the host's display server, leading to potential security risks and compatibility issues. To address these challenges, I utilize Virtual Network Computing (VNC), which should offers a more robust and isolated solution.

## How VNC Works

VNC allows us to create a virtual desktop within the Docker container, independent of the host's display system. This setup involves running a VNC server inside the container, which captures the output of a virtual display and makes it accessible over the network. Users can connect to this virtual desktop using a VNC client on their host machine or even remotely. 


## Implementation Guide

### Step 1: Setting Up the Docker Container

1. **Build the Docker Image**:
   - Ensure Docker is installed on your system.
   - Clone the repository containing the Dockerfile.
   - Navigate to the directory with the Dockerfile and build the image:
     ```
     ./build_image.sh
     ```

2. **Run the Docker Container**:
   - Use the following command to start the container:
     ```
     ./run_container.sh 
     ```

   - When the container is built, the VNC server should launched automatically, something like:
     ```
     Listening for VNC connections on TCP port 5920
     ``` 

### Step 2: Installing and Configuring VNC Viewer on Host PC

1. **Download VNC Viewer**:
   - Go to the VNC Viewer download page ([RealVNC](https://www.realvnc.com/en/connect/download/viewer/)).
   - Download and install the version appropriate for your operating system (Windows, MacOS, Linux).

2. **Connect to the Docker Container**:
   - Open VNC Viewer.
   - Connect to `localhost:5920` (if running Docker locally). If Docker is running on a remote machine, just replace `localhost` with the remote machine's IP address.
   - Enter the password when prompted (as set in the Docker run command).

### Step 3: Interacting with ROS2 in the Docker Container

- Once connected via VNC Viewer, you should see the ROS2 environment's desktop interface.
- You can now launch and use ROS2 tools like RViz and rqt within this virtual desktop.

## Existing issue of this repo
In the current version, although the VNC connection works and this should overcome the issue of X11. But the current desktop page on VNC viewer looks weird. This is because I haven't find suitable desktop program that both support VNC and Docker yet. THis will take sometime to working on it, improving UI of the desktop in VNC viewer mainly.   (Jianqiao, 11/17/2023)