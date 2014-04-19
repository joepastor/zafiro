#!/bin/sh
rutabw=/zafiro/archivos
rutadbs=/etc/rrds
rutaimg=/zafiro/www/rrdtool
widthg=600
heightg=300
widthc=600
heightc=50
fecha=`date +"%c %Z"`
lblmemlibre="Libre"
lblmemusada="Utilizada"
lblhdlibre="Libre"
lblhdusado="Utilizado"
lblprocesador="CPU"
lblprocesadorcom="Uso del procesador"
color1="#8080FF"
color2="#FF0000"

colorp2p="#FF0000"
colormsn="#0000FF"
colorwww="#00ff00"
colorpop="#CCCCCC"
colordns="#ff00CC"
colorftp="#00CCCC"
colorresto="#fff000"

#================================================================================
#				MEMORIA						#
#================================================================================
escritorio=$(free -m |grep Mem | awk '{print $3}')
#echo "Memoria RAM Usada" $escritorio
exterior=$(free -m|grep Mem | awk '{print $2}')
#echo "Memoria RAM Total" $exterior

/usr/bin/rrdtool update $rutadbs/memoria.rrd N:$escritorio:$exterior
#echo /usr/bin/rrdtool update $rutadbs/memoria.rrd N:$escritorio:$exterior

rrd=$rutadbs/memoria.rrd
last=`rrdtool last $rrd`
file0=$rutaimg/memhor.png
file1=$rutaimg/memdia.png
file2=$rutaimg/memsem.png
file3=$rutaimg/memmes.png
file4=$rutaimg/memano.png

# 1hora
/usr/bin/rrdtool graph $file0 --imgformat PNG --start -1hour --end $last \
--width $widthc --height $heightc DEF:ext_c=$rrd:exterior:AVERAGE \
DEF:int_c=$rrd:escritorio:AVERAGE \
AREA:ext_c$color1:$lblmemlibre \
AREA:int_c$color2:$lblmemusada \

# 1dia
/usr/bin/rrdtool graph $file1 --imgformat PNG --start -1day --end $last \
--width $widthg --height $heightg --title "Uso de Memoria RAM en MB - Dia" DEF:ext_c=$rrd:exterior:AVERAGE \
DEF:int_c=$rrd:escritorio:AVERAGE COMMENT:" Uso de Memoria RAM en MB - Dia\\n" \
COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
COMMENT:" " GPRINT:ext_c:MIN:$lblmemlibre"   %5.2lf" \
GPRINT:ext_c:MAX:" %5.2lf MB" GPRINT:ext_c:AVERAGE:"%5.2lf MB" \
GPRINT:ext_c:LAST:" %5.2lf MB\\n" COMMENT:" " \
GPRINT:int_c:MIN:$lblmemusada"   %5.2lf MB" \
GPRINT:int_c:MAX:" %5.2lf MB" GPRINT:int_c:AVERAGE:"%5.2lf MB" \
GPRINT:int_c:LAST:" %5.2lf MB\\n" COMMENT:"\\s" AREA:ext_c$color1:$lblmemlibre \
AREA:int_c$color2:$lblmemusada 

#sem
/usr/bin/rrdtool graph $file2 --imgformat PNG --start -1week --end $last \
--width $widthg --height $heightg --title "Uso de Memoria RAM en MB - Semana" DEF:ext_c=$rrd:exterior:AVERAGE \
DEF:int_c=$rrd:escritorio:AVERAGE COMMENT:" Uso de Memoria RAM en MB - Semana\\n" \
COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
COMMENT:" " GPRINT:ext_c:MIN:$lblmemlibre" %5.2lf MB" \
GPRINT:ext_c:MAX:" %5.2lf MB" GPRINT:ext_c:AVERAGE:" %5.2lf MB" \
GPRINT:ext_c:LAST:" %5.2lf MB\\n" COMMENT:" " \
GPRINT:int_c:MIN:$lblmemusada" %5.2lf MB" \
GPRINT:int_c:MAX:" %5.2lf MB" GPRINT:int_c:AVERAGE:" %5.2lf MB" \
GPRINT:int_c:LAST:" %5.2lf MB\\n" COMMENT:"\\s" AREA:ext_c$color1:$lblmemlibre \
AREA:int_c$color2:$lblmemusada 

