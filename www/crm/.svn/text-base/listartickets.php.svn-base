<?
include "db.php";
include "include/top.inc.php";

function fncreportassist($sql,$totales=array(),$fechas=array(),$ancho=90,$pesos=array(),$conteo=0,$fechor=array()){
	$total=0;
	$reporte="";	
	//$reporte.= "<link rel=stylesheet type='text/css' href='clases.css'>";
	$rs=mysql_query($sql);
	$reporte.= "<table align=center width=".$ancho."%>";
	$bgcolor="bgcolor=red";
	$reporte.= "<tr class=tablatitulo>";
	for($i=0;$i<=mysql_num_fields($rs)-1;$i++){
		//$reporte.= "<td><a href=listartickets.php?orden=".mysql_field_name($rs,$i).">".mysql_field_name($rs,$i)."</td>";
		$reporte.= "<td><a href=listartickets.php?orden=".($i+1).">".mysql_field_name($rs,$i)."</td>";
	}
	$reporte.= "<td>&nbsp;</td></tr>";
	while($rsarray=mysql_fetch_row($rs)){
		//echo $rsarray[4]."----".timestamptonum($rsarray[4]);
		if(timestamptonum($rsarray[1])<date("Ymd")){
			$clase="class=tablaregistrovencido";
		}else{
			$clase="class=tablaregistro";
		}
		$reporte.= "<tr ".$clase.">";
		for($i=0;$i<=mysql_num_fields($rs)-1;$i++){
			if(in_array($i,$totales)){
				$totales[$i]=$totales[$i]+$rsarray[$i];
				if(in_array($i,$pesos)){
					$reporte.= "<td align=right>$".number_format($rsarray[$i],2,",",".")."</td>";
				}else{
					$reporte.= "<td align=right>".odbc_result($rs,$i)."</td>";
				}
			}elseif(in_array($i,$fechas)){
				$reporte.= "<td>".numtofec(odbc_result($rs,$i))."</td>";
			}elseif(in_array($i,$pesos)){
				$reporte.= "<td align=right>$".number_format(odbc_result($rs,$i),2,",",".")."</td>";
			}elseif(in_array($i,$fechor)){
				$reporte.= "<td align=right>".numtofechor(odbc_result($rs,$i))."</td>";
			}else{
				$reporte.= "<td>".$rsarray[$i]."</td>";
			}
		}
		$reporte.= "<td><a href='operar.php?ticket=".$rsarray[0]."'>Operar</td>";
		$reporte.= "</tr>";
		$total++;
	}
	$reporte.= "<tr class=reportetitulos>";
	for($i=0;$i<=mysql_num_fields($rs)-1;$i++){
		if(in_array($i,$totales)){
			if(in_array($i,$pesos)){
				$reporte.= "<td>$".number_format($totales[$i],2,",",".")."<br>Total</td>";
			}else{
				$reporte.= "<td>".$totales[$i]."<br>Total</td>";
			}
		}else{
			$reporte.= "<td>&nbsp;</td>";
		}
	}
	$reporte.= "</tr>";
	$reporte.= "</table>";
	if($conteo==1){
		echo "<center><font size=+3><b>Total Registros: ".$total."</center>";
	}
	return $reporte;
}



echo f_dibuja_titulo("Listado de tickets");
$campos="";
$valores="";
if(isset($HTTP_GET_VARS["orden"])){
	$orden=$HTTP_GET_VARS["orden"];
}else{
	$orden=1;
}
foreach($HTTP_POST_VARS as $id=>$value){
        $campos.=$id.",";
        $valores.="'".$value."',";
}
$sql="select 
tickets.id as ID,
ingresado as Ingresado, 
concat(concat(servidores.nombre,'-'),servidores.ip) as Servidor,
cliente as Cliente,
productos.nombre as Producto,
tipo as Tipo,
usuarios.nombre as Usuario,
estadosadministrativos.estado as EstAdmin,
estadostecnicos.estado as EstTec,
tickets.timestamp as 'Ultima Actividad' 
from tickets 
left join productos on producto=productos.id 
left join servidores on tickets.servidor=servidores.id 
left join tipotickets on tickets.tipoticket=tipotickets.id 
left join usuarios on tickets.usuario=usuarios.id 
left join estadosadministrativos on tickets.estadoadministrativo=estadosadministrativos.id
left join estadostecnicos on tickets.estadotecnico=estadostecnicos.id
order by ".$orden;
//echo $sql;
echo "<html>";
echo "<link rel=stylesheet type='text/css' href='clases.css'>";
echo "<body class=body>";
echo fncreportassist($sql,array(),array(),95);

?>
