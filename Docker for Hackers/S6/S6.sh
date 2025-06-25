# list images
sudo docker image ls
sudo docker images

#remove an image
sudo docker image rm fauria/vsftpd

# Build and Run
docker build -t hello-basic .
docker run hello-basic

# build and run with a tag
docker build -t nwix-hello:v1 .
docker run hello-basic:v1

# check dependencies of a tool
ldd /absolute/path/to/tool
ldd $(which TOOL_NAME)

#extract an image
docker save myimg > myimg.tar

#excercise:
# what commands creates a new layer? good or bad? best practices?
sudo docker inspect alpine
sudo docker search alpine
sudo docker history alpine
