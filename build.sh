!#/bin/sh

cd chrom-browser;
docker build -t chrome-browser .;
docker network create chrome-net;
docker volume create chrome-data;
docker run --detach --restart=always --volume=chrome-data:/data --net=chrome-net --name=chrome-app --privileged chrome-browser;

cd ../chrome-caddy
docker build -t chrome-caddy .;
docker run --detach --restart=always --volume=chrome-data:/data --net=chrome-net --name=chrome-web --publish=8085:8085 chrome-caddy;
