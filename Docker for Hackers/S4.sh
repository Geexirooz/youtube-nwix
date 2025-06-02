# run an Nginx container
sudo docker run -itd --rm --name nginx nginx
sudo ss -ntulp | grep LIST
# check the listening port within the container
sudo docker exec -it nginx bash
apt install net-tools
netstat -antp | grep LIST

# forward port 80 to the host's 8000
sudo docker run -itd --rm -p 8000:80 --name nginx nginx
sudo ss -ntulp | grep LIST

# forward to a specific IP
sudo docker run -itd --rm -p 10.10.10.122:8000:80 --name nginx nginx
sudo docker port nginx
# tcp by default -> udp?

# inspect network info
sudo docker inspect nginx
# find connected container
sudo docker network inspect bridge

# default bridge is missing DNS feature
sudo docker run -itd --rm --name nginx1 nginx
sudo docker run -itd --rm --name nginx2 nginx
sudo docker exec -it nginx1 bash
sudo apt install iputils-ping

# custom bridge offers DNS service
sudo docker network create -d bridge gxbridge
sudo docker run -itd --rm --name nginx3 --network gxbridge nginx
sudo docker inspect nginx3
# connect a container to a different network
sudo docker network connect gxbridge nginx1

# connect to the host network
sudo docker run -itd --name nginx4 --network host --rm nginx

# bruteforce containerised FTP service via its IP
sudo docker run -itd --rm --name ftpcontainer -p 21:21 --network gxbridge -e FTP_USER=oracle -e FTP_PASS=donald fauria/vsftpd
sudo docker run --rm -it --network gxbridge -v ./wordlists:/wordlists parrotsec/netexec nxc ftp 10.10.10.123 -u /wordlists/users.txt -p /wordlists/passwords.txt

# bruteforce containerised FTP service via its name
sudo docker run -itd --rm --name ftpcontainer --network gxbridge -e FTP_USER=oracle -e FTP_PASS=donald fauria/vsftpd
sudo docker run --rm -it --network gxbridge -v ./wordlists:/wordlists parrotsec/netexec nxc ftp ftpcontainer -u /wordlists/users.txt -p /wordlists/passwords.txt

# Exercise
# How can we use a physical NIC for a container? (MacVlan?)
# Do we have any other drivers? (overlay?)
