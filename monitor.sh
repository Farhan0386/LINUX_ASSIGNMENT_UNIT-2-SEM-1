#!/bin/bash
# ----------------------------------------
# Script Name: monitor.sh
# Purpose: Log CPU and memory usage every 5 seconds
# Author: Farhan
# Date: $(date)
# ----------------------------------------

LOG_FILE="/home/$(whoami)/usage_log.txt"
INTERVAL=5     # seconds between samples

# Header for the log file
echo "Monitoring started at $(date)" >> "$LOG_FILE"
echo "Time,CPU_percent,Mem_percent" >> "$LOG_FILE"

# Loop that records timestamp, CPU% and Memory% to the log
while true; do
  timestamp=$(date '+%Y-%m-%d %H:%M:%S')

  # CPU: use top in batch mode, sum user+system usage (fields may vary by locale)
  cpu=$(top -bn1 | grep "Cpu(s)" | awk -F',' '{print $1","$2}' | 
        awk -F' ' '{print $(NF-7)+$(NF-5)}' 2>/dev/null)

  # Fallback if above parsing fails: use 0
  if [ -z "$cpu" ]; then
    cpu=0
  fi

  # Memory: used/total * 100
  mem=$(free | awk '/Mem/ {printf "%.2f", $3/$2 * 100.0}')

  # Write to log as CSV
  echo "$timestamp,$cpu,$mem" >> "$LOG_FILE"
  sleep "$INTERVAL"
done
