<body class=body>
<?
//include "menu.php";
include "librerias.php";
f_dibuja_titulo("Estado de Clientes");
echo "<table align=center class=table width=50%><tr class=grillatitulo><td>Clientes</td><td>Descripcion</td><td>IP</td><td>Ping</td></tr>";
$sql = "select clientesnom,clientesdes,clientesip,clientesest from clientes where clientesest=0";
$rs = mysql_query($sql, $db);
while ($fila=mysql_fetch_assoc($rs)) {
	if(htmlentities($fila['clientesest'])==1){
		$font="<font color=red>";
	}else{
		$font="";	
	}
	if(fncping(f_RequestRed().".".$fila['clientesip'],1)==1){
		$ping="<font color=green>Vivo</font>";
		$ping="<img src='Imagenes/ok.gif' width=24px height=24px>";
	}else{
		$ping="<font color=red>Muerto</font>";
		$ping="<img src='Imagenes/error.png' width=24px height=24px>";
	}
	echo "<tr class=grillaregistro><td>".$fila['clientesnom']."</td><td>".$fila['clientesdes']."</td><td>".f_RequestRed().".".$fila['clientesip']."</td><td>".$ping."</td></tr>";
}
echo "</table><br><center>";
echo "</center></body>";
?>
