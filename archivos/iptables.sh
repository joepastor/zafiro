iptables -F
iptables -t nat -F
iptables -t mangle -F

# COMIENZO DEL FIREWALL PERSONALIZADO
iptables hoasdfdf
iptables -P OUTPUT ACCEPT
iptables -P INPUT ACCEPT
iptables -A FORWARD -d 190.221.46.236 -j ACCEPT
iptables -A FORWARD -d 190.221.46.236 -j ACCEPT
iptables -A FORWARD -s 190.221.46.236 -j ACCEPT
iptables -A FORWARD -s 200.69.248.13 -j ACCEPT
iptables -A FORWARD -d 200.69.248.13 -j ACCEPT
iptables -A FORWARD -s 172.16.50.1 -j LOG --log-prefix 'JOE-------'
iptables -t nat -A PREROUTING -p tcp --dport 8923 -j DNAT --to 172.16.0.4:22
iptables -A OUTPUT -p tcp --sport 3784 -j ACCEPT
iptables -A INPUT -s 201.216.237.165 -p tcp --sport 800 -j ACCEPT
iptables -A OUTPUT -d 201.216.237.165 -p tcp --dport 800 -j ACCEPT
iptables iptables -A INPUT -p udp --dport 3784 -j ACCEPT
iptables iptables iptables -A OUTPUT -p udp --sport 3784 -j ACCEPT
iptables -A OUTPUT -p 443 -d sps.decidir.com -j ACCEPT
iptables -A FORWARD -s 200.80.194.18 -p tcp -j ACCEPT
iptables -A FORWARD -d 200.80.194.18 -p tcp -j ACCEPT
iptables -A FORWARD -s 200.80.194.18 -p udp -j ACCEPT
iptables -A FORWARD -d 200.80.194.18 -p udp -j ACCEPT
iptables -A FORWARD -d sps.decidir.com -j ACCEPT
iptables -A FORWARD -s 200.80.195.18 -p udp -j ACCEPT
iptables -A FORWARD -d 200.80.195.18 -p udp -j ACCEPT
iptables -A FORWARD -s sps.decidir.com -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -s 172.16.0.33 -j REDIRECT --to-port 3128
iptables -t nat -A PREROUTING -i eth1 -p udp -s 0.0.0.0/0 --dport 4097 -j DNAT --to 172.16.0.36:4097
iptables -A FORWARD -d 190.2.29.105 -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 3128 -j ACCEPT
iptables -A FORWARD -s 190.2.45.229 -j ACCEPT
iptables -A FORWARD -d 190.2.45.229 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 3128 -j ACCEPT
iptables -A FORWARD -s 190.2.29.105 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 3128 -j ACCEPT
iptables -A OUTPUT -o eth1 -p tcp --sport 3128 -j ACCEPT

# FIN DEL FIREWALL PERSONALIZADO

# COMIENZO DE FILTROS PERSONALIZADOS
iptables -A FORWARD  -i eth0  -s 192.168.10.1  -p UDP   -o eth1   -d 0.0.0.0 -j DROP

# FIN DE FILTROS PERSONALIZADO

# COMIENZO DE FIREWALL ESTANDAR
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -A FORWARD -o tun+ -j ACCEPT
iptables -A FORWARD -i tun+ -j ACCEPT
iptables -A OUTPUT -o tun+ -j ACCEPT
iptables -A INPUT -i tun+ -j ACCEPT
iptables -t nat -A POSTROUTING -o tun+ -j MASQUERADE
iptables -A INPUT -p 50 -j ACCEPT
iptables -A OUTPUT -p 51 -j ACCEPT
iptables -A INPUT -p 51 -j ACCEPT
iptables -A OUTPUT -p 50 -j ACCEPT
iptables -A INPUT -p udp --sport 1194 -j ACCEPT
iptables -A OUTPUT -p udp --dport 1194 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
iptables -A INPUT -p tcp --sport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -X 80in
iptables -N 80in
iptables -A 80in
iptables -X 80out
iptables -N 80out
iptables -A 80out
iptables -A FORWARD -s 192.168.0.0/24 -p tcp --dport 80 -j 80out
iptables -A FORWARD -d 192.168.0.0/24 -p tcp --sport 80 -j 80in
iptables -X 110in
iptables -N 110in
iptables -A 110in
iptables -X 110out
iptables -N 110out
iptables -A 110out
iptables -A FORWARD -s 192.168.0.0/24 -p tcp --dport 110 -j 110out
iptables -A FORWARD -d 192.168.0.0/24 -p tcp --sport 110 -j 110in
iptables -X 21in
iptables -N 21in
iptables -A 21in
iptables -X 21out
iptables -N 21out
iptables -A 21out
iptables -A FORWARD -s 192.168.0.0/24 -p tcp --dport 21 -j 21out
iptables -A FORWARD -d 192.168.0.0/24 -p tcp --sport 21 -j 21in
iptables -X 25in
iptables -N 25in
iptables -A 25in
iptables -X 25out
iptables -N 25out
iptables -A 25out
iptables -A FORWARD -s 192.168.0.0/24 -p tcp --dport 25 -j 25out
iptables -A FORWARD -d 192.168.0.0/24 -p tcp --sport 25 -j 25in
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -p ICMP -j ACCEPT
iptables -A OUTPUT -p ICMP -j ACCEPT
iptables -A INPUT -p tcp --dport 2801 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 2801 -j ACCEPT
iptables -A INPUT -p tcp --sport 43 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 43 -j ACCEPT
iptables -A INPUT -p tcp --dport 2801 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 2801 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i br2 -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -o br2 -p udp --sport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 53 -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 500 -j ACCEPT
iptables -A OUTPUT -p udp --dport 500 -j ACCEPT
iptables -A INPUT -p tcp --sport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 1723 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 1723 -j ACCEPT
iptables -A INPUT -p 47 -j ACCEPT
iptables -A OUTPUT -p 47 -j ACCEPT
iptables -A INPUT -p udp --sport 67:68 --dport 67:68 -j ACCEPT
iptables -A OUTPUT -p udp --dport 67:68 --sport 67:68 -j ACCEPT
iptables -A INPUT -i br2 -p tcp --dport 3128 -j ACCEPT
iptables -A OUTPUT -o br2 -p tcp --sport 3128 -j ACCEPT
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
iptables -A INPUT -i eth0 -f -j LOG --log-prefix 'Fragmento! '
iptables -A INPUT -i eth0 -f -j DROP
iptables -A INPUT -i br2 -f -j LOG --log-prefix 'Fragmento! '
iptables -A INPUT -i br2 -f -j DROP
iptables -t mangle -A PREROUTING -p icmp -j TOS --set-tos Minimize-Delay
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/all/log_martians
iptables -X ICMP
iptables -N ICMP
iptables -A ICMP -i eth0 -s 0.0.0.0/0 -p icmp -j LOG --log-level info --log-prefix 'ICMP FILTRADOS INTERNET:   '
iptables -A ICMP -i br2 -s 0.0.0.0/0 -p icmp -j LOG --log-level info --log-prefix 'ICMP FILTRADOS LAN:   '

# FIN DE FIREWALL ESTANDAR

# FIREWALL PARA DNSS
#==========================================================================================
iptables -t nat -A POSTROUTING -o eth0 -d 172.16.0.1 -p udp --dport 53 -j MASQUERADE
iptables -A FORWARD -i br2 -d 172.16.0.1 -p udp --dport 53 -j ACCEPT
#==========================================================================================
# FORWARDING DE PUERTOS
#==========================================================================================
iptables -t nat -A PREROUTING -i eth0 -p tcp -s 190.55.122.129 --dport 8946 -j DNAT --to 172.16.45.2:22
iptables -t nat -A PREROUTING -i eth0 -p tcp -s 190.55.122.129 --dport 8948 -j DNAT --to 172.16.45.2:443
iptables -t nat -A PREROUTING -i eth0 -p tcp -s 190.190.176.45 --dport 8949 -j DNAT --to 172.16.45.2:80
iptables -t nat -A PREROUTING -i eth0 -p tcp -s 0.0.0.0/0 --dport 9856 -j DNAT --to 172.16.0.37:80
iptables -t nat -A PREROUTING -i eth0 -p tcp -s 0.0.0.0/0 --dport 4097 -j DNAT --to 172.16.0.36:4097
#==========================================================================================
# DEFINICION DE COLAS BASICAS
#==========================================================================================
tc qdisc del dev eth0 root
tc qdisc add dev eth0 root handle 1: htb
tc qdisc del dev eth1 root
tc qdisc add dev eth1 root handle 1: htb


