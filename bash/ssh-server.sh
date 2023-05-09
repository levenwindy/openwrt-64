#!/bin/bash

wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
unzip ngrok-stable-linux-386.zip
chmod +x ./ngrok

echo -e "$2\n$2" | sudo passwd "$USER"

rm -f .ngrok.log
./ngrok authtoken "$1"
./ngrok tcp 22 --log ".ngrok.log" &

sleep 10

HAS_ERRORS=$(grep "command failed" < .ngrok.log)

if [[ -z "$HAS_ERRORS" ]]; then
  echo ""
  echo "To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh $USER@/" | sed "s/:/ -p /")"
  echo ""
else
  echo "$HAS_ERRORS"
  exit 4
fi
