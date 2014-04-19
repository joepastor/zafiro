# Archivo de configuracion

accesointerno=0
ocultamiento=0
ocultamientooct=0
dummy=0
mascara="0/24"
maxusers=250

# Estas son las DNS forzadas para que tomen LOS CLIENTES, no el servidor
# Se cargaran en el archivo dhcpd.conf para que cuando renueven IP
# Tomen estas dnss en vez de las que usa el server
# el caracter - significa que la dns sera puesta vacia
dns1_force="172.16.0.1"
dns2_force="-"
dns3_force="-"


#Archivo de configuracion
#No dejar lineas entre el nombre de la variable y el valor
#Ej: ilan = eth0 esta mal
#Ej: ilan=eth0 esta bien

# Interfaces
# WAN
devpub="eth0"
# LAN
devpri="br2"
# Enmascaramiento (salida)
devenm="eth0"

# Directorios
zafirodir="/Users/Joe/git/zafiro"
openvpndir="/etc/openvpn"
archivosdir="%s/archivos" % zafirodir 
vpnclidir="/zafiro/vpnclientes"
scriptsdir="%s/scripts" % zafirodir

# Archivos de lectura
interfacesfile="/etc/network/interfaces"

# Archivos de lectura/escritura
dyndnsfile="/etc/ddclient.conf"
hostnamefile="/etc/hostname"
resolvfile="/etc/resolv.conf"
placasinfo="/zafiro/archivos/placas.txt"
syslogfile="/var/log/syslog"
ip_forward="/zafiro/archivos/ip_forward"
pingignore="/zafiro/archivos/icmp_echo_ignore_all"