#mes
/usr/bin/rrdtool graph $file3 --imgformat PNG --start -1month --end $last \
--width $widthg --height $heightg --title "Uso de Memoria RAM en MB - Mes" DEF:ext_c=$rrd:exterior:AVERAGE \
DEF:int_c=$rrd:escritorio:AVERAGE COMMENT:" Uso de Memoria RAM en MB - Mes\\n" \
COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
COMMENT:" " GPRINT:ext_c:MIN:$lblmemlibre" %5.2lf C" \
GPRINT:ext_c:MAX:" %5.2lf C" GPRINT:ext_c:AVERAGE:" %5.2lf C" \
GPRINT:ext_c:LAST:" %5.2lf C\\n" COMMENT:" " \
GPRINT:int_c:MIN:$lblmemusada" %5.2lf MB" \
GPRINT:int_c:MAX:" %5.2lf MB" GPRINT:int_c:AVERAGE:" %5.2lf MB" \
GPRINT:int_c:LAST:" %5.2lf MB\\n" COMMENT:"\\s" AREA:ext_c$color1:$lblmemlibre \
AREA:int_c$color2:$lblmemusada 

#ano
/usr/bin/rrdtool graph $file4 --imgformat PNG --start -1year --end $last \
--width $widthg --height $heightg --title "Uso de Memoria RAM en MB - Año" DEF:ext_c=$rrd:exterior:AVERAGE \
DEF:int_c=$rrd:escritorio:AVERAGE COMMENT:" Uso de Memoria RAM en MB - Año\\n" \
COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
COMMENT:" " GPRINT:ext_c:MIN:$lblmemlibre" %5.2lf C" \
GPRINT:ext_c:MAX:" %5.2lf C" GPRINT:ext_c:AVERAGE:" %5.2lf C" \
GPRINT:ext_c:LAST:" %5.2lf C\\n" COMMENT:" " \
GPRINT:int_c:MIN:$lblmemusada" %5.2lf MB" \
GPRINT:int_c:MAX:" %5.2lf MB" GPRINT:int_c:AVERAGE:" %5.2lf MB" \
GPRINT:int_c:LAST:" %5.2lf MB\\n" COMMENT:"\\s" AREA:ext_c$color1:$lblmemlibre \
AREA:int_c$color2:$lblmemusada 


#================================================================================
#				DISCO RIGIDO					#
#================================================================================
disco=$(df -m| grep hda1 | awk '{print $2}')
total=$(df -m| grep hda1 | awk '{print $3}')
#echo "Uso del disco rígido" $disco
#echo "Total de capacidad del disco rígido" $total
/usr/bin/rrdtool update $rutadbs/disco.rrd N:$disco:$total
#echo /usr/bin/rrdtool update $rutadbs/disco.rrd N:$disco:$total
rrd=$rutadbs/disco.rrd
last=`rrdtool last $rrd`
file0=$rutaimg/hdhor.png
file1=$rutaimg/hddia.png
file2=$rutaimg/hdsem.png
file3=$rutaimg/hdmes.png
file4=$rutaimg/hdano.png


# 1hour
/usr/bin/rrdtool graph $file0 --imgformat PNG --start -1hour --end $last \
--width $widthc --height $heightc DEF:total=$rrd:total:AVERAGE \
DEF:disco=$rrd:disco:AVERAGE \
AREA:total$color1:$lblhdlibre \
AREA:disco$color2:$lblhdusado \

