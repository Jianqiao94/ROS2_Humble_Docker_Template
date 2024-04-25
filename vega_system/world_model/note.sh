THis is the folder with world_model related thing. Be attention that you will need to install requirements.txt to use world _model. 

But DON"T install requirement.txt inside of docker, otherwise everytime you restart container, the previous environment will reset. Only
changes mentioned in docker file and column will be "remembered". 

SO if you want to install a library, you need add a line in Dockerfile, I left some hints to you. 

"# IF you need to install some library, e.g. numpy, uncomment these lines 
# RUN apt-get update && apt-get install -y \
#     python3-pip \
#     libgl1-mesa-glx \
#     libgl1-mesa-dri \
#     && rm -rf /var/lib/apt/lists/*

# # Install Python packages
# RUN pip3 install pyserial PyYAML numpy OpenCV"