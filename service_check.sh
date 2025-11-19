#!/bin/bash

# List of services
services=("nginx" "mysql" "docker" "ssh" "jenkins")

# Log file stored safely in /tmp
logfile="/tmp/service_status.log"

# Reset log file each run
rm -f "$logfile"
touch "$logfile"
chmod 666 "$logfile"

echo "----------- Health check started at $(date) -----------" >> "$logfile"

for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "$service : RUNNING"
        echo "$(date) - $service is RUNNING" >> "$logfile"
    else
        echo "$service : NOT RUNNING ❌"
        echo "$(date) - $service is NOT RUNNING ❌" >> "$logfile"
    fi
done

echo "----------- Health check completed -----------" >> "$logfile"

