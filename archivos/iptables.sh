iptables -F
iptables -t nat -F
iptables -t mangle -F

# COMIENZO DEL FIREWALL PERSONALIZADO
iptables -A FORWARD -d 200.69.248.13 -j ACCEPT
iptables -A FORWARD -s 200.69.248.13 -j ACCEPT
iptables -A FORWARD -s 190.221.46.236 -j ACCEPT
iptables -A FORWARD -d 190.221.46.236 -j ACCEPT
iptables -A FORWARD -d 190.221.46.236 -j ACCEPT
iptables -A FORWARD -d 200.80.194.18 -p udp -j ACCEPT
iptables -A FORWARD -s 200.80.194.18 -p udp -j ACCEPT
iptables -A FORWARD -d 200.80.194.18 -p tcp -j ACCEPT
iptables -A FORWARD -s 200.80.194.18 -p tcp -j ACCEPT
iptables -A FORWARD -d 200.80.195.18 -p udp -j ACCEPT
iptables -A FORWARD -s 200.80.195.18 -p udp -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 3128 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 3128 -j ACCEPT
iptables -A FORWARD -d 190.2.45.229 -j ACCEPT
iptables -A FORWARD -s 190.2.45.229 -j ACCEPT
iptables -A FORWARD -d 190.2.29.105 -j ACCEPT
iptables -A FORWARD -s 190.2.29.105 -j ACCEPT

# FIN DEL FIREWALL PERSONALIZADO

# COMIENZO DE FILTROS PERSONALIZADOS

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
iptables -t nat -A PREROUTING -i eth0 -p tcp -s 190.190.176.45 --dport 8949 -j DNAT --to 172.16.45.2:80
iptables -t nat -A PREROUTING -i eth0 -p tcp -s 0.0.0.0/0 --dport 4097 -j DNAT --to 172.16.0.36:4097
#==========================================================================================
# DEFINICION DE COLAS BASICAS
#==========================================================================================
tc qdisc del dev eth0 root
tc qdisc add dev eth0 root handle 1: htb
tc qdisc del dev eth1 root
tc qdisc add dev eth1 root handle 1: htb


echo Cliente - Alejandro Rogers	IP:62    ID: 358
#------------------------------------------------------------------------------
#Cliente - Alejandro Rogers	IP:62    ID: 358
#------------------------------------------------------------------------------
iptables -X 192.168.0.62_i
iptables -X 192.168.0.62_o
iptables -N 192.168.0.62_i
iptables -N 192.168.0.62_o
iptables -F 192.168.0.62_i
iptables -F 192.168.0.62_o
iptables -A FORWARD -s 192.168.0.62 -j 192.168.0.62_o
iptables -A FORWARD -d 192.168.0.62 -j 192.168.0.62_i
iptables -A FORWARD -s 192.168.0.62 -m mac --mac-source f0:de:f1:87:cb:2c -j ACCEPT
iptables -A FORWARD -d 192.168.0.62 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.62 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.62 -o eth0 -j MASQUERADE


echo Cliente - Alejandro Rogers	IP:49    ID: 476
#------------------------------------------------------------------------------
#Cliente - Alejandro Rogers	IP:49    ID: 476
#------------------------------------------------------------------------------
iptables -X 192.168.0.49_i
iptables -X 192.168.0.49_o
iptables -N 192.168.0.49_i
iptables -N 192.168.0.49_o
iptables -F 192.168.0.49_i
iptables -F 192.168.0.49_o
iptables -A FORWARD -s 192.168.0.49 -j 192.168.0.49_o
iptables -A FORWARD -d 192.168.0.49 -j 192.168.0.49_i
iptables -A FORWARD -s 192.168.0.49 -m mac --mac-source 18:67:b0:66:5c:8b -j ACCEPT
iptables -A FORWARD -d 192.168.0.49 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.49 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.49 -o eth0 -j MASQUERADE


echo Cliente - Alejandro Rogers	IP:19    ID: 478
#------------------------------------------------------------------------------
#Cliente - Alejandro Rogers	IP:19    ID: 478
#------------------------------------------------------------------------------
iptables -X 192.168.0.19_i
iptables -X 192.168.0.19_o
iptables -N 192.168.0.19_i
iptables -N 192.168.0.19_o
iptables -F 192.168.0.19_i
iptables -F 192.168.0.19_o
iptables -A FORWARD -s 192.168.0.19 -j 192.168.0.19_o
iptables -A FORWARD -d 192.168.0.19 -j 192.168.0.19_i
iptables -A FORWARD -s 192.168.0.19 -m mac --mac-source e8:03:9a:53:01:65 -j ACCEPT
iptables -A FORWARD -d 192.168.0.19 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.19 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.19 -o eth0 -j MASQUERADE


echo Cliente - Alejandro Rogers	IP:29    ID: 418
#------------------------------------------------------------------------------
#Cliente - Alejandro Rogers	IP:29    ID: 418
#------------------------------------------------------------------------------
iptables -X 192.168.0.29_i
iptables -X 192.168.0.29_o
iptables -N 192.168.0.29_i
iptables -N 192.168.0.29_o
iptables -F 192.168.0.29_i
iptables -F 192.168.0.29_o
iptables -A FORWARD -s 192.168.0.29 -j 192.168.0.29_o
iptables -A FORWARD -d 192.168.0.29 -j 192.168.0.29_i
iptables -A FORWARD -s 192.168.0.29 -m mac --mac-source 94:39:e5:0e:73:15 -j ACCEPT
iptables -A FORWARD -d 192.168.0.29 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.29 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.29 -o eth0 -j MASQUERADE


echo Cliente - Alejandro Rogers	IP:15    ID: 454
#------------------------------------------------------------------------------
#Cliente - Alejandro Rogers	IP:15    ID: 454
#------------------------------------------------------------------------------
iptables -X 192.168.0.15_i
iptables -X 192.168.0.15_o
iptables -N 192.168.0.15_i
iptables -N 192.168.0.15_o
iptables -F 192.168.0.15_i
iptables -F 192.168.0.15_o
iptables -A FORWARD -s 192.168.0.15 -j 192.168.0.15_o
iptables -A FORWARD -d 192.168.0.15 -j 192.168.0.15_i
iptables -A FORWARD -s 192.168.0.15 -m mac --mac-source 00:1b:b9:e2:51:7e -j ACCEPT
iptables -A FORWARD -d 192.168.0.15 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.15 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.15 -o eth0 -j MASQUERADE


echo Cliente - Alejandro Rogers	IP:98    ID: 458
#------------------------------------------------------------------------------
#Cliente - Alejandro Rogers	IP:98    ID: 458
#------------------------------------------------------------------------------
iptables -X 192.168.0.98_i
iptables -X 192.168.0.98_o
iptables -N 192.168.0.98_i
iptables -N 192.168.0.98_o
iptables -F 192.168.0.98_i
iptables -F 192.168.0.98_o
iptables -A FORWARD -s 192.168.0.98 -j 192.168.0.98_o
iptables -A FORWARD -d 192.168.0.98 -j 192.168.0.98_i
iptables -A FORWARD -s 192.168.0.98 -m mac --mac-source bc:3b:af:c3:21:0e -j ACCEPT
iptables -A FORWARD -d 192.168.0.98 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.98 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.98 -o eth0 -j MASQUERADE


echo Cliente - Android TV	IP:5    ID: 469
#------------------------------------------------------------------------------
#Cliente - Android TV	IP:5    ID: 469
#------------------------------------------------------------------------------
iptables -X 192.168.0.5_i
iptables -X 192.168.0.5_o
iptables -N 192.168.0.5_i
iptables -N 192.168.0.5_o
iptables -F 192.168.0.5_i
iptables -F 192.168.0.5_o
iptables -A FORWARD -s 192.168.0.5 -j 192.168.0.5_o
iptables -A FORWARD -d 192.168.0.5 -j 192.168.0.5_i
iptables -A FORWARD -s 192.168.0.5 -m mac --mac-source 48:02:2a:b4:ee:e1 -j ACCEPT
iptables -A FORWARD -d 192.168.0.5 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.5 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.5 -o eth0 -j MASQUERADE


echo Cliente - Asesora Lucia Barrios	IP:205    ID: 392
#------------------------------------------------------------------------------
#Cliente - Asesora Lucia Barrios	IP:205    ID: 392
#------------------------------------------------------------------------------
iptables -X 192.168.0.205_i
iptables -X 192.168.0.205_o
iptables -N 192.168.0.205_i
iptables -N 192.168.0.205_o
iptables -F 192.168.0.205_i
iptables -F 192.168.0.205_o
iptables -A FORWARD -s 192.168.0.205 -j 192.168.0.205_o
iptables -A FORWARD -d 192.168.0.205 -j 192.168.0.205_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.205 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.205 -o eth0 -j MASQUERADE


echo Cliente - Asesora Vicente Lopez	IP:206    ID: 395
#------------------------------------------------------------------------------
#Cliente - Asesora Vicente Lopez	IP:206    ID: 395
#------------------------------------------------------------------------------
iptables -X 192.168.0.206_i
iptables -X 192.168.0.206_o
iptables -N 192.168.0.206_i
iptables -N 192.168.0.206_o
iptables -F 192.168.0.206_i
iptables -F 192.168.0.206_o
iptables -A FORWARD -s 192.168.0.206 -j 192.168.0.206_o
iptables -A FORWARD -d 192.168.0.206 -j 192.168.0.206_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.206 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.206 -o eth0 -j MASQUERADE


echo Cliente - Asterisk	IP:2    ID: 77
#------------------------------------------------------------------------------
#Cliente - Asterisk	IP:2    ID: 77
#------------------------------------------------------------------------------
iptables -X 192.168.0.2_i
iptables -X 192.168.0.2_o
iptables -N 192.168.0.2_i
iptables -N 192.168.0.2_o
iptables -F 192.168.0.2_i
iptables -F 192.168.0.2_o
iptables -A FORWARD -s 192.168.0.2 -j 192.168.0.2_o
iptables -A FORWARD -d 192.168.0.2 -j 192.168.0.2_i
iptables -A FORWARD -s 192.168.0.2 -m mac --mac-source 70:71:bc:71:98:2a -j ACCEPT
iptables -A FORWARD -d 192.168.0.2 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.2 -o eth0 -j MASQUERADE


echo Cliente - Backup	IP:71    ID: 133
#------------------------------------------------------------------------------
#Cliente - Backup	IP:71    ID: 133
#------------------------------------------------------------------------------
iptables -X 192.168.0.71_i
iptables -X 192.168.0.71_o
iptables -N 192.168.0.71_i
iptables -N 192.168.0.71_o
iptables -F 192.168.0.71_i
iptables -F 192.168.0.71_o
iptables -A FORWARD -s 192.168.0.71 -j 192.168.0.71_o
iptables -A FORWARD -d 192.168.0.71 -j 192.168.0.71_i
iptables -A FORWARD -s 192.168.0.71 -m mac --mac-source 00:27:0e:16:27:b3 -j ACCEPT
iptables -A FORWARD -d 192.168.0.71 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.71 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.71 -o eth0 -j MASQUERADE


