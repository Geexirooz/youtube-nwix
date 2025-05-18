sudo docker pull parrotsec/netexec

### To map a file
# This won't work
sudo docker run -it parrotsec/netexec nxc ftp 10.11.12.3 -u users.txt -p passwords.txt
# This will work now but stops at the first successful login
sudo docker run -it -v ./users.txt:/tmp/users.txt -v ./passwords.txt:/tmp/passwords.txt parrotsec/netexec nxc ftp 10.11.12.3 -u /tmp/users.txt -p /tmp/passwords.txt 
# This finds all valid credentials (continues on successful logins)
sudo docker run -it -v ./users.txt:/tmp/users.txt -v ./passwords.txt:/tmp/passwords.txt parrotsec/netexec nxc ftp 10.11.12.3 -u /tmp/users.txt -p /tmp/passwords.txt --continue-on-success

### To mount a volume (directory)
# Prepare the environment
mkdir wordlists
mv users.txt passwords.txt wordlists/
# mount the volume "wordlists"
sudo docker run -it -v ./wordlists:/wordlists parrotsec/netexec nxc ftp 10.11.12.3 -u /wordlists/users.txt -p /wordlists/passwords.txt --continue-on-success

#global volumes
# This won't mount your local wordlists - instead will create a global volume and mount it
sudo docker run -it -v wordlists:/wordlists parrotsec/netexec nxc ftp 10.11.12.3 -u /wordlists/users.txt -p /wordlists/passwords.txt --continue-on-success
# List all global volumes
sudo docker volume ls
sudo docker volume create wlists
sudo cp users.txt passwords.txt /var/lib/docker/volumes/wlists/_data/
sudo docker run -it -v wlists:/wordlists parrotsec/netexec nxc ftp 10.11.12.3 -u /wordlists/users.txt -p /wordlists/passwords.txt --continue-on-success

# Get info about a volume
docker volume inspect myvol

### Exercises
#1. Can you remove an in-use volume?
sudo docker volume rm wlists
sudo docker ps

#2. how does the below command work?
docker volume create --driver local --opt type=nfs --opt o=addr=192.168.100.100,ro --opt device=:/myvolume/data myvol

#3. Bruteforce the FTP service with other tools like hydra, medusa, crackmapexec etc.

#4. Bruteforce other services

#5. Launch the services via docker (Optional) (dig further)
