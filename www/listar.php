<?
include "inclusiones.php";
include "barra.php";

if (isset($_GET["orden"])) {
    $orden = $_GET["orden"];
    $_SESSION["orden"]=$_GET["orden"];
}else{
    $orden = $_SESSION["orden"];
}
switch ($_GET["list"]) {
    case "clientes":
        lstclientes();
        break;
    case "filtros":
        lstfiltros();
        break;
    case "firewall":
        lstfirewall();
        break;
    case "canales":
        lstcanales();
        break;
    case "planes":
        lstplanes();
        break;
    case "ipspublicas":
        lstipspublicas();
        break;
    case "nat":
        lstnat();
        break;
    case "dyndns":
        lstdyndns();
        break;
    case "nodos":
        lstnodos();
        break;
    case "estadisticas":
        lstestadisticas();
        break;
    case "puertos":
        lstpuertos();
        break;
}
function lstclientes() {
    global $servidor;
    global $orden;
    //Si está establecido algun parametro, entonces lo ejecuta. Corta salidas, etc.
    if (isset($_GET["cliente"]) && isset($_GET["estado"]) && isset($_GET["activar"]) && isset($_GET["proxy"])) {
        $sql = "update clientes set clientessal=".$_GET["activar"].",clientesest=".$_GET["estado"].",clientespro=".$_GET["proxy"]." where clientesid=".$_GET["cliente"];
        sql::query($sql);
        $servidor->aplicar();
    }
    
    ?>
    <h1>Lista de Clientes</h1>

    <table align="center" width=99%>
        <tr>
            <th><a href="listar.php?list=clientes&orden=clientesnom">Nombre</a></th>
            <th><a href="listar.php?list=clientes&orden=clientesdes">Descripcion</a></th>
            <th><a href="listar.php?list=clientes&orden=clientesip">IP</a></th>
            <th><a href="listar.php?list=clientes&orden=clientesmac">MAC</a></th>
            <th><a href="listar.php?list=clientes&orden=clientespla">Plan</a></th>
            <th><a href="listar.php?list=clientes&orden=canalesnom">Canal</a></th>
            <th><a href="listar.php?list=clientes&orden=canalessub">Subida</a></th>
            <th><a href="listar.php?list=clientes&orden=canalesbaj">Bajada</a></th>
            <th><a href="listar.php?list=clientes&orden=clientessal">Salida</a></th>
            <th><a href="listar.php?list=clientes&orden=clientespro">Proxy</a></th>
            <th><a href="listar.php?list=clientes&orden=clientesest">Estado</a></th>
            <!--
		<th><a href="listar.php?list=clientes&orden=clientestel">Tel&eacute;fono</a></th>
            <th><a href="listar.php?list=clientes&orden=clientesdir">Direcci&oacute;n</a></th>
		-->
        </tr>
        <?
        //Se le suma uno al día para que el día lunes quede como 1 en vez de 0
        $dia = (date("w") == 0) ? 7 : date("w");
        $hora = date("H");
        $orden = !isset($orden) ? "clientesest" : $orden;

        $sql = "select distinct(clientesid) as id, clientesdes, clientesnom as nombre, clientesest as estado , clientesip, planesnom,clientesmac,canalesnom,canalessub,canalesbaj,clientessal,clientespro from clientes left join planes on clientes.clientespla = planes.planesid left join canales on canales.canalesid=planes.planescan where clientesest in (0,1) and planesdia=$dia and planeshor=$hora order by " . $orden;
        $rs = sql::query($sql);
        while ($fila = mysql_fetch_assoc($rs)) {
            if ($fila['estado'] == 1) {
                $font = "<font color=red>";
            } else {
                $font = "";
            }
            ?>
            <tr>
                <td><a href="abmcliente.php?clientesid=<? echo $fila['id'] ?>"><? echo $font . htmlentities($fila['nombre']) ?></a></td>
                <td><? echo $font . htmlentities($fila['clientesdes']) ?></td>
 		<td><a href="http://<? echo f_RequestRed() . '.' . htmlentities($fila['clientesip']); ?>" target=_blank><? echo $font . f_RequestRed() . "." . htmlentities($fila['clientesip']) ?></td>
 		<td><? echo mb_strtoupper(htmlentities($fila['clientesmac'])) ?></td>
                <td><? echo htmlentities($fila['planesnom']) ?></td>
                <td><? echo htmlentities($fila['canalesnom']) ?></td>
                <td><? echo htmlentities($fila['canalessub']) ?> Kb/s</td>
                <td><? echo htmlentities($fila['canalesbaj']) ?> Kb/s</td>
                <td>
                    <?
                    if ($fila['clientessal']) {
                        $flag = 0;
                        $texto = "<font color=lightgreen>Activada";
                    } else {
                        $flag = 1;
                        $texto = "<font color=red>Desactivada";
                    }
                    echo "<a href='listar.php?list=clientes&activar=" . $flag . "&estado=" . $fila['estado'] . "&cliente=" . $fila['id'] . "&proxy=" . $fila['clientespro'] . "'>" . $texto . "</a>";
                    ?>
                </td>
                <td>

                    <?
                    if ($fila['clientespro']) {
                        $flag = 0;
                        $texto = "<font color=lightgreen>Enrutado";
                    } else {
                        $flag = 1;
                        $texto = "<font color=red>No enrutado";
                    }
                    echo "<a href='listar.php?list=clientes&activar=" . $fila['clientessal'] . "&estado=" . $fila['estado'] . "&cliente=" . $fila['id'] . "&proxy=" . $flag . "'>" . $texto . "</a>";
                    ?>

			<? //echo htmlentities($fila['clientespro']) ?></td>

                <td>
                    <?
                    if ($fila['estado']) {
                        $flag = 0;
                        $texto = "<font color=red>Desactivada";
                    } else {
                        $flag = 1;
                        $texto = "<font color=lightgreen>Activada";
                    }
                    echo "<a href='listar.php?list=clientes&activar=" . $fila['clientessal'] . "&estado=" . $flag . "&cliente=" . $fila['id'] . "&proxy=" . $fila['clientespro'] . "'>" . $texto . "</a>";
                    ?>
                </td>
                <!--
		<td><? echo htmlentities($fila['clientestel']) ?></td>
                <td><? echo htmlentities($fila['clientesdir']) ?></td>
		-->
            </tr>
        <? } ?>
    </table>
    <center><br>
        <?
        $rs = sql::query("select " . $servidor->maxusers . " > (select count(*) from clientes where clientesest=0) as nuevo");
        $nuevo = mysql_fetch_array($rs);
        if ($nuevo["nuevo"] == 1) {
            ?>
            <button value="nuevo" type="button" onclick="location='abmcliente.php?clientesid=0'">Nuevo</button>
            <?
        } else {
            echo "Ha alcanzado el numero maximo de usuarios en este servidor";
        }
        ?>
    </center>
    <?
}

