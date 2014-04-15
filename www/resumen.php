<?
include "inclusiones.php";
include "barra.php";

switch ($_GET["accion"]) {
    case "ejecutar":
        $servidor->ejecutar();
        break;
    case "salida":
        $servidor->togglesalida();
        break;
    case "ping":
        $servidor->toggleping();
        break;
    case "limitar":
        $servidor->togglelimitar();
        break;
    case "reiniciarred":
        $servidor->togglereiniciarred();
        break;
    case "reiniciardhcp":
        $servidor->togglereiniciardhcp();
        break;
    case "reiniciarvpn":
        $servidor->togglereiniciarvpn();
        break;
    case "apagar":
        $servidor->apagar();
        break;
    case "reiniciar":
        $servidor->reiniciar();
        break;
}

$sale = $servidor->getsalida() ? "ok.gif" : "error.png";
$limita = !$servidor->getlimitacion() ? "ok.gif" : "error.png";
$ping = $servidor->getping() ? "ok.gif" : "error.png";

/*
$reiniciarred = $servidor->getreiniciarred() ? "networkdisabled.png" : "network.png";
$reiniciardhcp = $servidor->getreiniciardhcp() == 1 ? "dhcpdisabled.png" : "dhcp.png";
$reiniciarvpn = $servidor->getreiniciarvpn() == 1 ? "vpndisabled.png" : "vpn.png";
*/
$rs = sql::query("select count(*) as activos from clientes where clientesest=0");
while ($fila = mysql_fetch_assoc($rs)) {
    $activos = $fila["activos"];
}

$rs = sql::query("select count(*) as activosconsalida from clientes where clientesest=0 and clientessal=1");
while ($fila = mysql_fetch_assoc($rs)) {
    $activoscs = $fila["activosconsalida"];
}

$rs = sql::query("select count(*) as inactivos from clientes where clientesest=1");
while ($fila = mysql_fetch_assoc($rs)) {
    $inactivos = $fila["inactivos"];
}
?>
<div id="contenedor">
<div id="botonera">
    <div class="botoncito" onclick="if(confirm('Desea habilitar/deshabilitar la salida a internet?')){location='resumen.php?accion=salida';}" title='Click para habilitar/deshabilitar la salida a internet'>
        INTERNET<br/><img src='Imagenes/<? echo $sale; ?>' width=32px height=32px border=0/>
    </div>
    <div class="botoncito" onclick="if(confirm('Desea habilitar/deshabilitar la respuesta de ping del servidor?')){location='resumen.php?accion=ping';}" title='Click para habilitar/deshabilitar ping'>
        PING<br/><img src='Imagenes/<? echo $ping; ?>' width=32px height=32px border=0/>
    </div>
    <div class="botoncito" onclick="if(confirm('Desea habilitar/deshabilitar el control de ancho de banda?')){location='resumen.php?accion=limitar';}"  title='Click para habilitar/deshabilitar la limitacion de ancho de banda'>
        LIMITAR<br/><img src='Imagenes/<? echo $limita; ?>' width=32px height=32px border=0/>
    </div>
</div>
<br/>
<div id="resumenclientes">
    <h4>Resumen de Clientes</h4>
    Activos <? echo $activos; ?><br/>
    Activos con salida <? echo $activoscs; ?><br/>
    Inctivos <? echo $inactivos; ?><br/>
</ul>
</div>
<div style="float:left; margin-left: 20px;">
    <div id="placa">
        LAN<br/><a href='mrtg/eth0.html'><img src='./mrtg/eth0-day.png'></a>
    </div>
    <div id="placa">
        WAN<br/><a href='mrtg/eth1.html'><img src='./mrtg/eth1-day.png'></a>
    </div>
    <div id="placa">
        TUN0<br/><a href='mrtg/tun0.html'><img src='./mrtg/tun0-day.png'></a>
    </div>
</div>
</div>
