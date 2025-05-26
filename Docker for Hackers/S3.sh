sudo docker ps

sudo docker run -it bash
sudo docker run bash       # no interaction and input
sudo docker run -i bash    # no tty

# exit from a container 
# ctrl p+q

# attach to a container
sudo docker attach pensive_mendeleev

# run a command inside a container
sudo docker exec -it pensive_mendeleev bash

# interaction with Nginx container
sudo docker run -it nginx
ctrl p+q
sudo docker ps
sudo docker attach
sudo docker exec -it romantic_merkle bash
ps #command is not installed
cat /proc/PID/cmdline
apt install procps

# Specify a name for a container
sudo docker run -itd --name myproc bash

# list/remove/stop a container
sudo docker ps -a
sudo docker ps -qa
sudo docker rm 2679f1a61d3c
sudo docker rm amazing_blackwell
sudo docker rm $(sudo docker ps -qa)
sudo docker stop $(sudo docker ps -qa) # or -f in the previous command - -v for volumes

# auto removal for a container
sudo docker run -itd --name test bash

# copy a file from/to a container
docker cp test.txt mycent2:/home
docker cp mycent2:/home/ .

#exercises
sudo docker ps -s
docker ps -a -f status=exited
docker cp -a test.txt mycent:/home  # preserves all the attributes
docker stop -t 20 mycontainer
#To attach to stderr/stdout/stdin
#ENVIRONMENT VARIABLE
docker logs mycontainer