echo Cliente - Backup 1	IP:10    ID: 160
#------------------------------------------------------------------------------
#Cliente - Backup 1	IP:10    ID: 160
#------------------------------------------------------------------------------
iptables -X 192.168.0.10_i
iptables -X 192.168.0.10_o
iptables -N 192.168.0.10_i
iptables -N 192.168.0.10_o
iptables -F 192.168.0.10_i
iptables -F 192.168.0.10_o
iptables -A FORWARD -s 192.168.0.10 -j 192.168.0.10_o
iptables -A FORWARD -d 192.168.0.10 -j 192.168.0.10_i
iptables -A FORWARD -s 192.168.0.10 -m mac --mac-source 00:1C:C0:B1:3B:F3 -j ACCEPT
iptables -A FORWARD -d 192.168.0.10 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.10 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.10 -o eth0 -j MASQUERADE


echo Cliente - Carlos	IP:34    ID: 474
#------------------------------------------------------------------------------
#Cliente - Carlos	IP:34    ID: 474
#------------------------------------------------------------------------------
iptables -X 192.168.0.34_i
iptables -X 192.168.0.34_o
iptables -N 192.168.0.34_i
iptables -N 192.168.0.34_o
iptables -F 192.168.0.34_i
iptables -F 192.168.0.34_o
iptables -A FORWARD -s 192.168.0.34 -j 192.168.0.34_o
iptables -A FORWARD -d 192.168.0.34 -j 192.168.0.34_i
iptables -A FORWARD -s 192.168.0.34 -m mac --mac-source 74:de:2b:d2:2b:cf -j ACCEPT
iptables -A FORWARD -d 192.168.0.34 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.34 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.34 -o eth0 -j MASQUERADE


echo Cliente - Carlos Rodriguez	IP:56    ID: 138
#------------------------------------------------------------------------------
#Cliente - Carlos Rodriguez	IP:56    ID: 138
#------------------------------------------------------------------------------
iptables -X 192.168.0.56_i
iptables -X 192.168.0.56_o
iptables -N 192.168.0.56_i
iptables -N 192.168.0.56_o
iptables -F 192.168.0.56_i
iptables -F 192.168.0.56_o
iptables -A FORWARD -s 192.168.0.56 -j 192.168.0.56_o
iptables -A FORWARD -d 192.168.0.56 -j 192.168.0.56_i
iptables -A FORWARD -s 192.168.0.56 -m mac --mac-source 00:27:0E:16:AC:39 -j ACCEPT
iptables -A FORWARD -d 192.168.0.56 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.56 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.56 -o eth0 -j MASQUERADE


echo Cliente - Celular	IP:12    ID: 472
#------------------------------------------------------------------------------
#Cliente - Celular	IP:12    ID: 472
#------------------------------------------------------------------------------
iptables -X 192.168.0.12_i
iptables -X 192.168.0.12_o
iptables -N 192.168.0.12_i
iptables -N 192.168.0.12_o
iptables -F 192.168.0.12_i
iptables -F 192.168.0.12_o
iptables -A FORWARD -s 192.168.0.12 -j 192.168.0.12_o
iptables -A FORWARD -d 192.168.0.12 -j 192.168.0.12_i
iptables -A FORWARD -s 192.168.0.12 -m mac --mac-source 98:0c:82:cf:59:fa -j ACCEPT
iptables -A FORWARD -d 192.168.0.12 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.12 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.12 -o eth0 -j MASQUERADE


echo Cliente - Cinthia Cabrino	IP:45    ID: 404
#------------------------------------------------------------------------------
#Cliente - Cinthia Cabrino	IP:45    ID: 404
#------------------------------------------------------------------------------
iptables -X 192.168.0.45_i
iptables -X 192.168.0.45_o
iptables -N 192.168.0.45_i
iptables -N 192.168.0.45_o
iptables -F 192.168.0.45_i
iptables -F 192.168.0.45_o
iptables -A FORWARD -s 192.168.0.45 -j 192.168.0.45_o
iptables -A FORWARD -d 192.168.0.45 -j 192.168.0.45_i
iptables -A FORWARD -s 192.168.0.45 -m mac --mac-source 00:0d:28:8f:9e:6f -j ACCEPT
iptables -A FORWARD -d 192.168.0.45 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.45 -o eth0 -j MASQUERADE


echo Cliente - Claudia Mattiussi	IP:60    ID: 466
#------------------------------------------------------------------------------
#Cliente - Claudia Mattiussi	IP:60    ID: 466
#------------------------------------------------------------------------------
iptables -X 192.168.0.60_i
iptables -X 192.168.0.60_o
iptables -N 192.168.0.60_i
iptables -N 192.168.0.60_o
iptables -F 192.168.0.60_i
iptables -F 192.168.0.60_o
iptables -A FORWARD -s 192.168.0.60 -j 192.168.0.60_o
iptables -A FORWARD -d 192.168.0.60 -j 192.168.0.60_i
iptables -A FORWARD -s 192.168.0.60 -m mac --mac-source 00:1c:25:9f:e2:82 -j ACCEPT
iptables -A FORWARD -d 192.168.0.60 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.60 -o eth0 -j MASQUERADE


echo Cliente - Claudia Mattiussi	IP:97    ID: 465
#------------------------------------------------------------------------------
#Cliente - Claudia Mattiussi	IP:97    ID: 465
#------------------------------------------------------------------------------
iptables -X 192.168.0.97_i
iptables -X 192.168.0.97_o
iptables -N 192.168.0.97_i
iptables -N 192.168.0.97_o
iptables -F 192.168.0.97_i
iptables -F 192.168.0.97_o
iptables -A FORWARD -s 192.168.0.97 -j 192.168.0.97_o
iptables -A FORWARD -d 192.168.0.97 -j 192.168.0.97_i
iptables -A FORWARD -s 192.168.0.97 -m mac --mac-source 4c:bc:a5:47:e4:3a -j ACCEPT
iptables -A FORWARD -d 192.168.0.97 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.97 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.97 -o eth0 -j MASQUERADE


echo Cliente - Claudia Mattiussi	IP:90    ID: 463
#------------------------------------------------------------------------------
#Cliente - Claudia Mattiussi	IP:90    ID: 463
#------------------------------------------------------------------------------
iptables -X 192.168.0.90_i
iptables -X 192.168.0.90_o
iptables -N 192.168.0.90_i
iptables -N 192.168.0.90_o
iptables -F 192.168.0.90_i
iptables -F 192.168.0.90_o
iptables -A FORWARD -s 192.168.0.90 -j 192.168.0.90_o
iptables -A FORWARD -d 192.168.0.90 -j 192.168.0.90_i
iptables -A FORWARD -s 192.168.0.90 -m mac --mac-source 30:39:26:65:8b:8e -j ACCEPT
iptables -A FORWARD -d 192.168.0.90 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.90 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.90 -o eth0 -j MASQUERADE


echo Cliente - Claudia Mattiussi	IP:17    ID: 444
#------------------------------------------------------------------------------
#Cliente - Claudia Mattiussi	IP:17    ID: 444
#------------------------------------------------------------------------------
iptables -X 192.168.0.17_i
iptables -X 192.168.0.17_o
iptables -N 192.168.0.17_i
iptables -N 192.168.0.17_o
iptables -F 192.168.0.17_i
iptables -F 192.168.0.17_o
iptables -A FORWARD -s 192.168.0.17 -j 192.168.0.17_o
iptables -A FORWARD -d 192.168.0.17 -j 192.168.0.17_i
iptables -A FORWARD -s 192.168.0.17 -m mac --mac-source 00:22:fa:2d:c8:a6 -j ACCEPT
iptables -A FORWARD -d 192.168.0.17 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.17 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.17 -o eth0 -j MASQUERADE


echo Cliente - Controlador Fiscal 1	IP:57    ID: 231
#------------------------------------------------------------------------------
#Cliente - Controlador Fiscal 1	IP:57    ID: 231
#------------------------------------------------------------------------------
iptables -X 192.168.0.57_i
iptables -X 192.168.0.57_o
iptables -N 192.168.0.57_i
iptables -N 192.168.0.57_o
iptables -F 192.168.0.57_i
iptables -F 192.168.0.57_o
iptables -A FORWARD -s 192.168.0.57 -j 192.168.0.57_o
iptables -A FORWARD -d 192.168.0.57 -j 192.168.0.57_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.57 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.57 -o eth0 -j MASQUERADE


echo Cliente - Controlador Fiscal 2	IP:67    ID: 330
#------------------------------------------------------------------------------
#Cliente - Controlador Fiscal 2	IP:67    ID: 330
#------------------------------------------------------------------------------
iptables -X 192.168.0.67_i
iptables -X 192.168.0.67_o
iptables -N 192.168.0.67_i
iptables -N 192.168.0.67_o
iptables -F 192.168.0.67_i
iptables -F 192.168.0.67_o
iptables -A FORWARD -s 192.168.0.67 -j 192.168.0.67_o
iptables -A FORWARD -d 192.168.0.67 -j 192.168.0.67_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.67 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.67 -o eth0 -j MASQUERADE


echo Cliente - Dan Wyrytowski	IP:26    ID: 414
#------------------------------------------------------------------------------
#Cliente - Dan Wyrytowski	IP:26    ID: 414
#------------------------------------------------------------------------------
iptables -X 192.168.0.26_i
iptables -X 192.168.0.26_o
iptables -N 192.168.0.26_i
iptables -N 192.168.0.26_o
iptables -F 192.168.0.26_i
iptables -F 192.168.0.26_o
iptables -A FORWARD -s 192.168.0.26 -j 192.168.0.26_o
iptables -A FORWARD -d 192.168.0.26 -j 192.168.0.26_i
iptables -A FORWARD -s 192.168.0.26 -m mac --mac-source e4:d5:3d:12:3a:db -j ACCEPT
iptables -A FORWARD -d 192.168.0.26 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.26 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.26 -o eth0 -j MASQUERADE


echo Cliente - Dario Juarez	IP:202    ID: 406
#------------------------------------------------------------------------------
#Cliente - Dario Juarez	IP:202    ID: 406
#------------------------------------------------------------------------------
iptables -X 192.168.0.202_i
iptables -X 192.168.0.202_o
iptables -N 192.168.0.202_i
iptables -N 192.168.0.202_o
iptables -F 192.168.0.202_i
iptables -F 192.168.0.202_o
iptables -A FORWARD -s 192.168.0.202 -j 192.168.0.202_o
iptables -A FORWARD -d 192.168.0.202 -j 192.168.0.202_i
iptables -A FORWARD -s 192.168.0.202 -m mac --mac-source 00:80:f0:d1:cd:dc -j ACCEPT
iptables -A FORWARD -d 192.168.0.202 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.202 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.202 -o eth0 -j MASQUERADE


echo Cliente - Dario Juarez	IP:43    ID: 445
#------------------------------------------------------------------------------
#Cliente - Dario Juarez	IP:43    ID: 445
#------------------------------------------------------------------------------
iptables -X 192.168.0.43_i
iptables -X 192.168.0.43_o
iptables -N 192.168.0.43_i
iptables -N 192.168.0.43_o
iptables -F 192.168.0.43_i
iptables -F 192.168.0.43_o
iptables -A FORWARD -s 192.168.0.43 -j 192.168.0.43_o
iptables -A FORWARD -d 192.168.0.43 -j 192.168.0.43_i
iptables -A FORWARD -s 192.168.0.43 -m mac --mac-source 00:26:c6:c6:7e:c4 -j ACCEPT
iptables -A FORWARD -d 192.168.0.43 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.43 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.43 -o eth0 -j MASQUERADE


