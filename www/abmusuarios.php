<body class=body>
<?
//include "menu.php";
include "librerias.php";
f_dibuja_titulo("Editar Usuario");
if($_SESSION["permiso"]>1){
        echo "<center>No tiene permiso para acceder a esta sesión</center>";
        exit();
}

$usuariosid = f_Request("usuariosid");
$usuariosnom = f_Request("usuariosnom");
$usuariospas = f_Request("usuariospas");
$usuariosniv = f_Request("usuariosniv");
$usuariosest = f_Request("usuariosest");
$red = f_RequestRed();

if (f_Request("ac")=="guardar") {
	$errores = "";
	if ($usuariosnom=="") {
		$errores .= "|Debe completar el nombre de usuario";
	}
	if ($usuariospas=="") {
		$errores .= "|Debe completar la contraseña del usuarios";
	}
	if($usuariosest==0){
		$sql="select usuariosnom from usuarios where usuariosest=0 and usuariosnom='".$usuariosnom."' and usuariosid <> $usuariosid";
		$rsusuarios=mysql_query($sql);
		$rsusuarios2=mysql_fetch_assoc($rsusuarios);
		if($rsusuarios2['usuariosnom']!=""){
			$nombreusuario=$rsusuarios2['rsusuariosnom'];
			$errores .= "|El nombre de usuario ".$usuariosnom." se encuentra actualmente en uso";
		}
	}
	//Mostrar Errores
	if ($errores!="") {
		f_imprime_errores($errores);
	} else {
		if ($usuariosid>0) {
			$sql = "update usuarios set usuariosnom='" . f_TSQL($usuariosnom) . "', usuariospas='" . f_TSQL($usuariospas) . "', usuariosniv=$usuariosniv, usuariosest=$usuariosest where usuariosid = $usuariosid";
		} else {
			$idusuario=fncidusuario();
			$sql = "insert into usuarios (usuariosid, usuariosnom, usuariospas, usuariosniv, usuariosest) values "
				. "($idusuario, '" . f_TSQL($usuariosnom) . "', '" . f_TSQL($usuariospas) . "', '$usuariosniv', '$usuarios<est')";
		}
		$db_selected = mysql_select_db($sysop["db_name"], $db);
                mysql_query($sql, $db);
		f_redirect("listar_usuarios.php");
	}

} else {

	$sql = "select usuariosid, usuariosnom, usuariospas,usuariosniv,usuariosest"
		. " from usuarios where usuariosid = $usuariosid";
	$rs = mysql_query($sql, $db);
	
	if ($fila = mysql_fetch_assoc($rs)) {

		$usuariosnom = $fila['usuariosnom'];
		$usuariospas = $fila['usuariospas'];
		$usuariosniv = $fila['usuariosniv'];
		$usuariosest = $fila['usuariosest'];
	}
}	

?>

<script>
function guardar() {
	document.datos.submit();
}
</script>
<body class=body>
<table class=table>
	<form name="datos" action="?ac=guardar" method="post">
	<tr>
		<td>Nombre</td>
		<td>
			<? f_HTML_Hidden("usuariosid", $usuariosid); 
			f_HTML_TextBox("usuariosnom", $usuariosnom, 
				$extras["TextBoxABM"], 45); ?>
		</td>
		
	</tr>
	<tr>
		<td>Contraseña</td>
		<td>
			<? f_HTML_TextBoxPassword("usuariospas", $usuariospas, 
				$extras["TextBoxABM"], 45); ?>
		</td>
		
	</tr>
	<tr>
		<td>Estado</td>
		<td><? f_HTML_Estado("usuariosest", $usuariosest, $extras["EstadoABM"]);?></td>
	</tr>
	<tr>
		<td>Nivel</td>		
		<td>
			<?
			$sql = "select nivelesusuarioid as id, nivelesusuarionom as nombre, nivelesusuarioest as estado "
				. " from nivelesusuario "
				. " where nivelesusuarioest = 0 "
				. " order by 2";
			   f_HTML_SelectObjeto("usuariosniv", $usuariosniv, 
				$extras["SelectABM"], $sql); ?>
		</td>
		
	</tr>
	</form>
</table>

<? f_HTML_Button("boGuardar", "Guardar", 
	$extras["ButtonABM"]. " onclick=\"guardar();\"");?>
</body>
