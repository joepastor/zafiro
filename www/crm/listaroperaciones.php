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
select 
eventos.id as ID,
ticket as Ticket,
fecha as Fecha,
usuarios.nombre as Usuario,
comentario as Comentario,
estadostecnicos.estado 'Estado Tecnico',
estadosadministrativos.estado as 'Estado Administrativo' 
from eventos inner join usuarios on usuarios.id=eventos.usuario left join estadosadministrativos on estadosadministrativos.id=eventos.estadoadministrativo left join estadostecnicos on estadostecnicos.id=eventos.estadotecnico where usuario=".$HTTP_SESSION_VARS["usuario"]." order by ".$orden;
//echo $sql;
echo "<html>";
echo "<link rel=stylesheet type='text/css' href='clases.css'>";
echo "<body class=body>";
echo fncreportassist($sql,array(),array(),70);
?>
