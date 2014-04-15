#!/bin/bash
statname="WWW"
uptime=`uptime | awk '{print $3}'`" dias, "`uptime | awk '{print $5}'`" horas"
in=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 80in | awk '{print $2}')
out=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 80out | awk '{print $2}')
echo $in
echo $out
echo $uptime
echo $statname
