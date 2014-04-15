<body class=body>
<?
//include "menu.php";
include "librerias.php";
f_dibuja_titulo("Perfiles de proxy");
echo "<table align=center class=table width=50%><tr class=grillatitulo><td>Nombre</td><td>Comentario</td><td>Estado</td><td></td></tr>";
$sql = "select id,nombre,descripcion, estado from perfilessquid where estado in (0,1)";
$rs = mysql_query($sql, $db);
while ($fila=mysql_fetch_assoc($rs)) {
	if(htmlentities($fila['estado'])==1){
		$font="<font color=red>";
	}else{
		$font="";	
	}
	echo "<tr class=grillaregistro><td>".htmlentities($fila['nombre'])."</td><td>".htmlentities($fila['descripcion'])."</td><td>".$font.htmlentities($arrEstado[$fila['estado']])."</td><td><a href='abmreglassquid.php?id=".$fila['id']."'>Editar</a></td></tr>";
}
echo "</table><br><center>";
echo f_HTML_Button("boNuevo", "Nuevo", $extras["ButtonABM"]." onclick=\"location='abmreglassquid.php?id=0'\"");
echo "</center></body>";
?>
