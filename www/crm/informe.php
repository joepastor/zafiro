<?
echo "<html>";
echo "<link rel=stylesheet type='text/css' href='clases.css'>";
echo "<body class=body>";
include "reporte.php";
if(!empty($HTTP_POST_VARS)){
	include_once "funciones.php";
	echo f_dibuja_titulo("Informe");
	echo f_dibuja_titulo(date(d."/".m."/".Y." ".H.":".i));
	//si es un array o tiene  algo dentro, etnconces hacemos el reporte
	$where=" where 1=1";
	foreach($HTTP_POST_VARS as $id=>$value){
		if($value!=0){
			echo $id."->".$value;
			$where.=" and ".$id."='".$value."'";
		}
        }
	$sql="select tickets.id as ID, ingresado as Ingresado, concat(concat(servidores.nombre,'-'),servidores.ip) as Servidor, cliente as Cliente, productos.nombre as Producto, tipo as Tipo, usuarios.nombre as Usuario, estadosadministrativos.estado as EstAdmin, estadostecnicos.estado as EstTec, tickets.timestamp as 'Ultima Actividad' from tickets left join productos on producto=productos.id left join servidores on tickets.servidor=servidores.id left join tipotickets on tickets.tipoticket=tipotickets.id left join usuarios on tickets.usuario=usuarios.id left join estadosadministrativos on tickets.estadoadministrativo=estadosadministrativos.id left join estadostecnicos on tickets.estadotecnico=estadostecnicos.id".$where." order by 1";
	//echo $sql;
	echo fncreportassist($sql,array(),array(),95);
	exit();
}
include "include/top.inc.php";
echo f_dibuja_titulo("Informe");

?>
<form action=informe.php target=_blank method=post>
<table align=center>
<tr class=tablatitulo>
<td>Tipo Ticket</td>
<td>Estado Tecnico</td>
<td>Estado Administrativo</td>
<td>Servidor</td>
<td>Cliente</td>
<td>&nbsp;</td>
</tr>
<tr class=tablaregistro>
<td><?echo creaselect("tipoticket","id,tipo","tipotickets");?></td>
<td><?echo creaselect("estadotecnico","id,estado","estadostecnicos");?></td>
<td><?echo creaselect("estadoadministrativo","id,estado","estadosadministrativos");?></td>
<td><?echo creaselect("servidor","id,nombre","servidores");?></td>
<td><?echo creaselect("cliente","cliente,cliente","tickets");?></td>
<td><button type=submit>Generar</button></td>
</tr>
</table>
</form>
<?
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

?>
