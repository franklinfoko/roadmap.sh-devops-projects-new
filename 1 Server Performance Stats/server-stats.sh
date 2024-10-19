#!/bin/bash
# Server Performance Stats
# Goal of this project is to write a script to analyse server performance stats.

echo "                SERVER PERFORMANCE STATS                 "
echo "---------------------------------------------------------"
echo "                                                         "
echo "Total CPU Usage:" top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
echo "---------------------------------------------------------"
echo "                                                         "
echo "Total Memory Usage:"
free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%), Free: %sMB (%.2f%%)\n", $3, $3*100/$2, $4, $4*100/$2 }'
echo "---------------------------------------------------------"
echo "                                                         "
echo "Total Disk Usage:"
df -h | awk '$NF=="/"{printf "Used: %dGB (%s), Free: %dGB\n", $3, $5, $4}'
echo "---------------------------------------------------------"
echo "                                                         "
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo "---------------------------------------------------------"
echo "                                                         "
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6