function lstfiltros() {
    ?>
    <h1>Filtros</h1>
    <table align=center>
        <tr>
            <th rowspan=2>Nombre</th>
            <th colspan=3>Origen</th>
            <th colspan=3>Destino</th>
            <th rowspan=2>Tipo</th>
            <th rowspan=2>Estado</th>
            <th rowspan=2></th>
        </tr>
        <tr>
            <th>Interface</th>
            <th>IP</th>
            <th>Puerto</th>
            <th>Interface</th>
            <th>IP</th>
            <th>Puerto</th>
        </tr>
        <?
        $sql = "select id,nombre,ipsource,ipdestino,puertosource,puertodestino,tipo,estado,interfaceentrada,interfacesalida from filtros where estado in (0,1)";
        $rs = sql::query($sql);
        while ($fila = mysql_fetch_assoc($rs)) {
            if (htmlentities($fila['estado']) == 1) {
                $font = "<font color=red>";
            } else {
                $font = "";
            }
            echo "<tr>
                <td>" . htmlentities($fila['nombre']) . "</td>
                <td>" . htmlentities($fila['interfaceentrada']) . "</td><td>" . htmlentities($fila['ipsource']) . "</td>
                <td>" . htmlentities($fila['puertosource']) . "</td>
                <td>" . htmlentities($fila['interfacesalida']) . "</td><td>" . htmlentities($fila['ipdestino']) . "</td>
                <td>" . htmlentities($fila['puertodestino']) . "</td>
                <td>" . htmlentities($fila['tipo']) . "</td>
                <td>" . $font . htmlentities($arrEstado[$fila['estado']]) . "</td>
                <td><a href='abmfiltros.php?id=" . $fila['id'] . "'>Editar</a></td>
            </tr>";
        }
        ?>

    </table>
    <br/>
    <center>
        <? echo f_HTML_Button("boNuevo", "Nuevo", $extras["ButtonABM"] . " onclick=\"location='abmfiltros.php?id=0'\""); ?>
    </center>
    <?
}

