#!/bin/bash

set -e

DEST="$1"
RINGTIMEOUT="$2"
DURATION="$3"

# seconds after which call is still not in connecting/ringing state
failed_threshold=5

if [ -z "$DEST" ] || [ -z "$RINGTIMEOUT" ] || [ -z "$DURATION" ]; then
    echo "Usage: $0 <destination> <ring-duration> <call-duration>"
    echo "  destination:    the number to dial"
    echo "  ring-duration:  number of secs to ring the destination"
    echo "  call-duration:  number of secs to play the message"
    exit 1
fi

curl "http://localhost:8080/raw/?/dial%20$DEST"

up=0
# process call setup and abort on timeouts
for i in $(seq 1 "$RINGTIMEOUT"); do
    sleep 1
    stat=$(curl "http://localhost:8080/raw/?/listcalls" 2>/dev/null)
    echo "$stat" | grep "ESTABLISHED" && { up=1; break; }
    if [ $i -ge $failed_threshold ]; then
        echo "$stat" | grep -- "--- Active calls (0) ---" && { break; }
    fi
done

rc=0
if [ $up = 0 ]; then
    echo "Call failed"
    rc=1
# process running calls and abort on remote hangups
elif [ $up = 1 ]; then
    for i in $(seq 1 "$DURATION"); do
        sleep 1
        stat=$(curl "http://localhost:8080/raw/?/listcalls" 2>/dev/null)
        echo "$stat" | grep -- "--- Active calls (0) ---" && { break; }
    done
fi

curl "http://localhost:8080/raw/?/hangup" 2>/dev/null
exit $rc