echo Cliente - Ce	IP:89    ID: 471
#------------------------------------------------------------------------------
#Cliente - Ce	IP:89    ID: 471
#------------------------------------------------------------------------------
iptables -X 192.168.0.89_i
iptables -X 192.168.0.89_o
iptables -N 192.168.0.89_i
iptables -N 192.168.0.89_o
iptables -F 192.168.0.89_i
iptables -F 192.168.0.89_o
iptables -A FORWARD -s 192.168.0.89 -j 192.168.0.89_o
iptables -A FORWARD -d 192.168.0.89 -j 192.168.0.89_i

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:4711 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:4711 classid 1:3 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:4711 classid 1:4 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:4711 classid 1:5 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:4711 classid 1:6 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:4711 classid 1:7 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:4711 classid 1:8 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:4711 classid 1:9 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:4711 classid 1:a htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:4711 classid 1:b htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 47120 fw classid 1:3
tc filter add dev br2 protocol ip parent 1: handle 47121 fw classid 1:4
tc filter add dev br2 protocol ip parent 1: handle 47122 fw classid 1:5
tc filter add dev br2 protocol ip parent 1: handle 47123 fw classid 1:6
tc filter add dev br2 protocol ip parent 1: handle 47124 fw classid 1:7
tc filter add dev br2 protocol ip parent 1: handle 47125 fw classid 1:8
tc filter add dev br2 protocol ip parent 1: handle 47126 fw classid 1:9
tc filter add dev br2 protocol ip parent 1: handle 47127 fw classid 1:a
tc filter add dev br2 protocol ip parent 1: handle 47128 fw classid 1:b

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:4712 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:4712 classid 1:c htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:4712 classid 1:d htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:4712 classid 1:e htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:4712 classid 1:f htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:4712 classid 1:10 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:4712 classid 1:11 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:4712 classid 1:12 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:4712 classid 1:13 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:4712 classid 1:14 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 47130 fw classid 1:c
tc filter add dev eth0 protocol ip parent 1: handle 47131 fw classid 1:d
tc filter add dev eth0 protocol ip parent 1: handle 47132 fw classid 1:e
tc filter add dev eth0 protocol ip parent 1: handle 47133 fw classid 1:f
tc filter add dev eth0 protocol ip parent 1: handle 47134 fw classid 1:10
tc filter add dev eth0 protocol ip parent 1: handle 47135 fw classid 1:11
tc filter add dev eth0 protocol ip parent 1: handle 47136 fw classid 1:12
tc filter add dev eth0 protocol ip parent 1: handle 47137 fw classid 1:13
tc filter add dev eth0 protocol ip parent 1: handle 47138 fw classid 1:14


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p udp --sport 10000:30000 -j MARK --set-mark 47120
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p udp --dport 10000:30000 -j MARK --set-mark 47130
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p udp --sport 5060:5082 -j MARK --set-mark 47120
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p udp --dport 5060:5082 -j MARK --set-mark 47130
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p udp --sport 53 -j MARK --set-mark 47121
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p udp --dport 53 -j MARK --set-mark 47131
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 22 -j MARK --set-mark 47122
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 22 -j MARK --set-mark 47132
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 443 -j MARK --set-mark 47123
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 443 -j MARK --set-mark 47133
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 80 -j MARK --set-mark 47124
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 80 -j MARK --set-mark 47134
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 25 -j MARK --set-mark 47126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 25 -j MARK --set-mark 47136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 110 -j MARK --set-mark 47126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 110 -j MARK --set-mark 47136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 143 -j MARK --set-mark 47126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 143 -j MARK --set-mark 47136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 21 -j MARK --set-mark 47127
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 21 -j MARK --set-mark 47137
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -j MARK --set-mark 47127
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.89 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -j MARK --set-mark 47137
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.89 -j RETURN
iptables -t nat -A POSTROUTING -s 192.168.0.89 -o eth0 -j MASQUERADE


echo Cliente - Claudia Mattiussi 	IP:25    ID: 451
#------------------------------------------------------------------------------
#Cliente - Claudia Mattiussi 	IP:25    ID: 451
#------------------------------------------------------------------------------
iptables -X 192.168.0.25_i
iptables -X 192.168.0.25_o
iptables -N 192.168.0.25_i
iptables -N 192.168.0.25_o
iptables -F 192.168.0.25_i
iptables -F 192.168.0.25_o
iptables -A FORWARD -s 192.168.0.25 -j 192.168.0.25_o
iptables -A FORWARD -d 192.168.0.25 -j 192.168.0.25_i
iptables -A FORWARD -s 192.168.0.25 -m mac --mac-source 00:1c:25:9f:e2:82 -j ACCEPT
iptables -A FORWARD -d 192.168.0.25 -j ACCEPT

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:4511 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:4511 classid 1:15 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:4511 classid 1:16 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:4511 classid 1:17 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:4511 classid 1:18 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:4511 classid 1:19 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:4511 classid 1:1a htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:4511 classid 1:1b htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:4511 classid 1:1c htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:4511 classid 1:1d htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 45120 fw classid 1:15
tc filter add dev br2 protocol ip parent 1: handle 45121 fw classid 1:16
tc filter add dev br2 protocol ip parent 1: handle 45122 fw classid 1:17
tc filter add dev br2 protocol ip parent 1: handle 45123 fw classid 1:18
tc filter add dev br2 protocol ip parent 1: handle 45124 fw classid 1:19
tc filter add dev br2 protocol ip parent 1: handle 45125 fw classid 1:1a
tc filter add dev br2 protocol ip parent 1: handle 45126 fw classid 1:1b
tc filter add dev br2 protocol ip parent 1: handle 45127 fw classid 1:1c
tc filter add dev br2 protocol ip parent 1: handle 45128 fw classid 1:1d

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:4512 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:4512 classid 1:1e htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:4512 classid 1:1f htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:4512 classid 1:20 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:4512 classid 1:21 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:4512 classid 1:22 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:4512 classid 1:23 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:4512 classid 1:24 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:4512 classid 1:25 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:4512 classid 1:26 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 45130 fw classid 1:1e
tc filter add dev eth0 protocol ip parent 1: handle 45131 fw classid 1:1f
tc filter add dev eth0 protocol ip parent 1: handle 45132 fw classid 1:20
tc filter add dev eth0 protocol ip parent 1: handle 45133 fw classid 1:21
tc filter add dev eth0 protocol ip parent 1: handle 45134 fw classid 1:22
tc filter add dev eth0 protocol ip parent 1: handle 45135 fw classid 1:23
tc filter add dev eth0 protocol ip parent 1: handle 45136 fw classid 1:24
tc filter add dev eth0 protocol ip parent 1: handle 45137 fw classid 1:25
tc filter add dev eth0 protocol ip parent 1: handle 45138 fw classid 1:26


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p udp --sport 10000:30000 -j MARK --set-mark 45120
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p udp --dport 10000:30000 -j MARK --set-mark 45130
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p udp --sport 5060:5082 -j MARK --set-mark 45120
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p udp --dport 5060:5082 -j MARK --set-mark 45130
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p udp --sport 53 -j MARK --set-mark 45121
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p udp --dport 53 -j MARK --set-mark 45131
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 22 -j MARK --set-mark 45122
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 22 -j MARK --set-mark 45132
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 443 -j MARK --set-mark 45123
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 443 -j MARK --set-mark 45133
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 80 -j MARK --set-mark 45124
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 80 -j MARK --set-mark 45134
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 25 -j MARK --set-mark 45126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 25 -j MARK --set-mark 45136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 110 -j MARK --set-mark 45126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 110 -j MARK --set-mark 45136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 143 -j MARK --set-mark 45126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 143 -j MARK --set-mark 45136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 21 -j MARK --set-mark 45127
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 21 -j MARK --set-mark 45137
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -j MARK --set-mark 45127
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -j MARK --set-mark 45137
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.25 -j RETURN
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.25 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.25 -o eth0 -j MASQUERADE


echo Cliente - Dario Juarez	IP:24    ID: 379
#------------------------------------------------------------------------------
#Cliente - Dario Juarez	IP:24    ID: 379
#------------------------------------------------------------------------------
iptables -X 192.168.0.24_i
iptables -X 192.168.0.24_o
iptables -N 192.168.0.24_i
iptables -N 192.168.0.24_o
iptables -F 192.168.0.24_i
iptables -F 192.168.0.24_o
iptables -A FORWARD -s 192.168.0.24 -j 192.168.0.24_o
iptables -A FORWARD -d 192.168.0.24 -j 192.168.0.24_i

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:3791 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:3791 classid 1:27 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:3791 classid 1:28 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:3791 classid 1:29 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:3791 classid 1:2a htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:3791 classid 1:2b htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:3791 classid 1:2c htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:3791 classid 1:2d htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:3791 classid 1:2e htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:3791 classid 1:2f htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 37920 fw classid 1:27
tc filter add dev br2 protocol ip parent 1: handle 37921 fw classid 1:28
tc filter add dev br2 protocol ip parent 1: handle 37922 fw classid 1:29
tc filter add dev br2 protocol ip parent 1: handle 37923 fw classid 1:2a
tc filter add dev br2 protocol ip parent 1: handle 37924 fw classid 1:2b
tc filter add dev br2 protocol ip parent 1: handle 37925 fw classid 1:2c
tc filter add dev br2 protocol ip parent 1: handle 37926 fw classid 1:2d
tc filter add dev br2 protocol ip parent 1: handle 37927 fw classid 1:2e
tc filter add dev br2 protocol ip parent 1: handle 37928 fw classid 1:2f

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:3792 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:3792 classid 1:30 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:3792 classid 1:31 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:3792 classid 1:32 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:3792 classid 1:33 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:3792 classid 1:34 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:3792 classid 1:35 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:3792 classid 1:36 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:3792 classid 1:37 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:3792 classid 1:38 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 37930 fw classid 1:30
tc filter add dev eth0 protocol ip parent 1: handle 37931 fw classid 1:31
tc filter add dev eth0 protocol ip parent 1: handle 37932 fw classid 1:32
tc filter add dev eth0 protocol ip parent 1: handle 37933 fw classid 1:33
tc filter add dev eth0 protocol ip parent 1: handle 37934 fw classid 1:34
tc filter add dev eth0 protocol ip parent 1: handle 37935 fw classid 1:35
tc filter add dev eth0 protocol ip parent 1: handle 37936 fw classid 1:36
tc filter add dev eth0 protocol ip parent 1: handle 37937 fw classid 1:37
tc filter add dev eth0 protocol ip parent 1: handle 37938 fw classid 1:38


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p udp --sport 10000:30000 -j MARK --set-mark 37920
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p udp --dport 10000:30000 -j MARK --set-mark 37930
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p udp --sport 5060:5082 -j MARK --set-mark 37920
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p udp --dport 5060:5082 -j MARK --set-mark 37930
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p udp --sport 53 -j MARK --set-mark 37921
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p udp --dport 53 -j MARK --set-mark 37931
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 22 -j MARK --set-mark 37922
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 22 -j MARK --set-mark 37932
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 443 -j MARK --set-mark 37923
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 443 -j MARK --set-mark 37933
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 80 -j MARK --set-mark 37924
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 80 -j MARK --set-mark 37934
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 25 -j MARK --set-mark 37926
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 25 -j MARK --set-mark 37936
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 110 -j MARK --set-mark 37926
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 110 -j MARK --set-mark 37936
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 143 -j MARK --set-mark 37926
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 143 -j MARK --set-mark 37936
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 21 -j MARK --set-mark 37927
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 21 -j MARK --set-mark 37937
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -j MARK --set-mark 37927
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.24 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -j MARK --set-mark 37937
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.24 -j RETURN
iptables -t nat -A POSTROUTING -s 192.168.0.24 -o eth0 -j MASQUERADE


