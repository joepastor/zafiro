#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
from funciones import curs
from funciones import *
import string
import os
import time
from time import strftime,localtime

print "###################################################"
print "#		COMIENZO DEL ZAFIRO		 #"
print "###################################################"

ejecutar=1
hora=strftime("%H",localtime())

# idtmp - Este es el ID de clase que asignara a cada clase de los clientes.
# Cada clase y handler que se genere para el cliente comenzara con este codigo
# Arranca en 0 porque las clases eran 93434 y al ser tan largas no las permite
# Por lo tanto decidimos arrancar con un contador en 0
idtmp=0


while True:
	try:

                os.system("bash %s/instalador/configurar.sh\n" % (zafirodir))
                # SI LA HORA ES DISTINTA EJECUTAR ####################################################################################
                if hora!=strftime("%H",localtime()):
                        ejecutar=1

	        hora=strftime("%H",localtime())
	        minutos=strftime("%M",localtime())
	        dia=time.localtime()[6]+1

	        #Configuracion de ancho de banda asignado para graficos ##############################################################
		#curs.execute("""select sum(canalessub) as subida, sum(canalesbaj) as bajada from canales inner join planes on canalesid=planescan inner join clientes on clientespla=planesid where canalesest=0 and planeshor=%s and planesdia=%s"""%(hora,dia))
		#bwasignado=curs.fetchall()
	        #for subida,bajada in bwasignado:
	        #        f=open("%sbwasignado.txt"%directorio,"w")
	        #        bajada=str(bajada)
	        #        f.write(bajada)
	        #        f.close()

                # APAGAR SERVIDOR ####################################################################################################
		reiniciarservidor=0
	        inp=open("%s/apagarservidor" % directorio,"r")
		for linea in inp.readlines():
			apagarservidor=int(linea)
		inp.close()
		if apagarservidor==1:
			os.system("echo 0 > %s/apagarservidor\n" % directorio)
			os.system("halt\n")

                # REINICIAR SERVIDOR #################################################################################################
		reiniciarservidor=0
	        inp=open("%s/reiniciarservidor" % directorio,"r")
		for linea in inp.readlines():
			reiniciarservidor=int(linea)
		inp.close()
		if reiniciarservidor==1:
			os.system("echo 0 > %s/reiniciarservidor\n" % directorio)
			os.system("reboot\n")

                # EJECUTAR ##########################################################################################################
		if ejecutar==0:
		        inp=open("%s/ejecutar" % directorio,"r")
			for linea in inp.readlines():
				ejecutar=int(linea)
			inp.close()

		inp=open("%s/liberado" % directorio,"r")
	        for linea in inp.readlines():
			liberado=int(linea)
	        inp.close()

	        ####################### SI SE EJECUTA EL SERVIDOR #########################
	        if ejecutar==1:
                        os.system("echo 0 > %s/ejecutar\n" % directorio)
			print "Ejecutando el dia %s - Hora %s Minutos %s" % (dia,hora,minutos)
			ejecutar=0

			idtmp=2 # Seteamos nuevamente el valor del ID temporal en 0

	                sasa=""
	                # Firewall basico
	                iptables=""
	                iptables+="iptables -F\n"
	                iptables+="iptables -t nat -F\n"
	                iptables+="iptables -t mangle -F\n"
			iptables+=fncfwpersonalizado()
			iptables+=fncfiltros()
			iptables+=fncfirewall()

                        # ARMADO DEL ARCHIVO MRTG.CONF
	                mrtg=""
	                mrtg+="BodyTag[_]:<BODY bgcolor=#333333 text=#cccccc>\n"
	                mrtg+="Background[_]:#333333\n"
	                mrtg+="WorkDir: %s/www/mrtg\nWriteExpires: Yes\nTitle[^]: Traffic Analysis for\nOptions[_]: growright\n\n" % (zafirodir)

	                mrtg+="Target[eth0]: `/usr/bin/mrtg-ip-acct eth0`\n"
	                mrtg+="MaxBytes1[eth0]: 1024000\n"
	                mrtg+="MaxBytes2[eth0]: 512000\n"
	                mrtg+="Title[eth0]: Analisis del trafico total en eth0\n"
	                mrtg+="YLegend[eth0]: Trafico\n"
	                mrtg+="PageTop[eth0]: <H1>Analisis del trafico total de la interface eth0</H1>\n"
	                mrtg+="XSize[eth0]:580\n"
	                mrtg+="YSize[eth0]:100\n"
	                mrtg+="Language: spanish\n"
	                mrtg+="Options[_]: growright, bits\n"

	                #$mrtg+="Colours[eth0]: GREEN#00ff00,RED#ff0000,BLACK#000000,WHITE#ffffff\n";
	                mrtg+="\n"
	                mrtg+="Target[eth1]: `/usr/bin/mrtg-ip-acct eth1`\n"
	                mrtg+="MaxBytes1[eth1]: 1024000\n"
	                mrtg+="MaxBytes2[eth1]: 512000\n"
	                mrtg+="Title[eth1]: Analisis del trafico total en eth1\n"
	                mrtg+="YLegend[eth1]: Trafico\n"
	                mrtg+="PageTop[eth1]: <H1>Analisis del trafico total de la interface eth1</H1>\n"
	                mrtg+="XSize[eth1]:580\n"
	                mrtg+="YSize[eth1]:100\n"
	                mrtg+="Language: spanish\n\n"
	                mrtg+="Options[_]: growright, bits\n\n"

	                mrtg+="\n"
	                mrtg+="Target[tun0]: `/usr/bin/mrtg-ip-acct tun0`\n"
	                mrtg+="MaxBytes1[tun0]: 1024000\n"
	                mrtg+="MaxBytes2[tun0]: 512000\n"
	                mrtg+="Title[tun0]: Analisis del trafico total en tun0\n"
	                mrtg+="YLegend[tun0]: Trafico\n"
	                mrtg+="PageTop[tun0]: <H1>Analisis del trafico total de la interface tun0</H1>\n"
	                mrtg+="XSize[tun0]:580\n"
	                mrtg+="YSize[tun0]:100\n"
	                mrtg+="Language: spanish\n\n"
	                mrtg+="Options[_]: growright, bits\n\n"

			mrtg+="\n"
			mrtg+="Target[www]: `%s/www.sh`\n" % scriptsdir
			mrtg+="MaxBytes1[www]: 1024000\n"
			mrtg+="MaxBytes2[www]: 512000\n"
			mrtg+="Title[www]: Analisis del trafico WWW\n"
			mrtg+="YLegend[www]: Trafico\n"
			#mrtg+="PageTop[www]: ZAFIRO<br><hr><br>\n"

			mrtg+="\n"
			mrtg+="Target[smtp]: `%s/smtp.sh`\n" % scriptsdir
			mrtg+="MaxBytes1[smtp]: 1024000\n"
			mrtg+="MaxBytes2[smtp]: 512000\n"
			mrtg+="Title[smtp]: Analisis del trafico SMTP\n"
			mrtg+="YLegend[smtp]: Trafico\n"
			#mrtg+="PageTop[smtp]: ZAFIRO<br><hr><br>\n"

			mrtg+="\n"
			mrtg+="Target[pop]: `%s/pop.sh`\n" % scriptsdir
			mrtg+="MaxBytes1[pop]: 1024000\n"
			mrtg+="MaxBytes2[pop]: 512000\n"
			mrtg+="Title[pop]: Analisis del trafico POP\n"
			mrtg+="YLegend[pop]: Trafico\n"
			#mrtg+="PageTop[pop]: ZAFIRO<br><hr><br>\n"

			mrtg+="\n"
			mrtg+="Target[ftp]: `%s/ftp.sh`\n" % scriptsdir
			mrtg+="MaxBytes1[ftp]: 1024000\n"
			mrtg+="MaxBytes2[ftp]: 512000\n"
			mrtg+="Title[ftp]: Analisis del trafico ftp\n"
			mrtg+="YLegend[ftp]: Trafico\n"
			#mrtg+="PageTop[ftp]: ZAFIRO<br><hr><br>\n"

	                # Armado del archivo dhcpd.conf
	                dhcpd=""
	                dhcpd+="default-lease-time 86400;\n"
	                dhcpd+="max-lease-time 86400;\n"

			dnss=""
	                iptables+="# FIREWALL PARA DNSS\n"
	                iptables+="#===========================================================================\n"
			if dns1:
				dnss=dns1
				iptables+="iptables -t nat -A POSTROUTING -o %s -d %s -p udp --dport 53 -j MASQUERADE\n" % (devpub,dns1)
				iptables+="iptables -A FORWARD -i %s -d %s -p udp --dport 53 -j ACCEPT\n" % (devpri,dns1)
			if dns2:
				dnss+=",%s" % dns2
				iptables+="iptables -t nat -A POSTROUTING -o %s -d %s -p udp --dport 53 -j MASQUERADE\n" % (devpub,dns2)
				iptables+="iptables -A FORWARD -i %s -d %s -p udp --dport 53 -j ACCEPT\n" % (devpri,dns2)
			if dns3:
				dnss+=",%s" % dns3
				iptables+="iptables -t nat -A POSTROUTING -o %s -d %s -p udp --dport 53 -j MASQUERADE\n" % (devpub,dns3)
				iptables+="iptables -A FORWARD -i %s -d %s -p udp --dport 53 -j ACCEPT\n" % (devpri,dns3)
			print dnss
	                iptables+="# FIN de FIREWALL PARA DNSS\n"
	                iptables+="#===========================================================================\n"

	                #dhcpd+="option domain-name-servers %s,%s,%s;\n"  % (dns1,dns2,dns3)
	                dhcpd+="option domain-name-servers %s;\n"  % (dnss)
	                dhcpd+="option domain-name \"zafiro\";\n"
	                dhcpd+="subnet %s0 netmask 255.255.255.0 {\n" % ipprefijopri #/joe, Si aca no se abre la mascara a 16 bits no asigna ip en otras redes, si la red es de 24 hay que cerrar aca la mascara a 24 porque si no tira que no esta dentro de la red, OJO
	                dhcpd+="\trange %s251 %s254;\n" % (ipprefijopri,ipprefijopri)
	                dhcpd+="}";
	
	                # Armado del archivo dhcp 
	                etcdhcp="INTERFACES=\"%s\"\n" % devpri
	                f=open("%s/dhcp" % directorio,"w")
	                f.write(etcdhcp)
	                f.close()

	                # NATeo de puertos
	                curs.execute("""select forwardeospuesrc,forwardeospuedst,forwardeosipdst,forwardeosipsrc from forwardeos where forwardeosest=0""")
	                nat=curs.fetchall()
	                nateos=""
	                for forwardeospuesrc,forwardeospuedst,forwardeosipdst,forwardeosipsrc in nat:
	                        if forwardeosipsrc=='0.0.0.0':
	                                forwardeosipsrc+='/0'
	                        nateos+="iptables -t nat -A PREROUTING -i %s -p tcp -s %s --dport %s -j DNAT --to %s:%s\n" % (devpub,forwardeosipsrc,forwardeospuesrc,forwardeosipdst,forwardeospuedst)

	                # Configuracion de pap para conectarse por adsl (no se si funciona)
	                #curs.execute("""select configuracionadsusu,configuracionadspas from configuracion""")
	                #pap=curs.fetchall()
	                #papfile=""
	                #for configuracionadsusu,configuracionadspas in pap:
	                #        papfile="\"%s\"	*	\"%s\"" % (configuracionadsusu,configuracionadspas)
	                #f=open("%s/pap-secrets" % directorio,"w")
	                #f.write(papfile)
	                #f.close()
	                        
	                # Configuracion de limitacion de clientes
	                iptables+="#Definicion de las colas basicas\n"
	                iptables+="#===========================================================================\n"
	                iptables+="\n\n"
			iptables+="tc qdisc del dev eth0 root\n"
			iptables+="tc qdisc add dev eth0 root handle 1: htb\n"
			iptables+="tc qdisc del dev eth1 root\n"
			iptables+="tc qdisc add dev eth1 root handle 1: htb\n"

                        # Crea la configuracion de limitacion de cada cliente
	                ipfijastr=""
	                curs.execute("""select clientesid,clientesip,clientesmac,clientespla,clientesnom,ipsfijasip,ipsfijasint,ipsfijasest,clientespro,clientessal,clientesdes from clientes left join ipsfijas on ipsfijas.ipsfijascli=clientes.clientesid where clientes.clientesest=0 order by clientesnom""")
	                clientes=curs.fetchall()
	                hosts="127.0.0.1        localhost\n"
	                for clientesid,clientesip,clientesmac,clientespla,clientesnom,ipsfijasip,ipsfijasint,ipsfijasest,clientespro,clientessal,clientesdes in clientes:
				iptables+="\n\n"
	                        iptables+="echo Cliente - %s	IP:%s    ID: %s\n" % (clientesnom,clientesip,clientesid)
	                        iptables+="#------------------------------------------------------------------------------\n"
	                        iptables+="#Cliente - %s	IP:%s    ID: %s\n" % (clientesnom,clientesip,clientesid)
	                        iptables+="#------------------------------------------------------------------------------\n"
	                        plan=clientespla
	                        # Define el numero de ip, gateway e ip publica del cliente. Si hay oclutamiento! ojo al piojo!
	                        ip="%s%s" % (ipprefijopri,clientesip)
	
	                        # Si el cliente tiene una ip publica asignada crea el alias de la placa
	                        if ipsfijasip:
	                                cuak=ipsfijasint[3:]
	                                ipfijastr+="ifconfig %s:%s %s\n" % (devenm,cuak,ipsfijasip)

	                        # Selecciona el canal que debe utilizar el cliente
	                        curs.execute("""select planescan,canalessub,canalesbaj,canalesnom from planes inner join canales on planes.planescan=canales.canalesid where planesid=%d and planesdia=%s and planeshor=%s"""%(plan,dia,hora))
	                        marca=curs.fetchall()
	                        i=0
	                        flagnodebesalir=1

	                        # Crea las reglas de analisis de trafico por ip
	                        iptables+="iptables -X %s_i\n" % ip
	                        iptables+="iptables -X %s_o\n" % ip
	                        iptables+="iptables -N %s_i\n" % ip
	                        iptables+="iptables -N %s_o\n" % ip
	                        iptables+="iptables -F %s_i\n" % ip
	                        iptables+="iptables -F %s_o\n" % ip
	                        iptables+="iptables -A FORWARD -s %s -j %s_o\n" % (ip,ip)
	                        iptables+="iptables -A FORWARD -d %s -j %s_i\n" % (ip,ip)

	                        for planescan, canalessub,canalesbaj,canalesnom in marca:
	                                flagnodebesalir=0
	                                i=i+1
	                                if canalesbaj != 0:
	                                        #servicio=planescan
	                                        mark="%s%s" % (planescan,clientesip)
	                                        servicio=mark
	                                        #skbytes=canalessub
	                                        #bkbytes=canalesbaj
	                                        #skbits=skbytes*8
	                                        #bkbits=bkbytes*8
						skbits=canalessub
	                                        bkbits=canalesbaj
	                                        if clientessal==1:
	                                                #	Verifica mac address y permite el forward
							iptables+="iptables -A FORWARD -s %s -m mac --mac-source %s -j ACCEPT\n" % (ip,clientesmac)
							iptables+="iptables -A FORWARD -d %s -j ACCEPT\n" % ip
	
	                        # Agrega al cliente en el archivo hosts
	                        hosts+="%s      %s\n" % (ip,clientesnom.replace(" ","_"))

	                        # Crea su enrutamiento a traves del canal y plan elgidos
				if liberado==0:
					idtmp+=1

					# Creacion de las clases PADRE del cliente (Ej.: 1:1031)
					clasebajada="%s1" % clientesid
					clasesubida="%s2" % clientesid

					# Identificadores de clases unicas para este cliente
					DC1=format(idtmp,'x') # Download Class 1
					idtmp+=1
					DC2=format(idtmp,'x') # Download Class 2
					idtmp+=1					
					DC3=format(idtmp,'x') # Download Class 3
					idtmp+=1
					DC4=format(idtmp,'x') # Download Class 4
					idtmp+=1
					DC5=format(idtmp,'x') # Download Class 5
					idtmp+=1
					DC6=format(idtmp,'x') # Download Class 6
					idtmp+=1
					DC7=format(idtmp,'x') # Download Class 7
					idtmp+=1
					DC8=format(idtmp,'x') # Download Class 8
					idtmp+=1
					DC9=format(idtmp,'x') # Download Class 9
					idtmp+=1

					UC1=format(idtmp,'x') # Upload Class 1
					idtmp+=1
					UC2=format(idtmp,'x') # Upload Class 2
					idtmp+=1
					UC3=format(idtmp,'x') # Upload Class 3
					idtmp+=1
					UC4=format(idtmp,'x') # Upload Class 4
					idtmp+=1
					UC5=format(idtmp,'x') # Upload Class 5
					idtmp+=1
					UC6=format(idtmp,'x') # Upload Class 6
					idtmp+=1
					UC7=format(idtmp,'x') # Upload Class 7
					idtmp+=1
					UC8=format(idtmp,'x') # Upload Class 8
					idtmp+=1
					UC9=format(idtmp,'x') # Upload Class 9
				

					# Handlers: Estos son los codigos que luego llamara el IPTABLES para marcar los paquetes
					DH1="%s20" % clientesid # Download Handler 1
					DH2="%s21" % clientesid # Download Handler 2
					DH3="%s22" % clientesid # Download Handler 3
					DH4="%s23" % clientesid # Download Handler 4
					DH5="%s24" % clientesid # Download Handler 5
					DH6="%s25" % clientesid # Download Handler 6
					DH7="%s26" % clientesid # Download Handler 7
					DH8="%s27" % clientesid # Download Handler 8
					DH9="%s28" % clientesid # Download Handler 9

					UH1="%s30" % clientesid # Upload Handler 1
					UH2="%s31" % clientesid # Upload Handler 2
					UH3="%s32" % clientesid # Upload Handler 3
					UH4="%s33" % clientesid # Upload Handler 4
					UH5="%s34" % clientesid # Upload Handler 5
					UH6="%s35" % clientesid # Upload Handler 6
					UH7="%s36" % clientesid # Upload Handler 7
					UH8="%s37" % clientesid # Upload Handler 8
					UH9="%s38" % clientesid # Upload Handler 9


					# 
					pb1=(40*bkbits)/100
					pb2=(40*bkbits)/100
					pb3=100

					ps1=(40*skbits)/100
					ps2=(40*skbits)/100
					ps3=100 # Menos de 80kbits tira error de HTB Quantum

					
					# El ceil es la cantidad de ancho de banda extra que puede utilizar la clase cuando las otras no estan utilizandose
					# Hay que tener cuidado en no poner el mismo ceil para todo, porque si no sería un bardo
					# Priorizacion de puertos
					# 10000:30000,22,445,139,80,443
					# OTROS
					# 25,143,110

					iptables+="\n# CLASES DE BAJADA\n"
					iptables+="tc class add dev %s parent 1: classid 1:%s htb rate %skbit ceil %skbit burst 15k\n" % (devpri,clasebajada,bkbits,bkbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 0\n" % (devpri,clasebajada,DC1,pb1,bkbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 1\n" % (devpri,clasebajada,DC2,pb1,bkbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 2\n" % (devpri,clasebajada,DC3,pb1,bkbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 3\n" % (devpri,clasebajada,DC4,pb2,bkbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 4\n" % (devpri,clasebajada,DC5,pb2,bkbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 5\n" % (devpri,clasebajada,DC6,pb2,bkbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 6\n" % (devpri,clasebajada,DC7,pb3,bkbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 7\n" % (devpri,clasebajada,DC8,pb3,bkbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 8\n" % (devpri,clasebajada,DC9,pb3,bkbits)

					iptables+="\n# HANDLERS DE BAJADA\n"
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devpri,DH1,DC1)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devpri,DH2,DC2)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devpri,DH3,DC3)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devpri,DH4,DC4)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devpri,DH5,DC5)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devpri,DH6,DC6)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devpri,DH7,DC7)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devpri,DH8,DC8)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devpri,DH9,DC9)

					iptables+="\n# CLASES DE SUBIDA\n"
					iptables+="tc class add dev %s parent 1: classid 1:%s htb rate %skbit ceil %skbit burst 15k\n" % (devenm,clasesubida,skbits,skbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 0\n" % (devenm,clasesubida,UC1,ps1,skbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 1\n" % (devenm,clasesubida,UC2,ps1,skbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 2\n" % (devenm,clasesubida,UC3,ps1,skbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 3\n" % (devenm,clasesubida,UC4,ps2,skbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 4\n" % (devenm,clasesubida,UC5,ps2,skbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 5\n" % (devenm,clasesubida,UC6,ps2,skbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 6\n" % (devenm,clasesubida,UC7,ps3,skbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 7\n" % (devenm,clasesubida,UC8,ps3,skbits)
					iptables+="tc class add dev %s parent 1:%s classid 1:%s htb rate %skbit ceil %skbit burst 15k prio 8\n" % (devenm,clasesubida,UC9,ps3,skbits)

					iptables+="\n# HANDLERS DE SUBIDA\n"
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devenm,UH1,UC1)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devenm,UH2,UC2)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devenm,UH3,UC3)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devenm,UH4,UC4)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devenm,UH5,UC5)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devenm,UH6,UC6)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devenm,UH7,UC7)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devenm,UH8,UC8)
					iptables+="tc filter add dev %s protocol ip parent 1: handle %s fw classid 1:%s\n" % (devenm,UH9,UC9)
					iptables+="\n"
					iptables+="\n# MARCAJE DE PAQUETES\n"
					iptables+="\n"
					# SACADO VERLO LUEGO iptables+="iptables -t mangle -A FORWARD -j MARK -i %s -s %s -p ICMP --set-mark %s\n" % (devpri,ip,markh4)
					# SACADO VERLO LUEGO iptables+="iptables -t mangle -A FORWARD -j MARK -i %s -d %s -p ICMP --set-mark %s\n" % (devenm,ip,markh1)

					#iptables+="tc filter add dev %s protocol ip parent 1:%s prio 1 u32 match ip dst %s flowid 1:%s\n" % (devpri,clasebajada,ip,DC1)
					#iptables+="tc filter add dev %s protocol ip parent 1:%s prio 1 u32 match ip src %s flowid 1:%s\n" % (devenm,clasesubida,ip,UC1)

					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p udp --sport 10000:30000 -j MARK --set-mark %s\n" % (devpri,ip,DH1)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p udp --sport 10000:30000 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p udp --dport 10000:30000 -j MARK --set-mark %s\n" % (devpri,ip,UH1)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p udp --dport 10000:30000 -j RETURN\n" % (devpri,ip)

					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p udp --sport 5060:5082 -j MARK --set-mark %s\n" % (devpri,ip,DH1)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p udp --sport 5060:5082 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p udp --dport 5060:5082 -j MARK --set-mark %s\n" % (devpri,ip,UH1)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p udp --dport 5060:5082 -j RETURN\n" % (devpri,ip)

					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p udp --sport 53 -j MARK --set-mark %s\n" % (devpri,ip,DH2)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p udp --sport 53 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p udp --dport 53 -j MARK --set-mark %s\n" % (devpri,ip,UH2)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p udp --dport 53 -j RETURN\n" % (devpri,ip)

					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 22 -j MARK --set-mark %s\n" % (devpri,ip,DH3)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 22 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 22 -j MARK --set-mark %s\n" % (devpri,ip,UH3)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 22 -j RETURN\n" % (devpri,ip)

					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 443 -j MARK --set-mark %s\n" % (devpri,ip,DH4)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 443 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 443 -j MARK --set-mark %s\n" % (devpri,ip,UH4)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 443 -j RETURN\n" % (devpri,ip)

					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 80 -j MARK --set-mark %s\n" % (devpri,ip,DH5)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 80 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 80 -j MARK --set-mark %s\n" % (devpri,ip,UH5)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 80 -j RETURN\n" % (devpri,ip)
					
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 25 -j MARK --set-mark %s\n" % (devpri,ip,DH7)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 25 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 25 -j MARK --set-mark %s\n" % (devpri,ip,UH7)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 25 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 110 -j MARK --set-mark %s\n" % (devpri,ip,DH7)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 110 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 110 -j MARK --set-mark %s\n" % (devpri,ip,UH7)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 110 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 143 -j MARK --set-mark %s\n" % (devpri,ip,DH7)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 143 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 143 -j MARK --set-mark %s\n" % (devpri,ip,UH7)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 143 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 21 -j MARK --set-mark %s\n" % (devpri,ip,DH8)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -p tcp --sport 21 -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 21 -j MARK --set-mark %s\n" % (devpri,ip,UH8)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -p tcp --dport 21 -j RETURN\n" % (devpri,ip)

					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -j MARK --set-mark %s\n" % (devpri,ip,DH8)
					iptables+="iptables -t mangle -A FORWARD -o %s -d %s -j RETURN\n" % (devpri,ip)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -j MARK --set-mark %s\n" % (devpri,ip,UH8)
					iptables+="iptables -t mangle -A FORWARD -i %s -s %s -j RETURN\n" % (devpri,ip)
					
					#iptables+="\n"


	                                if flagnodebesalir==0:
	                                        #print "Cliente: %s \t(%s) - Canal: %s - Marca de servicio: %s - Velocidad de Subida: %s KBs - Velocidad de Bajada: %s KBs" % (clientesnom,ip,canalesnom,mark,skbytes,bkbytes)
	                                        print "Cliente: %s \t(%s) - Canal: %s - Marca de servicio: %s - Velocidad de Subida: %s Kbits - Velocidad de Bajada: %s Kbits" % (clientesnom,ip,canalesnom,mark,skbits,bkbits)
	                                else:
	                                        print "Cliente: %s (%s) - SIN SALIDA ACTUAL" % (clientesnom,ip)
	                        else:
	                                if flagnodebesalir==0:
	                                        print "Cliente: %s" % clientesnom
	                                else:
	                                        print "Cliente: %s - SIN SALIDA ACTUAL" % (clientesnom)
	
	                        #Enrutamiento al proxy
				if clientespro:
	                                iptables+="iptables -t nat -A PREROUTING -i %s -p tcp --dport 80 -s %s -j REDIRECT --to-port 3128\n" % (devpri,ip)
	
				#Enruta la ip publica
	                        if ipsfijasip and ipsfijasest==0:
	                                iptables+="iptables -t nat -A POSTROUTING -s %s -j SNAT --to %s\n" % (ip,ipsfijasip)
	                                iptables+="iptables -t nat -A PREROUTING -d %s -j DNAT --to %s\n" % (ipsfijasip,ip)
	                        else:
	                                iptables+="iptables -t nat -A POSTROUTING -s %s -o %s -j MASQUERADE\n" % (ip,devenm)
	
	                        #	Agrega el bloque para asignacion de IP por dhcp
	                        dhcpd+="\nhost %s {\n" % clientesid
	                        dhcpd+="\thardware ethernet %s;\n" % clientesmac
	                        dhcpd+="\tfixed-address %s;\n" % ip
	                        dhcpd+="\toption routers %s;\n" % gwcliente
	                        dhcpd+="\toption subnet-mask 255.255.255.0;\n"
	                        dhcpd+="}\n"
				
				script=""
				script="""
				#!/bin/bash
				statname="%s"
				uptime=`uptime | awk '{print $3}'`" dias, "`uptime | awk '{print $5}'`" horas"
				statin=`/sbin/iptables -L -v -x -n| grep "%s_i"| grep 0.0.0.0 | awk '{print $2}'`
				statout=`/sbin/iptables -L -v -x -n| grep "%s_o "| grep 0.0.0.0 | awk '{print $2}'`
				echo $statin
				echo $statout
				echo $uptime
				echo $statname
				""" % (ip,ip,ip)
				f=open("%s/%s.sh" % (scriptsdir,ip),"w")
				f.write(script)
				f.close()

				mrtg+="\n"
				mrtg+="Target[%s]: `%s/%s.sh`\n" % (ip,scriptsdir,ip)
				mrtg+="MaxBytes1[%s]: 1024000\n" % ip
				mrtg+="MaxBytes2[%s]: 512000\n" % ip
				mrtg+="Title[%s]: Analisis del trafico total en %s\n" % (ip,ip)
				mrtg+="YLegend[%s]: Trafico\n" % ip
				#mrtg+="PageTop[%s]: ZAFIRO<br><hr><br>\n" % ip
				mrtg+="Options[_]: growright, bits\n"

	                        #Agrega la ip al SASA
	                        #sasa+="L:%s:%s\n" % (ip,clientesnom)
	
	                #######################################################  Armado de firewall para VPN  #######################################################
			for f in os.listdir(openvpndir):
                                if f !=".svn":
                                    archivo=open("%s/%s" % (openvpndir,f))
                                    for q in archivo.readlines():
                                            p=q.split(" ")
                                            #JOE aca es importante el tema de los puertos, si no funciona la VPN verificar si los puertos correctos estan abiertos
                                            if p[0]=="lport":
                                                    iptables+="iptables -A INPUT -p udp --dport %s -j ACCEPT\n" % p[1][0:-1]
                                                    iptables+="iptables -A OUTPUT -p udp --sport %s -j ACCEPT\n" % p[1][0:-1]
                                            #if p[0]=="rport":
                                            #	iptables+="iptables -A INPUT -p udp --sport %s -j ACCEPT\n" % p[1][0:-1]
                                            #	iptables+="iptables -A OUTPUT -p udp --dport %s -j ACCEPT\n" % p[1][0:-1]

	                iptables+="iptables -t mangle -A PREROUTING -p tcp -j RETURN\n"
		        iptables+="iptables -P INPUT DROP\n"
		        iptables+="iptables -P OUTPUT DROP\n"
		        iptables+="iptables -P FORWARD DROP\n"

	                ################################################# Escritura de archivos ##############################################################
	                sasa+="E:/usr/sasacct-1.0.2/lang/\n"
	                sasa+="U:en_UK\n"
	                iptables+=ipfijastr
	                iptables+=nateos
	                #iptables+=ping
	                f=open("%s/mrtg.cfg"%directorio,"w")
	                f.write(mrtg)
	                f.close()
	
	                f=open("%s/dhcpd.conf"%directorio,"w")
	                f.write(dhcpd)
	                f.close()
	                f=open("%s/iptables.sh"%directorio,"w")
	                f.write(iptables)
	                f.close()
	                f=open("%s/hosts"%directorio,"w")
	                f.write(hosts)
	                f.close()
	                f=open("%s/sasacct.conf"%directorio,"w")
	                f.write(sasa)
	                f.close()

                        # Ejecucion ##############################################################
                        print "EJECUTANDO ZAFIRO"
                        print "Ejecutando Firewall"
			os.system("bash %s/iptables.sh" % (directorio))

                # Acciones
                print "Ejecutando Acciones"
                #os.system("bash %s/acciones.sh" % (directorio))
                os.system("chmod +x %s*" % (scriptsdir))
                os.system("cat %s/icmp_echo_ignore_all > /proc/sys/net/ipv4/icmp_echo_ignore_all\n" % (directorio))

                # Copia la configuracion al MRTG y lo ejecuta
                print "Ejecutando Graficos"
                os.system("cat %s/mrtg.cfg > /etc/mrtg.cfg\n" % (directorio))
                os.system("env LANG=C mrtg\n")
                
                # Salida
                print "Salida"
                os.system("cat  %s/ip_forward > /proc/sys/net/ipv4/ip_forward\n" % (directorio))

                # Estado de placas
                print "Estado de placas"
                os.system("ifconfig > %s/placas.txt\n" % directorio)

                # REINICIAR DHCP #################################################################################################
		reiniciardhcp=0
	        inp=open("%s/reiniciardhcp" % directorio,"r")
		for linea in inp.readlines():
			reiniciardhcp=int(linea)
		inp.close()
		if reiniciardhcp==1:
			print "REINICIANDO DHCP"
                        os.system("echo 0 > %s/reiniciardhcp\n" % directorio)
			os.system("/etc/init.d/isc-dhcp-server restart\n")

                # REINICIAR NETWORK #################################################################################################
		reiniciarred=0
	        inp=open("%s/reiniciarred" % directorio,"r")
		for linea in inp.readlines():
			reiniciarred=int(linea)
		inp.close()
		if reiniciarred==1:
			print "Reiniciando Servicio de Red"
			os.system("/etc/init.d/networking restart\n")
			os.system("echo 0 > %s/reiniciarred\n" % directorio)

		# REINICIAR VPN #####################################################################################################
		reiniciarvpn=0
	        inp=open("%s/reiniciarvpn" % directorio,"r")
		for linea in inp.readlines():
			reiniciarvpn=int(linea)
		inp.close()
		if reiniciarvpn==1:
			print "Reiniciando VPN"
                        os.system("echo 0 > %s/reiniciarvpn\n" % directorio)
			os.system("/etc/init.d/openvpn restart\n")

                # FIN DE EJECUCION ###############################################################################################
                print "FIN EJECUCION"

                # TIEMPO DE ESPERA ANTES DE VOLVER A EJECUTAR ####################################################################
		time.sleep(5)
	except ValueError,NameError:
		print ValueError,NameError
