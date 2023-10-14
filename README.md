# Instructions

## prerequisites - docker.io and docker-buildx

sudo apt-get update && sudo apt-get install -y docker.io docker-buildx  
sudo usermod -aG docker $USER  

point the domain to server ip before starting the container.

## clone this repository to a vps

git clone https://github.com/iamtrazy/xray-docker-tls.git

## edit and change the $DOMAIN and $UUID in the .env file

eg: nano xray-docker-tls/.env

## build the docker image using docker buildx

cd xray-docker-tls  
docker buildx build -t caddy_xray .

## run the docker image with host port 80 and 443

docker run -p 80:80 -p 443:443 -d caddy_xray:latest  
this won't retain after reboot. re run the command after reboot or use docker-compose to automate the procss.

## sample vless

vless://$UUID@$DOMAIN:443/?type=ws&encryption=none&host=$DOMAIN&path=%2Fiamtrazy&security=tls&sni=$DOMAIN&fp=chrome&packetEncoding=xudp#CDN  

replace $DOMAIN and $UUID with your Domain and UUID, set allowInsecure to true to add custom SNI (setting allowInsecure to true may make you vulnerable to MITM attacks).