echo Cliente - Desktop XUBUNTU	IP:19    ID: 457
#------------------------------------------------------------------------------
#Cliente - Desktop XUBUNTU	IP:19    ID: 457
#------------------------------------------------------------------------------
iptables -X 192.168.0.19_i
iptables -X 192.168.0.19_o
iptables -N 192.168.0.19_i
iptables -N 192.168.0.19_o
iptables -F 192.168.0.19_i
iptables -F 192.168.0.19_o
iptables -A FORWARD -s 192.168.0.19 -j 192.168.0.19_o
iptables -A FORWARD -d 192.168.0.19 -j 192.168.0.19_i
iptables -A FORWARD -s 192.168.0.19 -m mac --mac-source 00:0b:6a:bf:a7:70 -j ACCEPT
iptables -A FORWARD -d 192.168.0.19 -j ACCEPT

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:4571 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:4571 classid 1:39 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:4571 classid 1:3a htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:4571 classid 1:3b htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:4571 classid 1:3c htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:4571 classid 1:3d htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:4571 classid 1:3e htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:4571 classid 1:3f htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:4571 classid 1:40 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:4571 classid 1:41 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 45720 fw classid 1:39
tc filter add dev br2 protocol ip parent 1: handle 45721 fw classid 1:3a
tc filter add dev br2 protocol ip parent 1: handle 45722 fw classid 1:3b
tc filter add dev br2 protocol ip parent 1: handle 45723 fw classid 1:3c
tc filter add dev br2 protocol ip parent 1: handle 45724 fw classid 1:3d
tc filter add dev br2 protocol ip parent 1: handle 45725 fw classid 1:3e
tc filter add dev br2 protocol ip parent 1: handle 45726 fw classid 1:3f
tc filter add dev br2 protocol ip parent 1: handle 45727 fw classid 1:40
tc filter add dev br2 protocol ip parent 1: handle 45728 fw classid 1:41

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:4572 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:4572 classid 1:42 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:4572 classid 1:43 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:4572 classid 1:44 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:4572 classid 1:45 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:4572 classid 1:46 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:4572 classid 1:47 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:4572 classid 1:48 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:4572 classid 1:49 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:4572 classid 1:4a htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 45730 fw classid 1:42
tc filter add dev eth0 protocol ip parent 1: handle 45731 fw classid 1:43
tc filter add dev eth0 protocol ip parent 1: handle 45732 fw classid 1:44
tc filter add dev eth0 protocol ip parent 1: handle 45733 fw classid 1:45
tc filter add dev eth0 protocol ip parent 1: handle 45734 fw classid 1:46
tc filter add dev eth0 protocol ip parent 1: handle 45735 fw classid 1:47
tc filter add dev eth0 protocol ip parent 1: handle 45736 fw classid 1:48
tc filter add dev eth0 protocol ip parent 1: handle 45737 fw classid 1:49
tc filter add dev eth0 protocol ip parent 1: handle 45738 fw classid 1:4a


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p udp --sport 10000:30000 -j MARK --set-mark 45720
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p udp --dport 10000:30000 -j MARK --set-mark 45730
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p udp --sport 5060:5082 -j MARK --set-mark 45720
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p udp --dport 5060:5082 -j MARK --set-mark 45730
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p udp --sport 53 -j MARK --set-mark 45721
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p udp --dport 53 -j MARK --set-mark 45731
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 22 -j MARK --set-mark 45722
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 22 -j MARK --set-mark 45732
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 443 -j MARK --set-mark 45723
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 443 -j MARK --set-mark 45733
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 80 -j MARK --set-mark 45724
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 80 -j MARK --set-mark 45734
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 25 -j MARK --set-mark 45726
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 25 -j MARK --set-mark 45736
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 110 -j MARK --set-mark 45726
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 110 -j MARK --set-mark 45736
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 143 -j MARK --set-mark 45726
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 143 -j MARK --set-mark 45736
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 21 -j MARK --set-mark 45727
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 21 -j MARK --set-mark 45737
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -j MARK --set-mark 45727
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.19 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -j MARK --set-mark 45737
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.19 -j RETURN
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.19 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.19 -o eth0 -j MASQUERADE


echo Cliente - ICS-100 Call Center	IP:22    ID: 222
#------------------------------------------------------------------------------
#Cliente - ICS-100 Call Center	IP:22    ID: 222
#------------------------------------------------------------------------------
iptables -X 192.168.0.22_i
iptables -X 192.168.0.22_o
iptables -N 192.168.0.22_i
iptables -N 192.168.0.22_o
iptables -F 192.168.0.22_i
iptables -F 192.168.0.22_o
iptables -A FORWARD -s 192.168.0.22 -j 192.168.0.22_o
iptables -A FORWARD -d 192.168.0.22 -j 192.168.0.22_i
iptables -A FORWARD -s 192.168.0.22 -m mac --mac-source 00:30:4f:79:2a:a7 -j ACCEPT
iptables -A FORWARD -d 192.168.0.22 -j ACCEPT

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:2221 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:2221 classid 1:4b htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:2221 classid 1:4c htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:2221 classid 1:4d htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:2221 classid 1:4e htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:2221 classid 1:4f htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:2221 classid 1:50 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:2221 classid 1:51 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:2221 classid 1:52 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:2221 classid 1:53 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 22220 fw classid 1:4b
tc filter add dev br2 protocol ip parent 1: handle 22221 fw classid 1:4c
tc filter add dev br2 protocol ip parent 1: handle 22222 fw classid 1:4d
tc filter add dev br2 protocol ip parent 1: handle 22223 fw classid 1:4e
tc filter add dev br2 protocol ip parent 1: handle 22224 fw classid 1:4f
tc filter add dev br2 protocol ip parent 1: handle 22225 fw classid 1:50
tc filter add dev br2 protocol ip parent 1: handle 22226 fw classid 1:51
tc filter add dev br2 protocol ip parent 1: handle 22227 fw classid 1:52
tc filter add dev br2 protocol ip parent 1: handle 22228 fw classid 1:53

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:2222 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:2222 classid 1:54 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:2222 classid 1:55 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:2222 classid 1:56 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:2222 classid 1:57 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:2222 classid 1:58 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:2222 classid 1:59 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:2222 classid 1:5a htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:2222 classid 1:5b htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:2222 classid 1:5c htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 22230 fw classid 1:54
tc filter add dev eth0 protocol ip parent 1: handle 22231 fw classid 1:55
tc filter add dev eth0 protocol ip parent 1: handle 22232 fw classid 1:56
tc filter add dev eth0 protocol ip parent 1: handle 22233 fw classid 1:57
tc filter add dev eth0 protocol ip parent 1: handle 22234 fw classid 1:58
tc filter add dev eth0 protocol ip parent 1: handle 22235 fw classid 1:59
tc filter add dev eth0 protocol ip parent 1: handle 22236 fw classid 1:5a
tc filter add dev eth0 protocol ip parent 1: handle 22237 fw classid 1:5b
tc filter add dev eth0 protocol ip parent 1: handle 22238 fw classid 1:5c


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p udp --sport 10000:30000 -j MARK --set-mark 22220
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p udp --dport 10000:30000 -j MARK --set-mark 22230
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p udp --sport 5060:5082 -j MARK --set-mark 22220
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p udp --dport 5060:5082 -j MARK --set-mark 22230
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p udp --sport 53 -j MARK --set-mark 22221
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p udp --dport 53 -j MARK --set-mark 22231
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 22 -j MARK --set-mark 22222
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 22 -j MARK --set-mark 22232
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 443 -j MARK --set-mark 22223
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 443 -j MARK --set-mark 22233
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 80 -j MARK --set-mark 22224
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 80 -j MARK --set-mark 22234
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 25 -j MARK --set-mark 22226
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 25 -j MARK --set-mark 22236
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 110 -j MARK --set-mark 22226
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 110 -j MARK --set-mark 22236
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 143 -j MARK --set-mark 22226
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 143 -j MARK --set-mark 22236
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 21 -j MARK --set-mark 22227
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 21 -j MARK --set-mark 22237
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -j MARK --set-mark 22227
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -j MARK --set-mark 22237
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.22 -j RETURN
iptables -t nat -A POSTROUTING -s 192.168.0.22 -o eth0 -j MASQUERADE


echo Cliente - Manuela Gaitto	IP:49    ID: 412
#------------------------------------------------------------------------------
#Cliente - Manuela Gaitto	IP:49    ID: 412
#------------------------------------------------------------------------------
iptables -X 192.168.0.49_i
iptables -X 192.168.0.49_o
iptables -N 192.168.0.49_i
iptables -N 192.168.0.49_o
iptables -F 192.168.0.49_i
iptables -F 192.168.0.49_o
iptables -A FORWARD -s 192.168.0.49 -j 192.168.0.49_o
iptables -A FORWARD -d 192.168.0.49 -j 192.168.0.49_i
iptables -A FORWARD -s 192.168.0.49 -m mac --mac-source 78:dd:08:e0:20:c6 -j ACCEPT
iptables -A FORWARD -d 192.168.0.49 -j ACCEPT

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:4121 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:4121 classid 1:5d htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:4121 classid 1:5e htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:4121 classid 1:5f htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:4121 classid 1:60 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:4121 classid 1:61 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:4121 classid 1:62 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:4121 classid 1:63 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:4121 classid 1:64 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:4121 classid 1:65 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 41220 fw classid 1:5d
tc filter add dev br2 protocol ip parent 1: handle 41221 fw classid 1:5e
tc filter add dev br2 protocol ip parent 1: handle 41222 fw classid 1:5f
tc filter add dev br2 protocol ip parent 1: handle 41223 fw classid 1:60
tc filter add dev br2 protocol ip parent 1: handle 41224 fw classid 1:61
tc filter add dev br2 protocol ip parent 1: handle 41225 fw classid 1:62
tc filter add dev br2 protocol ip parent 1: handle 41226 fw classid 1:63
tc filter add dev br2 protocol ip parent 1: handle 41227 fw classid 1:64
tc filter add dev br2 protocol ip parent 1: handle 41228 fw classid 1:65

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:4122 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:4122 classid 1:66 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:4122 classid 1:67 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:4122 classid 1:68 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:4122 classid 1:69 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:4122 classid 1:6a htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:4122 classid 1:6b htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:4122 classid 1:6c htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:4122 classid 1:6d htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:4122 classid 1:6e htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 41230 fw classid 1:66
tc filter add dev eth0 protocol ip parent 1: handle 41231 fw classid 1:67
tc filter add dev eth0 protocol ip parent 1: handle 41232 fw classid 1:68
tc filter add dev eth0 protocol ip parent 1: handle 41233 fw classid 1:69
tc filter add dev eth0 protocol ip parent 1: handle 41234 fw classid 1:6a
tc filter add dev eth0 protocol ip parent 1: handle 41235 fw classid 1:6b
tc filter add dev eth0 protocol ip parent 1: handle 41236 fw classid 1:6c
tc filter add dev eth0 protocol ip parent 1: handle 41237 fw classid 1:6d
tc filter add dev eth0 protocol ip parent 1: handle 41238 fw classid 1:6e


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p udp --sport 10000:30000 -j MARK --set-mark 41220
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p udp --dport 10000:30000 -j MARK --set-mark 41230
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p udp --sport 5060:5082 -j MARK --set-mark 41220
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p udp --dport 5060:5082 -j MARK --set-mark 41230
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p udp --sport 53 -j MARK --set-mark 41221
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p udp --dport 53 -j MARK --set-mark 41231
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 22 -j MARK --set-mark 41222
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 22 -j MARK --set-mark 41232
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 443 -j MARK --set-mark 41223
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 443 -j MARK --set-mark 41233
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 80 -j MARK --set-mark 41224
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 80 -j MARK --set-mark 41234
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 25 -j MARK --set-mark 41226
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 25 -j MARK --set-mark 41236
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 110 -j MARK --set-mark 41226
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 110 -j MARK --set-mark 41236
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 143 -j MARK --set-mark 41226
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 143 -j MARK --set-mark 41236
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 21 -j MARK --set-mark 41227
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 21 -j MARK --set-mark 41237
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -j MARK --set-mark 41227
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.49 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -j MARK --set-mark 41237
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.49 -j RETURN
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.49 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.49 -o eth0 -j MASQUERADE


