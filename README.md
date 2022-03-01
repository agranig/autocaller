# Install

* Run `make` to build the Docker image.
* Copy `etc/accounts.example` to `etc/accounts` and fill in proper SIP account.
* Replace `etc/message.mp3` with the message you want to play.

# Run

* Run `./run.sh` in one terminal to start the a Docker container instance. This exposes port 8080 on the host, so it can be controlled via `dial.sh`.
* Run `./dial.sh 012345 10 30` in another terminal to ring 012345 for 10s and then play `etc/message.mp3` for 30s.

To call a list of numbers sequentially, create a file like this:

```
cat /tmp/numbers.txt
01234567890
01234567891
01234567892
01234567893
01234567894
01234567895
01234567896
01234567897
01234567898
01234567899
```

Then call them one by one by executing `for num in $(cat /tmp/numbers.txt); do ./dial.sh $num 10 30; done`.

* If calls happen to fail because they take longer than 5s to get into ringing state, increase the `failed_threshold` variable and your ring-timeout cmd line parameter in `dial.sh`.

# Notes

* Failures while connecting calls (busy, rejects etc) as well as remote hangups are supposed to be handled gracefully.
* You can currently only do one call per container. To parallelize, run more containers while incrementing the exposed httpd port in `run.sh` and `dial.sh`

# Disclaimer

Desperate times call for desperate measures, and this is one of them. Don't abuse this tool. Слава Україні!
