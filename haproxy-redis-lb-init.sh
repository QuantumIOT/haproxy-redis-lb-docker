#!/usr/bin/env bash

SERVERS_IPS=$1

IPS=(${SERVERS_IPS//;/ })
N=0

for i in "${IPS[@]}"; do
  ((N++))
  echo "server server$N $i:6379 check inter 1s" >> /usr/local/etc/haproxy/haproxy.cfg
done

haproxy -f "/usr/local/etc/haproxy/haproxy.cfg"