echo Cliente - Dario Juarez	IP:99    ID: 447
#------------------------------------------------------------------------------
#Cliente - Dario Juarez	IP:99    ID: 447
#------------------------------------------------------------------------------
iptables -X 192.168.0.99_i
iptables -X 192.168.0.99_o
iptables -N 192.168.0.99_i
iptables -N 192.168.0.99_o
iptables -F 192.168.0.99_i
iptables -F 192.168.0.99_o
iptables -A FORWARD -s 192.168.0.99 -j 192.168.0.99_o
iptables -A FORWARD -d 192.168.0.99 -j 192.168.0.99_i
iptables -A FORWARD -s 192.168.0.99 -m mac --mac-source 00:22:68:19:c9:96 -j ACCEPT
iptables -A FORWARD -d 192.168.0.99 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.99 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.99 -o eth0 -j MASQUERADE


echo Cliente - Dario Juarez	IP:59    ID: 456
#------------------------------------------------------------------------------
#Cliente - Dario Juarez	IP:59    ID: 456
#------------------------------------------------------------------------------
iptables -X 192.168.0.59_i
iptables -X 192.168.0.59_o
iptables -N 192.168.0.59_i
iptables -N 192.168.0.59_o
iptables -F 192.168.0.59_i
iptables -F 192.168.0.59_o
iptables -A FORWARD -s 192.168.0.59 -j 192.168.0.59_o
iptables -A FORWARD -d 192.168.0.59 -j 192.168.0.59_i
iptables -A FORWARD -s 192.168.0.59 -m mac --mac-source 80:96:b1:df:d1:77 -j ACCEPT
iptables -A FORWARD -d 192.168.0.59 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.59 -o eth0 -j MASQUERADE


echo Cliente - Depilight TV	IP:16    ID: 438
#------------------------------------------------------------------------------
#Cliente - Depilight TV	IP:16    ID: 438
#------------------------------------------------------------------------------
iptables -X 192.168.0.16_i
iptables -X 192.168.0.16_o
iptables -N 192.168.0.16_i
iptables -N 192.168.0.16_o
iptables -F 192.168.0.16_i
iptables -F 192.168.0.16_o
iptables -A FORWARD -s 192.168.0.16 -j 192.168.0.16_o
iptables -A FORWARD -d 192.168.0.16 -j 192.168.0.16_i
iptables -A FORWARD -s 192.168.0.16 -m mac --mac-source 00:0b:6a:bf:79:58 -j ACCEPT
iptables -A FORWARD -d 192.168.0.16 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.16 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.16 -o eth0 -j MASQUERADE


echo Cliente - DVR 1	IP:9    ID: 201
#------------------------------------------------------------------------------
#Cliente - DVR 1	IP:9    ID: 201
#------------------------------------------------------------------------------
iptables -X 192.168.0.9_i
iptables -X 192.168.0.9_o
iptables -N 192.168.0.9_i
iptables -N 192.168.0.9_o
iptables -F 192.168.0.9_i
iptables -F 192.168.0.9_o
iptables -A FORWARD -s 192.168.0.9 -j 192.168.0.9_o
iptables -A FORWARD -d 192.168.0.9 -j 192.168.0.9_i
iptables -A FORWARD -s 192.168.0.9 -m mac --mac-source 00:5e:09:07:fc:0a -j ACCEPT
iptables -A FORWARD -d 192.168.0.9 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.9 -o eth0 -j MASQUERADE


echo Cliente - DVR 2	IP:8    ID: 200
#------------------------------------------------------------------------------
#Cliente - DVR 2	IP:8    ID: 200
#------------------------------------------------------------------------------
iptables -X 192.168.0.8_i
iptables -X 192.168.0.8_o
iptables -N 192.168.0.8_i
iptables -N 192.168.0.8_o
iptables -F 192.168.0.8_i
iptables -F 192.168.0.8_o
iptables -A FORWARD -s 192.168.0.8 -j 192.168.0.8_o
iptables -A FORWARD -d 192.168.0.8 -j 192.168.0.8_i
iptables -A FORWARD -s 192.168.0.8 -m mac --mac-source 00:6b:58:2c:2c:55 -j ACCEPT
iptables -A FORWARD -d 192.168.0.8 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.8 -o eth0 -j MASQUERADE


echo Cliente - Erica Mirkouski	IP:61    ID: 374
#------------------------------------------------------------------------------
#Cliente - Erica Mirkouski	IP:61    ID: 374
#------------------------------------------------------------------------------
iptables -X 192.168.0.61_i
iptables -X 192.168.0.61_o
iptables -N 192.168.0.61_i
iptables -N 192.168.0.61_o
iptables -F 192.168.0.61_i
iptables -F 192.168.0.61_o
iptables -A FORWARD -s 192.168.0.61 -j 192.168.0.61_o
iptables -A FORWARD -d 192.168.0.61 -j 192.168.0.61_i
iptables -A FORWARD -s 192.168.0.61 -m mac --mac-source 00:27:0e:15:9d:38 -j ACCEPT
iptables -A FORWARD -d 192.168.0.61 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.61 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.61 -o eth0 -j MASQUERADE


echo Cliente - Erica Mirkouski	IP:200    ID: 410
#------------------------------------------------------------------------------
#Cliente - Erica Mirkouski	IP:200    ID: 410
#------------------------------------------------------------------------------
iptables -X 192.168.0.200_i
iptables -X 192.168.0.200_o
iptables -N 192.168.0.200_i
iptables -N 192.168.0.200_o
iptables -F 192.168.0.200_i
iptables -F 192.168.0.200_o
iptables -A FORWARD -s 192.168.0.200 -j 192.168.0.200_o
iptables -A FORWARD -d 192.168.0.200 -j 192.168.0.200_i
iptables -A FORWARD -s 192.168.0.200 -m mac --mac-source 00:80:f0:d1:d1:9f -j ACCEPT
iptables -A FORWARD -d 192.168.0.200 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.200 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.200 -o eth0 -j MASQUERADE


echo Cliente - HPDESKJET3050	IP:32    ID: 400
#------------------------------------------------------------------------------
#Cliente - HPDESKJET3050	IP:32    ID: 400
#------------------------------------------------------------------------------
iptables -X 192.168.0.32_i
iptables -X 192.168.0.32_o
iptables -N 192.168.0.32_i
iptables -N 192.168.0.32_o
iptables -F 192.168.0.32_i
iptables -F 192.168.0.32_o
iptables -A FORWARD -s 192.168.0.32 -j 192.168.0.32_o
iptables -A FORWARD -d 192.168.0.32 -j 192.168.0.32_i
iptables -A FORWARD -s 192.168.0.32 -m mac --mac-source 28:92:4a:a6:11:7a -j ACCEPT
iptables -A FORWARD -d 192.168.0.32 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.32 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.32 -o eth0 -j MASQUERADE


echo Cliente - I-Drive	IP:18    ID: 477
#------------------------------------------------------------------------------
#Cliente - I-Drive	IP:18    ID: 477
#------------------------------------------------------------------------------
iptables -X 192.168.0.18_i
iptables -X 192.168.0.18_o
iptables -N 192.168.0.18_i
iptables -N 192.168.0.18_o
iptables -F 192.168.0.18_i
iptables -F 192.168.0.18_o
iptables -A FORWARD -s 192.168.0.18 -j 192.168.0.18_o
iptables -A FORWARD -d 192.168.0.18 -j 192.168.0.18_i
iptables -A FORWARD -s 192.168.0.18 -m mac --mac-source 00:08:54:a5:f0:8c -j ACCEPT
iptables -A FORWARD -d 192.168.0.18 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.18 -o eth0 -j MASQUERADE


echo Cliente - ICS-100 Call Center	IP:22    ID: 220
#------------------------------------------------------------------------------
#Cliente - ICS-100 Call Center	IP:22    ID: 220
#------------------------------------------------------------------------------
iptables -X 192.168.0.22_i
iptables -X 192.168.0.22_o
iptables -N 192.168.0.22_i
iptables -N 192.168.0.22_o
iptables -F 192.168.0.22_i
iptables -F 192.168.0.22_o
iptables -A FORWARD -s 192.168.0.22 -j 192.168.0.22_o
iptables -A FORWARD -d 192.168.0.22 -j 192.168.0.22_i
iptables -A FORWARD -s 192.168.0.22 -m mac --mac-source 00:30:4f:79:29:f9 -j ACCEPT
iptables -A FORWARD -d 192.168.0.22 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.22 -o eth0 -j MASQUERADE


echo Cliente - Impresora Onell	IP:31    ID: 417
#------------------------------------------------------------------------------
#Cliente - Impresora Onell	IP:31    ID: 417
#------------------------------------------------------------------------------
iptables -X 192.168.0.31_i
iptables -X 192.168.0.31_o
iptables -N 192.168.0.31_i
iptables -N 192.168.0.31_o
iptables -F 192.168.0.31_i
iptables -F 192.168.0.31_o
iptables -A FORWARD -s 192.168.0.31 -j 192.168.0.31_o
iptables -A FORWARD -d 192.168.0.31 -j 192.168.0.31_i
iptables -A FORWARD -s 192.168.0.31 -m mac --mac-source 00:15:99:ac:98:99 -j ACCEPT
iptables -A FORWARD -d 192.168.0.31 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.31 -o eth0 -j MASQUERADE


echo Cliente - Impresora Reuniones	IP:30    ID: 390
#------------------------------------------------------------------------------
#Cliente - Impresora Reuniones	IP:30    ID: 390
#------------------------------------------------------------------------------
iptables -X 192.168.0.30_i
iptables -X 192.168.0.30_o
iptables -N 192.168.0.30_i
iptables -N 192.168.0.30_o
iptables -F 192.168.0.30_i
iptables -F 192.168.0.30_o
iptables -A FORWARD -s 192.168.0.30 -j 192.168.0.30_o
iptables -A FORWARD -d 192.168.0.30 -j 192.168.0.30_i
iptables -t nat -A POSTROUTING -s 192.168.0.30 -o eth0 -j MASQUERADE


echo Cliente - Jose Lopez	IP:36    ID: 261
#------------------------------------------------------------------------------
#Cliente - Jose Lopez	IP:36    ID: 261
#------------------------------------------------------------------------------
iptables -X 192.168.0.36_i
iptables -X 192.168.0.36_o
iptables -N 192.168.0.36_i
iptables -N 192.168.0.36_o
iptables -F 192.168.0.36_i
iptables -F 192.168.0.36_o
iptables -A FORWARD -s 192.168.0.36 -j 192.168.0.36_o
iptables -A FORWARD -d 192.168.0.36 -j 192.168.0.36_i
iptables -A FORWARD -s 192.168.0.36 -m mac --mac-source e0:06:e6:07:3c:87 -j ACCEPT
iptables -A FORWARD -d 192.168.0.36 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.36 -o eth0 -j MASQUERADE


echo Cliente - Jose Lopez	IP:33    ID: 286
#------------------------------------------------------------------------------
#Cliente - Jose Lopez	IP:33    ID: 286
#------------------------------------------------------------------------------
iptables -X 192.168.0.33_i
iptables -X 192.168.0.33_o
iptables -N 192.168.0.33_i
iptables -N 192.168.0.33_o
iptables -F 192.168.0.33_i
iptables -F 192.168.0.33_o
iptables -A FORWARD -s 192.168.0.33 -j 192.168.0.33_o
iptables -A FORWARD -d 192.168.0.33 -j 192.168.0.33_i
iptables -A FORWARD -s 192.168.0.33 -m mac --mac-source 24:b6:fd:4d:ba:bc -j ACCEPT
iptables -A FORWARD -d 192.168.0.33 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.33 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.33 -o eth0 -j MASQUERADE