# 1dia
/usr/bin/rrdtool graph $file1 --imgformat PNG --start -1day --end $last \
--width $widthg --height $heightg --title "Uso del disco rigido - Dia" DEF:total=$rrd:total:AVERAGE \
DEF:disco=$rrd:disco:AVERAGE COMMENT:" Uso de Disco\\n" \
COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
COMMENT:" " GPRINT:total:MIN:$lblhdlibre"     %5.2lf MB" \
GPRINT:total:MAX:" %5.2lf MB" GPRINT:total:AVERAGE:" %5.2lf MB" \
GPRINT:total:LAST:" %5.2lf MB\\n" COMMENT:" " \
GPRINT:disco:MIN:$lblhdusado" %5.2lf MB" \
GPRINT:disco:MAX:" %5.2lf MB" GPRINT:disco:AVERAGE:" %5.2lf MB" \
GPRINT:disco:LAST:" %5.2lf MB\\n" COMMENT:"\\s" AREA:total$color1:$lblhdlibre \
AREA:disco\#FF0000:$lblhdusado 

# 1semana
/usr/bin/rrdtool graph $file2 --imgformat PNG --start -1week --end $last \
--width $widthg --height $heightg --title "Uso del disco rigido - Semana" DEF:total=$rrd:total:AVERAGE \
DEF:disco=$rrd:disco:AVERAGE COMMENT:" Uso de Disco\\n" \
COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
COMMENT:" " GPRINT:total:MIN:$lblhdlibre"     %5.2lf MB" \
GPRINT:total:MAX:" %5.2lf MB" GPRINT:total:AVERAGE:" %5.2lf MB" \
GPRINT:total:LAST:" %5.2lf MB\\n" COMMENT:" " \
GPRINT:disco:MIN:$lblhdusado" %5.2lf MB" \
GPRINT:disco:MAX:" %5.2lf MB" GPRINT:disco:AVERAGE:" %5.2lf MB" \
GPRINT:disco:LAST:" %5.2lf MB\\n" COMMENT:"\\s" AREA:total$color1:$lblhdlibre \
AREA:disco$color2:$lblhdusado 

# 1mes
/usr/bin/rrdtool graph $file3 --imgformat PNG --start -1month --end $last \
--width $widthg --height $heightg --title "Uso del disco rigido - Mes" DEF:total=$rrd:total:AVERAGE \
DEF:disco=$rrd:disco:AVERAGE COMMENT:" Uso de Disco\\n" \
COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
COMMENT:" " GPRINT:total:MIN:$lblhdlibre"     %5.2lf KB" \
GPRINT:total:MAX:" %5.2lf MB" GPRINT:total:AVERAGE:" %5.2lf MB" \
GPRINT:total:LAST:" %5.2lf MB\\n" COMMENT:" " \
GPRINT:disco:MIN:$lblhdusado" %5.2lf MB" \
GPRINT:disco:MAX:" %5.2lf MB" GPRINT:disco:AVERAGE:" %5.2lf MB" \
GPRINT:disco:LAST:" %5.2lf MB\\n" COMMENT:"\\s" AREA:total$color1:$lblhdlibre \
AREA:disco$color2:$lblhdusado 

# 1ano
/usr/bin/rrdtool graph $file4 --imgformat PNG --start -1year --end $last \
--width $widthg --height $heightg --title "Uso del disco rigido - Año" DEF:total=$rrd:total:AVERAGE \
DEF:disco=$rrd:disco:AVERAGE COMMENT:" Uso de Disco\\n" \
COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
COMMENT:" " GPRINT:total:MIN:$lblhdlibre"     %5.2lf MB" \
GPRINT:total:MAX:" %5.2lf MB" GPRINT:total:AVERAGE:" %5.2lf MB" \
GPRINT:total:LAST:" %5.2lf MB\\n" COMMENT:" " \
GPRINT:disco:MIN:$lblhdusado" %5.2lf MB" \
GPRINT:disco:MAX:" %5.2lf MB" GPRINT:disco:AVERAGE:" %5.2lf MB" \
GPRINT:disco:LAST:" %5.2lf MB\\n" COMMENT:"\\s" AREA:total$color1:$lblhdlibre \
AREA:disco$color2:$lblhdusado 