function lstfirewall() {
    global $arrEstado;
    ?>
    <h1>Reglas Manuales de Firewall</h1>
    <table align=center>
        <tr>
            <th>Comentario</th>
            <th>Comando</th>
            <th>Orden</th>
            <th>Estado</th>
            <th></th>
        </tr>
        <?
        $sql = "select id,comando, estado, comentario,orden from firewall where estado in (0,1) order by orden";
        $rs = sql::query($sql);
        while ($fila = mysql_fetch_assoc($rs)) {
            if (htmlentities($fila['estado']) == 1) {
                $font = "<font color=red>";
            } else {
                $font = "";
            }
            echo "<tr>
                <td>" . htmlentities($fila['comentario']) . "</td>
                <td>iptables " . htmlentities($fila['comando']) . "</td>
                <td>" . htmlentities($fila['orden']) . "</td>
                <td>" . $font . htmlentities($arrEstado[$fila['estado']]) . "</td>
                <td><a href='abmfirewall.php?id=" . $fila['id'] . "'>Editar</a></td>
                </tr>";
        }
        ?>
    </table>
    <br/>
    <center>
        <? echo f_HTML_Button("boNuevo", "Nuevo", $extras["ButtonABM"] . " onclick=\"location='abmfirewall.php?id=0'\""); ?>
    </center>
    <?
}

function lstcanales() {
    ?>
    <h1>Lista de Canales</h1>
    <table align=center>
        <tr>
            <th>Descripci&oacute;n</th>
            <th>Subida</th>
            <th>Bajada</th>
            <th>Estado</th>
            <th></th>
        </tr>    
        <?
        $sql = "select canalesid as id, canalesnom as nombre, canalessub, canalesbaj, canalesest as estado "
                . " from canales "
                . " where canalesest in (0,1) "
                . " order by canalesest, canalesnom";
        $rs = sql::query($sql);
        while ($fila = mysql_fetch_assoc($rs)) {
            ?>
            <tr <?
        if ($fila['estado'] == 1) {
            echo 'bgcolor=red';
        }
            ?>>
                <td><? echo htmlentities($fila['nombre']); ?></td>
                <td><? echo htmlentities($fila['canalessub']); ?> Kbits</td>
                <td><? echo htmlentities($fila['canalesbaj']); ?> Kbits</td>
                <td><? echo htmlentities($arrEstado[$fila['estado']]); ?></td>
                <td><a href="abmcanal.php?canalesid=<? echo $fila['id']; ?>">Editar</a></td>
            </tr>
            <?
        }
        ?>
    </table>
    <br/>
    <center>
        <?
        f_HTML_Button("boNuevo", "Nuevo", $extras["ButtonABM"] . " onclick=\"location='abmcanal.php?canalesid=0'\"");
        ?>
    </center>
    <?
}

function lstplanes() {
    ?>
    <h1>Lista de Planes</h1>
    <table align=center>
        <tr>
            <th>Descripci&oacute;n</th>
            <th>Canal Actual</th>
            <th>Estado</th>
            <th></th>
        </tr>
        <?
        $dia = date("w") + 1;
        $hora = date("H");

        $sql = "select distinct planesid as id, planesnom as nombre, planesest as estado, canalesnom"
                . " from planes "
                . " left join canales on planescan=canalesid "
                . " where planesest in (0,1) and planesdia=$dia and planeshor=$hora "
                . " order by 3";
        $rs = sql::query($sql);
        while ($fila = mysql_fetch_assoc($rs)) {
            if ($fila['estado'] == 1) {
                $font = "<font color=red>";
            } else {
                $font = "";
            }
            ?>
            <tr>
                <td><? echo $font . htmlentities($fila['nombre']) ?></td>
                <td><? echo $font . htmlentities($fila['canalesnom']) ?></td>
                <td><? echo $font . htmlentities($arrEstado[$fila['estado']]) ?></td>
                <td><a href="abmplan.php?planesid=<? echo $fila['id'] ?>">Editar</a></td>
            </tr>
        <? } ?>
    </table>
    <br>
    <center>
        <?
        f_HTML_Button("boNuevo", "Nuevo", $extras["ButtonABM"] . " onclick=\"location='abmplan.php?planesid=0'\"");
        ?>
    </center>
    <?
}

