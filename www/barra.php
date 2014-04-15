<!DOCTYPE html>
<html>
  <head>
    <title>Zafiro Server</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/codemirror.css">
    <link rel="stylesheet" href="css/codemirror-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/jshint.css">
  </head>
  <body>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>


<div class="navbar navbar-fixed-top navbar-inverse">
  <div class="navbar-inner">
    <a class="brand" href="resumen.php"><img src="Imagenes/ZAFIRO-LOGO.png" width="80px"></a>
    <ul class="nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Networking <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="controlador.php?view=placas">Estado de Placas</a></li>
            <li><a href="controlador.php?view=rutas">Rutas del Servidor</a></li>
            <li><a href="controlador.php?view=arp">Tabla ARP</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sistema <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="controlador.php?view=logsys">Log del Sistema</a></li>
            <li><a href="controlador.php?view=dmesg">Mensajes de Inicio</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Informaci&oacute;n <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="controlador.php?view=anchodebanda">Ancho de Banda</a></li>
            <li><a href="listar.php?list=estadisticas">Estad&iacute;sticas de IP</a></li>
            <li><a href="controlador.php?view=estadoclientes">Estado de Clientes</a></li>
            <li><a href="controlador.php?view=estadonodos">Estado de Nodos VPN</a></li>
            <li><a href="calamaris">Estado de Proxy</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Herramientas <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="controlador.php?view=detectar">Detectar Equipos</a></li>
            <li><a href="controlador.php?view=exe&comando=nslookup">DNS Lookup</a></li>
            <li><a href="controlador.php?view=exe&comando=ping">Ping</a></li>
            <li><a href="controlador.php?view=exe&comando=tracepath">Trazado de Ruta</a></li>
            <li><a href="controlador.php?view=exe&comando=whois">Whois</a></li>
            <li><a href="controlador.php?view=exe&comando=dig">Informaci&oacute;n de Dominio</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Configuracion <b class="caret"></b></a>
          <ul class="dropdown-menu">
	    <li><a href="listar.php?list=filtros">Filtros</a></li>
	    <li><a href="listar.php?list=firewall">Firewall Manual</a></li>
	    <li><a href="abmconfiguracion.php">General</a></li>
	    <li><a href="listar.php?list=canales">Canales</a></li>
	    <li><a href="listar.php?list=planes">Planes</a></li>
	    <li><a href="listar.php?list=clientes">Clientes</a></li>
	    <li><a href="listar.php?list=ipspublicas">IPs Publicas</a></li>
	    <li><a href="listar.php?list=nat">Opciones NAT</a></li>
	    <li><a href="listar.php?list=nodos">Nodos VPN</a></li>
          </ul>
        </li>
        
       <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Acciones <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#" onclick="if(confirm('Desea aplicar los cambios en el servidor?')){location='resumen.php?accion=ejecutar';}"><img src="Imagenes/ok2.png" width="16px"> Aplicar cambios</a></li>
            <li class="dropdown-submenu">
              <a href="#">Reiniciar</a>
              <ul class="dropdown-menu">
                <li><a href="#" onclick="if(confirm('Desea reinciar el servicio VPN?')){location='resumen.php?accion=reiniciarvpn';}"><img src="Imagenes/vpn.png" width="16px"> VPN</a></li>
                <li><a href="#" onclick="if(confirm('Desea reiniciar servicio DHCP?')){location='resumen.php?accion=reiniciardhcp';}"><img src="Imagenes/dhcp.png" width="16px"> DHCP</a></li>
                <li><a href="#" onclick="if(confirm('Desea reiniciar el servicio de red?')){location='resumen.php?accion=reiniciarred';}" ><img src="Imagenes/network.png" width="16px"> Network</a></li>
              </ul>
            </li>

            <li class="divider"></li>
            <li class="nav-header">Warning</li>
            <li><a href="#" onclick="if(confirm('Desea resetear el servidor?')){body.location='resumen.php?accion=reiniciar';}"><img src="Imagenes/reset.png" width="16px"> Resetear</a></li>
            <li><a href="#" onclick="if(confirm('Desea apagar el servidor?')){body.location='resumen.php?accion=apagar';}"> <img src="Imagenes/shutdown.png" width="16px"> Apagar</a></li>
          </ul>
        </li>
    </ul>
	<?php
	if(isset($_SESSION["aplicar"])){
		echo "<img src='Imagenes/warning.png' onclick='if(confirm(\"Desea aplicar los cambios en el servidor?\")){location=\"resumen.php?accion=ejecutar\";}'>";
	}
	?>
  </div>
</div>



  </body>
</html>
