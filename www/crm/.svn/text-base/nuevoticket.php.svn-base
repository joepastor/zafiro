<?
include "db.php";
if(isset($HTTP_POST_VARS["cliente"])){
	echo "<center>PROCESO DE INGRESO DE TICKET INICIADO<br>";
	$campos="";
	$valores="";
	foreach($HTTP_POST_VARS as $id=>$value){
	        $campos.=$id.",";
	        $valores.="'".$value."',";
	}
	$sql="insert into tickets (ingresado,".$campos."usuario) values (now(),".$valores."'".$HTTP_SESSION_VARS['usuario']."')";
	//echo $sql;
	mysql_query($sql);
	$rs=mysql_query("select last_insert_id() as id");
	echo "<br><font size=+2 color=red>Se ha generado el ticket Nroº <b><a target=_parent href=operar.php?ticket=".mysql_result($rs,"id").">".mysql_result($rs,"id")."</a></center>";
}else{
?>
<script language=JavaScript>
function controldatos(){
	if(formulario.cliente.value==0){
		alert('Debe seleccionar el cliente correspondiente al ticket');
		return false;
	}
	return true;
}
</script>
<?
echo "<form action='nuevoticket.php' method=post name=formulario>";
echo "<link rel=stylesheet type='text/css' href='clases.css'>";
echo "<body class=body vlink=#dddddd link=#dddddd>";
echo "<table align=center border=1 cellpadding=0 cellspacing=0 width=70%>";
echo "<tr align=center class=tablatitulo>";

//CARGA DE CLIENTES DE OTROS SERVIDORES
echo "<td><select name=cliente><option value=0>Seleccione Cliente</option>";
$sql="select nombre,usuariomysql,passwordmysql,ip from servidores where id=".$HTTP_GET_VARS["servidor"];
$rs=mysql_query($sql);
if($resultados=mysql_fetch_row($rs)){
        $dbclientes = mysql_connect($resultados[3], $resultados[1], $resultados[2]);
	mysql_select_db("zafiro",$dbclientes);
        $resultado=mysql_query("select clientesid,clientesnom from clientes where clientesest in (0,1)",$dbclientes);
        while($array=mysql_fetch_row($resultado)){
                echo "<option value=".$array[0]."-".$array[1].">".$array[1]."</opion>";
        }
        mysql_close($dbclientes);
}
echo "</select></td>";
echo "<input type=hidden name=servidor value=".$HTTP_GET_VARS["servidor"].">";
echo "<td><select name=producto><option value=0>Seleccion Producto</option>";include "./include/productos.inc.php";echo "</select></td>";
echo "<td><select name=tipoticket>";echo "<option value=0>Seleccione Tipo de ticket</option>";include "./include/tipotickets.inc.php";echo "</select></td>";
echo "</tr>";
echo "<tr align=center class=tablaregistro>";
echo "<td colspan=5><textarea name=descripcion cols=100 rows=10></textarea></td>";
echo "</tr>";
echo "<tr align=center class=tablatitulo>";
echo "<td colspan=5><button style='background-color:red;font:bold 18px Arial;color:#cccccc' type=button onclick='if(controldatos()){this.disabled=true;if(confirm(\"Esta seguro que desea generar un nuevo ticket?\")==true){document.formulario.submit();}else{alert(\"El ticket ha sido cancelado\");this.disabled=false}}'>Generar nuevo ticket</button></td>";
echo "</tr>";
echo "</table>";
echo "</form>";
}
?>
