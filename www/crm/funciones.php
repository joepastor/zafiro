<!--<LINK rel=stylesheet type="text/css" href="<?echo "http://" . getenv("HTTP_HOST") . "/clases.css";?>">-->
<?
$popupjs="<script language='JavaScript'>function popup(pagina) {var opciones='toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=508, height=365, top=85, left=140';window.open(pagina,'',opciones);}</script>";


function creaselect($name,$campos,$from){
	$return="";
	$return="<select name=".$name.">";
	$return.="<option value=0>Seleccione</option>";
	$sql="select $campos from $from";
	$rs=mysql_query($sql);
	while($array=mysql_fetch_row($rs)){
	        $return.="<option value=".$array[0].">".$array[1]."</option>";
	}
	$return.="</select>";
	return $return;
}

function timestamptonum($fecha){
        return  substr($fecha,0,4) . substr($fecha,5,2) . substr($fecha,8,2);
}

function fectonum($fecha){
        return  substr($fecha,-4) . substr($fecha,4,2) . substr($fecha,2);
}

function numtofec($num){
        if ($num>0){
                return substr($num,6,2) . "/" . substr($num,4,2) . "/" . substr($num,0,4);
        }
}

function validausuario($usuario,$password){
	include "db.php";
	$sql="select id from usuarios where login='$usuario' and password='$password'";
	//echo $sql;
        $rs=mysql_query($sql);
        if(mysql_fetch_row($rs)){
		$HTTP_SESSION_VARS["usuario"]=mysql_result($rs,0);
		return $HTTP_SESSION_VARS["usuario"];
                //return true;
        }
	return false;
}

function f_Request($nombre) {
	
	global $HTTP_POST_VARS;
	global $HTTP_GET_VARS;
	
	if (isset($HTTP_POST_VARS[$nombre])) {
		return $HTTP_POST_VARS[$nombre];
	}

	if (isset($HTTP_GET_VARS[$nombre])) {
		return $HTTP_GET_VARS[$nombre];
	}

	return "";
}

function f_RequestFecha($nombre) {

	$fecha = f_Request($nombre."_3");
	if (f_Request($nombre."_2")>0 && f_Request($nombre."_2")<10) {
		$fecha .= "0";
	}
	$fecha .= f_Request($nombre."_2");
	if (f_Request($nombre."_1")>0 && f_Request($nombre."_1")<10) {
		$fecha .= "0";
	}
	$fecha .= f_Request($nombre."_1");
	return $fecha;
}

function f_carga_clase($nomclase) {

	global $sysop;

	$ruta = $sysop["ruta"] . "clases/class." . $nomclase . ".php";
	include_once($ruta);
}

function f_mostrar_plantilla($nombre, $objeto = null) {
	
	global $sysop;
	global $extras;

	$ruta = $sysop["ruta"] . "plantillas/template." . $nombre . ".php";
	include $ruta;
}

function f_dibuja_titulo($titulo) {
	echo "<br><center><font class=textotitulos>" . htmlentities($titulo) . "</font></center><br>";
}

function f_redirect($url) {
	
	header("Location: ".$url);
	exit();
	?>
	<script>
	location = '<?echo addslashes($url)?>';
	</script>
	<?
}

function f_TSQL($valor) {

	return str_replace("'", "''", stripslashes($valor));
}

function f_HTML_Button($nombre, $valor="", $extras="") {

	$valor = is_null($valor) ? "" : $valor;

	?>
	<input name="<?echo $nombre?>" id="<?echo $nombre?>" 
		 type="button" value="<?echo htmlentities($valor)?>" <?echo $extras?> >
	<?
}

function f_HTML_CheckBox($nombre, $valor="", $extras="") {

	$valor = is_null($valor) ? "" : $valor;

	?>
	<input name="<?echo $nombre?>" id="<?echo $nombre?>" 
		 type="checkbox" value="<?echo $valor?>" <?echo $extras?> >
	<?
}

