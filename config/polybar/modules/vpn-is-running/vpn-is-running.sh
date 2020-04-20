#!/bin/sh

connection=$(pgrep -a openconnect$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)
ip=$(ip a s tun0 2>/dev/null | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

if [ -n "$connection" ]; then
  echo "VPN active ($ip)"
else 
  echo ""
fi
