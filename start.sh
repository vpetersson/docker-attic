#!/bin/bash

if [ -z "$SSHKEY" ]; then
  echo "No SSH key was provided. Exiting."
  exit 1
fi

# Installing SSH key
SSHKEY_PATH="/home/attic/.ssh/authorized_keys"
echo "$SSHKEY" > $SSHKEY_PATH
chown attic:attic $SSHKEY_PATH
chmod 600 $SSHKEY_PATH

# Set permission
chown -R attic:attic /home/attic

/usr/sbin/sshd -D
