#!/bin/bash
## Start docker and run docker-compose
sudo systemctl start docker
docker-compose run --rm hugo ""

docker-compose up