echo Cliente - Manuela Gaitto	IP:82    ID: 389
#------------------------------------------------------------------------------
#Cliente - Manuela Gaitto	IP:82    ID: 389
#------------------------------------------------------------------------------
iptables -X 192.168.0.82_i
iptables -X 192.168.0.82_o
iptables -N 192.168.0.82_i
iptables -N 192.168.0.82_o
iptables -F 192.168.0.82_i
iptables -F 192.168.0.82_o
iptables -A FORWARD -s 192.168.0.82 -j 192.168.0.82_o
iptables -A FORWARD -d 192.168.0.82 -j 192.168.0.82_i
iptables -A FORWARD -s 192.168.0.82 -m mac --mac-source 80:c1:6e:59:1b:df -j ACCEPT
iptables -A FORWARD -d 192.168.0.82 -j ACCEPT

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:3891 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:3891 classid 1:6f htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:3891 classid 1:70 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:3891 classid 1:71 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:3891 classid 1:72 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:3891 classid 1:73 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:3891 classid 1:74 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:3891 classid 1:75 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:3891 classid 1:76 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:3891 classid 1:77 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 38920 fw classid 1:6f
tc filter add dev br2 protocol ip parent 1: handle 38921 fw classid 1:70
tc filter add dev br2 protocol ip parent 1: handle 38922 fw classid 1:71
tc filter add dev br2 protocol ip parent 1: handle 38923 fw classid 1:72
tc filter add dev br2 protocol ip parent 1: handle 38924 fw classid 1:73
tc filter add dev br2 protocol ip parent 1: handle 38925 fw classid 1:74
tc filter add dev br2 protocol ip parent 1: handle 38926 fw classid 1:75
tc filter add dev br2 protocol ip parent 1: handle 38927 fw classid 1:76
tc filter add dev br2 protocol ip parent 1: handle 38928 fw classid 1:77

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:3892 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:3892 classid 1:78 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:3892 classid 1:79 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:3892 classid 1:7a htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:3892 classid 1:7b htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:3892 classid 1:7c htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:3892 classid 1:7d htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:3892 classid 1:7e htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:3892 classid 1:7f htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:3892 classid 1:80 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 38930 fw classid 1:78
tc filter add dev eth0 protocol ip parent 1: handle 38931 fw classid 1:79
tc filter add dev eth0 protocol ip parent 1: handle 38932 fw classid 1:7a
tc filter add dev eth0 protocol ip parent 1: handle 38933 fw classid 1:7b
tc filter add dev eth0 protocol ip parent 1: handle 38934 fw classid 1:7c
tc filter add dev eth0 protocol ip parent 1: handle 38935 fw classid 1:7d
tc filter add dev eth0 protocol ip parent 1: handle 38936 fw classid 1:7e
tc filter add dev eth0 protocol ip parent 1: handle 38937 fw classid 1:7f
tc filter add dev eth0 protocol ip parent 1: handle 38938 fw classid 1:80


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p udp --sport 10000:30000 -j MARK --set-mark 38920
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p udp --dport 10000:30000 -j MARK --set-mark 38930
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p udp --sport 5060:5082 -j MARK --set-mark 38920
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p udp --dport 5060:5082 -j MARK --set-mark 38930
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p udp --sport 53 -j MARK --set-mark 38921
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p udp --dport 53 -j MARK --set-mark 38931
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 22 -j MARK --set-mark 38922
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 22 -j MARK --set-mark 38932
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 443 -j MARK --set-mark 38923
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 443 -j MARK --set-mark 38933
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 80 -j MARK --set-mark 38924
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 80 -j MARK --set-mark 38934
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 25 -j MARK --set-mark 38926
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 25 -j MARK --set-mark 38936
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 110 -j MARK --set-mark 38926
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 110 -j MARK --set-mark 38936
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 143 -j MARK --set-mark 38926
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 143 -j MARK --set-mark 38936
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 21 -j MARK --set-mark 38927
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 21 -j MARK --set-mark 38937
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -j MARK --set-mark 38927
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.82 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -j MARK --set-mark 38937
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.82 -j RETURN
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.82 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.82 -o eth0 -j MASQUERADE


echo Cliente - NO UTILIZAR	IP:1    ID: 462
#------------------------------------------------------------------------------
#Cliente - NO UTILIZAR	IP:1    ID: 462
#------------------------------------------------------------------------------
iptables -X 192.168.0.1_i
iptables -X 192.168.0.1_o
iptables -N 192.168.0.1_i
iptables -N 192.168.0.1_o
iptables -F 192.168.0.1_i
iptables -F 192.168.0.1_o
iptables -A FORWARD -s 192.168.0.1 -j 192.168.0.1_o
iptables -A FORWARD -d 192.168.0.1 -j 192.168.0.1_i

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:4621 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:4621 classid 1:81 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:4621 classid 1:82 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:4621 classid 1:83 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:4621 classid 1:84 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:4621 classid 1:85 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:4621 classid 1:86 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:4621 classid 1:87 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:4621 classid 1:88 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:4621 classid 1:89 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 46220 fw classid 1:81
tc filter add dev br2 protocol ip parent 1: handle 46221 fw classid 1:82
tc filter add dev br2 protocol ip parent 1: handle 46222 fw classid 1:83
tc filter add dev br2 protocol ip parent 1: handle 46223 fw classid 1:84
tc filter add dev br2 protocol ip parent 1: handle 46224 fw classid 1:85
tc filter add dev br2 protocol ip parent 1: handle 46225 fw classid 1:86
tc filter add dev br2 protocol ip parent 1: handle 46226 fw classid 1:87
tc filter add dev br2 protocol ip parent 1: handle 46227 fw classid 1:88
tc filter add dev br2 protocol ip parent 1: handle 46228 fw classid 1:89

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:4622 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:4622 classid 1:8a htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:4622 classid 1:8b htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:4622 classid 1:8c htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:4622 classid 1:8d htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:4622 classid 1:8e htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:4622 classid 1:8f htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:4622 classid 1:90 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:4622 classid 1:91 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:4622 classid 1:92 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 46230 fw classid 1:8a
tc filter add dev eth0 protocol ip parent 1: handle 46231 fw classid 1:8b
tc filter add dev eth0 protocol ip parent 1: handle 46232 fw classid 1:8c
tc filter add dev eth0 protocol ip parent 1: handle 46233 fw classid 1:8d
tc filter add dev eth0 protocol ip parent 1: handle 46234 fw classid 1:8e
tc filter add dev eth0 protocol ip parent 1: handle 46235 fw classid 1:8f
tc filter add dev eth0 protocol ip parent 1: handle 46236 fw classid 1:90
tc filter add dev eth0 protocol ip parent 1: handle 46237 fw classid 1:91
tc filter add dev eth0 protocol ip parent 1: handle 46238 fw classid 1:92


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p udp --sport 10000:30000 -j MARK --set-mark 46220
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p udp --dport 10000:30000 -j MARK --set-mark 46230
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p udp --sport 5060:5082 -j MARK --set-mark 46220
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p udp --dport 5060:5082 -j MARK --set-mark 46230
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p udp --sport 53 -j MARK --set-mark 46221
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p udp --dport 53 -j MARK --set-mark 46231
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 22 -j MARK --set-mark 46222
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 22 -j MARK --set-mark 46232
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 443 -j MARK --set-mark 46223
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 443 -j MARK --set-mark 46233
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 80 -j MARK --set-mark 46224
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 80 -j MARK --set-mark 46234
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 25 -j MARK --set-mark 46226
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 25 -j MARK --set-mark 46236
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 110 -j MARK --set-mark 46226
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 110 -j MARK --set-mark 46236
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 143 -j MARK --set-mark 46226
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 143 -j MARK --set-mark 46236
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 21 -j MARK --set-mark 46227
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 21 -j MARK --set-mark 46237
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -j MARK --set-mark 46227
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.1 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -j MARK --set-mark 46237
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.1 -j RETURN
iptables -t nat -A POSTROUTING -s 192.168.0.1 -o eth0 -j MASQUERADE