function f_HTML_Estado($nombre, $valor="0", $extras="") {

	global $arrEstado;
	$valor = is_null($valor) ? "" : $valor;

	?>
	<select class=textbox name="<?echo $nombre?>" id="<?echo $nombre?>" <?echo $extras?> >
	<?
		$i = 0;
		$selected = ($valor==$i) ? " selected " : "";
		echo "<option value=\"{$i}\" {$selected} >".$arrEstado[$i]."</option>";

		$i = 1;
		$selected = ($valor==$i) ? " selected " : "";
		echo "<option value=\"{$i}\" {$selected} >".$arrEstado[$i]."</option>";

		$i = 2;
		$selected = ($valor==$i) ? " selected " : "";
		echo "<option value=\"{$i}\" {$selected} >".$arrEstado[$i]."</option>";
	?>
	</select>
	<?
}

function f_HTML_Hidden($nombre, $valor="") {

	$valor = is_null($valor) ? "" : $valor;

	?>
	<input name="<?echo $nombre?>" id="<?echo $nombre?>" 
		 type="hidden" value="<?echo htmlentities($valor)?>" >
	<?
}

function f_HTML_SelectCantidad($nombre, $valor="", $extras="", $inicio, $fin,
		 $nro_mask = 0, $mostrar_blanco = false) {

	$valor = is_null($valor) ? "" : $valor;

	?>
	<select class=textbox name="<?echo $nombre?>" id="<?echo $nombre?>" <?echo $extras?> >
	<?
	
	if ($mostrar_blanco) {
		echo "<option value=\"\" selected></option>";
	}
	
	for($i=$inicio; $i<=$fin; $i++) {
		$selected = ($valor==$i) ? " selected " : "";
		$i_masked = $nro_mask - strlen($i)>=0 ? 
			str_repeat("0", $nro_mask - strlen($i)) . $i : $i;
		echo "<option value=\"{$i}\" {$selected} >{$i_masked}</option>";
	}
	?>
	</select>
	<?
}

function f_HTML_SelectFecha($nombre, $valor=null, $extras="") {

	$valor = is_null($valor) ?  date("Ymd") : $valor;
	
	if ($valor) {
		$anio = substr($valor, 0, 4);
		$mes = substr($valor, 4, 2);
		$dia = substr($valor, 6, 2);
	} else {
		$anio = -1;
		$mes = -1;
		$dia = -1;
	}
	
	f_HTML_SelectCantidad($nombre . "_1", $dia, $extras="", 1, 31, 2, TRUE);
	f_HTML_SelectCantidad($nombre . "_2", $mes, $extras="", 1, 12, 2, TRUE);
	f_HTML_SelectCantidad($nombre . "_3", $anio, $extras="",
		 date("Y")-10, date("Y")+1, 4, TRUE);
}

function f_HTML_SelectObjeto($nombre, $valor=null, $extras="", $sql,
		 $mostrar_blanco = false) {
	
	global $db;
	$rs = mysql_query($sql, $db);
	
	?>
	<select class=textbox name="<?echo $nombre?>" id="<?echo $nombre?>" >
	<?
	if ($mostrar_blanco) {
		echo "<option value=\"\"></option>";
	}
	
	while($fila = mysql_fetch_assoc($rs)) {
		$selected = $fila['id']==$valor ? " selected " : "";
		echo "<option value=\"" . $fila['id'] . "\" ".$selected.">" .
			 addslashes($fila['nombre']) . "</option>";
	}
	?>
	
	</select>
	<?
}

function f_HTML_SelectValores($nombre, $valor="", $extras="", $arr_valores) {

	?>
	<select class=textbox name="<?echo $nombre?>" id="<?echo $nombre?>" <?echo $extras?> >
	<?
	foreach($arr_valores as $k=>$v) {
		$selected = ($valor==$k) ? " selected " : "";
		echo "<option value=\"{$k}\" {$selected} >{$v}</option>";
	}
	?>
	</select>
	<?
}

function f_HTML_TextBox($nombre, $valor="", $extras="", $maxlength="", $size="") {

	$valor = is_null($valor) ? "" : $valor;
	$maxlength = $maxlength>=1 ? " maxlength=\"{$maxlength}\" " : "";
	$size = $size>=1 ? " size=\"{$size}\" " : "";

	?>
	<input class=textbox name="<?echo $nombre?>" id="<?echo $nombre?>" 
		 type="text" value="<?echo htmlentities($valor)?>" 
		 <?echo $extras . $maxlength . $size?>>
	<?
}

