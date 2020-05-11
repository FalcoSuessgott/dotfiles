#!/bin/sh

connection=$(pgrep pulse)
ip=$(ip a s tun0 2>/dev/null | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

if [ -n "$connection" ]; then
  echo "VPN active ($ip)"
else 
  echo ""
fi
