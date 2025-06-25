####ssh server
sudo docker network create nwix_project -d bridge
sudo docker run -itd --rm --name samba --net=nwix_project -e "USER=samba" -e "PASS=secret" -v "${PWD:-.}/samba:/storage" dockurr/samba

####suricata
# --cap-add=net_admin --cap-add=sys_nice --cap-add=net_raw 
sudo docker run -itd --rm --name suricata --net=host -v $(pwd)/logs:/var/log/suricata jasonish/suricata:latest -i <nwix_project-interface>

####check if we see the traffic
sudo docker exec -it suricata bash
tcpdump -i <nwix_project-interface> icmp

sudo docker run -it --rm --name ubuntu --net=nwix_project ubuntu
apt update && apt install iputils-ping -y
ping samba

####update suricata signature
sudo docker exec -it suricata bash
# list signatures soruces
suricata-update list-sources
# list free signatures sources
suricata-update list-sources --free
# enable all free signature sources
for i in $(suricata-update list-sources --free | grep Name | cut -d' ' -f2 | sed -r 's/\x1B\[[0-9;]*[mK]//g');do suricata-update enable-source $i;done
suricata-update

####watch the alerts
tail -f logs/fast.log #outside of the container
tail -f /var/log/suricata/fast.log #inside the container

####port scan
sudo docker run -it --rm --net=nwix_project instrumentisto/nmap samba

####smb bruteforce
sudo docker run --rm -it --network nwix_project -v ./wordlists:/wordlists parrotsec/netexec nxc smb samba -u /wordlists/users.txt -p /wordlists/passwords.txt
