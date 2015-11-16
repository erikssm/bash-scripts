#!/bin/bash

CNT=0

while true; do

  N=$(ifconfig | grep "192.168" | wc -l)
  if [ "$N" = "1" ]; then
    echo "Localhost connection is active, starting samba.."
    service smbd restart
    echo "Samba started."
    break
  fi
  CNT=$[$CNT+5]
  echo $CNT

  if [ "$CNT" -gt "3" ]; then
    echo "Failed to start samba, no localhost connection, quitting.."
    break
  fi
  sleep 30
 
done
