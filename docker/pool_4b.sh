#!/bin/bash
# Wait until gbas started started and listens on port 8515.
while [ -z "`netstat -tln | grep 8515`" ]; do
 echo 'Waiting for gbas to start ...'
 sleep 1
done
echo 'gbas started.'
sleep 5

# Start server.
echo 'Starting pool...'
/opt/open-ethereum-pool/build/bin/open-ethereum-pool /opt/open-ethereum-pool/config_4b.json