#================================================================================
#				USO DEL PROCESADOR				#
#================================================================================
carga=$(uptime |  awk '{print $11}' | tr "," " ")
#echo Uso del procesador $carga
/usr/bin/rrdtool update $rutadbs/carga.rrd N:$carga
#echo /usr/bin/rrdtool update $rutadbs/carga.rrd N:$carga
rrd=$rutadbs/carga.rrd
last=`rrdtool last $rrd`
file=$rutaimg/cpu
tipo="AREA" 

for N in "-1hour" "-1day" "-1week" "-1month" "-1year"
do 
	/usr/bin/rrdtool graph $file$N.png --imgformat PNG --start $N --end $last --width $widthg --height $heightg --title "Carga del procesador - Dia" \
	DEF:int_c=$rrd:carga:AVERAGE \
	COMMENT:" $lblprocesadorcom\\n" \
	COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
	COMMENT:" " GPRINT:int_c:MIN:$lblprocesador" %5.2lf" \
	GPRINT:int_c:MAX:" %5.2lf" GPRINT:int_c:AVERAGE:$lblprocesador" %5.2lf" \
	GPRINT:int_c:LAST:" %5.2lf\\n" COMMENT:"\\s" \
	AREA:int_c$color1:$lblprocesador 
done
	/usr/bin/rrdtool graph $file-resumen.png --imgformat PNG --start -1hour --end $last --width $widthc --height $heightc \
	DEF:int_c=$rrd:carga:AVERAGE \
	AREA:int_c$color1:$lblprocesador

#================================================================================
#				PROTOCOLOS TCP/UDP				#
#================================================================================
tcp=$(cat /proc/net/ip_conntrack |grep -v UNREPLIED | grep tcp -c)
udp=$(cat /proc/net/ip_conntrack |grep -v UNREPLIED | grep udp -c)
#echo Uso de protocolos TCP/UDP
/usr/bin/rrdtool update $rutadbs/tcp.rrd N:$tcp:$udp
#echo /usr/bin/rrdtool update $rutadbs/tcp.rrd N:$tcp:$udp
rrd=$rutadbs/tcp.rrd
last=`rrdtool last $rrd`
file=$rutaimg/tcp
colortcp="#00FF00"
colorudp="#0000FF"
tipo="STACK"

for N in "-1hour" "-1day" "-1week" "-1month" "-1year"
do 
	/usr/bin/rrdtool graph $file$N.png --imgformat PNG --start -1day --end $last --width $widthg --height $heightg --title "Conexiones TCP/UDP - Dia" \
	DEF:tcp=$rrd:tcp:AVERAGE \
	DEF:udp=$rrd:udp:AVERAGE \
	COMMENT:" Cantidad de conexiones activas\\n" \
	COMMENT:"          " \
	COMMENT:" Min        Max      Med      Último\\n" \
	COMMENT:" " \
	GPRINT:tcp:MIN:"TCP %5.2lf " \
	GPRINT:tcp:MAX:" %5.2lf " GPRINT:tcp:AVERAGE:" %5.2lf " \
	GPRINT:tcp:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:udp:MIN:"UDP %5.2lf " \
	GPRINT:udp:MAX:" %5.2lf " GPRINT:udp:AVERAGE:" %5.2lf " \
	GPRINT:udp:LAST:" %5.2lf \\n" COMMENT:"\\s" \
	AREA:udp$colorudp:'UDP' \
	STACK:tcp$colortcp:'TCP' \
	
done
	/usr/bin/rrdtool graph $file-resumen.png --imgformat PNG --start -1day --end $last --width $widthc --height $heightc  \
	DEF:tcp=$rrd:tcp:AVERAGE \
	DEF:udp=$rrd:udp:AVERAGE \
	AREA:udp$colorudp:'UDP' \
	STACK:tcp$colortcp:'TCP' \