function lstipspublicas() {
    ?>
    <h1>Lista de IPs Publicas</h1>
    <table align=center>
        <tr><th>Cliente</th><th>IP</th><th>IV</th><th>Estado</th><th></th></tr>
        <?
        $sql = "select ipsfijasid as id, clientesnom, ipsfijasip, ipsfijasint,ipsfijasest as estado "
                . " from ipsfijas inner join clientes on (ipsfijascli=clientesid) where ipsfijasest in (0,1)"
                . " order by 5";
        $rs = sql::query($sql);
        while ($fila = mysql_fetch_assoc($rs)) {
            if (htmlentities($fila['estado']) == 1) {
                $font = "<font color=red>";
            } else {
                $font = "";
            }
            ?>
            <tr>
                <td><? echo $font . htmlentities($fila['clientesnom']) ?></td>
                <td><? echo $font . htmlentities($fila['ipsfijasip']) ?></td>
                <td><? echo $font . htmlentities($fila['ipsfijasint']) ?></td>
                <td><? echo $font . htmlentities($arrEstado[$fila['estado']]) ?></td>
                <td><a href="abmipfija.php?ipsfijasid=<? echo $fila['id'] ?>">Editar</a></td>
            </tr>
            <?
        }
        ?>
    </table>
    <br>
    <center>
        <?
        f_HTML_Button("boNuevo", "Nuevo", $extras["ButtonABM"] . " onclick=\"location='abmipfija.php?ipsfijasid=0'\"");
        ?>
    </center>
    </body>
    <?
}

function lstnat() {
    ?>
    <h1>Opciones NAT</h1>
    <table align=center>
        <tr>
            <th>Descripci&oacute;n</th>
            <th>IP de Origen</th>
            <th>Puerto del Servidor</th>
            <th>IP Destino</th>
            <th>Puerto Destino</th>
            <th>Estado</th>
            <th>&nbsp;</th>
        </tr>
        <?
        $sql = "select forwardeosid as id, forwardeosest as estado, concat(forwardeospuesrc, '-', forwardeospuedst) as nombre, forwardeospuesrc,forwardeospuedst, forwardeosipdst, forwardeosipsrc "
                . " from forwardeos "
                . " where forwardeosest in (0,1) "
                . " order by 2";
        $rs = sql::query($sql, $db);
        while ($fila = mysql_fetch_assoc($rs)) {
            if ($fila['estado'] == 1) {
                $font = "<font color=red>";
            } else {
                $font = "";
            }
            ?>
            <tr>
                <td><? echo $font . htmlentities($fila['nombre']) ?></td>
                <td><? echo $font . htmlentities($fila['forwardeosipsrc']) ?></td>
                <td><? echo $font . htmlentities($fila['forwardeospuesrc']) ?></td>
                <td><? echo $font . htmlentities($fila['forwardeosipdst']) ?></td>
                <td><? echo $font . htmlentities($fila['forwardeospuedst']) ?></td>
                <td><? echo $font . htmlentities($arrEstado[$fila['estado']]) ?></td>
                <td><a href="abmforward.php?forwardeosid=<? echo $fila['id'] ?>">Editar</a></td>
            </tr>
            <?
        }
        ?>
    </table>
    <br>
    <center>
        <?
        f_HTML_Button("boNuevo", "Nuevo", $extras["ButtonABM"] . " onclick=\"location='abmforward.php?forwardeosid=0'\"");
        ?>
    </center>
    <?
}

function lstdyndns() { //OBSOLETA????
    ?>
    <h1>DynDNS</h1>
    <table align=center>
        <tr>
            <th>Dominio</th>
            <th>Interface</th>
            <th>Servidor</th>
            <th>Usuario</th>
            <th>Estado</th>
            <th></th>
        </tr>
        <?
        $sql = "select id,protocolo,interface,servidor,usuario,password,dominio,estado from dyndns where estado in (0,1)";
        $rs = sql::query($sql);
        while ($fila = mysql_fetch_assoc($rs)) {
            if (htmlentities($fila['estado']) == 1) {
                $font = "<font color=red>";
            } else {
                $font = "";
            }
            echo "<tr><td>" . htmlentities($fila['dominio']) . "</td><td>" . htmlentities($fila['interface']) . "</td><td>" . htmlentities($fila['servidor']) . "</td><td>" . htmlentities($fila['usuario']) . "</td><td>" . $font . htmlentities($arrEstado[$fila['estado']]) . "</td><td><a href='abmdyndns.php?id=" . $fila['id'] . "'>Editar</a></td></tr>";
        }
        ?>
    </table>
    <br/>
    <center>
        <?
        echo f_HTML_Button("boNuevo", "Nuevo", $extras["ButtonABM"] . " onclick=\"location='abmdyndns.php?id=0'\"");
        ?>
    </center>
    <?
}