echo Cliente - PC en REPARACION	IP:124    ID: 208
#------------------------------------------------------------------------------
#Cliente - PC en REPARACION	IP:124    ID: 208
#------------------------------------------------------------------------------
iptables -X 192.168.0.124_i
iptables -X 192.168.0.124_o
iptables -N 192.168.0.124_i
iptables -N 192.168.0.124_o
iptables -F 192.168.0.124_i
iptables -F 192.168.0.124_o
iptables -A FORWARD -s 192.168.0.124 -j 192.168.0.124_o
iptables -A FORWARD -d 192.168.0.124 -j 192.168.0.124_i

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:2081 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:2081 classid 1:93 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:2081 classid 1:94 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:2081 classid 1:95 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:2081 classid 1:96 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:2081 classid 1:97 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:2081 classid 1:98 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:2081 classid 1:99 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:2081 classid 1:9a htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:2081 classid 1:9b htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 20820 fw classid 1:93
tc filter add dev br2 protocol ip parent 1: handle 20821 fw classid 1:94
tc filter add dev br2 protocol ip parent 1: handle 20822 fw classid 1:95
tc filter add dev br2 protocol ip parent 1: handle 20823 fw classid 1:96
tc filter add dev br2 protocol ip parent 1: handle 20824 fw classid 1:97
tc filter add dev br2 protocol ip parent 1: handle 20825 fw classid 1:98
tc filter add dev br2 protocol ip parent 1: handle 20826 fw classid 1:99
tc filter add dev br2 protocol ip parent 1: handle 20827 fw classid 1:9a
tc filter add dev br2 protocol ip parent 1: handle 20828 fw classid 1:9b

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:2082 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:2082 classid 1:9c htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:2082 classid 1:9d htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:2082 classid 1:9e htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:2082 classid 1:9f htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:2082 classid 1:a0 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:2082 classid 1:a1 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:2082 classid 1:a2 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:2082 classid 1:a3 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:2082 classid 1:a4 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 20830 fw classid 1:9c
tc filter add dev eth0 protocol ip parent 1: handle 20831 fw classid 1:9d
tc filter add dev eth0 protocol ip parent 1: handle 20832 fw classid 1:9e
tc filter add dev eth0 protocol ip parent 1: handle 20833 fw classid 1:9f
tc filter add dev eth0 protocol ip parent 1: handle 20834 fw classid 1:a0
tc filter add dev eth0 protocol ip parent 1: handle 20835 fw classid 1:a1
tc filter add dev eth0 protocol ip parent 1: handle 20836 fw classid 1:a2
tc filter add dev eth0 protocol ip parent 1: handle 20837 fw classid 1:a3
tc filter add dev eth0 protocol ip parent 1: handle 20838 fw classid 1:a4


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p udp --sport 10000:30000 -j MARK --set-mark 20820
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p udp --dport 10000:30000 -j MARK --set-mark 20830
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p udp --sport 5060:5082 -j MARK --set-mark 20820
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p udp --dport 5060:5082 -j MARK --set-mark 20830
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p udp --sport 53 -j MARK --set-mark 20821
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p udp --dport 53 -j MARK --set-mark 20831
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 22 -j MARK --set-mark 20822
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 22 -j MARK --set-mark 20832
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 443 -j MARK --set-mark 20823
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 443 -j MARK --set-mark 20833
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 80 -j MARK --set-mark 20824
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 80 -j MARK --set-mark 20834
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 25 -j MARK --set-mark 20826
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 25 -j MARK --set-mark 20836
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 110 -j MARK --set-mark 20826
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 110 -j MARK --set-mark 20836
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 143 -j MARK --set-mark 20826
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 143 -j MARK --set-mark 20836
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 21 -j MARK --set-mark 20827
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 21 -j MARK --set-mark 20837
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -j MARK --set-mark 20827
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.124 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -j MARK --set-mark 20837
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.124 -j RETURN
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.124 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.124 -o eth0 -j MASQUERADE


echo Cliente - PC07	IP:107    ID: 3
#------------------------------------------------------------------------------
#Cliente - PC07	IP:107    ID: 3
#------------------------------------------------------------------------------
iptables -X 192.168.0.107_i
iptables -X 192.168.0.107_o
iptables -N 192.168.0.107_i
iptables -N 192.168.0.107_o
iptables -F 192.168.0.107_i
iptables -F 192.168.0.107_o
iptables -A FORWARD -s 192.168.0.107 -j 192.168.0.107_o
iptables -A FORWARD -d 192.168.0.107 -j 192.168.0.107_i

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:31 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:31 classid 1:a5 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:31 classid 1:a6 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:31 classid 1:a7 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:31 classid 1:a8 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:31 classid 1:a9 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:31 classid 1:aa htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:31 classid 1:ab htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:31 classid 1:ac htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:31 classid 1:ad htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 320 fw classid 1:a5
tc filter add dev br2 protocol ip parent 1: handle 321 fw classid 1:a6
tc filter add dev br2 protocol ip parent 1: handle 322 fw classid 1:a7
tc filter add dev br2 protocol ip parent 1: handle 323 fw classid 1:a8
tc filter add dev br2 protocol ip parent 1: handle 324 fw classid 1:a9
tc filter add dev br2 protocol ip parent 1: handle 325 fw classid 1:aa
tc filter add dev br2 protocol ip parent 1: handle 326 fw classid 1:ab
tc filter add dev br2 protocol ip parent 1: handle 327 fw classid 1:ac
tc filter add dev br2 protocol ip parent 1: handle 328 fw classid 1:ad

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:32 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:32 classid 1:ae htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:32 classid 1:af htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:32 classid 1:b0 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:32 classid 1:b1 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:32 classid 1:b2 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:32 classid 1:b3 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:32 classid 1:b4 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:32 classid 1:b5 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:32 classid 1:b6 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 330 fw classid 1:ae
tc filter add dev eth0 protocol ip parent 1: handle 331 fw classid 1:af
tc filter add dev eth0 protocol ip parent 1: handle 332 fw classid 1:b0
tc filter add dev eth0 protocol ip parent 1: handle 333 fw classid 1:b1
tc filter add dev eth0 protocol ip parent 1: handle 334 fw classid 1:b2
tc filter add dev eth0 protocol ip parent 1: handle 335 fw classid 1:b3
tc filter add dev eth0 protocol ip parent 1: handle 336 fw classid 1:b4
tc filter add dev eth0 protocol ip parent 1: handle 337 fw classid 1:b5
tc filter add dev eth0 protocol ip parent 1: handle 338 fw classid 1:b6


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p udp --sport 10000:30000 -j MARK --set-mark 320
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p udp --dport 10000:30000 -j MARK --set-mark 330
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p udp --sport 5060:5082 -j MARK --set-mark 320
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p udp --dport 5060:5082 -j MARK --set-mark 330
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p udp --sport 53 -j MARK --set-mark 321
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p udp --dport 53 -j MARK --set-mark 331
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 22 -j MARK --set-mark 322
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 22 -j MARK --set-mark 332
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 443 -j MARK --set-mark 323
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 443 -j MARK --set-mark 333
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 80 -j MARK --set-mark 324
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 80 -j MARK --set-mark 334
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 25 -j MARK --set-mark 326
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 25 -j MARK --set-mark 336
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 110 -j MARK --set-mark 326
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 110 -j MARK --set-mark 336
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 143 -j MARK --set-mark 326
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 143 -j MARK --set-mark 336
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 21 -j MARK --set-mark 327
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 21 -j MARK --set-mark 337
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -j MARK --set-mark 327
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.107 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -j MARK --set-mark 337
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.107 -j RETURN
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.107 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.107 -o eth0 -j MASQUERADE


echo Cliente - PC53	IP:153    ID: 459
#------------------------------------------------------------------------------
#Cliente - PC53	IP:153    ID: 459
#------------------------------------------------------------------------------
iptables -X 192.168.0.153_i
iptables -X 192.168.0.153_o
iptables -N 192.168.0.153_i
iptables -N 192.168.0.153_o
iptables -F 192.168.0.153_i
iptables -F 192.168.0.153_o
iptables -A FORWARD -s 192.168.0.153 -j 192.168.0.153_o
iptables -A FORWARD -d 192.168.0.153 -j 192.168.0.153_i

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:4591 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:4591 classid 1:b7 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:4591 classid 1:b8 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:4591 classid 1:b9 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:4591 classid 1:ba htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:4591 classid 1:bb htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:4591 classid 1:bc htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:4591 classid 1:bd htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:4591 classid 1:be htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:4591 classid 1:bf htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 45920 fw classid 1:b7
tc filter add dev br2 protocol ip parent 1: handle 45921 fw classid 1:b8
tc filter add dev br2 protocol ip parent 1: handle 45922 fw classid 1:b9
tc filter add dev br2 protocol ip parent 1: handle 45923 fw classid 1:ba
tc filter add dev br2 protocol ip parent 1: handle 45924 fw classid 1:bb
tc filter add dev br2 protocol ip parent 1: handle 45925 fw classid 1:bc
tc filter add dev br2 protocol ip parent 1: handle 45926 fw classid 1:bd
tc filter add dev br2 protocol ip parent 1: handle 45927 fw classid 1:be
tc filter add dev br2 protocol ip parent 1: handle 45928 fw classid 1:bf

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:4592 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:4592 classid 1:c0 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:4592 classid 1:c1 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:4592 classid 1:c2 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:4592 classid 1:c3 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:4592 classid 1:c4 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:4592 classid 1:c5 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:4592 classid 1:c6 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:4592 classid 1:c7 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:4592 classid 1:c8 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 45930 fw classid 1:c0
tc filter add dev eth0 protocol ip parent 1: handle 45931 fw classid 1:c1
tc filter add dev eth0 protocol ip parent 1: handle 45932 fw classid 1:c2
tc filter add dev eth0 protocol ip parent 1: handle 45933 fw classid 1:c3
tc filter add dev eth0 protocol ip parent 1: handle 45934 fw classid 1:c4
tc filter add dev eth0 protocol ip parent 1: handle 45935 fw classid 1:c5
tc filter add dev eth0 protocol ip parent 1: handle 45936 fw classid 1:c6
tc filter add dev eth0 protocol ip parent 1: handle 45937 fw classid 1:c7
tc filter add dev eth0 protocol ip parent 1: handle 45938 fw classid 1:c8


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p udp --sport 10000:30000 -j MARK --set-mark 45920
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p udp --dport 10000:30000 -j MARK --set-mark 45930
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p udp --sport 5060:5082 -j MARK --set-mark 45920
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p udp --dport 5060:5082 -j MARK --set-mark 45930
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p udp --sport 53 -j MARK --set-mark 45921
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p udp --dport 53 -j MARK --set-mark 45931
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 22 -j MARK --set-mark 45922
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 22 -j MARK --set-mark 45932
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 443 -j MARK --set-mark 45923
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 443 -j MARK --set-mark 45933
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 80 -j MARK --set-mark 45924
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 80 -j MARK --set-mark 45934
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 25 -j MARK --set-mark 45926
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 25 -j MARK --set-mark 45936
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 110 -j MARK --set-mark 45926
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 110 -j MARK --set-mark 45936
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 143 -j MARK --set-mark 45926
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 143 -j MARK --set-mark 45936
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 21 -j MARK --set-mark 45927
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 21 -j MARK --set-mark 45937
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -j MARK --set-mark 45927
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.153 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -j MARK --set-mark 45937
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.153 -j RETURN
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.153 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.153 -o eth0 -j MASQUERADE


