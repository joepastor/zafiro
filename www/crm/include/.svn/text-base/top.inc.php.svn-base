<?
include "funciones.php";
if(!validausuario($HTTP_SESSION_VARS["login"],$HTTP_SESSION_VARS["password"])){
        ?>
       	<script language="Javascript">
        alert('Usuario o contraseña incorrectos');
        location="index.php";
        </script>
        <?
        exit();
}else{
	$HTTP_SESSION_VARS["usuario"]=validausuario($HTTP_SESSION_VARS["login"],$HTTP_SESSION_VARS["password"]);
}

echo "<table width=100%>";
echo "<tr><td><font color=white size=+2>CRM</td><td align=right>".$HTTP_SESSION_VARS['login']."@".getenv(REMOTE_ADDR)."</td></tr>";
echo "<tr><td><i>Maxcom</td><td align=right>&nbsp;</td></tr>";
echo "</table>";
include "include/menu.inc.php";
?>
