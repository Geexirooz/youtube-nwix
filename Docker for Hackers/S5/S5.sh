# Install docker compose
sudo apt install docker-compose-v2

# After creating docker-compose.yml file - Bring them up
sudo docker compose up -d
# Specify a project name
sudo docker compose -p nwix up -d

# Docker compose commands we used in the session
sudo docker compose stop
sudo docker compose down
sudo docker compose rm
sudo docker compose logs 

# Setup ELK stack
git clone https://github.com/deviantony/docker-elk.git
cd docker-elk/
sudo docker compose up setup -d
sudo docker compose up -d