echo Cliente - Router Vte Lopez	IP:14    ID: 391
#------------------------------------------------------------------------------
#Cliente - Router Vte Lopez	IP:14    ID: 391
#------------------------------------------------------------------------------
iptables -X 192.168.0.14_i
iptables -X 192.168.0.14_o
iptables -N 192.168.0.14_i
iptables -N 192.168.0.14_o
iptables -F 192.168.0.14_i
iptables -F 192.168.0.14_o
iptables -A FORWARD -s 192.168.0.14 -j 192.168.0.14_o
iptables -A FORWARD -d 192.168.0.14 -j 192.168.0.14_i
iptables -A FORWARD -s 192.168.0.14 -m mac --mac-source 00:1e:e5:34:b3:a7 -j ACCEPT
iptables -A FORWARD -d 192.168.0.14 -j ACCEPT

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:3911 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:3911 classid 1:c9 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:3911 classid 1:ca htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:3911 classid 1:cb htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:3911 classid 1:cc htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:3911 classid 1:cd htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:3911 classid 1:ce htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:3911 classid 1:cf htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:3911 classid 1:d0 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:3911 classid 1:d1 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 39120 fw classid 1:c9
tc filter add dev br2 protocol ip parent 1: handle 39121 fw classid 1:ca
tc filter add dev br2 protocol ip parent 1: handle 39122 fw classid 1:cb
tc filter add dev br2 protocol ip parent 1: handle 39123 fw classid 1:cc
tc filter add dev br2 protocol ip parent 1: handle 39124 fw classid 1:cd
tc filter add dev br2 protocol ip parent 1: handle 39125 fw classid 1:ce
tc filter add dev br2 protocol ip parent 1: handle 39126 fw classid 1:cf
tc filter add dev br2 protocol ip parent 1: handle 39127 fw classid 1:d0
tc filter add dev br2 protocol ip parent 1: handle 39128 fw classid 1:d1

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:3912 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:3912 classid 1:d2 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:3912 classid 1:d3 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:3912 classid 1:d4 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:3912 classid 1:d5 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:3912 classid 1:d6 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:3912 classid 1:d7 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:3912 classid 1:d8 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:3912 classid 1:d9 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:3912 classid 1:da htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 39130 fw classid 1:d2
tc filter add dev eth0 protocol ip parent 1: handle 39131 fw classid 1:d3
tc filter add dev eth0 protocol ip parent 1: handle 39132 fw classid 1:d4
tc filter add dev eth0 protocol ip parent 1: handle 39133 fw classid 1:d5
tc filter add dev eth0 protocol ip parent 1: handle 39134 fw classid 1:d6
tc filter add dev eth0 protocol ip parent 1: handle 39135 fw classid 1:d7
tc filter add dev eth0 protocol ip parent 1: handle 39136 fw classid 1:d8
tc filter add dev eth0 protocol ip parent 1: handle 39137 fw classid 1:d9
tc filter add dev eth0 protocol ip parent 1: handle 39138 fw classid 1:da


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p udp --sport 10000:30000 -j MARK --set-mark 39120
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p udp --dport 10000:30000 -j MARK --set-mark 39130
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p udp --sport 5060:5082 -j MARK --set-mark 39120
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p udp --dport 5060:5082 -j MARK --set-mark 39130
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p udp --sport 53 -j MARK --set-mark 39121
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p udp --dport 53 -j MARK --set-mark 39131
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 22 -j MARK --set-mark 39122
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 22 -j MARK --set-mark 39132
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 443 -j MARK --set-mark 39123
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 443 -j MARK --set-mark 39133
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 80 -j MARK --set-mark 39124
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 80 -j MARK --set-mark 39134
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 25 -j MARK --set-mark 39126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 25 -j MARK --set-mark 39136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 110 -j MARK --set-mark 39126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 110 -j MARK --set-mark 39136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 143 -j MARK --set-mark 39126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 143 -j MARK --set-mark 39136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 21 -j MARK --set-mark 39127
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 21 -j MARK --set-mark 39137
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -j MARK --set-mark 39127
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.14 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -j MARK --set-mark 39137
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.14 -j RETURN
iptables -t nat -A POSTROUTING -s 192.168.0.14 -o eth0 -j MASQUERADE


echo Cliente - Router wi-fi	IP:17    ID: 380
#------------------------------------------------------------------------------
#Cliente - Router wi-fi	IP:17    ID: 380
#------------------------------------------------------------------------------
iptables -X 192.168.0.17_i
iptables -X 192.168.0.17_o
iptables -N 192.168.0.17_i
iptables -N 192.168.0.17_o
iptables -F 192.168.0.17_i
iptables -F 192.168.0.17_o
iptables -A FORWARD -s 192.168.0.17 -j 192.168.0.17_o
iptables -A FORWARD -d 192.168.0.17 -j 192.168.0.17_i
iptables -A FORWARD -s 192.168.0.17 -m mac --mac-source 54:e6:fc:bc:1e:39 -j ACCEPT
iptables -A FORWARD -d 192.168.0.17 -j ACCEPT

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:3801 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:3801 classid 1:db htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:3801 classid 1:dc htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:3801 classid 1:dd htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:3801 classid 1:de htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:3801 classid 1:df htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:3801 classid 1:e0 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:3801 classid 1:e1 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:3801 classid 1:e2 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:3801 classid 1:e3 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 38020 fw classid 1:db
tc filter add dev br2 protocol ip parent 1: handle 38021 fw classid 1:dc
tc filter add dev br2 protocol ip parent 1: handle 38022 fw classid 1:dd
tc filter add dev br2 protocol ip parent 1: handle 38023 fw classid 1:de
tc filter add dev br2 protocol ip parent 1: handle 38024 fw classid 1:df
tc filter add dev br2 protocol ip parent 1: handle 38025 fw classid 1:e0
tc filter add dev br2 protocol ip parent 1: handle 38026 fw classid 1:e1
tc filter add dev br2 protocol ip parent 1: handle 38027 fw classid 1:e2
tc filter add dev br2 protocol ip parent 1: handle 38028 fw classid 1:e3

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:3802 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:3802 classid 1:e4 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:3802 classid 1:e5 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:3802 classid 1:e6 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:3802 classid 1:e7 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:3802 classid 1:e8 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:3802 classid 1:e9 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:3802 classid 1:ea htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:3802 classid 1:eb htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:3802 classid 1:ec htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 38030 fw classid 1:e4
tc filter add dev eth0 protocol ip parent 1: handle 38031 fw classid 1:e5
tc filter add dev eth0 protocol ip parent 1: handle 38032 fw classid 1:e6
tc filter add dev eth0 protocol ip parent 1: handle 38033 fw classid 1:e7
tc filter add dev eth0 protocol ip parent 1: handle 38034 fw classid 1:e8
tc filter add dev eth0 protocol ip parent 1: handle 38035 fw classid 1:e9
tc filter add dev eth0 protocol ip parent 1: handle 38036 fw classid 1:ea
tc filter add dev eth0 protocol ip parent 1: handle 38037 fw classid 1:eb
tc filter add dev eth0 protocol ip parent 1: handle 38038 fw classid 1:ec


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p udp --sport 10000:30000 -j MARK --set-mark 38020
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p udp --dport 10000:30000 -j MARK --set-mark 38030
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p udp --sport 5060:5082 -j MARK --set-mark 38020
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p udp --dport 5060:5082 -j MARK --set-mark 38030
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p udp --sport 53 -j MARK --set-mark 38021
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p udp --dport 53 -j MARK --set-mark 38031
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 22 -j MARK --set-mark 38022
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 22 -j MARK --set-mark 38032
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 443 -j MARK --set-mark 38023
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 443 -j MARK --set-mark 38033
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 80 -j MARK --set-mark 38024
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 80 -j MARK --set-mark 38034
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 25 -j MARK --set-mark 38026
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 25 -j MARK --set-mark 38036
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 110 -j MARK --set-mark 38026
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 110 -j MARK --set-mark 38036
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 143 -j MARK --set-mark 38026
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 143 -j MARK --set-mark 38036
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 21 -j MARK --set-mark 38027
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 21 -j MARK --set-mark 38037
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -j MARK --set-mark 38027
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.17 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -j MARK --set-mark 38037
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.17 -j RETURN
iptables -t nat -A POSTROUTING -s 192.168.0.17 -o eth0 -j MASQUERADE


