#!/bin/sh

ip=$(ip a s tun0 2>/dev/null | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

if [ -n "$ip" ]; then
  echo "VPN active ($ip)"
else
  echo "%{A1:/usr/bin/vpn:} No VPN %{A}"
fi