#================================================================================
#				ANCHO DE BANDA					#
#================================================================================
totals=$(cat $rutabw/bwtotal.txt)
asignados=$(cat $rutabw/bwasignado.txt)
asignado=`expr $asignados \* 1024`
total=`expr $totals \* 1024`
#echo Ancho de banda total $totals
#echo Ancho de banda asignado $asignado
/usr/bin/rrdtool update $rutadbs/bw.rrd N:$total:$asignado
rrd=$rutadbs/bw.rrd
last=`rrdtool last $rrd`
file=$rutaimg/bw
colorasignado="#00FF00"
colortotal="#0000FF"
tipo="STACK"

for N in "-1hour" "-1day" "-1week" "-1month" "-1year"
do 
	/usr/bin/rrdtool graph $file$N.png --imgformat PNG --start $N --end $last --width $widthg --height $heightg \
	DEF:asignado=$rrd:asignado:AVERAGE \
	DEF:total=$rrd:total:AVERAGE \
	COMMENT:" Cantidad de conexiones activas\\n" \
	COMMENT:"          " \
	COMMENT:" Min        Max      Med      Último\\n" \
	COMMENT:" " \
	GPRINT:asignado:MIN:"asignado %5.2lf " \
	GPRINT:asignado:MAX:" %5.2lf " \
	GPRINT:asignado:AVERAGE:" %5.2lf " \
	GPRINT:asignado:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:total:MIN:"total %5.2lf " \
	GPRINT:total:MAX:" %5.2lf " \
	GPRINT:total:AVERAGE:" %5.2lf " \
	GPRINT:total:LAST:" %5.2lf \\n" COMMENT:"\\s" \
	AREA:asignado$colorasignado:'Asignado' \
	LINE3:total$colortotal:'Total' 
done
	/usr/bin/rrdtool graph $file-resumen.png --imgformat PNG --start -1day --end $last --width $widthc --height $heightc \
	DEF:asignado=$rrd:asignado:AVERAGE \
	DEF:total=$rrd:total:AVERAGE \
	AREA:asignado$colorasignado:'Asignado' \
	LINE3:total$colortotal:'Total' \


#================================================================================
#				Trafico puerto 80				#
#================================================================================
in=$(iptables -L -n -v --exact | grep -A 15 FORWARD | grep 80in | awk '{print $2}')
out=$(iptables -L -n -v --exact | grep -A 15 FORWARD | grep 80out | awk '{print $2}')
#echo Trafico de entrada del puerto 80 $in
#echo Trafico de salida del puerto 80 $out
/usr/bin/rrdtool update $rutadbs/80.rrd N:$in:$out
rrd=$rutadbs/80.rrd
last=`rrdtool last $rrd`
file=$rutaimg/80
colorin="#00FF00"
colorout="#008800"
tipo="AREA"
for N in "-1hour" "-1day" "-1week" "-1month" "-1year"
do 
	/usr/bin/rrdtool graph $file$N.png --imgformat PNG --start $N --end $last --width $widthg --height $heightg \
	DEF:in=$rrd:in:AVERAGE \
	DEF:out=$rrd:out:AVERAGE \
	COMMENT:" Trafico del puerto 80\\n" \
	COMMENT:"          " \
	COMMENT:" Min        Max      Med      Último\\n" \
	COMMENT:" " \
	GPRINT:in:MIN:"Bajada %5.2lf " \
	GPRINT:in:MAX:" %5.2lf " \
	GPRINT:in:AVERAGE:" %5.2lf " \
	GPRINT:in:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:out:MIN:"Subida %5.2lf " \
	GPRINT:out:MAX:" %5.2lf " \
	GPRINT:out:AVERAGE:" %5.2lf " \
	GPRINT:out:LAST:" %5.2lf \\n" COMMENT:"\\s" \
	AREA:in$colorin:'Bajada' \
	LINE1:out$colorout:'Subida'
	#las siguientes lineas hacen un grafico chiquito para "preview", nunca se uso
	#/usr/bin/rrdtool graph $file$Nc.png --imgformat PNG --start $N --end $last --width $widthc --height $heightc \
	#DEF:in=$rrd:in:AVERAGE \
	#DEF:out=$rrd:out:AVERAGE \
	#AREA:in$colorin:'Bajada' \
	#STACK:out$colorout:'Subida' \

