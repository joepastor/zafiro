# Archivo de configuracion

accesointerno=0
ocultamiento=0
ocultamientooct=0
dummy=0
mascara="0/24"
maxusers=250

#Archivo de configuracion
#No dejar lineas entre el nombre de la variable y el valor
#Ej: ilan = eth0 esta mal
#Ej: ilan=eth0 esta bien

# Interfaces
# WAN
#devpub="eth0"
# LAN
#devpri="br2"
# Enmascaramiento (salida)
#devenm="eth0"

# Directorios
zafirodir="/Users/Joe/git/zafiro"
zafirodir="/home/joe/git/zafiro"
archivosdir="%s/archivos" % zafirodir
openvpndir="%s/openvpn" % archivosdir
scriptsdir="%s/scripts" % archivosdir
symfonydir="%s/Symfony" % zafirodir
mrtgdir="%s/web/bundles/joezafiro/mrtg" % symfonydir

#!vpnclidir="/zafiro/vpnclientes"

# Archivos de lectura
interfacesfile="/etc/network/interfaces"

# Archivos de lectura/escritura
dyndnsfile="/etc/ddclient.conf"
hostnamefile="/etc/hostname"
resolvfile="/etc/resolv.conf"
ip_forward="/proc/sys/net/ipv4/ip_forward"
pingignore="/proc/sys/net/ipv4/icmp_echo_ignore_all"