function f_HTML_TextArea($nombre, $valor="", $extras="", $maxlength="", $size="") {

	$valor = is_null($valor) ? "" : $valor;
	$maxlength = $maxlength>=1 ? " maxlength=\"{$maxlength}\" " : "";
	$size = $size>=1 ? " size=\"{$size}\" " : "";

	?>
	<input class=textarea name="<?echo $nombre?>" id="<?echo $nombre?>" 
		 type="text" value="<?echo htmlentities($valor)?>" 
		 <?echo $extras . $maxlength . $size?>>
	<?
}

function f_HTML_TextBoxPassword($nombre, $valor="", $extras="", 
		$maxlength="", $size="") {

	$valor = is_null($valor) ? "" : $valor;
	$maxlength = $maxlength>=1 ? " maxlength=\"{$maxlength}\" " : "";
	$size = $size>=1 ? " size=\"{$size}\" " : "";

	?>
	<input class=textbox name="<?echo $nombre?>" id="<?echo $nombre?>" 
		 type="password" value="<?echo htmlentities($valor)?>" 
		 <?echo $extras . $maxlength . $size?> >
	<?
}

function f_HTML_TextBoxMAC($nombre, $valor="", $extras="", $nro_bloques) {

	$valor = is_null($valor) ? "" : $valor;
	
	$arr_valores = explode(":", $valor);

	for($i=1; $i<=6; $i++) {

		if ($i>1) {
			echo ":";	
		}
		$v = isset($arr_valores[$i-1]) ? $arr_valores[$i-1] : "";
		?>
		<input class=textbox name="<?echo $nombre."_$i"?>" id="<?echo $nombre."_$i"?>" 
			 type="text" value="<?echo $v?>" 
			 maxlength="2" size="1">
		<?
	}
}

function f_HTML_TextBoxIP($nombre, $valor="", $extras="", $nro_bloques) {

	$valor = is_null($valor) ? "" : $valor;
	
	$arr_valores = explode(".", $valor);

	for($i=1; $i<=$nro_bloques; $i++) {

		if ($i>1) {
			echo ".";	
		}
		$v = isset($arr_valores[$i-1]) ? $arr_valores[$i-1] : "";
		?>
		<input class=textbox name="<?echo $nombre."_$i"?>" id="<?echo $nombre."_$i"?>" 
			 type="text" value="<?echo $v?>" 
			 maxlength="3" size="2" >
		<?
	}
}

function f_Nombre_Mes($numero) {

	$nombre[1] = "Enero";
	$nombre[2] = "Febrero";
	$nombre[3] = "Marzo";
	$nombre[4] = "Abril";
	$nombre[5] = "Mayo";
	$nombre[6] = "Junio";
	$nombre[7] = "Julio";
	$nombre[8] = "Agosto";
	$nombre[9] = "Septiembre";
	$nombre[10] = "Octubre";
	$nombre[11] = "Noviembre";
	$nombre[12] = "Diciembre";

	return $nombre[$numero];
}

function f_Nombre_Dia($numero) {

	$nombre[1] = "Lunes";
	$nombre[2] = "Martes";
	$nombre[3] = "Miércoles";
	$nombre[4] = "Jueves";
	$nombre[5] = "Viernes";
	$nombre[6] = "Sábado";
	$nombre[7] = "Domingo";
	return $nombre[$numero];
}

function f_es_mac($valor) {
	
	$chars = "1234567890ABCDEF";
	$valor = strtoupper($valor);
	if (strlen($valor)!=2) {
		return false;
	}
	for($i=0; $i<strlen($valor); $i++) {
		if (strpos($chars, $valor{$i})===false) {
			return false;
		}
	}
	return true;
}

function f_es_ip($valor) {
	
	$chars = "1234567890";
	$valor = strtoupper($valor);
	if ($valor>254 || $valor<0) {
		return false;
	}
	for($i=0; $i<strlen($valor); $i++) {
		if (strpos($chars, $valor{$i})===false) {
			return false;
		}
	}
	return true;
}

function fncvalidaip($ip){
	$trozos=explode(".",$ip);
	$contador=0;
	$error=1;
	foreach($trozos as $pis=>$valor){
        	if(is_numeric($valor)){
			if($valor>254 || $valor<0){
				return false;
			}else{
				$contador++;
			}
        	}else{
			return false;
		}
	}
	if($contador!=4){ 
        	return false;
	}
	return true;
}
?>
