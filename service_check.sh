#!/bin/bash

# your services to monitor

services=(
    "nginx"
    "mysql"
    "docker"
    "ssh"
    "jenkins"
)

# Store logs in your home directory

log_file="$HOME/service_health_check.log"

echo "----------- Health check started at $(date) -----------" >> "$log_file"
for service in "${services[@]}";do
   if systemctl is-active --quiet "$service"; then
        echo "$service : RUNNING"
        echo "$(date) - $service is RUNNING" >> "$logfile"
    else
       echo "$service : NOT RUNNING"
       echo "$(date) - $service is NOT RUNNING" >> "$logfile"
            # Optional auto-restart:
            # systemctl restart "$service"
            # echo "$(date) - $service RESTARTED" >> "$logfile"
    fi 
done

echo "----------- Health check Completed -----------" >> "$lofile"