function lstnodos() {
    global $servidor;
    ?>
    <head>
        <script language="JavaScript">
            function openpopup(pagina) {
                var opciones="toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=508, height=365, top=85, left=140";
                window.open(pagina,"",opciones);
            }
        </script>
    </head>
    <h1>Nodos VPN</h1>
    <div id="nodoscontenedor">
        <?
        $directorio = opendir($servidor->openvpndir);
        while ($archivo = readdir($directorio)) {
            if (substr($archivo, -5) == '.conf') {
                $contador++;
                $elo = fopen($servidor->openvpndir . "/" . $archivo, "r");
                for ($i = 0; $i < 9; $i++) {
                    fgets($elo);
                    if ($i == 1) {
                        $ip = explode(" ", fgets($elo));
                    }
                    if ($i == 3) {
                        $pto = explode(" ", fgets($elo));
                    }
                }
                fclose($elo);
                $nodo = substr($archivo, 0, strlen($archivo) - 5);
                ?>
                <div class="nodovpn">
                    <a href='abmnodovpn.php?accion=editar&nodo=<? echo $nodo; ?>'>
                        <img src='Imagenes/vpn.png' border=0></a><br/>
                    <b><? echo $nodo; ?></b><br/>
                    <? echo $ip[1] . ":" . $pto[1]; ?><br/>
                    <img width=24px src='Imagenes/tux.png' onclick="location='controlador.php?ejecutar=bajarvpn&tipo=conf&nodo=<? echo $nodo; ?>'">
                    <img width=24px src='Imagenes/windows.png' onclick="location='controlador.php?ejecutar=bajarvpn&tipo=ovpn&nodo=<? echo $nodo; ?>'">
                    <img width=24px src='Imagenes/llave.png' onclick="location='controlador.php?ejecutar=bajarvpn&tipo=key&nodo=<? echo $nodo; ?>'">
                </div>
                <?
            }
        }
        closedir($directorio);
        ?>
    </div>
    <br/>
    <center>
        <? echo f_HTML_Button("boNuevo", "Nuevo", $extras["ButtonABM"] . " onclick=\"location='abmnodovpn.php?accion=nuevo'\""); ?>
    </center>
    <?
}

function lstestadisticas() {
    global $ilan;
    ?>
    <h1>Estadisticas por cliente</h1>
    <?
//    $sql = "select configuracionocuoct,configuracionocu from configuracion";
//    $rs = sql::query($sql);
//    $config = mysql_fetch_assoc($rs);
//    $ocultamiento = $config["configuracionocu"];
//    $ocultamientoocteto = $config["configuracionocuoct"];

    $sql = "select distinct(clientesid) as id, clientesdes, clientesnom as nombre, clientesest as estado , clientesip, planesnom from clientes " . " inner join planes on clientes.clientespla = planes.planesid where clientesest in (0,1) order by clientesest,clientesnom";
    $rs = sql::query($sql);
    while ($fila = mysql_fetch_assoc($rs)) {
        if ($ocultamiento == 1) {
            $ip = f_RequestRed() . "." . htmlentities($fila['clientesip']) . ".10";
        } else {
            $ip = f_RequestRed() . "." . htmlentities($fila['clientesip']);
        }
        ?>
        <div>
            <div class="nodovpn">
                <?
                if ($fila['estado'] == 1) {
                    echo '<font color="#FF0000"><b>';
                } else {
                    echo '<font color="#00DD00"><b>';
                }
                echo htmlentities($fila['nombre'])
                ?>
                <br/>
                (<? echo htmlentities($fila['clientesdes']) ?>)
                <br/><? echo $ip ?></a>
                <br/>Plan <? echo htmlentities($fila['planesnom']) ?>
                <br/><? echo htmlentities($arrEstado[$fila['estado']]) ?>
            </div>
            <div>
                <a href="mrtg/<? echo $ip; ?>.html"><img width=500px height=130px src="mrtg/<? echo f_RequestRed() . "." . htmlentities($fila['clientesip']); ?>-day.png"></a>
            </div>
        </div>
        <?
    }
}

function lstpuertos() {
    global $ilan;
    ?>
    <h1>Estadisticas por puerto</h1>
    <div>FTP<BR/>
        <a href="./mrtg/ftp.html"><img src="mrtg/ftp-day.png"></a>
    </div>
    <div>WWW<br/>
        <a href="./mrtg/www.html"><img src="mrtg/www-day.png"></a>
    </div>
    <?
}
?>
