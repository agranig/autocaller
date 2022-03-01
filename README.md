# Install

run `make` to build the Docker image

# Run

* Run `./run.sh` in one terminal to start the a Docker container. This exposes port 8080 on the host, so it can be controlled via curl.
* Run `./dial.sh 012345 30` in another terminal to connect to HTTP 8080 and issue dial command to 012345 for 30s while playing `etc/message.mp3`.

# Notes

* Taking into account the current `etc/config`, you should be able to do 10 calls in parallel. 
* No error handling or timeout handling. If the other side only picks up after 25s, the call would only last for 5s in case 30 is specified as duration.
* If the call fails (rejected, busy), it will still wait the full 30s until the dial.sh command returns.