echo Cliente - Router Wifi	IP:7    ID: 321
#------------------------------------------------------------------------------
#Cliente - Router Wifi	IP:7    ID: 321
#------------------------------------------------------------------------------
iptables -X 192.168.0.7_i
iptables -X 192.168.0.7_o
iptables -N 192.168.0.7_i
iptables -N 192.168.0.7_o
iptables -F 192.168.0.7_i
iptables -F 192.168.0.7_o
iptables -A FORWARD -s 192.168.0.7 -j 192.168.0.7_o
iptables -A FORWARD -d 192.168.0.7 -j 192.168.0.7_i
iptables -A FORWARD -s 192.168.0.7 -m mac --mac-source 00:1e:e5:34:b3:a8 -j ACCEPT
iptables -A FORWARD -d 192.168.0.7 -j ACCEPT

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:3211 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:3211 classid 1:ed htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:3211 classid 1:ee htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:3211 classid 1:ef htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:3211 classid 1:f0 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:3211 classid 1:f1 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:3211 classid 1:f2 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:3211 classid 1:f3 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:3211 classid 1:f4 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:3211 classid 1:f5 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 32120 fw classid 1:ed
tc filter add dev br2 protocol ip parent 1: handle 32121 fw classid 1:ee
tc filter add dev br2 protocol ip parent 1: handle 32122 fw classid 1:ef
tc filter add dev br2 protocol ip parent 1: handle 32123 fw classid 1:f0
tc filter add dev br2 protocol ip parent 1: handle 32124 fw classid 1:f1
tc filter add dev br2 protocol ip parent 1: handle 32125 fw classid 1:f2
tc filter add dev br2 protocol ip parent 1: handle 32126 fw classid 1:f3
tc filter add dev br2 protocol ip parent 1: handle 32127 fw classid 1:f4
tc filter add dev br2 protocol ip parent 1: handle 32128 fw classid 1:f5

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:3212 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:3212 classid 1:f6 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:3212 classid 1:f7 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:3212 classid 1:f8 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:3212 classid 1:f9 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:3212 classid 1:fa htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:3212 classid 1:fb htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:3212 classid 1:fc htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:3212 classid 1:fd htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:3212 classid 1:fe htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 32130 fw classid 1:f6
tc filter add dev eth0 protocol ip parent 1: handle 32131 fw classid 1:f7
tc filter add dev eth0 protocol ip parent 1: handle 32132 fw classid 1:f8
tc filter add dev eth0 protocol ip parent 1: handle 32133 fw classid 1:f9
tc filter add dev eth0 protocol ip parent 1: handle 32134 fw classid 1:fa
tc filter add dev eth0 protocol ip parent 1: handle 32135 fw classid 1:fb
tc filter add dev eth0 protocol ip parent 1: handle 32136 fw classid 1:fc
tc filter add dev eth0 protocol ip parent 1: handle 32137 fw classid 1:fd
tc filter add dev eth0 protocol ip parent 1: handle 32138 fw classid 1:fe


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p udp --sport 10000:30000 -j MARK --set-mark 32120
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p udp --dport 10000:30000 -j MARK --set-mark 32130
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p udp --sport 5060:5082 -j MARK --set-mark 32120
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p udp --dport 5060:5082 -j MARK --set-mark 32130
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p udp --sport 53 -j MARK --set-mark 32121
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p udp --dport 53 -j MARK --set-mark 32131
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 22 -j MARK --set-mark 32122
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 22 -j MARK --set-mark 32132
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 443 -j MARK --set-mark 32123
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 443 -j MARK --set-mark 32133
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 80 -j MARK --set-mark 32124
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 80 -j MARK --set-mark 32134
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 25 -j MARK --set-mark 32126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 25 -j MARK --set-mark 32136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 110 -j MARK --set-mark 32126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 110 -j MARK --set-mark 32136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 143 -j MARK --set-mark 32126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 143 -j MARK --set-mark 32136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 21 -j MARK --set-mark 32127
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 21 -j MARK --set-mark 32137
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -j MARK --set-mark 32127
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.7 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -j MARK --set-mark 32137
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.7 -j RETURN
iptables -t nat -A POSTROUTING -s 192.168.0.7 -o eth0 -j MASQUERADE


echo Cliente - Servidor caballito 2	IP:191    ID: 291
#------------------------------------------------------------------------------
#Cliente - Servidor caballito 2	IP:191    ID: 291
#------------------------------------------------------------------------------
iptables -X 192.168.0.191_i
iptables -X 192.168.0.191_o
iptables -N 192.168.0.191_i
iptables -N 192.168.0.191_o
iptables -F 192.168.0.191_i
iptables -F 192.168.0.191_o
iptables -A FORWARD -s 192.168.0.191 -j 192.168.0.191_o
iptables -A FORWARD -d 192.168.0.191 -j 192.168.0.191_i

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:2911 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:2911 classid 1:ff htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:2911 classid 1:100 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:2911 classid 1:101 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:2911 classid 1:102 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:2911 classid 1:103 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:2911 classid 1:104 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:2911 classid 1:105 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:2911 classid 1:106 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:2911 classid 1:107 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 29120 fw classid 1:ff
tc filter add dev br2 protocol ip parent 1: handle 29121 fw classid 1:100
tc filter add dev br2 protocol ip parent 1: handle 29122 fw classid 1:101
tc filter add dev br2 protocol ip parent 1: handle 29123 fw classid 1:102
tc filter add dev br2 protocol ip parent 1: handle 29124 fw classid 1:103
tc filter add dev br2 protocol ip parent 1: handle 29125 fw classid 1:104
tc filter add dev br2 protocol ip parent 1: handle 29126 fw classid 1:105
tc filter add dev br2 protocol ip parent 1: handle 29127 fw classid 1:106
tc filter add dev br2 protocol ip parent 1: handle 29128 fw classid 1:107

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:2912 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:2912 classid 1:108 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:2912 classid 1:109 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:2912 classid 1:10a htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:2912 classid 1:10b htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:2912 classid 1:10c htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:2912 classid 1:10d htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:2912 classid 1:10e htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:2912 classid 1:10f htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:2912 classid 1:110 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 29130 fw classid 1:108
tc filter add dev eth0 protocol ip parent 1: handle 29131 fw classid 1:109
tc filter add dev eth0 protocol ip parent 1: handle 29132 fw classid 1:10a
tc filter add dev eth0 protocol ip parent 1: handle 29133 fw classid 1:10b
tc filter add dev eth0 protocol ip parent 1: handle 29134 fw classid 1:10c
tc filter add dev eth0 protocol ip parent 1: handle 29135 fw classid 1:10d
tc filter add dev eth0 protocol ip parent 1: handle 29136 fw classid 1:10e
tc filter add dev eth0 protocol ip parent 1: handle 29137 fw classid 1:10f
tc filter add dev eth0 protocol ip parent 1: handle 29138 fw classid 1:110


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p udp --sport 10000:30000 -j MARK --set-mark 29120
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p udp --dport 10000:30000 -j MARK --set-mark 29130
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p udp --sport 5060:5082 -j MARK --set-mark 29120
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p udp --dport 5060:5082 -j MARK --set-mark 29130
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p udp --sport 53 -j MARK --set-mark 29121
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p udp --dport 53 -j MARK --set-mark 29131
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 22 -j MARK --set-mark 29122
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 22 -j MARK --set-mark 29132
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 443 -j MARK --set-mark 29123
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 443 -j MARK --set-mark 29133
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 80 -j MARK --set-mark 29124
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 80 -j MARK --set-mark 29134
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 25 -j MARK --set-mark 29126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 25 -j MARK --set-mark 29136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 110 -j MARK --set-mark 29126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 110 -j MARK --set-mark 29136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 143 -j MARK --set-mark 29126
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 143 -j MARK --set-mark 29136
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 21 -j MARK --set-mark 29127
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 21 -j MARK --set-mark 29137
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -j MARK --set-mark 29127
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.191 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -j MARK --set-mark 29137
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.191 -j RETURN
iptables -t nat -A POSTROUTING -s 192.168.0.191 -o eth0 -j MASQUERADE


echo Cliente - Sonia Toconas	IP:243    ID: 198
#------------------------------------------------------------------------------
#Cliente - Sonia Toconas	IP:243    ID: 198
#------------------------------------------------------------------------------
iptables -X 192.168.0.243_i
iptables -X 192.168.0.243_o
iptables -N 192.168.0.243_i
iptables -N 192.168.0.243_o
iptables -F 192.168.0.243_i
iptables -F 192.168.0.243_o
iptables -A FORWARD -s 192.168.0.243 -j 192.168.0.243_o
iptables -A FORWARD -d 192.168.0.243 -j 192.168.0.243_i
iptables -A FORWARD -s 192.168.0.243 -m mac --mac-source 00:24:54:6E:26:E2 -j ACCEPT
iptables -A FORWARD -d 192.168.0.243 -j ACCEPT

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:1981 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:1981 classid 1:111 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:1981 classid 1:112 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:1981 classid 1:113 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:1981 classid 1:114 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:1981 classid 1:115 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:1981 classid 1:116 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:1981 classid 1:117 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:1981 classid 1:118 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:1981 classid 1:119 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 19820 fw classid 1:111
tc filter add dev br2 protocol ip parent 1: handle 19821 fw classid 1:112
tc filter add dev br2 protocol ip parent 1: handle 19822 fw classid 1:113
tc filter add dev br2 protocol ip parent 1: handle 19823 fw classid 1:114
tc filter add dev br2 protocol ip parent 1: handle 19824 fw classid 1:115
tc filter add dev br2 protocol ip parent 1: handle 19825 fw classid 1:116
tc filter add dev br2 protocol ip parent 1: handle 19826 fw classid 1:117
tc filter add dev br2 protocol ip parent 1: handle 19827 fw classid 1:118
tc filter add dev br2 protocol ip parent 1: handle 19828 fw classid 1:119

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:1982 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:1982 classid 1:11a htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:1982 classid 1:11b htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:1982 classid 1:11c htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:1982 classid 1:11d htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:1982 classid 1:11e htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:1982 classid 1:11f htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:1982 classid 1:120 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:1982 classid 1:121 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:1982 classid 1:122 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 19830 fw classid 1:11a
tc filter add dev eth0 protocol ip parent 1: handle 19831 fw classid 1:11b
tc filter add dev eth0 protocol ip parent 1: handle 19832 fw classid 1:11c
tc filter add dev eth0 protocol ip parent 1: handle 19833 fw classid 1:11d
tc filter add dev eth0 protocol ip parent 1: handle 19834 fw classid 1:11e
tc filter add dev eth0 protocol ip parent 1: handle 19835 fw classid 1:11f
tc filter add dev eth0 protocol ip parent 1: handle 19836 fw classid 1:120
tc filter add dev eth0 protocol ip parent 1: handle 19837 fw classid 1:121
tc filter add dev eth0 protocol ip parent 1: handle 19838 fw classid 1:122


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p udp --sport 10000:30000 -j MARK --set-mark 19820
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p udp --dport 10000:30000 -j MARK --set-mark 19830
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p udp --sport 5060:5082 -j MARK --set-mark 19820
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p udp --dport 5060:5082 -j MARK --set-mark 19830
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p udp --sport 53 -j MARK --set-mark 19821
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p udp --dport 53 -j MARK --set-mark 19831
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 22 -j MARK --set-mark 19822
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 22 -j MARK --set-mark 19832
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 443 -j MARK --set-mark 19823
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 443 -j MARK --set-mark 19833
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 80 -j MARK --set-mark 19824
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 80 -j MARK --set-mark 19834
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 25 -j MARK --set-mark 19826
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 25 -j MARK --set-mark 19836
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 110 -j MARK --set-mark 19826
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 110 -j MARK --set-mark 19836
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 143 -j MARK --set-mark 19826
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 143 -j MARK --set-mark 19836
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 21 -j MARK --set-mark 19827
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 21 -j MARK --set-mark 19837
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -j MARK --set-mark 19827
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.243 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -j MARK --set-mark 19837
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.243 -j RETURN
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.243 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.243 -o eth0 -j MASQUERADE


