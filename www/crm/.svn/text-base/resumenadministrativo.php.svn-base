<?
include "include/top.inc.php";
include "reporte.php";
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

$sql="
select estadosadministrativos.estado as Estado,count(*) as Cantidad
from tickets 
inner join estadosadministrativos on estadosadministrativos.id=tickets.estadoadministrativo 
where tickets.borrado=0 
group by 1 order by ".$orden;
echo "<html>";
echo "<link rel=stylesheet type='text/css' href='clases.css'>";
echo "<body class=body>";
echo fncreportassist($sql,array(),array(),40);
?>
