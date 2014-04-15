<?php
include "inclusiones.php";
include "barra.php";

function arp() {
    ?>
    <h1>Tabla ARP del sistema</h1>
    <table align=center>
        <tr><th>IP</th><th>HW Tipo</th><th>Flags</th><th>MAC</th><th>Mask</th><th>Dispositivo</th></tr>
        <?
        $fd = fopen("/proc/net/arp", "r");
        $erra = 0;
        while (!feof($fd)) {
            $caca = trim(fgets($fd, 1024));
            if ($erra == 1) {
                echo "<tr>";
                $trozos = explode(" ", $caca);
                $c = 0;
                $incompleto = 0;
                foreach ($trozos as $pis => $valor) {
                    if ($valor != "") {
                        if ($valor == "(incomplete)") {
                            ?>
                            <td>&nbsp;</td>
                            <td><? echo $valor; ?></td>
                            <td>&nbsp;</td>
                            <?
                            $incompleto = 1;
                        } else {
                            if ($c == 3) {
                                if (!$incompleto) {
                                    ?>
                                    <td><a href="abmcliente.php?mac=<? echo $valor; ?>&clientesid=0"><? echo $valor; ?></a></td>
                                    <?
                                } else {
                                    echo "<td>" . $valor . "</td>";
                                }
                            } else {
                                echo "<td>" . $valor . "</td>";
                            }
                        }
                        $c++;
                    }
                }
                echo "</tr>";
            }
            $erra = 1;
        }
        ?>
    </table>
    <?
}

function logsys() {
    global $servidor;
    echo "<h1>Log del sistema</h1>";
    $syslog = "";
    try {
        $fd = fopen($servidor->syslogfile, "r");
        if ($fd) {
            while (!feof($fd)) {
                $syslog = trim(fgets($fd, 1024)) . "<br>" . $syslog;
            }
            echo "<pre>" . $syslog . "</pre>";
        }
    } catch (Exception $e) {
        echo 'Excepción capturada: ', $e->getMessage(), "\n";
    }
}

function placas() {
   global $servidor;
    echo "<h1>Estado de placas</h1>";
    $placas = "";
    $fd = fopen($servidor->placasinfo, "r");
    if ($fd) {
        while (!feof($fd)) {
            $placas.=trim(fgets($fd, 1024)) . "<br>";
        }
        echo "<pre>" . $placas . "</pre>";
    }
}

function dmesg() {
    global $servidor;
    echo "<h1>Mensajes de incio del servidor</h1>";
    $dmesg = "";
    $fd = fopen($servidor->msginiciofile, "r");
    if ($fd) {
        while (!feof($fd)) {
            $dmesg.=trim(fgets($fd, 1024)) . "<br>";
        }
        echo "<pre>" . $dmesg . "</pre>";
    }
}

function rutas() {
    echo "<h1>Rutas del servidor</h1>";
    echo '<pre>';
    system("routel");
    system("killall routel");
    echo '</pre>';
}

function detectar() {
    echo "<h1>Detectar equipos</h1>";
    //$register_globals = (bool) ini_get('register_gobals');
    $system = ini_get('system');
    $iLan = new iLan();
    $x = explode(".", $iLan->ip);
    $rango = $x[0] . "." . $x[1] . "." . $x[2] . ".*";
    echo "<h2>" . $rango . "</h2>";
    echo '<pre>';
    system("nmap -sP $rango");
    system("killall nmap");
    echo "</pre>";
}

