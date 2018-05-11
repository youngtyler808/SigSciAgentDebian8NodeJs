#!/bin/bash

echo "Starting sigsci-agent"
/usr/sbin/sigsci-agent &

echo "Starting node"
node /app.js

echo "Starting bash"
/bin/bash
