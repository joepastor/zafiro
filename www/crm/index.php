<?
$HTTP_SESSION_VARS["usuario"]="";
$HTTP_SESSION_VARS["password"]="";
?>
<html class=body>
<link rel=stylesheet type='text/css' href='clases.css'>
<body><br><br><br>
<form action="workarea.php" method=post name=form>

<script src="md5-min.js" type="text/javascript"></script>
<table align=center width=10%>
<tr align=center><td><font size=+9><b>CRM</td></tr>
<tr align=center><td><i>Maxcom</td></tr>
<tr><td>&nbsp;</td></tr>
<tr align=center><td class=grillaregistro><b>Usuario</td></tr>
<tr align=center><td><input class=textbox name=login></td></tr>
<tr align=center><td class=grillaregistro><b>Contraseña</td></tr>
<tr align=center><td><input class=textbox name=password type=password></td></tr>
<tr align=center><td><input type="button" class=boton onclick="password.value = hex_md5(password.value);form.submit();" value="Ingresar"></td></tr>
</table>

</form>
</body>
</html>
