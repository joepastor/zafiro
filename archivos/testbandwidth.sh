#!/bin/bash
tc qdisc del dev eth0 root
tc qdisc add dev eth0 root handle 1: htb
tc qdisc del dev eth1 root
tc qdisc add dev eth1 root handle 1: htb

CEIL="512kbit"
CEIL1="512kbit"
CEIL2="256kbit"
CEIL3="128kbit"
BW1="256kbit"
BW2="128kbit"
BW3="64kbit"
IP="172.16.0.33"
INT="eth0"

echo "qdisc"
tc qdisc show dev eth0
tc qdisc show dev eth1
echo "class"
tc class show dev eth0
tc class show dev eth1
echo "filter"
tc filter show dev eth0
tc filter show dev eth1

# CLASES DE BAJADA
tc class add dev eth0 parent 1: classid 1:2861 htb rate $CEIL ceil $CEIL burst 15k
tc class add dev eth0 parent 1:2861 classid 1:286a htb rate $BW1 ceil $CEIL1 burst 15k prio 0
tc class add dev eth0 parent 1:2861 classid 1:286b htb rate $BW2 ceil $CEIL2 burst 15k prio 1
tc class add dev eth0 parent 1:2861 classid 1:286c htb rate $BW3 ceil $CEIL3 burst 15k prio 2
tc filter add dev eth0 protocol ip parent 1: handle 0x28601 fw classid 1:286a
tc filter add dev eth0 protocol ip parent 1: handle 0x28602 fw classid 1:286b
tc filter add dev eth0 protocol ip parent 1: handle 0x28603 fw classid 1:286c

# CLASES DE SUBIDA
tc class add dev eth1 parent 1: classid 1:2860 htb rate $CEIL ceil $CEIL burst 15k
tc class add dev eth1 parent 1:2860 classid 1:286d htb rate $BW1 ceil $CEIL1 burst 15k prio 0
tc class add dev eth1 parent 1:2860 classid 1:286e htb rate $BW2 ceil $CEIL2 burst 15k prio 1
tc class add dev eth1 parent 1:2860 classid 1:286f htb rate $BW3 ceil $CEIL3 burst 15k prio 2
tc filter add dev eth1 protocol ip parent 1: handle 0x28604 fw classid 1:286d
tc filter add dev eth1 protocol ip parent 1: handle 0x28605 fw classid 1:286e
tc filter add dev eth1 protocol ip parent 1: handle 0x28606 fw classid 1:286f

tc qdisc show dev eth0
tc qdisc show dev eth1

tc class show dev eth0
tc class show dev eth1

tc filter show dev eth0
tc filter show dev eth1

iptables -t mangle -F

iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 22 -j MARK --set-mark 0x28601
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d $IP -p udp --sport 5060:5090 -j MARK --set-mark 0x28601
iptables -t mangle -A FORWARD -o $INT -d $IP -p udp --sport 5060:5090 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 5060:5090 -j MARK --set-mark 0x28601
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 5060:5090 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 10000:30000 -j MARK --set-mark 0x28601
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 10000:30000 -j MARK --set-mark 0x28601
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 80 -j MARK --set-mark 0x28602
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 443 -j MARK --set-mark 0x28602
iptables -t mangle -A FORWARD -o $INT -d $IP -p tcp --sport 443 -j RETURN

iptables -t mangle -A FORWARD -o $INT -d $IP -j MARK --set-mark 0x28603
iptables -t mangle -A FORWARD -o $INT -d $IP -j RETURN

iptables -t mangle -L -n


#iptables -t mangle -A FORWARD -d $IP -j RETURN

