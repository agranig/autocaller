NAME := baresip

default: build

build:
	env PATH=$(PATH) docker build -t ${NAME}:latest .