echo Cliente - Jose Lopez	IP:50    ID: 423
#------------------------------------------------------------------------------
#Cliente - Jose Lopez	IP:50    ID: 423
#------------------------------------------------------------------------------
iptables -X 192.168.0.50_i
iptables -X 192.168.0.50_o
iptables -N 192.168.0.50_i
iptables -N 192.168.0.50_o
iptables -F 192.168.0.50_i
iptables -F 192.168.0.50_o
iptables -A FORWARD -s 192.168.0.50 -j 192.168.0.50_o
iptables -A FORWARD -d 192.168.0.50 -j 192.168.0.50_i
iptables -A FORWARD -s 192.168.0.50 -m mac --mac-source 9c:04:eb:e9:b5:3a -j ACCEPT
iptables -A FORWARD -d 192.168.0.50 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.50 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.50 -o eth0 -j MASQUERADE


echo Cliente - Jose Lopez	IP:11    ID: 453
#------------------------------------------------------------------------------
#Cliente - Jose Lopez	IP:11    ID: 453
#------------------------------------------------------------------------------
iptables -X 192.168.0.11_i
iptables -X 192.168.0.11_o
iptables -N 192.168.0.11_i
iptables -N 192.168.0.11_o
iptables -F 192.168.0.11_i
iptables -F 192.168.0.11_o
iptables -A FORWARD -s 192.168.0.11 -j 192.168.0.11_o
iptables -A FORWARD -d 192.168.0.11 -j 192.168.0.11_i
iptables -A FORWARD -s 192.168.0.11 -m mac --mac-source 40:6f:2a:da:1c:01 -j ACCEPT
iptables -A FORWARD -d 192.168.0.11 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.11 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.11 -o eth0 -j MASQUERADE


echo Cliente - Manuela Gaitto	IP:72    ID: 446
#------------------------------------------------------------------------------
#Cliente - Manuela Gaitto	IP:72    ID: 446
#------------------------------------------------------------------------------
iptables -X 192.168.0.72_i
iptables -X 192.168.0.72_o
iptables -N 192.168.0.72_i
iptables -N 192.168.0.72_o
iptables -F 192.168.0.72_i
iptables -F 192.168.0.72_o
iptables -A FORWARD -s 192.168.0.72 -j 192.168.0.72_o
iptables -A FORWARD -d 192.168.0.72 -j 192.168.0.72_i
iptables -A FORWARD -s 192.168.0.72 -m mac --mac-source 00:21:6b:ca:89:d0 -j ACCEPT
iptables -A FORWARD -d 192.168.0.72 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.72 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.72 -o eth0 -j MASQUERADE


echo Cliente - Mariela Rossetti	IP:73    ID: 323
#------------------------------------------------------------------------------
#Cliente - Mariela Rossetti	IP:73    ID: 323
#------------------------------------------------------------------------------
iptables -X 192.168.0.73_i
iptables -X 192.168.0.73_o
iptables -N 192.168.0.73_i
iptables -N 192.168.0.73_o
iptables -F 192.168.0.73_i
iptables -F 192.168.0.73_o
iptables -A FORWARD -s 192.168.0.73 -j 192.168.0.73_o
iptables -A FORWARD -d 192.168.0.73 -j 192.168.0.73_i
iptables -A FORWARD -s 192.168.0.73 -m mac --mac-source 00:1c:c0:37:40:b7 -j ACCEPT
iptables -A FORWARD -d 192.168.0.73 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.73 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.73 -o eth0 -j MASQUERADE


echo Cliente - Mariela Rossetti	IP:46    ID: 411
#------------------------------------------------------------------------------
#Cliente - Mariela Rossetti	IP:46    ID: 411
#------------------------------------------------------------------------------
iptables -X 192.168.0.46_i
iptables -X 192.168.0.46_o
iptables -N 192.168.0.46_i
iptables -N 192.168.0.46_o
iptables -F 192.168.0.46_i
iptables -F 192.168.0.46_o
iptables -A FORWARD -s 192.168.0.46 -j 192.168.0.46_o
iptables -A FORWARD -d 192.168.0.46 -j 192.168.0.46_i
iptables -A FORWARD -s 192.168.0.46 -m mac --mac-source 00:0b:82:14:dc:47 -j ACCEPT
iptables -A FORWARD -d 192.168.0.46 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.46 -o eth0 -j MASQUERADE


echo Cliente - Micronet	IP:4    ID: 281
#------------------------------------------------------------------------------
#Cliente - Micronet	IP:4    ID: 281
#------------------------------------------------------------------------------
iptables -X 192.168.0.4_i
iptables -X 192.168.0.4_o
iptables -N 192.168.0.4_i
iptables -N 192.168.0.4_o
iptables -F 192.168.0.4_i
iptables -F 192.168.0.4_o
iptables -A FORWARD -s 192.168.0.4 -j 192.168.0.4_o
iptables -A FORWARD -d 192.168.0.4 -j 192.168.0.4_i
iptables -A FORWARD -s 192.168.0.4 -m mac --mac-source 00:11:3b:18:87:57 -j ACCEPT
iptables -A FORWARD -d 192.168.0.4 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.4 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.4 -o eth0 -j MASQUERADE


echo Cliente - Office	IP:40    ID: 224
#------------------------------------------------------------------------------
#Cliente - Office	IP:40    ID: 224
#------------------------------------------------------------------------------
iptables -X 192.168.0.40_i
iptables -X 192.168.0.40_o
iptables -N 192.168.0.40_i
iptables -N 192.168.0.40_o
iptables -F 192.168.0.40_i
iptables -F 192.168.0.40_o
iptables -A FORWARD -s 192.168.0.40 -j 192.168.0.40_o
iptables -A FORWARD -d 192.168.0.40 -j 192.168.0.40_i
iptables -A FORWARD -s 192.168.0.40 -m mac --mac-source 00:40:01:2e:15:55 -j ACCEPT
iptables -A FORWARD -d 192.168.0.40 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.40 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.40 -o eth0 -j MASQUERADE


echo Cliente - Onell Lanfranco	IP:35    ID: 402
#------------------------------------------------------------------------------
#Cliente - Onell Lanfranco	IP:35    ID: 402
#------------------------------------------------------------------------------
iptables -X 192.168.0.35_i
iptables -X 192.168.0.35_o
iptables -N 192.168.0.35_i
iptables -N 192.168.0.35_o
iptables -F 192.168.0.35_i
iptables -F 192.168.0.35_o
iptables -A FORWARD -s 192.168.0.35 -j 192.168.0.35_o
iptables -A FORWARD -d 192.168.0.35 -j 192.168.0.35_i
iptables -A FORWARD -s 192.168.0.35 -m mac --mac-source 00:27:0e:1c:28:ac -j ACCEPT
iptables -A FORWARD -d 192.168.0.35 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.35 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.35 -o eth0 -j MASQUERADE


echo Cliente - Onell Lanfranco	IP:39    ID: 403
#------------------------------------------------------------------------------
#Cliente - Onell Lanfranco	IP:39    ID: 403
#------------------------------------------------------------------------------
iptables -X 192.168.0.39_i
iptables -X 192.168.0.39_o
iptables -N 192.168.0.39_i
iptables -N 192.168.0.39_o
iptables -F 192.168.0.39_i
iptables -F 192.168.0.39_o
iptables -A FORWARD -s 192.168.0.39 -j 192.168.0.39_o
iptables -A FORWARD -d 192.168.0.39 -j 192.168.0.39_i
iptables -A FORWARD -s 192.168.0.39 -m mac --mac-source 4c:8d:79:e9:51:36 -j ACCEPT
iptables -A FORWARD -d 192.168.0.39 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.39 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.39 -o eth0 -j MASQUERADE


echo Cliente - Onell Lanfranco	IP:44    ID: 405
#------------------------------------------------------------------------------
#Cliente - Onell Lanfranco	IP:44    ID: 405
#------------------------------------------------------------------------------
iptables -X 192.168.0.44_i
iptables -X 192.168.0.44_o
iptables -N 192.168.0.44_i
iptables -N 192.168.0.44_o
iptables -F 192.168.0.44_i
iptables -F 192.168.0.44_o
iptables -A FORWARD -s 192.168.0.44 -j 192.168.0.44_o
iptables -A FORWARD -d 192.168.0.44 -j 192.168.0.44_i
iptables -A FORWARD -s 192.168.0.44 -m mac --mac-source 00:80:f0:d1:ce:23 -j ACCEPT
iptables -A FORWARD -d 192.168.0.44 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.44 -o eth0 -j MASQUERADE


echo Cliente - Onell Lanfranco	IP:37    ID: 422
#------------------------------------------------------------------------------
#Cliente - Onell Lanfranco	IP:37    ID: 422
#------------------------------------------------------------------------------
iptables -X 192.168.0.37_i
iptables -X 192.168.0.37_o
iptables -N 192.168.0.37_i
iptables -N 192.168.0.37_o
iptables -F 192.168.0.37_i
iptables -F 192.168.0.37_o
iptables -A FORWARD -s 192.168.0.37 -j 192.168.0.37_o
iptables -A FORWARD -d 192.168.0.37 -j 192.168.0.37_i
iptables -A FORWARD -s 192.168.0.37 -m mac --mac-source c8:6f:1d:0b:3e:66 -j ACCEPT
iptables -A FORWARD -d 192.168.0.37 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.37 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.37 -o eth0 -j MASQUERADE


echo Cliente - Onell Lanfranco	IP:48    ID: 433
#------------------------------------------------------------------------------
#Cliente - Onell Lanfranco	IP:48    ID: 433
#------------------------------------------------------------------------------
iptables -X 192.168.0.48_i
iptables -X 192.168.0.48_o
iptables -N 192.168.0.48_i
iptables -N 192.168.0.48_o
iptables -F 192.168.0.48_i
iptables -F 192.168.0.48_o
iptables -A FORWARD -s 192.168.0.48 -j 192.168.0.48_o
iptables -A FORWARD -d 192.168.0.48 -j 192.168.0.48_i
iptables -A FORWARD -s 192.168.0.48 -m mac --mac-source 10:dd:b1:aa:09:3a -j ACCEPT
iptables -A FORWARD -d 192.168.0.48 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.48 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.48 -o eth0 -j MASQUERADE


echo Cliente - Onell Lanfranco	IP:47    ID: 461
#------------------------------------------------------------------------------
#Cliente - Onell Lanfranco	IP:47    ID: 461
#------------------------------------------------------------------------------
iptables -X 192.168.0.47_i
iptables -X 192.168.0.47_o
iptables -N 192.168.0.47_i
iptables -N 192.168.0.47_o
iptables -F 192.168.0.47_i
iptables -F 192.168.0.47_o
iptables -A FORWARD -s 192.168.0.47 -j 192.168.0.47_o
iptables -A FORWARD -d 192.168.0.47 -j 192.168.0.47_i
iptables -A FORWARD -s 192.168.0.47 -m mac --mac-source f4:f9:51:c8:db:ed -j ACCEPT
iptables -A FORWARD -d 192.168.0.47 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.47 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.47 -o eth0 -j MASQUERADE


echo Cliente - PC01	IP:101    ID: 170
#------------------------------------------------------------------------------
#Cliente - PC01	IP:101    ID: 170
#------------------------------------------------------------------------------
iptables -X 192.168.0.101_i
iptables -X 192.168.0.101_o
iptables -N 192.168.0.101_i
iptables -N 192.168.0.101_o
iptables -F 192.168.0.101_i
iptables -F 192.168.0.101_o
iptables -A FORWARD -s 192.168.0.101 -j 192.168.0.101_o
iptables -A FORWARD -d 192.168.0.101 -j 192.168.0.101_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.101 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.101 -o eth0 -j MASQUERADE


