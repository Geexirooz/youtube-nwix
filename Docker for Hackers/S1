#### unshare commands ###
#### UTS isolation 
# Change hostname in an isolated sh shell
sudo unshare --uts sh -c "hostname foo; hostname"
# Change hostname globally
sudo sh -c "hostname foo; hostname"

### Net isolation
sudo unshare --net sh

### PID isolation
# This won't work
sudo unshare --pid sh
# This works but won't isolate processes
sudo unshare --pid --fork sh
# This isolates processes
sudo mkdir /home/jail
cd /home/jail
sudo wget https://dl-cdn.alpinelinux.org/alpine/v3.18/releases/x86_64/alpine-minirootfs-3.18.4-x86_64.tar.gz
sudo tar xzf alpine-minirootfs-3.18.4-x86_64.tar.gz
sudo rm alpine-minirootfs-3.18.4-x86_64.tar.gz
sudo unshare --pid --fork chroot /home/jail sh
mount -t proc proc proc
ps aux

### Install Docker on Ubuntu ###
sudo apt install docker.io

### Docekr commands
# An isolated bash
sudo docker run -it bash
# Login to DockerHub
sudo docker login

# Download an image from DockerHub
sudo docker pull instrumentisto/nmap

# Install Apache server
sudo apt install apache2
# Check listening ports
sudo netstat -antp | grep LIST
# OR
sudo ss -ntulp | grep LIST

# Run a few hacking tools via Docker
sudo docker run -it instrumentisto/nmap -p 80,81 TARGET_IP_ADDRESS
sudo docker run -it bberastegui/whatweb http://TARGET_IP_ADDRESS
sudo docker run -it osodevops/wafw00f http://TARGET_IP_ADDRESS
