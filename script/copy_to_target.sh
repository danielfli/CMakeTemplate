#!/bin/bash

cd "$1" || exit 1
TARGET_IP=$2

echo -e " copy to target $TARGET_IP "

ret=$(ping -c1 "$TARGET_IP" > /dev/null)
if [ "$ret" -ne 0 ]; then
  echo "Error: Target $TARGET_IP not reachable!"
  exit 1
fi

ret=$(rsync  -av --delete --human-readable bin/* "$TARGET_IP:/usr/local/bin")
if [ "$ret" -ne 0 ]; then
  echo "Error - bin could not send!"
  exit 1
else
  echo "bin send to target" 
fi

echo "Done!"