echo Cliente - PC02	IP:102    ID: 168
#------------------------------------------------------------------------------
#Cliente - PC02	IP:102    ID: 168
#------------------------------------------------------------------------------
iptables -X 192.168.0.102_i
iptables -X 192.168.0.102_o
iptables -N 192.168.0.102_i
iptables -N 192.168.0.102_o
iptables -F 192.168.0.102_i
iptables -F 192.168.0.102_o
iptables -A FORWARD -s 192.168.0.102 -j 192.168.0.102_o
iptables -A FORWARD -d 192.168.0.102 -j 192.168.0.102_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.102 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.102 -o eth0 -j MASQUERADE


echo Cliente - PC03	IP:103    ID: 124
#------------------------------------------------------------------------------
#Cliente - PC03	IP:103    ID: 124
#------------------------------------------------------------------------------
iptables -X 192.168.0.103_i
iptables -X 192.168.0.103_o
iptables -N 192.168.0.103_i
iptables -N 192.168.0.103_o
iptables -F 192.168.0.103_i
iptables -F 192.168.0.103_o
iptables -A FORWARD -s 192.168.0.103 -j 192.168.0.103_o
iptables -A FORWARD -d 192.168.0.103 -j 192.168.0.103_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.103 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.103 -o eth0 -j MASQUERADE


echo Cliente - PC04	IP:104    ID: 141
#------------------------------------------------------------------------------
#Cliente - PC04	IP:104    ID: 141
#------------------------------------------------------------------------------
iptables -X 192.168.0.104_i
iptables -X 192.168.0.104_o
iptables -N 192.168.0.104_i
iptables -N 192.168.0.104_o
iptables -F 192.168.0.104_i
iptables -F 192.168.0.104_o
iptables -A FORWARD -s 192.168.0.104 -j 192.168.0.104_o
iptables -A FORWARD -d 192.168.0.104 -j 192.168.0.104_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.104 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.104 -o eth0 -j MASQUERADE


echo Cliente - PC05	IP:105    ID: 116
#------------------------------------------------------------------------------
#Cliente - PC05	IP:105    ID: 116
#------------------------------------------------------------------------------
iptables -X 192.168.0.105_i
iptables -X 192.168.0.105_o
iptables -N 192.168.0.105_i
iptables -N 192.168.0.105_o
iptables -F 192.168.0.105_i
iptables -F 192.168.0.105_o
iptables -A FORWARD -s 192.168.0.105 -j 192.168.0.105_o
iptables -A FORWARD -d 192.168.0.105 -j 192.168.0.105_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.105 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.105 -o eth0 -j MASQUERADE


echo Cliente - PC06	IP:106    ID: 169
#------------------------------------------------------------------------------
#Cliente - PC06	IP:106    ID: 169
#------------------------------------------------------------------------------
iptables -X 192.168.0.106_i
iptables -X 192.168.0.106_o
iptables -N 192.168.0.106_i
iptables -N 192.168.0.106_o
iptables -F 192.168.0.106_i
iptables -F 192.168.0.106_o
iptables -A FORWARD -s 192.168.0.106 -j 192.168.0.106_o
iptables -A FORWARD -d 192.168.0.106 -j 192.168.0.106_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.106 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.106 -o eth0 -j MASQUERADE


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
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.107 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.107 -o eth0 -j MASQUERADE


echo Cliente - PC08	IP:108    ID: 123
#------------------------------------------------------------------------------
#Cliente - PC08	IP:108    ID: 123
#------------------------------------------------------------------------------
iptables -X 192.168.0.108_i
iptables -X 192.168.0.108_o
iptables -N 192.168.0.108_i
iptables -N 192.168.0.108_o
iptables -F 192.168.0.108_i
iptables -F 192.168.0.108_o
iptables -A FORWARD -s 192.168.0.108 -j 192.168.0.108_o
iptables -A FORWARD -d 192.168.0.108 -j 192.168.0.108_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.108 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.108 -o eth0 -j MASQUERADE


echo Cliente - PC09	IP:109    ID: 159
#------------------------------------------------------------------------------
#Cliente - PC09	IP:109    ID: 159
#------------------------------------------------------------------------------
iptables -X 192.168.0.109_i
iptables -X 192.168.0.109_o
iptables -N 192.168.0.109_i
iptables -N 192.168.0.109_o
iptables -F 192.168.0.109_i
iptables -F 192.168.0.109_o
iptables -A FORWARD -s 192.168.0.109 -j 192.168.0.109_o
iptables -A FORWARD -d 192.168.0.109 -j 192.168.0.109_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.109 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.109 -o eth0 -j MASQUERADE


echo Cliente - PC10	IP:110    ID: 207
#------------------------------------------------------------------------------
#Cliente - PC10	IP:110    ID: 207
#------------------------------------------------------------------------------
iptables -X 192.168.0.110_i
iptables -X 192.168.0.110_o
iptables -N 192.168.0.110_i
iptables -N 192.168.0.110_o
iptables -F 192.168.0.110_i
iptables -F 192.168.0.110_o
iptables -A FORWARD -s 192.168.0.110 -j 192.168.0.110_o
iptables -A FORWARD -d 192.168.0.110 -j 192.168.0.110_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.110 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.110 -o eth0 -j MASQUERADE


echo Cliente - PC11	IP:111    ID: 223
#------------------------------------------------------------------------------
#Cliente - PC11	IP:111    ID: 223
#------------------------------------------------------------------------------
iptables -X 192.168.0.111_i
iptables -X 192.168.0.111_o
iptables -N 192.168.0.111_i
iptables -N 192.168.0.111_o
iptables -F 192.168.0.111_i
iptables -F 192.168.0.111_o
iptables -A FORWARD -s 192.168.0.111 -j 192.168.0.111_o
iptables -A FORWARD -d 192.168.0.111 -j 192.168.0.111_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.111 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.111 -o eth0 -j MASQUERADE


echo Cliente - PC12	IP:112    ID: 136
#------------------------------------------------------------------------------
#Cliente - PC12	IP:112    ID: 136
#------------------------------------------------------------------------------
iptables -X 192.168.0.112_i
iptables -X 192.168.0.112_o
iptables -N 192.168.0.112_i
iptables -N 192.168.0.112_o
iptables -F 192.168.0.112_i
iptables -F 192.168.0.112_o
iptables -A FORWARD -s 192.168.0.112 -j 192.168.0.112_o
iptables -A FORWARD -d 192.168.0.112 -j 192.168.0.112_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.112 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.112 -o eth0 -j MASQUERADE


echo Cliente - PC13	IP:113    ID: 161
#------------------------------------------------------------------------------
#Cliente - PC13	IP:113    ID: 161
#------------------------------------------------------------------------------
iptables -X 192.168.0.113_i
iptables -X 192.168.0.113_o
iptables -N 192.168.0.113_i
iptables -N 192.168.0.113_o
iptables -F 192.168.0.113_i
iptables -F 192.168.0.113_o
iptables -A FORWARD -s 192.168.0.113 -j 192.168.0.113_o
iptables -A FORWARD -d 192.168.0.113 -j 192.168.0.113_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.113 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.113 -o eth0 -j MASQUERADE


echo Cliente - PC14	IP:114    ID: 156
#------------------------------------------------------------------------------
#Cliente - PC14	IP:114    ID: 156
#------------------------------------------------------------------------------
iptables -X 192.168.0.114_i
iptables -X 192.168.0.114_o
iptables -N 192.168.0.114_i
iptables -N 192.168.0.114_o
iptables -F 192.168.0.114_i
iptables -F 192.168.0.114_o
iptables -A FORWARD -s 192.168.0.114 -j 192.168.0.114_o
iptables -A FORWARD -d 192.168.0.114 -j 192.168.0.114_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.114 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.114 -o eth0 -j MASQUERADE


echo Cliente - PC15	IP:115    ID: 153
#------------------------------------------------------------------------------
#Cliente - PC15	IP:115    ID: 153
#------------------------------------------------------------------------------
iptables -X 192.168.0.115_i
iptables -X 192.168.0.115_o
iptables -N 192.168.0.115_i
iptables -N 192.168.0.115_o
iptables -F 192.168.0.115_i
iptables -F 192.168.0.115_o
iptables -A FORWARD -s 192.168.0.115 -j 192.168.0.115_o
iptables -A FORWARD -d 192.168.0.115 -j 192.168.0.115_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.115 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.115 -o eth0 -j MASQUERADE


echo Cliente - PC16	IP:116    ID: 164
#------------------------------------------------------------------------------
#Cliente - PC16	IP:116    ID: 164
#------------------------------------------------------------------------------
iptables -X 192.168.0.116_i
iptables -X 192.168.0.116_o
iptables -N 192.168.0.116_i
iptables -N 192.168.0.116_o
iptables -F 192.168.0.116_i
iptables -F 192.168.0.116_o
iptables -A FORWARD -s 192.168.0.116 -j 192.168.0.116_o
iptables -A FORWARD -d 192.168.0.116 -j 192.168.0.116_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.116 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.116 -o eth0 -j MASQUERADE


echo Cliente - PC17	IP:117    ID: 167
#------------------------------------------------------------------------------
#Cliente - PC17	IP:117    ID: 167
#------------------------------------------------------------------------------
iptables -X 192.168.0.117_i
iptables -X 192.168.0.117_o
iptables -N 192.168.0.117_i
iptables -N 192.168.0.117_o
iptables -F 192.168.0.117_i
iptables -F 192.168.0.117_o
iptables -A FORWARD -s 192.168.0.117 -j 192.168.0.117_o
iptables -A FORWARD -d 192.168.0.117 -j 192.168.0.117_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.117 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.117 -o eth0 -j MASQUERADE


echo Cliente - PC18	IP:118    ID: 252
#------------------------------------------------------------------------------
#Cliente - PC18	IP:118    ID: 252
#------------------------------------------------------------------------------
iptables -X 192.168.0.118_i
iptables -X 192.168.0.118_o
iptables -N 192.168.0.118_i
iptables -N 192.168.0.118_o
iptables -F 192.168.0.118_i
iptables -F 192.168.0.118_o
iptables -A FORWARD -s 192.168.0.118 -j 192.168.0.118_o
iptables -A FORWARD -d 192.168.0.118 -j 192.168.0.118_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.118 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.118 -o eth0 -j MASQUERADE


echo Cliente - PC19	IP:119    ID: 206
#------------------------------------------------------------------------------
#Cliente - PC19	IP:119    ID: 206
#------------------------------------------------------------------------------
iptables -X 192.168.0.119_i
iptables -X 192.168.0.119_o
iptables -N 192.168.0.119_i
iptables -N 192.168.0.119_o
iptables -F 192.168.0.119_i
iptables -F 192.168.0.119_o
iptables -A FORWARD -s 192.168.0.119 -j 192.168.0.119_o
iptables -A FORWARD -d 192.168.0.119 -j 192.168.0.119_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.119 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.119 -o eth0 -j MASQUERADE


echo Cliente - PC20	IP:120    ID: 210
#------------------------------------------------------------------------------
#Cliente - PC20	IP:120    ID: 210
#------------------------------------------------------------------------------
iptables -X 192.168.0.120_i
iptables -X 192.168.0.120_o
iptables -N 192.168.0.120_i
iptables -N 192.168.0.120_o
iptables -F 192.168.0.120_i
iptables -F 192.168.0.120_o
iptables -A FORWARD -s 192.168.0.120 -j 192.168.0.120_o
iptables -A FORWARD -d 192.168.0.120 -j 192.168.0.120_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.120 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.120 -o eth0 -j MASQUERADE


