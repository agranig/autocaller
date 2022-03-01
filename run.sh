#!/bin/sh

#docker network create autocall
#docker run --network=autocall --rm -ti -v $(pwd)/etc:/etc/baresip -p 8080:8000 baresip:latest

docker run --rm -ti -v $(pwd)/etc:/etc/baresip -p 8080:8000 baresip:latest /bin/bash

