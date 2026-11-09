#!/bin/bash
date
df -h /
if ping -c 1 -W 2 192.168.50.1 > /dev/null; then 
    echo "Firewall OK"
else 
    echo "Firewall ERRORE"
fi