echo Cliente - PC21	IP:121    ID: 219
#------------------------------------------------------------------------------
#Cliente - PC21	IP:121    ID: 219
#------------------------------------------------------------------------------
iptables -X 192.168.0.121_i
iptables -X 192.168.0.121_o
iptables -N 192.168.0.121_i
iptables -N 192.168.0.121_o
iptables -F 192.168.0.121_i
iptables -F 192.168.0.121_o
iptables -A FORWARD -s 192.168.0.121 -j 192.168.0.121_o
iptables -A FORWARD -d 192.168.0.121 -j 192.168.0.121_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.121 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.121 -o eth0 -j MASQUERADE


echo Cliente - PC22	IP:122    ID: 177
#------------------------------------------------------------------------------
#Cliente - PC22	IP:122    ID: 177
#------------------------------------------------------------------------------
iptables -X 192.168.0.122_i
iptables -X 192.168.0.122_o
iptables -N 192.168.0.122_i
iptables -N 192.168.0.122_o
iptables -F 192.168.0.122_i
iptables -F 192.168.0.122_o
iptables -A FORWARD -s 192.168.0.122 -j 192.168.0.122_o
iptables -A FORWARD -d 192.168.0.122 -j 192.168.0.122_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.122 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.122 -o eth0 -j MASQUERADE


echo Cliente - PC23	IP:123    ID: 209
#------------------------------------------------------------------------------
#Cliente - PC23	IP:123    ID: 209
#------------------------------------------------------------------------------
iptables -X 192.168.0.123_i
iptables -X 192.168.0.123_o
iptables -N 192.168.0.123_i
iptables -N 192.168.0.123_o
iptables -F 192.168.0.123_i
iptables -F 192.168.0.123_o
iptables -A FORWARD -s 192.168.0.123 -j 192.168.0.123_o
iptables -A FORWARD -d 192.168.0.123 -j 192.168.0.123_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.123 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.123 -o eth0 -j MASQUERADE


echo Cliente - PC24	IP:124    ID: 398
#------------------------------------------------------------------------------
#Cliente - PC24	IP:124    ID: 398
#------------------------------------------------------------------------------
iptables -X 192.168.0.124_i
iptables -X 192.168.0.124_o
iptables -N 192.168.0.124_i
iptables -N 192.168.0.124_o
iptables -F 192.168.0.124_i
iptables -F 192.168.0.124_o
iptables -A FORWARD -s 192.168.0.124 -j 192.168.0.124_o
iptables -A FORWARD -d 192.168.0.124 -j 192.168.0.124_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.124 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.124 -o eth0 -j MASQUERADE


echo Cliente - PC25	IP:125    ID: 196
#------------------------------------------------------------------------------
#Cliente - PC25	IP:125    ID: 196
#------------------------------------------------------------------------------
iptables -X 192.168.0.125_i
iptables -X 192.168.0.125_o
iptables -N 192.168.0.125_i
iptables -N 192.168.0.125_o
iptables -F 192.168.0.125_i
iptables -F 192.168.0.125_o
iptables -A FORWARD -s 192.168.0.125 -j 192.168.0.125_o
iptables -A FORWARD -d 192.168.0.125 -j 192.168.0.125_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.125 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.125 -o eth0 -j MASQUERADE


echo Cliente - PC27	IP:127    ID: 244
#------------------------------------------------------------------------------
#Cliente - PC27	IP:127    ID: 244
#------------------------------------------------------------------------------
iptables -X 192.168.0.127_i
iptables -X 192.168.0.127_o
iptables -N 192.168.0.127_i
iptables -N 192.168.0.127_o
iptables -F 192.168.0.127_i
iptables -F 192.168.0.127_o
iptables -A FORWARD -s 192.168.0.127 -j 192.168.0.127_o
iptables -A FORWARD -d 192.168.0.127 -j 192.168.0.127_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.127 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.127 -o eth0 -j MASQUERADE


echo Cliente - PC28	IP:128    ID: 246
#------------------------------------------------------------------------------
#Cliente - PC28	IP:128    ID: 246
#------------------------------------------------------------------------------
iptables -X 192.168.0.128_i
iptables -X 192.168.0.128_o
iptables -N 192.168.0.128_i
iptables -N 192.168.0.128_o
iptables -F 192.168.0.128_i
iptables -F 192.168.0.128_o
iptables -A FORWARD -s 192.168.0.128 -j 192.168.0.128_o
iptables -A FORWARD -d 192.168.0.128 -j 192.168.0.128_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.128 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.128 -o eth0 -j MASQUERADE


echo Cliente - PC29	IP:129    ID: 250
#------------------------------------------------------------------------------
#Cliente - PC29	IP:129    ID: 250
#------------------------------------------------------------------------------
iptables -X 192.168.0.129_i
iptables -X 192.168.0.129_o
iptables -N 192.168.0.129_i
iptables -N 192.168.0.129_o
iptables -F 192.168.0.129_i
iptables -F 192.168.0.129_o
iptables -A FORWARD -s 192.168.0.129 -j 192.168.0.129_o
iptables -A FORWARD -d 192.168.0.129 -j 192.168.0.129_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.129 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.129 -o eth0 -j MASQUERADE


echo Cliente - PC30	IP:130    ID: 248
#------------------------------------------------------------------------------
#Cliente - PC30	IP:130    ID: 248
#------------------------------------------------------------------------------
iptables -X 192.168.0.130_i
iptables -X 192.168.0.130_o
iptables -N 192.168.0.130_i
iptables -N 192.168.0.130_o
iptables -F 192.168.0.130_i
iptables -F 192.168.0.130_o
iptables -A FORWARD -s 192.168.0.130 -j 192.168.0.130_o
iptables -A FORWARD -d 192.168.0.130 -j 192.168.0.130_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.130 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.130 -o eth0 -j MASQUERADE


echo Cliente - PC31	IP:131    ID: 243
#------------------------------------------------------------------------------
#Cliente - PC31	IP:131    ID: 243
#------------------------------------------------------------------------------
iptables -X 192.168.0.131_i
iptables -X 192.168.0.131_o
iptables -N 192.168.0.131_i
iptables -N 192.168.0.131_o
iptables -F 192.168.0.131_i
iptables -F 192.168.0.131_o
iptables -A FORWARD -s 192.168.0.131 -j 192.168.0.131_o
iptables -A FORWARD -d 192.168.0.131 -j 192.168.0.131_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.131 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.131 -o eth0 -j MASQUERADE


echo Cliente - PC32	IP:132    ID: 251
#------------------------------------------------------------------------------
#Cliente - PC32	IP:132    ID: 251
#------------------------------------------------------------------------------
iptables -X 192.168.0.132_i
iptables -X 192.168.0.132_o
iptables -N 192.168.0.132_i
iptables -N 192.168.0.132_o
iptables -F 192.168.0.132_i
iptables -F 192.168.0.132_o
iptables -A FORWARD -s 192.168.0.132 -j 192.168.0.132_o
iptables -A FORWARD -d 192.168.0.132 -j 192.168.0.132_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.132 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.132 -o eth0 -j MASQUERADE


echo Cliente - PC33	IP:133    ID: 247
#------------------------------------------------------------------------------
#Cliente - PC33	IP:133    ID: 247
#------------------------------------------------------------------------------
iptables -X 192.168.0.133_i
iptables -X 192.168.0.133_o
iptables -N 192.168.0.133_i
iptables -N 192.168.0.133_o
iptables -F 192.168.0.133_i
iptables -F 192.168.0.133_o
iptables -A FORWARD -s 192.168.0.133 -j 192.168.0.133_o
iptables -A FORWARD -d 192.168.0.133 -j 192.168.0.133_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.133 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.133 -o eth0 -j MASQUERADE


echo Cliente - PC34	IP:134    ID: 265
#------------------------------------------------------------------------------
#Cliente - PC34	IP:134    ID: 265
#------------------------------------------------------------------------------
iptables -X 192.168.0.134_i
iptables -X 192.168.0.134_o
iptables -N 192.168.0.134_i
iptables -N 192.168.0.134_o
iptables -F 192.168.0.134_i
iptables -F 192.168.0.134_o
iptables -A FORWARD -s 192.168.0.134 -j 192.168.0.134_o
iptables -A FORWARD -d 192.168.0.134 -j 192.168.0.134_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.134 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.134 -o eth0 -j MASQUERADE


echo Cliente - PC35	IP:135    ID: 272
#------------------------------------------------------------------------------
#Cliente - PC35	IP:135    ID: 272
#------------------------------------------------------------------------------
iptables -X 192.168.0.135_i
iptables -X 192.168.0.135_o
iptables -N 192.168.0.135_i
iptables -N 192.168.0.135_o
iptables -F 192.168.0.135_i
iptables -F 192.168.0.135_o
iptables -A FORWARD -s 192.168.0.135 -j 192.168.0.135_o
iptables -A FORWARD -d 192.168.0.135 -j 192.168.0.135_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.135 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.135 -o eth0 -j MASQUERADE


echo Cliente - PC36	IP:136    ID: 274
#------------------------------------------------------------------------------
#Cliente - PC36	IP:136    ID: 274
#------------------------------------------------------------------------------
iptables -X 192.168.0.136_i
iptables -X 192.168.0.136_o
iptables -N 192.168.0.136_i
iptables -N 192.168.0.136_o
iptables -F 192.168.0.136_i
iptables -F 192.168.0.136_o
iptables -A FORWARD -s 192.168.0.136 -j 192.168.0.136_o
iptables -A FORWARD -d 192.168.0.136 -j 192.168.0.136_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.136 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.136 -o eth0 -j MASQUERADE


echo Cliente - PC37	IP:137    ID: 273
#------------------------------------------------------------------------------
#Cliente - PC37	IP:137    ID: 273
#------------------------------------------------------------------------------
iptables -X 192.168.0.137_i
iptables -X 192.168.0.137_o
iptables -N 192.168.0.137_i
iptables -N 192.168.0.137_o
iptables -F 192.168.0.137_i
iptables -F 192.168.0.137_o
iptables -A FORWARD -s 192.168.0.137 -j 192.168.0.137_o
iptables -A FORWARD -d 192.168.0.137 -j 192.168.0.137_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.137 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.137 -o eth0 -j MASQUERADE


echo Cliente - PC38	IP:138    ID: 271
#------------------------------------------------------------------------------
#Cliente - PC38	IP:138    ID: 271
#------------------------------------------------------------------------------
iptables -X 192.168.0.138_i
iptables -X 192.168.0.138_o
iptables -N 192.168.0.138_i
iptables -N 192.168.0.138_o
iptables -F 192.168.0.138_i
iptables -F 192.168.0.138_o
iptables -A FORWARD -s 192.168.0.138 -j 192.168.0.138_o
iptables -A FORWARD -d 192.168.0.138 -j 192.168.0.138_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.138 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.138 -o eth0 -j MASQUERADE


echo Cliente - PC39	IP:139    ID: 269
#------------------------------------------------------------------------------
#Cliente - PC39	IP:139    ID: 269
#------------------------------------------------------------------------------
iptables -X 192.168.0.139_i
iptables -X 192.168.0.139_o
iptables -N 192.168.0.139_i
iptables -N 192.168.0.139_o
iptables -F 192.168.0.139_i
iptables -F 192.168.0.139_o
iptables -A FORWARD -s 192.168.0.139 -j 192.168.0.139_o
iptables -A FORWARD -d 192.168.0.139 -j 192.168.0.139_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.139 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.139 -o eth0 -j MASQUERADE


