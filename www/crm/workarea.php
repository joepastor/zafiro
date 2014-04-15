<?
if(isset($HTTP_POST_VARS["login"]) && isset($HTTP_POST_VARS["password"])){
	$HTTP_SESSION_VARS["login"]=$HTTP_POST_VARS["login"];
	$HTTP_SESSION_VARS["password"]=$HTTP_POST_VARS["password"];
}
include "include/top.inc.php";

echo f_dibuja_titulo("Alta de Ticket");
?>
<script language=JavaScript>
function controldatos(){
	if(document.formulario.servidor.value==0){
		alert('Debe seleccionar el servidor correspondiente al ticket');
		return false;
	}
	return true;
}
</script>
<center><select name=servidor onChange="iframe1.location='nuevoticket.php?servidor='+this.value;">
<option value=0>Seleccione Servidor</option>
<?include "./include/servidores.inc.php";?>
</select></center>
<iframe name=iframe1 width=100% height=60% frameborder=0></iframe>
<?
echo "<body class=body vlink=#dddddd link=#dddddd>";
echo "<link rel=stylesheet type='text/css' href='clases.css'>";

?>