function estadonodos() {
    global $servidor;
    echo "<h1>Estado de Nodos VPN</h1>";
    echo "<table align=center><tr><th>Nombre</th><th>Remoto</th><th>IP Left</th><th>IP Right</th><th>Enruta hacia</th><th>Ping</th></tr>";

    $directorio = opendir($servidor->openvpndir);
    if (!$directorio) {
        echo "error";
        die();
    }
    while ($archivo = readdir($directorio)) {
        //if (ereg('.conf', $archivo)) {
        if (substr($archivo, -5) == ".conf") {
            $elo = fopen($servidor->openvpndir . "/" . $archivo, "r");
            $nombre = substr($archivo, 0, strlen($archivo) - 5);
            while (!feof($elo)) {
                $z = fgets($elo);
                $buffer = explode(" ", $z);
                if ($buffer[0] == "ifconfig") {
                    $right = $buffer[2];
                    $left = $buffer[1];
                }
                if ($buffer[0] == "route") {
                    $red = $buffer[1];
                    $mascara = $buffer[2];
                }
                if ($buffer[0] == "remote") {
                    $remoto = $buffer[1];
                }
                if ($buffer[0] == "float\n") {
                    $remoto = "VARIABLE";
                }
                if ($buffer[0] == "float") {
                    $remoto = "float";
                }
            }
            fclose($elo);
            if (fncping($right, 1) == 1) {
                $ping = "<img src='Imagenes/ok.gif' width=24px height=24px>";
            } else {
                $ping = "<img src='Imagenes/error.png' width=24px height=24px>";
            }
            echo "<tr><td>" . $nombre . "</td><td>" . $remoto . "</td><td>" . $left . "</td><td>" . $right . "</td><td>" . $red . "/" . $mascara . "</td><td>" . $ping . "</td></tr>";
        }
    }
    echo "</table>";
}

function estadoclientes() {
    echo "<h1>Estado de Clientes</h1>";
    echo "<table align=center><tr><th>Clientes</th><th>Descripcion</th><th>IP</th><th>Ping</th></tr>";
    $sql = "select clientesnom,clientesdes,clientesip,clientesest from clientes where clientesest=0";
    //$rs = mysql_query($sql, $db);
    $rs = sql::query($sql);
    while ($fila = mysql_fetch_assoc($rs)) {
        if (htmlentities($fila['clientesest']) == 1) {
            $font = "<font color=red>";
        } else {
            $font = "";
        }
        if (fncping(f_RequestRed() . "." . $fila['clientesip'], 1) == 1) {
            $ping = "<img src='Imagenes/ok.gif' width=24px height=24px>";
        } else {
            $ping = "<img src='Imagenes/error.png' width=24px height=24px>";
        }
        echo "<tr><td>" . $fila['clientesnom'] . "</td><td>" . $fila['clientesdes'] . "</td><td>" . f_RequestRed() . "." . $fila['clientesip'] . "</td><td>" . $ping . "</td></tr>";
    }
    echo "</table>";
}

function exe($comando, $parametro="") {
    echo "<h1>" . $comando . "</h1>";

    $max_count = 5; //maximum count for ping command
    $unix = 1; //set this to 1 if you are on a *unix system      
    $windows = 0; //set this to 1 if you are on a windows system

    $register_globals = (bool) ini_get('register_gobals');
    $system = ini_get('system');

    If ($register_globals) {
        $ip = getenv(REMOTE_ADDR);
        $self = $PHP_SELF;
    } else {
        $submit = $_GET['submit'];
        $count = $_GET['count'];
        $host = $_GET['host'];
        $ip = $_SERVER['REMOTE_ADDR'];
        $self = $_SERVER['PHP_SELF'];
    }
// form submitted ?
    If (isset($parametro) && $parametro != "") {
        // over count ?
        If ($count > $max_count) {
            echo 'Maximum for count is: ' . $max_count;
        } else {
            // replace bad chars
            $host = preg_replace("/[^A-Za-z0-9.-]/", "", $host);
            $count = preg_replace("/[^0-9]/", "", $count);
            echo("<h2>Resultado de $comando a $parametro</h2>");
            echo '<pre>';
            //check target IP or domain
            if ($comando == "ping") {
                $adicional = "-c 3";
            }
            echo "$comando $parametro $adicional";
            system("$comando $parametro $adicional");
            system("killall $comando"); // kill all ping processes in case there are some stalled ones or use echo 'ping' to execute ping without shell
            echo '</pre>';

            echo "<a href='controlador.php?view=exe&comando=$comando'>Realizar otra b&uacute;squeda</a>";
        }
    } else {
        ?>
        <p align=center>Su IP es: <? echo $ip; ?></p>
        <form method="get" action="controlador.php">
            <input type="hidden" name="view" value="exe">
            <input type="hidden" name="comando" value="<? echo $comando; ?>">
            Ingrese la IP o host <input type="text" name="parametro" value=<? echo $ip; ?>></input>
            <button type="submit" name="submit">Enviar</button>
        </form>
        <br><b><? echo $system; ?></b>
        <?
    }
}

