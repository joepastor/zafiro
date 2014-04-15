<?
echo "<body class=body>";
include "librerias.php";
f_dibuja_titulo("Editar reglas de proxy");
if($_SESSION["permiso"]>1){
        echo "<center>No tiene permiso para acceder a esta sesi&oacute;n</center>";
        exit();
}
$sql3="";
$sql2="";
$id = f_Request("id");
$comentario = f_Request("comentario");
$comando = f_Request("nombre");
$orden = f_Request("host");
$estado = f_Request("estado");
if (f_Request("ac")=="guardar") {
	$errores = "";
	//ip address
	$f = 0;
	unset($ips);
	if ($comando=="") {
		$errores .= "|Debe ingresar la regla quid";
	}
	//Mostrar Errores
	if ($errores!="") {
		f_imprime_errores($errores);
	} else {
		if ($id>0) {
			$sql = "update firewall set comando='".$comando."', comentario='".$comentario."',orden='".$orden."', estado=".$estado." where id = $id";
		} else {
			$id=fncidfirewall();
			$sql = "insert into firewall (id,comando,comentario,orden,estado) values 
			($id, '$comando','$comentario', $orden, $estado)";
		}
		mysql_query($sql, $db);
		mysql_query($sql2, $db);
		f_redirect("listar_firewall.php");
	}
} else {
	$sql = "select id,comentario,comando,orden,estado from firewall where id = $id";
	$rs = mysql_query($sql, $db);
	if ($fila = mysql_fetch_assoc($rs)){
		$comentario = $fila['comentario'];
		$comando = $fila['comando'];
		$orden = $fila['orden'];
		$estado = $fila['estado'];
	}
}
?>

<script>
function guardar() {
	document.datos.submit();
}
</script>
<table class=table border=0 align=center width=80%>
<form name="datos" action="?mod=ABMfirewall&ac=guardar" method="post">
<tr><td class=grillatitulo>Comentario</td><td colspan=3><? f_HTML_TextBox("comentario", $comentario, $extras["TextBoxABM"], 254,80);?></td></tr>
<tr><td class=grillatitulo>Comando</td><td>iptables <? f_HTML_TextBox("comando", $comando, $extras["TextBoxABM"], 254,50);?></td><td class=grillatitulo width=5%>Orden</td><td><? f_HTML_Hidden("id", $id); f_HTML_TextBox("orden", $orden, $extras["TextBoxABM"], 254,5);?></td></tr>
<tr><td class=grillatitulo>Estado</td><td>
<?
f_HTML_Hidden("id", $id);
f_HTML_Estado("estado", $estado, $extras["EstadoABM"]);
?>
</td>
</tr>
</form>
<tr align=center><td colspan=4><? f_HTML_Button("boGuardar", "Guardar", $extras["ButtonABM"]. " onclick=\"guardar();\"");?></td></tr>
</table>
</body>