done

#================================================================================
#				Trafico puerto 110				#
#================================================================================
in=$(iptables -L -n -v --exact | grep -A 15 FORWARD | grep 110in | awk '{print $2}')
out=$(iptables -L -n -v --exact | grep -A 15 FORWARD | grep 110out | awk '{print $2}')
#echo Trafico de entrada del puerto 110 $in
#echo Trafico de salida del puerto 110 $out
/usr/bin/rrdtool update $rutadbs/110.rrd N:$in:$out
rrd=$rutadbs/110.rrd
last=`rrdtool last $rrd`
file=$rutaimg/110
colorin="#00FF00"
colorout="#0000FF"
tipo="STACK" 

for N in "-1hour" "-1day" "-1week" "-1month" "-1year"
do 
	/usr/bin/rrdtool graph $file$N.png --imgformat PNG --start $N --end $last --width $widthg --height $heightg \
	DEF:in=$rrd:in:AVERAGE \
	DEF:out=$rrd:out:AVERAGE \
	COMMENT:" Trafico del puerto 110\\n" \
	COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
	COMMENT:" " GPRINT:in:MIN:"Bajada %5.2lf " \
	GPRINT:in:MAX:" %5.2lf " GPRINT:in:AVERAGE:" %5.2lf " \
	GPRINT:in:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:out:MIN:"Subida %5.2lf " \
	GPRINT:out:MAX:" %5.2lf " GPRINT:out:AVERAGE:" %5.2lf " \
	GPRINT:out:LAST:" %5.2lf \\n" COMMENT:"\\s" \
	LINE2:in$colorin:'Bajada' \
	LINE2:out$colorout:'Subida' 

done


#================================================================================
#				Trafico puerto 21				#
#================================================================================
in=$(iptables -L -n -v --exact | grep -A 15 FORWARD | grep 21in | awk '{print $2}')
out=$(iptables -L -n -v --exact | grep -A 15 FORWARD | grep 21out | awk '{print $2}')
#echo Trafico de entrada del puerto 21 $in
#echo Trafico de salida del puerto 21 $out
/usr/bin/rrdtool update $rutadbs/21.rrd N:$in:$out
rrd=$rutadbs/21.rrd
last=`rrdtool last $rrd`
file=$rutaimg/21
colorin="#00FF00"
colorout="#0000FF"

for N in "-1hour" "-1day" "-1week" "-1month" "-1year"
do 
	/usr/bin/rrdtool graph $file$N.png --imgformat PNG --start $N --end $last --width $widthg --height $heightg \
	DEF:in=$rrd:in:AVERAGE \
	DEF:out=$rrd:out:AVERAGE \
	COMMENT:" Trafico del puerto 21\\n" \
	COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
	COMMENT:" " \
	GPRINT:in:MIN:"Bajada %5.2lf " \
	GPRINT:in:MAX:" %5.2lf " \
	GPRINT:in:AVERAGE:" %5.2lf " \
	GPRINT:in:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:out:MIN:"Subida %5.2lf " \
	GPRINT:out:MAX:" %5.2lf " \
	GPRINT:out:AVERAGE:" %5.2lf " \
	GPRINT:out:LAST:" %5.2lf \\n" COMMENT:"\\s" \
	LINE2:in$colorin:'Bajada' \
	LINE2:out$colorout:'Subida' 
done

#================================================================================
#				Trafico puerto 1863				#
#================================================================================
in=$(iptables -L -n -v --exact | grep -A 15 FORWARD | grep 1863in | awk '{print $2}')
out=$(iptables -L -n -v --exact | grep -A 15 FORWARD | grep 1863out | awk '{print $2}')
#echo Trafico de entrada del puerto 1863 $in
#echo Trafico de salida del puerto 1863 $out
/usr/bin/rrdtool update $rutadbs/1863.rrd N:$in:$out
rrd=$rutadbs/1863.rrd
last=`rrdtool last $rrd`
file=$rutaimg/1863
colorin="#00FF00"
colorout="#0000FF"
tipo="STACK"