echo Cliente - telefono belgrano	IP:42    ID: 473
#------------------------------------------------------------------------------
#Cliente - telefono belgrano	IP:42    ID: 473
#------------------------------------------------------------------------------
iptables -X 192.168.0.42_i
iptables -X 192.168.0.42_o
iptables -N 192.168.0.42_i
iptables -N 192.168.0.42_o
iptables -F 192.168.0.42_i
iptables -F 192.168.0.42_o
iptables -A FORWARD -s 192.168.0.42 -j 192.168.0.42_o
iptables -A FORWARD -d 192.168.0.42 -j 192.168.0.42_i

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:4731 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:4731 classid 1:123 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:4731 classid 1:124 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:4731 classid 1:125 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:4731 classid 1:126 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:4731 classid 1:127 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:4731 classid 1:128 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:4731 classid 1:129 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:4731 classid 1:12a htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:4731 classid 1:12b htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 47320 fw classid 1:123
tc filter add dev br2 protocol ip parent 1: handle 47321 fw classid 1:124
tc filter add dev br2 protocol ip parent 1: handle 47322 fw classid 1:125
tc filter add dev br2 protocol ip parent 1: handle 47323 fw classid 1:126
tc filter add dev br2 protocol ip parent 1: handle 47324 fw classid 1:127
tc filter add dev br2 protocol ip parent 1: handle 47325 fw classid 1:128
tc filter add dev br2 protocol ip parent 1: handle 47326 fw classid 1:129
tc filter add dev br2 protocol ip parent 1: handle 47327 fw classid 1:12a
tc filter add dev br2 protocol ip parent 1: handle 47328 fw classid 1:12b

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:4732 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:4732 classid 1:12c htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:4732 classid 1:12d htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:4732 classid 1:12e htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:4732 classid 1:12f htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:4732 classid 1:130 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:4732 classid 1:131 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:4732 classid 1:132 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:4732 classid 1:133 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:4732 classid 1:134 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 47330 fw classid 1:12c
tc filter add dev eth0 protocol ip parent 1: handle 47331 fw classid 1:12d
tc filter add dev eth0 protocol ip parent 1: handle 47332 fw classid 1:12e
tc filter add dev eth0 protocol ip parent 1: handle 47333 fw classid 1:12f
tc filter add dev eth0 protocol ip parent 1: handle 47334 fw classid 1:130
tc filter add dev eth0 protocol ip parent 1: handle 47335 fw classid 1:131
tc filter add dev eth0 protocol ip parent 1: handle 47336 fw classid 1:132
tc filter add dev eth0 protocol ip parent 1: handle 47337 fw classid 1:133
tc filter add dev eth0 protocol ip parent 1: handle 47338 fw classid 1:134


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p udp --sport 10000:30000 -j MARK --set-mark 47320
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p udp --dport 10000:30000 -j MARK --set-mark 47330
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p udp --sport 5060:5082 -j MARK --set-mark 47320
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p udp --dport 5060:5082 -j MARK --set-mark 47330
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p udp --sport 53 -j MARK --set-mark 47321
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p udp --dport 53 -j MARK --set-mark 47331
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 22 -j MARK --set-mark 47322
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 22 -j MARK --set-mark 47332
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 443 -j MARK --set-mark 47323
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 443 -j MARK --set-mark 47333
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 80 -j MARK --set-mark 47324
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 80 -j MARK --set-mark 47334
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 25 -j MARK --set-mark 47326
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 25 -j MARK --set-mark 47336
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 110 -j MARK --set-mark 47326
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 110 -j MARK --set-mark 47336
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 143 -j MARK --set-mark 47326
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 143 -j MARK --set-mark 47336
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 21 -j MARK --set-mark 47327
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 21 -j MARK --set-mark 47337
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -j MARK --set-mark 47327
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.42 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -j MARK --set-mark 47337
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.42 -j RETURN
iptables -t nat -A POSTROUTING -s 192.168.0.42 -o eth0 -j MASQUERADE


echo Cliente - WiFi Vicente Lopez	IP:5    ID: 370
#------------------------------------------------------------------------------
#Cliente - WiFi Vicente Lopez	IP:5    ID: 370
#------------------------------------------------------------------------------
iptables -X 192.168.0.5_i
iptables -X 192.168.0.5_o
iptables -N 192.168.0.5_i
iptables -N 192.168.0.5_o
iptables -F 192.168.0.5_i
iptables -F 192.168.0.5_o
iptables -A FORWARD -s 192.168.0.5 -j 192.168.0.5_o
iptables -A FORWARD -d 192.168.0.5 -j 192.168.0.5_i

# CLASES DE BAJADA
tc class add dev br2 parent 1: classid 1:3701 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev br2 parent 1:3701 classid 1:135 htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev br2 parent 1:3701 classid 1:136 htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev br2 parent 1:3701 classid 1:137 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev br2 parent 1:3701 classid 1:138 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev br2 parent 1:3701 classid 1:139 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev br2 parent 1:3701 classid 1:13a htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev br2 parent 1:3701 classid 1:13b htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev br2 parent 1:3701 classid 1:13c htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev br2 parent 1:3701 classid 1:13d htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE BAJADA
tc filter add dev br2 protocol ip parent 1: handle 37020 fw classid 1:135
tc filter add dev br2 protocol ip parent 1: handle 37021 fw classid 1:136
tc filter add dev br2 protocol ip parent 1: handle 37022 fw classid 1:137
tc filter add dev br2 protocol ip parent 1: handle 37023 fw classid 1:138
tc filter add dev br2 protocol ip parent 1: handle 37024 fw classid 1:139
tc filter add dev br2 protocol ip parent 1: handle 37025 fw classid 1:13a
tc filter add dev br2 protocol ip parent 1: handle 37026 fw classid 1:13b
tc filter add dev br2 protocol ip parent 1: handle 37027 fw classid 1:13c
tc filter add dev br2 protocol ip parent 1: handle 37028 fw classid 1:13d

# CLASES DE SUBIDA
tc class add dev eth0 parent 1: classid 1:3702 htb rate 256kbit ceil 256kbit burst 15k
tc class add dev eth0 parent 1:3702 classid 1:13e htb rate 102kbit ceil 256kbit burst 15k prio 0
tc class add dev eth0 parent 1:3702 classid 1:13f htb rate 102kbit ceil 256kbit burst 15k prio 1
tc class add dev eth0 parent 1:3702 classid 1:140 htb rate 102kbit ceil 256kbit burst 15k prio 2
tc class add dev eth0 parent 1:3702 classid 1:141 htb rate 102kbit ceil 256kbit burst 15k prio 3
tc class add dev eth0 parent 1:3702 classid 1:142 htb rate 102kbit ceil 256kbit burst 15k prio 4
tc class add dev eth0 parent 1:3702 classid 1:143 htb rate 102kbit ceil 256kbit burst 15k prio 5
tc class add dev eth0 parent 1:3702 classid 1:144 htb rate 100kbit ceil 256kbit burst 15k prio 6
tc class add dev eth0 parent 1:3702 classid 1:145 htb rate 100kbit ceil 256kbit burst 15k prio 7
tc class add dev eth0 parent 1:3702 classid 1:146 htb rate 100kbit ceil 256kbit burst 15k prio 8

# HANDLERS DE SUBIDA
tc filter add dev eth0 protocol ip parent 1: handle 37030 fw classid 1:13e
tc filter add dev eth0 protocol ip parent 1: handle 37031 fw classid 1:13f
tc filter add dev eth0 protocol ip parent 1: handle 37032 fw classid 1:140
tc filter add dev eth0 protocol ip parent 1: handle 37033 fw classid 1:141
tc filter add dev eth0 protocol ip parent 1: handle 37034 fw classid 1:142
tc filter add dev eth0 protocol ip parent 1: handle 37035 fw classid 1:143
tc filter add dev eth0 protocol ip parent 1: handle 37036 fw classid 1:144
tc filter add dev eth0 protocol ip parent 1: handle 37037 fw classid 1:145
tc filter add dev eth0 protocol ip parent 1: handle 37038 fw classid 1:146


# MARCAJE DE PAQUETES

iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p udp --sport 10000:30000 -j MARK --set-mark 37020
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p udp --sport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p udp --dport 10000:30000 -j MARK --set-mark 37030
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p udp --dport 10000:30000 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p udp --sport 5060:5082 -j MARK --set-mark 37020
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p udp --sport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p udp --dport 5060:5082 -j MARK --set-mark 37030
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p udp --dport 5060:5082 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p udp --sport 53 -j MARK --set-mark 37021
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p udp --sport 53 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p udp --dport 53 -j MARK --set-mark 37031
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p udp --dport 53 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 22 -j MARK --set-mark 37022
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 22 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 22 -j MARK --set-mark 37032
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 22 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 443 -j MARK --set-mark 37023
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 443 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 443 -j MARK --set-mark 37033
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 443 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 80 -j MARK --set-mark 37024
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 80 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 80 -j MARK --set-mark 37034
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 80 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 25 -j MARK --set-mark 37026
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 25 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 25 -j MARK --set-mark 37036
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 25 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 110 -j MARK --set-mark 37026
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 110 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 110 -j MARK --set-mark 37036
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 110 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 143 -j MARK --set-mark 37026
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 143 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 143 -j MARK --set-mark 37036
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 143 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 21 -j MARK --set-mark 37027
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -p tcp --sport 21 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 21 -j MARK --set-mark 37037
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -p tcp --dport 21 -j RETURN
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -j MARK --set-mark 37027
iptables -t mangle -A FORWARD -o br2 -d 192.168.0.5 -j RETURN
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -j MARK --set-mark 37037
iptables -t mangle -A FORWARD -i br2 -s 192.168.0.5 -j RETURN
iptables -t nat -A POSTROUTING -s 192.168.0.5 -o eth0 -j MASQUERADE
iptables -A INPUT -p udp --dport 9010 -j ACCEPT
iptables -A OUTPUT -p udp --sport 9010 -j ACCEPT
iptables -A INPUT -p udp --dport 9010 -j ACCEPT
iptables -A OUTPUT -p udp --sport 9010 -j ACCEPT
iptables -t mangle -A PREROUTING -p tcp -j RETURN
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
