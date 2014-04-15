zafirodir="/zafiro"
#scriptsdir="%s/scripts" % zafirodir
#directorio="%s/archivos" % zafirodir
#openvpndir="%s/openvpn" % zafirodir
#interfacesfile="/etc/network/interfaces"
#resolvfile="/etc/resolv.conf"

#devpri="eth1"
#devpub="eth0"
#devenm="eth0"

inp=open("%s/configuracion/zafiro.conf" % zafirodir,"r")
for linea in inp.readlines():
	if linea[1:] != "#":
		variable=linea.split("=")
		if variable[0]=="iwan":
			devpub=variable[1][:-1]
		if variable[0]=="ilan":
			devpri=variable[1][:-1]
		if variable[0]=="enm":
			devenm=variable[1][:-1]
		if variable[0]=="resolvfile":
			resolvfile=variable[1][:-1]
		if variable[0]=="zafirodir":
			zafirodir=variable[1][:-1]
		if variable[0]=="scriptsdir":
			scriptsdir=variable[1][:-1]
		if variable[0]=="archivosdir":
			directorio=variable[1][:-1]
		if variable[0]=="openvpndir":
			openvpndir=variable[1][:-1]
		if variable[0]=="interfacesfile":
			interfacesfile=variable[1][:-1]
		if variable[0]=="dns1_force":
			dns1_force=variable[1][:-1]
		if variable[0]=="dns2_force":
			dns2_force=variable[1][:-1]
		if variable[0]=="dns3_force":
			dns3_force=variable[1][:-1]

inp.close()

accesointerno=0
ocultamiento=0
ocultamientooct=0
dummy=0
mascara="0/24"

# Estas son las DNS forzadas para que tomen LOS CLIENTES, no el servidor
# Se cargaran en el archivo dhcpd.conf para que cuando renueven IP
# Tomen estas dnss en vez de las que usa el server
# el caracter - significa que la dns sera puesta vacia
dns1_force="172.16.0.1"
dns2_force="-"
dns3_force="-"
