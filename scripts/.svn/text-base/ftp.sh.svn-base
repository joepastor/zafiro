#!/bin/bash
statname="FTP"
uptime=`uptime | awk '{print $3}'`" dias, "`uptime | awk '{print $5}'`" horas"
in=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 21in | awk '{print $2}')
out=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 21out | awk '{print $2}')
echo $in
echo $out
echo $uptime
echo $statname
