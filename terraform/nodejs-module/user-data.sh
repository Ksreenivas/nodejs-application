#!/bin/bash
# A script that runs the Node.js web application. It expects certain variables to be set via Terraform interpolation.

set -e

# Send the log output from this script to user-data.log, syslog, and the console
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "Starting Node.js web applicaion on port ${port} and piping all log output to syslog"
cd /home/ubuntu/nodejs-hello-world
ls
docker run -p 8080:8080 -d nodejs-helloworld:latest
docker ps -a