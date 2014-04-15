#!/usr/bin/env python
import MySQLdb, sys
try:
	db = MySQLdb.connect(host='localhost',user='zafiro',passwd='j483nd8-34/23f--ds',db='zafiro')
	curs = db.cursor()
except MySQLdb.Error, e:
	print e
	sys.exit(0)

from configuracion import *

###### TOMA DE VARIABLES GLOBALES ###############################################
inp=open("%s" % resolvfile,"r")
count=0
dns1=""
dns2=""
dns3=""
for linea in inp.readlines():
	count=count+1
	if linea.split(" ")[0]=="nameserver":
		if count==1:
			dns1=linea.split(" ")[1][:-1]
		elif count==2:
			dns2=linea.split(" ")[1][:-1]
		elif count==3:
			dns3=linea.split(" ")[1][:-1]
inp.close()

#TODO 20131022 - Aca hay un problema, con el tema de las dnss forzadas para dhcpd
# la logica siguiente no tiene sentido, pero ahora no tenemos tiempo de repararla.
# deberia funcionar asi: si esta seteada dnsX_force con alguna ip, entonces poner esa
# si esta vacia o con algun codigo, entonces deberia VACIARLA para que no exista
# y si no, deberia seguir la logica y tomar la configurada normal.
# ahora no hace eso, asi que tenemos que corregirlo
if dns1_force!="":
	dns1=dns1_force
if dns1_force=="-":
	dns1=""

if dns2_force!="":
	dns2=dns2_force
if dns2_force=="-":
	dns2=""

if dns3_force!="":
	dns3=dns3_force
if dns3_force=="-":
	dns3=""

print dns1
print dns2
print dns3

inp=open(interfacesfile,"r")
gwcliente=""
iface=""
global ipprefijopri
ipprefijopri=""
for linea in inp.readlines():
	linea2=linea.split(" ")
	if linea2[0]=="iface":
		iface=linea2[1]
	if len(linea2)>1:
		if iface==devpri and linea2[0]=="\taddress":
			gwcliente=linea2[1][:-1]
			ip=linea2[1]
			prioctpri=ip.split(".")[0]
	                segoctpri=ip.split(".")[1]
	                teroctpri=ip.split(".")[2]
	                cuaoctpri=ip.split(".")[3][:-1]
	                ipprefijopri="%s.%s.%s." % (prioctpri,segoctpri,teroctpri)
inp.close()
###### FUNCIONES ################################################################

def fncgetlimitar():
	inp=open("%s/archivos/limitar" % zafirodir,"r")
	for linea in inp.readlines():
		return linea
	inp.close()

def fncarmaip (p,s,t,c):
        return "%s.%s.%s.%s" % (p,s,t,c)

def fncgrafico(puerto, prefijo, mascara,tipo):
	iptables=""
        iptables+="iptables -X %din\n" % puerto
        iptables+="iptables -N %din\n" % puerto
	iptables+="iptables -A %din\n" % puerto
	iptables+="iptables -X %dout\n" % puerto
	iptables+="iptables -N %dout\n" % puerto
	iptables+="iptables -A %dout\n" % puerto
	iptables+="iptables -A FORWARD -s %s%s -p %s --dport %d -j %dout\n" % (prefijo,mascara,tipo,puerto,puerto)
	iptables+="iptables -A FORWARD -d %s%s -p %s --sport %d -j %din\n" % (prefijo,mascara,tipo,puerto,puerto)
        return iptables

def fncfiltros():
	iptables=""
	iptables+="\n# COMIENZO DE FILTROS PERSONALIZADOS\n"
        curs.execute("""select tipo,ipsource,ipdestino,puertosource,puertodestino,interfaceentrada,interfacesalida from filtros where estado=0""")
        rstfiltros=curs.fetchall()
        for tipo,ipsource,ipdestino,puertosource,puertodestino,interfaceentrada,interfacesalida in rstfiltros:
        	if ipsource:
                	ipsource=" -s %s" % ipsource
                if ipdestino:	
                      	ipdestino=" -d %s" % ipdestino
                if tipo:
                      	if tipo != "ICMP":
	                        if puertosource:
        	                        puertosource=" --sport %s" % puertosource
                                if puertodestino:
                                        puertodestino=" --dport %s" % puertodestino
			else:
				puertosource=""
				puertodestino=""
                	tipo=" -p %s" % tipo
                if interfaceentrada:
                	interfaceentrada=" -i %s" % interfaceentrada
                if interfacesalida:
                	interfacesalida=" -o %s" % interfacesalida
                iptables+="iptables -A FORWARD %s %s %s %s %s %s %s -j DROP\n" % (interfaceentrada,ipsource,tipo,puertosource,interfacesalida,puertodestino,ipdestino)
	iptables+="\n# FIN DE FILTROS PERSONALIZADO\n"
	return iptables

def fncfwpersonalizado():
	iptables=""
	iptables+="\n# COMIENZO DEL FIREWALL PERSONALIZADO\n"
        curs.execute("""select comando from firewall where estado=0 order by orden""")
        rstfire=curs.fetchall()
        for comando in rstfire:
        	iptables+="iptables %s\n" % comando
	iptables+="\n# FIN DEL FIREWALL PERSONALIZADO\n"
	return iptables

