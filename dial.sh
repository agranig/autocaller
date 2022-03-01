#!/bin/sh

DEST="$1"
DURATION="$2"

if [ -z "$DEST" ] || [ -z "$DURATION" ]; then
    echo "Usage: $0 <destination> <duration>"
    echo "  destination: the number to dial"
    echo "  duration:    seconds of call duration"
    exit 1
fi

curl "http://localhost:8080?d%20$DEST"
sleep "$DURATION"
curl "http://localhost:8080?b"