echo Cliente - PC40	IP:140    ID: 245
#------------------------------------------------------------------------------
#Cliente - PC40	IP:140    ID: 245
#------------------------------------------------------------------------------
iptables -X 192.168.0.140_i
iptables -X 192.168.0.140_o
iptables -N 192.168.0.140_i
iptables -N 192.168.0.140_o
iptables -F 192.168.0.140_i
iptables -F 192.168.0.140_o
iptables -A FORWARD -s 192.168.0.140 -j 192.168.0.140_o
iptables -A FORWARD -d 192.168.0.140 -j 192.168.0.140_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.140 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.140 -o eth0 -j MASQUERADE


echo Cliente - PC41	IP:141    ID: 295
#------------------------------------------------------------------------------
#Cliente - PC41	IP:141    ID: 295
#------------------------------------------------------------------------------
iptables -X 192.168.0.141_i
iptables -X 192.168.0.141_o
iptables -N 192.168.0.141_i
iptables -N 192.168.0.141_o
iptables -F 192.168.0.141_i
iptables -F 192.168.0.141_o
iptables -A FORWARD -s 192.168.0.141 -j 192.168.0.141_o
iptables -A FORWARD -d 192.168.0.141 -j 192.168.0.141_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.141 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.141 -o eth0 -j MASQUERADE


echo Cliente - PC42	IP:142    ID: 394
#------------------------------------------------------------------------------
#Cliente - PC42	IP:142    ID: 394
#------------------------------------------------------------------------------
iptables -X 192.168.0.142_i
iptables -X 192.168.0.142_o
iptables -N 192.168.0.142_i
iptables -N 192.168.0.142_o
iptables -F 192.168.0.142_i
iptables -F 192.168.0.142_o
iptables -A FORWARD -s 192.168.0.142 -j 192.168.0.142_o
iptables -A FORWARD -d 192.168.0.142 -j 192.168.0.142_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.142 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.142 -o eth0 -j MASQUERADE


echo Cliente - PC43	IP:143    ID: 343
#------------------------------------------------------------------------------
#Cliente - PC43	IP:143    ID: 343
#------------------------------------------------------------------------------
iptables -X 192.168.0.143_i
iptables -X 192.168.0.143_o
iptables -N 192.168.0.143_i
iptables -N 192.168.0.143_o
iptables -F 192.168.0.143_i
iptables -F 192.168.0.143_o
iptables -A FORWARD -s 192.168.0.143 -j 192.168.0.143_o
iptables -A FORWARD -d 192.168.0.143 -j 192.168.0.143_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.143 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.143 -o eth0 -j MASQUERADE


echo Cliente - PC44	IP:144    ID: 226
#------------------------------------------------------------------------------
#Cliente - PC44	IP:144    ID: 226
#------------------------------------------------------------------------------
iptables -X 192.168.0.144_i
iptables -X 192.168.0.144_o
iptables -N 192.168.0.144_i
iptables -N 192.168.0.144_o
iptables -F 192.168.0.144_i
iptables -F 192.168.0.144_o
iptables -A FORWARD -s 192.168.0.144 -j 192.168.0.144_o
iptables -A FORWARD -d 192.168.0.144 -j 192.168.0.144_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.144 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.144 -o eth0 -j MASQUERADE


echo Cliente - PC45	IP:145    ID: 365
#------------------------------------------------------------------------------
#Cliente - PC45	IP:145    ID: 365
#------------------------------------------------------------------------------
iptables -X 192.168.0.145_i
iptables -X 192.168.0.145_o
iptables -N 192.168.0.145_i
iptables -N 192.168.0.145_o
iptables -F 192.168.0.145_i
iptables -F 192.168.0.145_o
iptables -A FORWARD -s 192.168.0.145 -j 192.168.0.145_o
iptables -A FORWARD -d 192.168.0.145 -j 192.168.0.145_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.145 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.145 -o eth0 -j MASQUERADE


echo Cliente - PC46	IP:146    ID: 384
#------------------------------------------------------------------------------
#Cliente - PC46	IP:146    ID: 384
#------------------------------------------------------------------------------
iptables -X 192.168.0.146_i
iptables -X 192.168.0.146_o
iptables -N 192.168.0.146_i
iptables -N 192.168.0.146_o
iptables -F 192.168.0.146_i
iptables -F 192.168.0.146_o
iptables -A FORWARD -s 192.168.0.146 -j 192.168.0.146_o
iptables -A FORWARD -d 192.168.0.146 -j 192.168.0.146_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.146 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.146 -o eth0 -j MASQUERADE


echo Cliente - PC47	IP:147    ID: 353
#------------------------------------------------------------------------------
#Cliente - PC47	IP:147    ID: 353
#------------------------------------------------------------------------------
iptables -X 192.168.0.147_i
iptables -X 192.168.0.147_o
iptables -N 192.168.0.147_i
iptables -N 192.168.0.147_o
iptables -F 192.168.0.147_i
iptables -F 192.168.0.147_o
iptables -A FORWARD -s 192.168.0.147 -j 192.168.0.147_o
iptables -A FORWARD -d 192.168.0.147 -j 192.168.0.147_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.147 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.147 -o eth0 -j MASQUERADE


echo Cliente - PC48	IP:148    ID: 341
#------------------------------------------------------------------------------
#Cliente - PC48	IP:148    ID: 341
#------------------------------------------------------------------------------
iptables -X 192.168.0.148_i
iptables -X 192.168.0.148_o
iptables -N 192.168.0.148_i
iptables -N 192.168.0.148_o
iptables -F 192.168.0.148_i
iptables -F 192.168.0.148_o
iptables -A FORWARD -s 192.168.0.148 -j 192.168.0.148_o
iptables -A FORWARD -d 192.168.0.148 -j 192.168.0.148_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.148 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.148 -o eth0 -j MASQUERADE


echo Cliente - PC49	IP:149    ID: 435
#------------------------------------------------------------------------------
#Cliente - PC49	IP:149    ID: 435
#------------------------------------------------------------------------------
iptables -X 192.168.0.149_i
iptables -X 192.168.0.149_o
iptables -N 192.168.0.149_i
iptables -N 192.168.0.149_o
iptables -F 192.168.0.149_i
iptables -F 192.168.0.149_o
iptables -A FORWARD -s 192.168.0.149 -j 192.168.0.149_o
iptables -A FORWARD -d 192.168.0.149 -j 192.168.0.149_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.149 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.149 -o eth0 -j MASQUERADE


echo Cliente - PC50	IP:150    ID: 225
#------------------------------------------------------------------------------
#Cliente - PC50	IP:150    ID: 225
#------------------------------------------------------------------------------
iptables -X 192.168.0.150_i
iptables -X 192.168.0.150_o
iptables -N 192.168.0.150_i
iptables -N 192.168.0.150_o
iptables -F 192.168.0.150_i
iptables -F 192.168.0.150_o
iptables -A FORWARD -s 192.168.0.150 -j 192.168.0.150_o
iptables -A FORWARD -d 192.168.0.150 -j 192.168.0.150_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.150 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.150 -o eth0 -j MASQUERADE


echo Cliente - PC51	IP:151    ID: 180
#------------------------------------------------------------------------------
#Cliente - PC51	IP:151    ID: 180
#------------------------------------------------------------------------------
iptables -X 192.168.0.151_i
iptables -X 192.168.0.151_o
iptables -N 192.168.0.151_i
iptables -N 192.168.0.151_o
iptables -F 192.168.0.151_i
iptables -F 192.168.0.151_o
iptables -A FORWARD -s 192.168.0.151 -j 192.168.0.151_o
iptables -A FORWARD -d 192.168.0.151 -j 192.168.0.151_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.151 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.151 -o eth0 -j MASQUERADE


echo Cliente - PC52	IP:152    ID: 298
#------------------------------------------------------------------------------
#Cliente - PC52	IP:152    ID: 298
#------------------------------------------------------------------------------
iptables -X 192.168.0.152_i
iptables -X 192.168.0.152_o
iptables -N 192.168.0.152_i
iptables -N 192.168.0.152_o
iptables -F 192.168.0.152_i
iptables -F 192.168.0.152_o
iptables -A FORWARD -s 192.168.0.152 -j 192.168.0.152_o
iptables -A FORWARD -d 192.168.0.152 -j 192.168.0.152_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.152 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.152 -o eth0 -j MASQUERADE


echo Cliente - PC53	IP:153    ID: 464
#------------------------------------------------------------------------------
#Cliente - PC53	IP:153    ID: 464
#------------------------------------------------------------------------------
iptables -X 192.168.0.153_i
iptables -X 192.168.0.153_o
iptables -N 192.168.0.153_i
iptables -N 192.168.0.153_o
iptables -F 192.168.0.153_i
iptables -F 192.168.0.153_o
iptables -A FORWARD -s 192.168.0.153 -j 192.168.0.153_o
iptables -A FORWARD -d 192.168.0.153 -j 192.168.0.153_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.153 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.153 -o eth0 -j MASQUERADE


echo Cliente - PC54	IP:154    ID: 460
#------------------------------------------------------------------------------
#Cliente - PC54	IP:154    ID: 460
#------------------------------------------------------------------------------
iptables -X 192.168.0.154_i
iptables -X 192.168.0.154_o
iptables -N 192.168.0.154_i
iptables -N 192.168.0.154_o
iptables -F 192.168.0.154_i
iptables -F 192.168.0.154_o
iptables -A FORWARD -s 192.168.0.154 -j 192.168.0.154_o
iptables -A FORWARD -d 192.168.0.154 -j 192.168.0.154_i
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.154 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.154 -o eth0 -j MASQUERADE


echo Cliente - Sala de Reuniones	IP:80    ID: 348
#------------------------------------------------------------------------------
#Cliente - Sala de Reuniones	IP:80    ID: 348
#------------------------------------------------------------------------------
iptables -X 192.168.0.80_i
iptables -X 192.168.0.80_o
iptables -N 192.168.0.80_i
iptables -N 192.168.0.80_o
iptables -F 192.168.0.80_i
iptables -F 192.168.0.80_o
iptables -A FORWARD -s 192.168.0.80 -j 192.168.0.80_o
iptables -A FORWARD -d 192.168.0.80 -j 192.168.0.80_i
iptables -A FORWARD -s 192.168.0.80 -m mac --mac-source 00:0b:82:11:b9:2d -j ACCEPT
iptables -A FORWARD -d 192.168.0.80 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.80 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.80 -o eth0 -j MASQUERADE


echo Cliente - SERVER MASTER	IP:7    ID: 470
#------------------------------------------------------------------------------
#Cliente - SERVER MASTER	IP:7    ID: 470
#------------------------------------------------------------------------------
iptables -X 192.168.0.7_i
iptables -X 192.168.0.7_o
iptables -N 192.168.0.7_i
iptables -N 192.168.0.7_o
iptables -F 192.168.0.7_i
iptables -F 192.168.0.7_o
iptables -A FORWARD -s 192.168.0.7 -j 192.168.0.7_o
iptables -A FORWARD -d 192.168.0.7 -j 192.168.0.7_i
iptables -A FORWARD -s 192.168.0.7 -m mac --mac-source 00:25:90:d8:e5:ac -j ACCEPT
iptables -A FORWARD -d 192.168.0.7 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.7 -o eth0 -j MASQUERADE


