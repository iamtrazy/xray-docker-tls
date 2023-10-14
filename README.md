# Instructions

## prerequisites - docker.io and docker-buildx

sudo apt-get update && sudo apt-get install -y docker.io docker-buildx  
sudo usermod -aG docker $USER

## clone this repository to a vps

git clone https://github.com/iamtrazy/xray-docker-tls.git

## edit and change the $DOMAIN and $UUID in the .env file

eg: nano xray-docker-tls/.env

## build the docker image using docker buildx

cd xray-docker-tls  
docker buildx build -t caddy_xray .

## run the docker image with host port 80

docker run --name caddy_xray -p 80:80 -p 443:443 -d caddy_xray:latest