for N in "-1hour" "-1day" "-1week" "-1month" "-1year"
do 
	/usr/bin/rrdtool graph $file$N.png --imgformat PNG --start $N --end $last --width $widthg --height $heightg \
	DEF:in=$rrd:in:AVERAGE \
	DEF:out=$rrd:out:AVERAGE \
	COMMENT:" Trafico del puerto 1863\\n" \
	COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
	COMMENT:" " GPRINT:in:MIN:"Bajada %5.2lf " \
	GPRINT:in:MAX:" %5.2lf " GPRINT:in:AVERAGE:" %5.2lf " \
	GPRINT:in:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:out:MIN:"Subida %5.2lf " \
	GPRINT:out:MAX:" %5.2lf " GPRINT:out:AVERAGE:" %5.2lf " \
	GPRINT:out:LAST:" %5.2lf \\n" COMMENT:"\\s" \
	AREA:in$colorin:'Bajada' \
	LINE1:out$colorout:'Subida' 
done


#================================================================================
#				     P2P	     				#
#================================================================================
in=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep p2pin | awk '{print $2}')
out=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep p2pout | awk '{print $2}')
p2p=`expr $in + $out`

#echo Trafico de entrada p2p $in
#echo Trafico de salida p2p $out

/usr/bin/rrdtool update $rutadbs/p2p.rrd N:$in:$out
rrd=$rutadbs/p2p.rrd
file=$rutaimg/p2p
last=`rrdtool last $rrd`
colorin="#00FF00"
colorout="#0000FF"
tipo="STACK"

for N in "-1hour" "-1day" "-1week" "-1month" "-1year"
do 
	/usr/bin/rrdtool graph $file$N.png --imgformat PNG --start $N --end $last --width $widthg --height $heightg \
	DEF:in=$rrd:in:AVERAGE \
	DEF:out=$rrd:out:AVERAGE \
	COMMENT:" Trafico P2P\\n" \
	COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
	COMMENT:" " \
	GPRINT:in:MIN:"Bajada %5.2lf " \
	GPRINT:in:MAX:" %5.2lf " \
	GPRINT:in:AVERAGE:" %5.2lf " \
	GPRINT:in:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:out:MIN:"Subida %5.2lf " \
	GPRINT:out:MAX:" %5.2lf " \
	GPRINT:out:AVERAGE:" %5.2lf " \
	GPRINT:out:LAST:" %5.2lf \\n" COMMENT:"\\s" \
	AREA:in$colorin:'Bajada' \
	LINE1:out$colorout:'Subida' 
done



#================================================================================
#				     DETALLE     				#
#================================================================================
wwwin=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 80in | awk '{print $2}')
wwwout=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 80out | awk '{print $2}')
www=1
www=`expr $wwwin + $wwwout`
#echo Trafico WWW $www

msnin=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 1863in | awk '{print $2}')
msnout=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 1863out | awk '{print $2}')
msn=1
msn=`expr $msnin + $msnout`
#echo Trafico MSN entrada $msnin
#echo Trafico MSN salida $msnout

ftpin=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 21in | awk '{print $2}')
ftpout=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 21out | awk '{print $2}')
ftp=1
ftp=`expr $ftpin + $ftpout`
#echo Trafico FTP entrada $ftpin
#echo Trafico FTP salida $ftpout

popin=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 110in | awk '{print $2}')
popout=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 110out | awk '{print $2}')
pop=1
pop=`expr $popin + $popout`
#echo Trafico POP entrada $popin
#echo Trafico POP salida $popout

dnsin=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 53in | awk '{print $2}')
dnsout=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep 53out | awk '{print $2}')
dns=1
dns=`expr $dnsin + $dnsout`
#echo Trafico DNS entrada $dnsin
#echo Trafico DNS salida $dnsout

