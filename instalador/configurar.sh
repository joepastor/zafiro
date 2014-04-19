#!/bin/sh
directorio="/zafiro"

#mv /etc/network/interfaces /etc/network/interfaces.$(date +%Y%m%d%H%M%S)
#mv /etc/default/dhcp /etc/default/dhcp.$(date +%Y%m%d%H%M%S)
#mv /etc/default/dhcp3-server /etc/default/dhcp3-server.$(date +%Y%m%d%H%M%S)
#mv /etc/dhcpd.conf /etc/dhcpd.conf.$(date +%Y%m%d%H%M%S)
#mv /etc/dhcp3/dhcpd.conf /etc/dhcp3/dhcpd.conf.$(date +%Y%m%d%H%M%S)
#mv /etc/resolv.conf /etc/resolv.conf.$(date +%Y%m%d%H%M%S)
#mv /etc/hosts /etc/hosts.$(date +%Y%m%d%H%M%S)
#mv /etc/mrtg.cfg /etc/mrtg.cfg.$(date +%Y%m%d%H%M%S)
#mv /etc/hostname /etc/hostname.$(date +%Y%m%d%H%M%S)
#mv /etc/ddclient.conf /etc/ddclient.conf.$(date +%Y%m%d%H%M%S)
#mv /etc/openvpn /etc/openvpn.$(date +%Y%m%d%H%M%S)

#chmod 644 /var/log/syslog /var/log/dmesg
#ln -s $directorio/archivos/interfaces /etc/network/interfaces 
#ln -s $directorio/archivos/dhcp /etc/default/dhcp
#ln -s $directorio/archivos/dhcp /etc/default/dhcp3-server
#ln -s $directorio/archivos/dhcpd.conf /etc/dhcpd.conf
#ln -s $directorio/archivos/dhcpd.conf /etc/dhcp3/dhcpd.conf
#ln -s $directorio/archivos/resolv.conf /etc/resolv.conf 
#ln -s $directorio/archivos/hosts /etc/hosts
#ln -s $directorio/archivos/mrtg.cfg /etc/mrtg.cfg
#ln -s $directorio/archivos/sasacct.conf /etc/sasacct.conf
#ln -s $directorio/archivos/sasacct.users /etc/sasacct.users
#ln -s $directorio/archivos/hostname /etc/hostname
#ln -s $directorio/archivos/ddclient.conf /etc/ddclient.conf
#ln -s $directorio/openvpn/ /etc/openvpn
#ln -s /sbin/iptables /usr/sbin/iptables




# NUEVO INSTALADOR
chmod +x $directorio/archivos/*.sh
chmod +x $directorio/scripts/*.sh
chgrp www-data /zafiro/archivos/*; chmod g+w /zafiro/archivos/*
chgrp www-data $directorio/archivos/ejecutar ; chmod g+w $directorio/archivos/ejecutar
chgrp www-data /etc/openvpn/ -R; chmod g+w /etc/openvpn/ -R
chgrp www-data /etc/hostname; chmod g+w /etc/hostname
chgrp www-data /etc/network/interfaces; chmod 640 /etc/network/interfaces
chgrp www-data /etc/resolv.conf; chmod g+w /etc/resolv.conf
chgrp www-data /etc/hosts ; chmod g+w /etc/hosts
chgrp www-data /var/log/dmesg;
chgrp www-data /var/log/syslog; chmod g+r /var/log/syslog
cat /zafiro/archivos/mrtg.cfg > /etc/mrtg.cfg
chgrp www-data /zafiro/vpnclientes -R; chmod g+w /zafiro/vpnclientes -R
