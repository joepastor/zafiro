<?
include "db.php";
function fncreportassist($sql,$totales=array(),$fechas=array(),$ancho=50,$pesos=array(),$conteo=0,$fechor=array()){
	$total=0;
	$reporte="";	
	//$reporte.= "<link rel=stylesheet type='text/css' href='clases.css'>";
	$rs=mysql_query($sql);
	$reporte.= "<table align=center width=".$ancho."%>";
	$reporte.= "<tr class=tablatitulo>";
	for($i=0;$i<=mysql_num_fields($rs)-1;$i++){
		//$reporte.= "<td><a href=".getenv("SCRIPT_NAME ")."?orden=".mysql_field_name($rs,$i).">".mysql_field_name($rs,$i)."</td>";
		$reporte.= "<td><a href=".getenv("SCRIPT_NAME ")."?orden=".($i+1).">".mysql_field_name($rs,$i)."</td>";
	}
	$reporte.= "</tr>";
	while($rsarray=mysql_fetch_row($rs)){
		$reporte.= "<tr class=tablaregistro>";
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
?>