p2pin=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep p2pin | awk '{print $2}')
p2pout=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep p2pout | awk '{print $2}')
p2p=1
p2p=`expr $p2pin + $p2pout`

restoin=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep restoin | awk '{print $2}')
restoout=$(iptables -L -n -v --exact | grep -A 30 FORWARD | grep restoout | awk '{print $2}')
resto=1
resto=`expr $restoin + $restoout`
#echo Resto $restoin $restout

/usr/bin/rrdtool update $rutadbs/detalle.rrd N:$www:$msn:$ftp:$pop:$dns:$p2p:$resto
#/usr/bin/rrdtool update $rutadbs/detalle.rrd N:500:500:500:500:500:500:500
#echo /usr/bin/rrdtool update $rutadbs/detalle.rrd N:$www:$msn:$ftp:$pop:$dns:$p2p:$resto
rrd=$rutadbs/detalle.rrd
last=`rrdtool last $rrd`
file=$rutaimg/detalle
colorin="#00FF00"
colorout="#0000FF"
tipo="STACK"

for N in "-1hour" "-1day" "-1week" "-1month" "-1year"
do 
	/usr/bin/rrdtool graph $file$N.png --imgformat PNG --start $N --end $last --width $widthg --height $heightg \
	DEF:www=$rrd:80:AVERAGE \
	DEF:msn=$rrd:1863:AVERAGE \
	DEF:ftp=$rrd:21:AVERAGE \
	DEF:pop=$rrd:110:AVERAGE \
	DEF:dns=$rrd:53:AVERAGE \
	DEF:p2p=$rrd:p2p:AVERAGE \
	DEF:resto=$rrd:resto:AVERAGE \
	COMMENT:" Resumen de trafico por protolos\\n" \
	COMMENT:"          " COMMENT:" Min        Max      Med      Último\\n" \
	COMMENT:" " \
	GPRINT:www:MIN:"WWW %5.2lf " \
	GPRINT:www:MAX:" %5.2lf " \
	GPRINT:www:AVERAGE:" %5.2lf " \
	GPRINT:www:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:msn:MIN:"MSN %5.2lf " \
	GPRINT:msn:MAX:" %5.2lf " \
	GPRINT:msn:AVERAGE:" %5.2lf " \
	GPRINT:msn:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:ftp:MIN:"FTP %5.2lf " \
	GPRINT:ftp:MAX:" %5.2lf " \
	GPRINT:ftp:AVERAGE:" %5.2lf " \
	GPRINT:ftp:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:pop:MIN:"POP %5.2lf " \
	GPRINT:pop:MAX:" %5.2lf " \
	GPRINT:pop:AVERAGE:" %5.2lf " \
	GPRINT:pop:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:dns:MIN:"DNS %5.2lf " \
	GPRINT:dns:MAX:" %5.2lf " \
	GPRINT:dns:AVERAGE:" %5.2lf " \
	GPRINT:dns:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:p2p:MIN:"P2P %5.2lf " \
	GPRINT:p2p:MAX:" %5.2lf " \
	GPRINT:p2p:AVERAGE:" %5.2lf " \
	GPRINT:p2p:LAST:" %5.2lf \\n" COMMENT:" " \
	GPRINT:resto:MIN:"OTROS %5.2lf " \
	GPRINT:resto:MAX:" %5.2lf " \
	GPRINT:resto:AVERAGE:" %5.2lf " \
	GPRINT:resto:LAST:" %5.2lf \\n" COMMENT:" " \
	AREA:p2p$colorp2p:'P2P': \
	$tipo:www$colorwww:'WWW': \
	$tipo:msn$colormsn:'MSN': \
	$tipo:ftp$colorftp:'FTP': \
	$tipo:pop$colorpop:'POP': \
	$tipo:dns$colordns:'DNS': \
	$tipo:resto$colorresto:'OTROS': \

done

/zafiro/sasacct-1.0.2/bin/sasacct.plx -c /zafiro/archivos/sasacct.conf
iptables -Z FORWARD