def fncfirewall():
	iptables=""
	iptables+="\n# COMIENZO DE FIREWALL ESTANDAR\n"
	iptables+="iptables -P INPUT ACCEPT\n"
        iptables+="iptables -P OUTPUT ACCEPT\n"
        iptables+="iptables -P FORWARD ACCEPT\n"

	#VPN
	iptables+="iptables -A FORWARD -o tun+ -j ACCEPT\n"
	iptables+="iptables -A FORWARD -i tun+ -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -o tun+ -j ACCEPT\n"
	iptables+="iptables -A INPUT -i tun+ -j ACCEPT\n"
	iptables+="iptables -t nat -A POSTROUTING -o tun+ -j MASQUERADE\n"

	iptables+="iptables -A INPUT -p 50 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p 51 -j ACCEPT\n"
	iptables+="iptables -A INPUT -p 51 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p 50 -j ACCEPT\n"
	iptables+="iptables -A INPUT -p udp --sport 1194 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p udp --dport 1194 -j ACCEPT\n"
	##VPN

	#SSH
	iptables+="iptables -A INPUT -p tcp --dport 22 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT\n"
	iptables+="iptables -A INPUT -p tcp --sport 22 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT\n"
	##SSH

	#iptables+="iptables -A INPUT -j LOG --log-prefix 'CONEXION SSH '\n"

	for puerto in (80,110,21,25):
	        if puerto==53:
	                iptables+=fncgrafico(puerto,ipprefijopri,mascara,'udp')
	        else:
	                iptables+=fncgrafico(puerto,ipprefijopri,mascara,'tcp')

	iptables+="iptables -A INPUT -i lo -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -o lo -j ACCEPT\n"
	iptables+="iptables -A INPUT -p ICMP -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p ICMP -j ACCEPT\n"
	iptables+="iptables -A INPUT -p tcp --dport 2801 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p tcp --sport 2801 -j ACCEPT\n"

	#WHOIS
	iptables+="iptables -A INPUT -p tcp --sport 43 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p tcp --dport 43 -j ACCEPT\n"


	# Permite el acceso al GUI solo a traves de la placa interna
	if accesointerno:
	        iptables+="iptables -A INPUT -i %s -p tcp --dport 2801 -j ACCEPT\n" % devpri
	        iptables+="iptables -A OUTPUT -o %s -p tcp --sport 2801 -j ACCEPT\n" % devpri
	else:
	        iptables+="iptables -A INPUT -p tcp --dport 2801 -j ACCEPT\n"
	        iptables+="iptables -A OUTPUT -p tcp --sport 2801 -j ACCEPT\n"
	iptables+="iptables -A INPUT -p udp --sport 53 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p udp --dport 53 -j ACCEPT\n"

	iptables+="iptables -A INPUT -i %s -p udp --dport 53 -j ACCEPT\n" % devpri
	iptables+="iptables -A OUTPUT -o %s -p udp --sport 53 -j ACCEPT\n" % devpri
	iptables+="iptables -A INPUT -i %s -p udp --sport 53 -j ACCEPT\n" % devpub
	iptables+="iptables -A OUTPUT -o %s -p udp --dport 53 -j ACCEPT\n" % devpub

	iptables+="iptables -A INPUT -p udp --dport 500 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p udp --dport 500 -j ACCEPT\n"


	iptables+="iptables -A INPUT -p tcp --sport 80 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT\n"
	iptables+="iptables -A INPUT -p tcp --dport 80 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT\n"
	iptables+="iptables -A INPUT -p tcp --dport 1723 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p tcp --sport 1723 -j ACCEPT\n"
	iptables+="iptables -A INPUT -p 47 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p 47 -j ACCEPT\n"
	iptables+="iptables -A INPUT -p udp --sport 67:68 --dport 67:68 -j ACCEPT\n"
	iptables+="iptables -A OUTPUT -p udp --dport 67:68 --sport 67:68 -j ACCEPT\n"
	iptables+="iptables -A INPUT -i %s -p tcp --dport 3128 -j ACCEPT\n" % devpri
	iptables+="iptables -A OUTPUT -o %s -p tcp --sport 3128 -j ACCEPT\n" % devpri
	iptables+="iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu\n"
	#iptables+="iptables -X syn-flood\n"
	#iptables+="iptables -N syn-flood\n"
	#iptables+="iptables -A INPUT -i %s -p tcp --syn -j syn-flood\n" % devenm
	#iptables+="iptables -A INPUT -i %s -p tcp --syn -j syn-flood\n" % devpri
	#iptables+="iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN\n"
	#iptables+="iptables -A syn-flood -j DROP\n"
	iptables+="iptables -A INPUT -i %s -f -j LOG --log-prefix 'Fragmento! '\n" % devenm
	iptables+="iptables -A INPUT -i %s -f -j DROP\n" % devenm
	iptables+="iptables -A INPUT -i %s -f -j LOG --log-prefix 'Fragmento! '\n" % devpri
	iptables+="iptables -A INPUT -i %s -f -j DROP\n" % devpri
	iptables+="iptables -t mangle -A PREROUTING -p icmp -j TOS --set-tos Minimize-Delay\n"
	iptables+="echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts\n"
	iptables+="echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects\n"
	iptables+="echo 0 > /proc/sys/net/ipv4/conf/all/log_martians\n"
	iptables+="iptables -X ICMP\n"
	iptables+="iptables -N ICMP\n"
	iptables+="iptables -A ICMP -i %s -s 0.0.0.0/0 -p icmp -j LOG --log-level info --log-prefix 'ICMP FILTRADOS INTERNET:   '\n" % devenm
	iptables+="iptables -A ICMP -i %s -s 0.0.0.0/0 -p icmp -j LOG --log-level info --log-prefix 'ICMP FILTRADOS LAN:   '\n" % devpri
	iptables+="\n"
	iptables+="# FIN DE FIREWALL ESTANDAR\n\n"

	return iptables
