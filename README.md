# Install

* Run `make` to build the Docker image.
* Copy `etc/accounts.example` to `etc/accounts` and fill in proper SIP account.
* Replace `etc/message.mp3` with the message you want to play.

# Run

* Run `./run.sh` in one terminal to start the a Docker container instance. This exposes port 8080 on the host, so it can be controlled via `dial.sh`.
* Run `./dial.sh 012345 10 30` in another terminal to ring 012345 for 10s and then play `etc/message.mp3` for 30s.

# Notes

* Failures while connecting calls (busy, rejects etc) as well as remote hangups are supposed to be handled gracefully.
* You can currently only do one call per container. To parallelize, run more containers while incrementing the exposed httpd port in `run.sh` and `dial.sh`