function anchodebanda($parametro="") {
    ?>
    <h1>Ancho de banda asignado</h1>
    <center><img src="./rrdtool/bw-1<? echo $parametro; ?>.png"><br></center>
    <center>
        <a href="controlador.php?view=anchodebanda&parametro=hour">Horario</a>
        <a href="controlador.php?view=anchodebanda&parametro=day">Diario</a>
        <a href="controlador.php?view=anchodebanda&parametro=week">Semanal</a>
        <a href="controlador.php?view=anchodebanda&parametro=month">Mensual</a>
        <a href="controlador.php?view=anchodebanda&parametro=year">Anual</a>
    </center>
    <?
}

function puertos($parametro="") {
    ?>
    <h1>Tr&aacute;fico de puertos</h1>
    <center><img src="./rrdtool/bw-1<? echo $parametro; ?>.png"><br></center>
    <center>
        <a href="controlador.php?view=anchodebanda&parametro=hour">Horario</a>
        <a href="controlador.php?view=anchodebanda&parametro=day">Diario</a>
        <a href="controlador.php?view=anchodebanda&parametro=week">Semanal</a>
        <a href="controlador.php?view=anchodebanda&parametro=month">Mensual</a>
        <a href="controlador.php?view=anchodebanda&parametro=year">Anual</a>
    </center>
    <?
}

function bajarvpn($parametros) {
    global $servidor;
    if (isset($_REQUEST["tipo"]) && isset($_REQUEST["nodo"])) {
        switch ($_REQUEST["tipo"]) {
            case "key":
                $ruta = $servidor->openvpndir . "/" . $_REQUEST["nodo"] . ".key";
                break;
            case "conf":
                $ruta = $servidor->vpnclidir . "/" . $_REQUEST["nodo"] . ".conf";
                break;
            case "ovpn":
                $ruta = $servidor->vpnclidir . "/" . $_REQUEST["nodo"] . ".ovpn";
                break;
        }
        if ($ruta) {
            $nombre = basename($ruta);
            header("Content-Disposition: attachment; filename=$nombre\n\n");
            header("Content-Type: application/force-download");
            readfile($ruta);
        }
    }
    //header("Location: listar.php?list=nodos");
}

//MENU

if (isset($_GET["view"])) {
    switch ($_GET["view"]) {
        case "arp":
            arp();
            break;
        case "logsys":
            logsys();
            break;
        case "placas":
            placas();
            break;
        case "dmesg":
            dmesg();
            break;
        case "rutas":
            rutas();
            break;
        case "detectar":
            detectar();
            break;
        case "estadonodos":
            estadonodos();
            break;
        case "estadoclientes":
            estadoclientes();
            break;
        case "exe":
            if (isset($_GET["comando"])) {
                if (isset($_GET["parametro"])) {
                    exe($_GET["comando"], $_GET["parametro"]);
                } else {
                    exe($_GET["comando"]);
                }
            }
            break;
        case "anchodebanda":
            if (isset($_GET["parametro"])) {
                anchodebanda($_GET["parametro"]);
            } else {
                anchodebanda();
            }
            break;
    }
}
if (isset($_GET["ejecutar"])) {
    switch ($_GET["ejecutar"]) {
        case "aplicar":
            Servidor::aplicar();
            echo "Ejecutado";
        case "bajarvpn":
            bajarvpn($_REQUEST);
            break;
    }
}
?>
