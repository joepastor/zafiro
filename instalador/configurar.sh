#!/bin/sh
directorio="/zafiro"

mv /etc/network/interfaces /etc/network/interfaces.$(date +%Y%m%d%H%M%S)
mv /etc/default/dhcp /etc/default/dhcp.$(date +%Y%m%d%H%M%S)
mv /etc/default/dhcp3-server /etc/default/dhcp3-server.$(date +%Y%m%d%H%M%S)
mv /etc/dhcpd.conf /etc/dhcpd.conf.$(date +%Y%m%d%H%M%S)
mv /etc/dhcp3/dhcpd.conf /etc/dhcp3/dhcpd.conf.$(date +%Y%m%d%H%M%S)
mv /etc/resolv.conf /etc/resolv.conf.$(date +%Y%m%d%H%M%S)
mv /etc/hosts /etc/hosts.$(date +%Y%m%d%H%M%S)
mv /etc/mrtg.cfg /etc/mrtg.cfg.$(date +%Y%m%d%H%M%S)
mv /etc/hostname /etc/hostname.$(date +%Y%m%d%H%M%S)
mv /etc/ddclient.conf /etc/ddclient.conf.$(date +%Y%m%d%H%M%S)
mv /etc/openvpn /etc/openvpn.$(date +%Y%m%d%H%M%S)

#chmod 644 /var/log/syslog /var/log/dmesg
ln -s $directorio/archivos/interfaces /etc/network/interfaces 
ln -s $directorio/archivos/dhcp /etc/default/isc-dhcp-server
ln -s $directorio/archivos/dhcpd.conf /etc/dhcp/dhcpd.conf
ln -s $directorio/archivos/resolv.conf /etc/resolv.conf 
ln -s $directorio/archivos/hosts /etc/hosts
ln -s $directorio/archivos/mrtg.cfg /etc/mrtg.cfg
ln -s $directorio/archivos/sasacct.conf /etc/sasacct.conf
ln -s $directorio/archivos/sasacct.users /etc/sasacct.users
ln -s $directorio/archivos/hostname /etc/hostname
ln -s $directorio/archivos/ddclient.conf /etc/ddclient.conf
ln -s $directorio/openvpn/ /etc/openvpn
