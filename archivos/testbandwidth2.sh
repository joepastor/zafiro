#!/bin/bash
echo "LIMPIEZA"
tc qdisc del dev $INT root
tc qdisc add dev $INT root handle 1: htb
tc qdisc del dev eth1 root
tc qdisc add dev eth1 root handle 1: htb
iptables -t mangle -F

CEIL="512kbit"
CEIL1="512kbit"
CEIL2="256kbit"
CEIL3="128kbit"
BW1="256kbit"
BW2="128kbit"
BW3="64kbit"
IP="172.16.0.33"
INT="eth0"

echo "MUESTRA INICIAL"

echo "qdisc"
tc qdisc show dev $INT
tc qdisc show dev eth1
echo "class"
tc class show dev $INT
tc class show dev eth1
echo "filter"
tc filter show dev $INT
tc filter show dev eth1
echo "iptables"
iptables -t mangle -L -v -n


echo Cliente - Jose Lopez	IP:33    ID: 286
#------------------------------------------------------------------------------
#Cliente - Jose Lopez	IP:33    ID: 286
#------------------------------------------------------------------------------
iptables -X 172.16.0.33_i
iptables -X 172.16.0.33_o
iptables -N 172.16.0.33_i
iptables -N 172.16.0.33_o
iptables -F 172.16.0.33_i
iptables -F 172.16.0.33_o
iptables -A FORWARD -s 172.16.0.33 -j 172.16.0.33_o
iptables -A FORWARD -d 172.16.0.33 -j 172.16.0.33_i
iptables -A FORWARD -s 172.16.0.33 -m mac --mac-source 24:b6:fd:4d:ba:bc -j ACCEPT
iptables -A FORWARD -d 172.16.0.33 -j ACCEPT

# CLASES DE BAJADA
tc class add dev $INT parent 1: classid 1:2861 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev $INT parent 1:2861 classid 1:255 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev $INT parent 1:2861 classid 1:256 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev $INT parent 1:2861 classid 1:257 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev $INT parent 1:2861 classid 1:258 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev $INT parent 1:2861 classid 1:259 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev $INT parent 1:2861 classid 1:25a htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev $INT parent 1:2861 classid 1:25b htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev $INT parent 1:2861 classid 1:25c htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev $INT parent 1:2861 classid 1:25d htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev $INT protocol ip parent 1: handle 28620 fw classid 1:255
tc filter add dev $INT protocol ip parent 1: handle 28621 fw classid 1:256
tc filter add dev $INT protocol ip parent 1: handle 28622 fw classid 1:257
tc filter add dev $INT protocol ip parent 1: handle 28623 fw classid 1:258
tc filter add dev $INT protocol ip parent 1: handle 28624 fw classid 1:259
tc filter add dev $INT protocol ip parent 1: handle 28625 fw classid 1:25a
tc filter add dev $INT protocol ip parent 1: handle 28626 fw classid 1:25b
tc filter add dev $INT protocol ip parent 1: handle 28627 fw classid 1:25c
tc filter add dev $INT protocol ip parent 1: handle 28628 fw classid 1:25d

# CLASES DE SUBIDA
tc class add dev eth1 parent 1: classid 1:2862 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth1 parent 1:2862 classid 1:25e htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth1 parent 1:2862 classid 1:25f htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth1 parent 1:2862 classid 1:260 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth1 parent 1:2862 classid 1:261 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth1 parent 1:2862 classid 1:262 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth1 parent 1:2862 classid 1:263 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth1 parent 1:2862 classid 1:264 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth1 parent 1:2862 classid 1:265 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth1 parent 1:2862 classid 1:266 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth1 protocol ip parent 1:2862 handle 28630 fw classid 1:25e
tc filter add dev eth1 protocol ip parent 1:2862 handle 28631 fw classid 1:25f
tc filter add dev eth1 protocol ip parent 1:2862 handle 28632 fw classid 1:260
tc filter add dev eth1 protocol ip parent 1:2862 handle 28633 fw classid 1:261
tc filter add dev eth1 protocol ip parent 1:2862 handle 28634 fw classid 1:262
tc filter add dev eth1 protocol ip parent 1:2862 handle 28635 fw classid 1:263
tc filter add dev eth1 protocol ip parent 1:2862 handle 28636 fw classid 1:264
tc filter add dev eth1 protocol ip parent 1:2862 handle 28637 fw classid 1:265
tc filter add dev eth1 protocol ip parent 1:2862 handle 28638 fw classid 1:266


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p udp --sport 10000:30000 -j MARK --set-mark 28620
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p udp --dport 10000:30000 -j MARK --set-mark 28630
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p udp --sport 5060:5082 -j MARK --set-mark 28620
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p udp --dport 5060:5082 -j MARK --set-mark 28630
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 22 -j MARK --set-mark 28622
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 22 -j MARK --set-mark 28632
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p udp --sport 53 -j MARK --set-mark 28621
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p udp --dport 53 -j MARK --set-mark 28631
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 80 -j MARK --set-mark 28623
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 80 -j MARK --set-mark 28633
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 443 -j MARK --set-mark 28623
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 443 -j MARK --set-mark 28633
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 25 -j MARK --set-mark 28626
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 25 -j MARK --set-mark 28636
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 110 -j MARK --set-mark 28626
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 110 -j MARK --set-mark 28636
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 143 -j MARK --set-mark 28626
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 143 -j MARK --set-mark 28636
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 20:21 -j MARK --set-mark 28627
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -p tcp --sport 20:21 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 20:21 -j MARK --set-mark 28637
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -p tcp --dport 20:21 -j RETURN
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -j MARK --set-mark 28627
iptables -t mangle -A FORWARD -o $INT -d 172.16.0.33 -j RETURN
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -j MARK --set-mark 28637
iptables -t mangle -A FORWARD -i $INT -s 172.16.0.33 -j RETURN
iptables -t nat -A POSTROUTING -s 172.16.0.33 -o eth1 -j MASQUERADE

echo "MUESTRA FINAL"

echo "qdisc"
tc qdisc show dev $INT
tc qdisc show dev eth1
echo "class"
tc class show dev $INT
tc class show dev eth1
echo "filter"
tc filter show dev $INT
tc filter show dev eth1
echo "iptables"
iptables -t mangle -L -v -n

#iptables -t mangle -A FORWARD -d $IP -j RETURN