echo Cliente - Servidor temporal	IP:21    ID: 468
#------------------------------------------------------------------------------
#Cliente - Servidor temporal	IP:21    ID: 468
#------------------------------------------------------------------------------
iptables -X 192.168.0.21_i
iptables -X 192.168.0.21_o
iptables -N 192.168.0.21_i
iptables -N 192.168.0.21_o
iptables -F 192.168.0.21_i
iptables -F 192.168.0.21_o
iptables -A FORWARD -s 192.168.0.21 -j 192.168.0.21_o
iptables -A FORWARD -d 192.168.0.21 -j 192.168.0.21_i
iptables -A FORWARD -s 192.168.0.21 -m mac --mac-source 00:11:d8:f9:fd:73 -j ACCEPT
iptables -A FORWARD -d 192.168.0.21 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.21 -o eth0 -j MASQUERADE


echo Cliente - Servidor virtualizado	IP:14    ID: 475
#------------------------------------------------------------------------------
#Cliente - Servidor virtualizado	IP:14    ID: 475
#------------------------------------------------------------------------------
iptables -X 192.168.0.14_i
iptables -X 192.168.0.14_o
iptables -N 192.168.0.14_i
iptables -N 192.168.0.14_o
iptables -F 192.168.0.14_i
iptables -F 192.168.0.14_o
iptables -A FORWARD -s 192.168.0.14 -j 192.168.0.14_o
iptables -A FORWARD -d 192.168.0.14 -j 192.168.0.14_i
iptables -A FORWARD -s 192.168.0.14 -m mac --mac-source 70:71:bc:72:72:c6 -j ACCEPT
iptables -A FORWARD -d 192.168.0.14 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.14 -o eth0 -j MASQUERADE


echo Cliente - Sistemas	IP:24    ID: 467
#------------------------------------------------------------------------------
#Cliente - Sistemas	IP:24    ID: 467
#------------------------------------------------------------------------------
iptables -X 192.168.0.24_i
iptables -X 192.168.0.24_o
iptables -N 192.168.0.24_i
iptables -N 192.168.0.24_o
iptables -F 192.168.0.24_i
iptables -F 192.168.0.24_o
iptables -A FORWARD -s 192.168.0.24 -j 192.168.0.24_o
iptables -A FORWARD -d 192.168.0.24 -j 192.168.0.24_i
iptables -A FORWARD -s 192.168.0.24 -m mac --mac-source 00:24:e8:84:06:21 -j ACCEPT
iptables -A FORWARD -d 192.168.0.24 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.24 -o eth0 -j MASQUERADE


echo Cliente - Sistemas	IP:38    ID: 396
#------------------------------------------------------------------------------
#Cliente - Sistemas	IP:38    ID: 396
#------------------------------------------------------------------------------
iptables -X 192.168.0.38_i
iptables -X 192.168.0.38_o
iptables -N 192.168.0.38_i
iptables -N 192.168.0.38_o
iptables -F 192.168.0.38_i
iptables -F 192.168.0.38_o
iptables -A FORWARD -s 192.168.0.38 -j 192.168.0.38_o
iptables -A FORWARD -d 192.168.0.38 -j 192.168.0.38_i
iptables -A FORWARD -s 192.168.0.38 -m mac --mac-source 78:e4:00:d3:ee:d5 -j ACCEPT
iptables -A FORWARD -d 192.168.0.38 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.38 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.38 -o eth0 -j MASQUERADE


echo Cliente - Sistemas	IP:201    ID: 408
#------------------------------------------------------------------------------
#Cliente - Sistemas	IP:201    ID: 408
#------------------------------------------------------------------------------
iptables -X 192.168.0.201_i
iptables -X 192.168.0.201_o
iptables -N 192.168.0.201_i
iptables -N 192.168.0.201_o
iptables -F 192.168.0.201_i
iptables -F 192.168.0.201_o
iptables -A FORWARD -s 192.168.0.201 -j 192.168.0.201_o
iptables -A FORWARD -d 192.168.0.201 -j 192.168.0.201_i
iptables -A FORWARD -s 192.168.0.201 -m mac --mac-source 00:80:f0:d1:d5:4e -j ACCEPT
iptables -A FORWARD -d 192.168.0.201 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.201 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.201 -o eth0 -j MASQUERADE


echo Cliente - Sonia Toconas	IP:100    ID: 185
#------------------------------------------------------------------------------
#Cliente - Sonia Toconas	IP:100    ID: 185
#------------------------------------------------------------------------------
iptables -X 192.168.0.100_i
iptables -X 192.168.0.100_o
iptables -N 192.168.0.100_i
iptables -N 192.168.0.100_o
iptables -F 192.168.0.100_i
iptables -F 192.168.0.100_o
iptables -A FORWARD -s 192.168.0.100 -j 192.168.0.100_o
iptables -A FORWARD -d 192.168.0.100 -j 192.168.0.100_i
iptables -A FORWARD -s 192.168.0.100 -m mac --mac-source 10:78:D2:8A:43:EF -j ACCEPT
iptables -A FORWARD -d 192.168.0.100 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.100 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.100 -o eth0 -j MASQUERADE


echo Cliente - Sonia Toconas	IP:54    ID: 434
#------------------------------------------------------------------------------
#Cliente - Sonia Toconas	IP:54    ID: 434
#------------------------------------------------------------------------------
iptables -X 192.168.0.54_i
iptables -X 192.168.0.54_o
iptables -N 192.168.0.54_i
iptables -N 192.168.0.54_o
iptables -F 192.168.0.54_i
iptables -F 192.168.0.54_o
iptables -A FORWARD -s 192.168.0.54 -j 192.168.0.54_o
iptables -A FORWARD -d 192.168.0.54 -j 192.168.0.54_i
iptables -A FORWARD -s 192.168.0.54 -m mac --mac-source b8:03:05:4e:e1:43 -j ACCEPT
iptables -A FORWARD -d 192.168.0.54 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.54 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.54 -o eth0 -j MASQUERADE


echo Cliente - Telefono IP Panasonic	IP:204    ID: 415
#------------------------------------------------------------------------------
#Cliente - Telefono IP Panasonic	IP:204    ID: 415
#------------------------------------------------------------------------------
iptables -X 192.168.0.204_i
iptables -X 192.168.0.204_o
iptables -N 192.168.0.204_i
iptables -N 192.168.0.204_o
iptables -F 192.168.0.204_i
iptables -F 192.168.0.204_o
iptables -A FORWARD -s 192.168.0.204 -j 192.168.0.204_o
iptables -A FORWARD -d 192.168.0.204 -j 192.168.0.204_i
iptables -A FORWARD -s 192.168.0.204 -m mac --mac-source 00:80:f0:d1:d1:dd -j ACCEPT
iptables -A FORWARD -d 192.168.0.204 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.204 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.204 -o eth0 -j MASQUERADE


echo Cliente - Telular 1	IP:3    ID: 221
#------------------------------------------------------------------------------
#Cliente - Telular 1	IP:3    ID: 221
#------------------------------------------------------------------------------
iptables -X 192.168.0.3_i
iptables -X 192.168.0.3_o
iptables -N 192.168.0.3_i
iptables -N 192.168.0.3_o
iptables -F 192.168.0.3_i
iptables -F 192.168.0.3_o
iptables -A FORWARD -s 192.168.0.3 -j 192.168.0.3_o
iptables -A FORWARD -d 192.168.0.3 -j 192.168.0.3_i
iptables -A FORWARD -s 192.168.0.3 -m mac --mac-source 00:03:7e:00:c4:ae -j ACCEPT
iptables -A FORWARD -d 192.168.0.3 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.3 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.3 -o eth0 -j MASQUERADE


echo Cliente - Telular 2	IP:6    ID: 282
#------------------------------------------------------------------------------
#Cliente - Telular 2	IP:6    ID: 282
#------------------------------------------------------------------------------
iptables -X 192.168.0.6_i
iptables -X 192.168.0.6_o
iptables -N 192.168.0.6_i
iptables -N 192.168.0.6_o
iptables -F 192.168.0.6_i
iptables -F 192.168.0.6_o
iptables -A FORWARD -s 192.168.0.6 -j 192.168.0.6_o
iptables -A FORWARD -d 192.168.0.6 -j 192.168.0.6_i
iptables -A FORWARD -s 192.168.0.6 -m mac --mac-source 00:03:7e:00:7e:38 -j ACCEPT
iptables -A FORWARD -d 192.168.0.6 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.6 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.6 -o eth0 -j MASQUERADE


echo Cliente - Toshiba Satellite	IP:51    ID: 452
#------------------------------------------------------------------------------
#Cliente - Toshiba Satellite	IP:51    ID: 452
#------------------------------------------------------------------------------
iptables -X 192.168.0.51_i
iptables -X 192.168.0.51_o
iptables -N 192.168.0.51_i
iptables -N 192.168.0.51_o
iptables -F 192.168.0.51_i
iptables -F 192.168.0.51_o
iptables -A FORWARD -s 192.168.0.51 -j 192.168.0.51_o
iptables -A FORWARD -d 192.168.0.51 -j 192.168.0.51_i
iptables -A FORWARD -s 192.168.0.51 -m mac --mac-source 00:26:9e:d9:f6:fc -j ACCEPT
iptables -A FORWARD -d 192.168.0.51 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.51 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.51 -o eth0 -j MASQUERADE


echo Cliente - Vicente López Recepción	IP:203    ID: 409
#------------------------------------------------------------------------------
#Cliente - Vicente López Recepción	IP:203    ID: 409
#------------------------------------------------------------------------------
iptables -X 192.168.0.203_i
iptables -X 192.168.0.203_o
iptables -N 192.168.0.203_i
iptables -N 192.168.0.203_o
iptables -F 192.168.0.203_i
iptables -F 192.168.0.203_o
iptables -A FORWARD -s 192.168.0.203 -j 192.168.0.203_o
iptables -A FORWARD -d 192.168.0.203 -j 192.168.0.203_i
iptables -A FORWARD -s 192.168.0.203 -m mac --mac-source 00:80:f0:d1:d5:46 -j ACCEPT
iptables -A FORWARD -d 192.168.0.203 -j ACCEPT
iptables -t nat -A PREROUTING -i br2 -p tcp --dport 80 -s 192.168.0.203 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 192.168.0.203 -o eth0 -j MASQUERADE


echo Cliente - Zafiro Backup	IP:13    ID: 375
#------------------------------------------------------------------------------
#Cliente - Zafiro Backup	IP:13    ID: 375
#------------------------------------------------------------------------------
iptables -X 192.168.0.13_i
iptables -X 192.168.0.13_o
iptables -N 192.168.0.13_i
iptables -N 192.168.0.13_o
iptables -F 192.168.0.13_i
iptables -F 192.168.0.13_o
iptables -A FORWARD -s 192.168.0.13 -j 192.168.0.13_o
iptables -A FORWARD -d 192.168.0.13 -j 192.168.0.13_i
iptables -A FORWARD -s 192.168.0.13 -m mac --mac-source 00:19:21:19:3d:7e -j ACCEPT
iptables -A FORWARD -d 192.168.0.13 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.13 -o eth0 -j MASQUERADE
iptables -A INPUT -p udp --dport 9010 -j ACCEPT
iptables -A OUTPUT -p udp --sport 9010 -j ACCEPT
iptables -A INPUT -p udp --dport 9010 -j ACCEPT
iptables -A OUTPUT -p udp --sport 9010 -j ACCEPT
iptables -t mangle -A PREROUTING -p tcp -j RETURN
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
