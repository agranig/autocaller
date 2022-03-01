#!/bin/sh

docker run --rm -ti -v $(pwd)/etc:/etc/baresip -p 8080:8000 baresip:latest
