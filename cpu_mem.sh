#!/bin/bash
pid=$1
if [ -z $1 ]; then
  echo "ERROR: Process ID not specified."
  echo
  echo "Usage: $(basename "$0") <PID>"
  exit 1
fi
while true; do
    cpu_mem_usage=$(top -b -n 1 | grep -w -E "^ *$pid" | awk '{print $9 "," $10}')
    echo $cpu_mem_usage
    sleep 2
done