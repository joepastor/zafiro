<?
include "db.php";
include "include/top.inc.php";
echo "<link rel=stylesheet type='text/css' href='clases.css'>";
echo "<body class=body vlink=#dddddd link=#dddddd>";
if(isset($HTTP_POST_VARS["comentario"])){
	echo "<center>PROCESO DE INGRESO DE EVENTO INICIADO<br>";
	$campos="";
	$valores="";
	foreach($HTTP_POST_VARS as $id=>$value){
	        $campos.=$id.",";
	        $valores.="'".$value."',";
	}
	$sql="insert into eventos (".$campos."usuario) values (".$valores.$HTTP_SESSION_VARS['usuario'].")";
	//echo $sql;
	mysql_query($sql);

	if($HTTP_POST_VARS["estadotecnico"]>0){
		$up="estadotecnico=".$HTTP_POST_VARS["estadotecnico"];
	}
	if($HTTP_POST_VARS["estadoadministrativo"]>0){
		if($up){
			$up.=",";
		}
		$up.="estadoadministrativo=".$HTTP_POST_VARS["estadoadministrativo"];
	}
	$sql2="update tickets set ".$up." where id=".$HTTP_POST_VARS["ticket"];
	//echo $sql2;
	mysql_query($sql2);
	$rs=mysql_query("select last_insert_id() as id");
	echo "<br><font size=+2 color=red>Se ha generado el evento Nroº <b>".mysql_result($rs,"id")."</center>";
	exit;
}
?>
<script language=JavaScript>
function controldatos(){
	if(formulario.comentario.value==""){
		alert('Debe ingresar los comentarios del evento');
		return false;
	}
	return true;
}
</script>
<?
if(isset($HTTP_GET_VARS["ticket"])){
	include "reporte.php";
	f_dibuja_titulo("Nuevo evento");
	$sql="select servidores.nombre,cliente,productos.nombre,usuarios.nombre,tipotickets.tipo,tickets.timestamp,
(select estado from eventos inner join estadosadministrativos on estadoadministrativo=estadosadministrativos.id where eventos.id=(select max(id) from eventos where eventos.ticket=tickets.id)),
(select estado from eventos inner join estadostecnicos on estadotecnico=estadostecnicos.id where eventos.id=(select max(id) from eventos where eventos.ticket=tickets.id))
 from tickets left join servidores on servidores.id=tickets.servidor left join productos on productos.id=tickets.producto left join tipotickets on tickets.tipoticket=tipotickets.id inner join usuarios on tickets.usuario=usuarios.id where tickets.id=".$HTTP_GET_VARS["ticket"];
        $rs=mysql_query($sql);
	while($resultados=mysql_fetch_row($rs)){
		echo "<table class=table align=center border=0 width=70%>";
		echo "<tr class=tablatitulo><td>Ticket Nº</td><td>Servidor</td><td>Cliente</td><td>Producto</td><td>Usuario</td><td>Tipo de Ticket</td></td><td>Fecha y Hora</td><td>Estado Administrativo</td><td>Estado Técnico</td></tr>";
		echo "<tr class=tablaregistro><td>".$HTTP_GET_VARS["ticket"]."</td><td>".$resultados[0]."</td><td>".$resultados[1]."</td><td>".$resultados[2]."</td><td>".$resultados[3]."</td><td>".$resultados[4]."</td><td>".$resultados[5]."</td><td>".$resultados[6]."</td><td>".$resultados[7]."</td></tr>";
	}
	echo "</table>";
	echo "<br>";
	echo "<form action='operar.php' method=post name=formulario>";
	echo "<input name=ticket type=hidden value=".$HTTP_GET_VARS["ticket"].">";
	echo "<table align=center border=1 cellpadding=0 cellspacing=0 width=70%>";
	echo "<tr align=center class=tablatitulo>";
	echo "<td><select name=estadotecnico><option value=0>Seleccion Nuevo Estado Técnico</option>";include "./include/estadostecnicos.inc.php";echo "</select></td>";
	echo "<td><select name=estadoadministrativo>";echo "<option value=0>Seleccione Nuevo Estado Administrativo</option>";include "./include/estadosadministrativos.inc.php";echo "</select></td>";
	echo "</tr>";
	echo "<tr align=center class=tablaregistro>";
	echo "<td colspan=5><textarea name=comentario cols=100 rows=10></textarea></td>";
	echo "</tr>";
	echo "<tr align=center class=tablatitulo>";
	echo "<td colspan=5 height=50px><button style='background-color:red;font:bold 18px Arial;color:#cccccc' type=button onclick='if(controldatos()){this.disabled=true;if(confirm(\"Esta seguro que desea generar un nuevo evento?\")==true){document.formulario.submit();}else{alert(\"El evento no ha sido ingresado\");this.disabled=false}}'>Ingresar nuevo evento</button></td>";
	echo "</tr>";
	echo "</table>";
	echo "</form>";
	$sql="select eventos.id as ID, ticket as Ticket, fecha as Fecha, usuarios.nombre as Usuario, comentario as Comentario, estadostecnicos.estado as 'Estado Técnico', estadosadministrativos.estado as 'Estado Administrativo' from eventos inner join usuarios on eventos.usuario=usuarios.id left join estadosadministrativos on estadosadministrativos.id=eventos.estadoadministrativo left join estadostecnicos on estadostecnicos.id=eventos.estadotecnico where ticket=".$HTTP_GET_VARS["ticket"];
	$rs=mysql_query($sql);
        echo "<table align=center width=70%>";
       	echo "<tr class=tablatitulo>";
        for($i=0;$i<=mysql_num_fields($rs)-1;$i++){
       	        echo "<td>".mysql_field_name($rs,$i)."</td>";
        }
       	echo "</tr>";
        while($rsarray=mysql_fetch_row($rs)){
       	        echo "<tr class=tablaregistro>";
               	for($i=0;$i<=mysql_num_fields($rs)-1;$i++){
			echo "<td align=right>".$rsarray[$i]."</td>";
       	        }
	}
}else{
	echo "<center>No se ha seleccionado un ticket para operar</center>";
}
?>
