<?
//include "menu.php";
include "inclusiones.php";
include "barra.php";
if (isset($_GET["mac"])) {
    $mac = $_GET["mac"];
//	$mac=explode(":",$mac);
}
$clientesid = f_Request("clientesid");
$clientesdes = f_Request("clientesdes");
$clientesmac = f_Request("clientesmac");
$clientesper = f_Request("clientesper");
$clientesest = f_Request("clientesest");
$clientesip = f_Request("clientesip");
$clientesfecalt = f_Request("clientesfecalt");
$clientesfecbaj = f_Request("clientesfecbaj");
$clientespla = f_Request("clientespla");
$clientesnom = f_Request("clientesnom");
$clientesdir = f_Request("clientesdir");
$clientestel = f_Request("clientestel");
$clientescui = f_Request("clientescui");
$clientesema = f_Request("clientesema");
if (f_Request("clientespro")) {
    $clientespro = 1;
} else {
    $clientespro = 0;
}
if (f_Request("clientessal")) {
    $clientessal = 1;
} else {
    $clientessal = 0;
}

$red = f_RequestRed();

if (f_Request("ac") == "guardar") {

    $errores = "";

    //mac address
    $f = 0;
    for ($i = 1; $i <= 6; $i++) {
        $macs[$i] = f_Request("clientesmac_$i");
        if (!f_es_mac($macs[$i])) {
            if ($f == 0) {
                $errores .= "|La direccion MAC no es valida";
                $f = 1;
            }
        }
    }
    $clientesmac = implode(":", $macs);

    //fecha alta
    $clientesfecalt = f_RequestFecha("clientesfecalt");

    //fecha baja
    $clientesfecbaj = f_RequestFecha("clientesfecbaj");

    if ((strlen($clientesip) > 0 && $clientesip < 1)
            || $clientesip > 254) {
        $errores .= "|El numero IP no es valido";
    }

    if ($clientesip == "") {
        $errores .= "|Debe completar el numero de IP";
    }

    if ($clientespla == "") {
        $errores .= "|Debe seleccionar el plan del cliente. Si el selector de planes se encuentra vacio deberia cargar al menos uno mediante la secci�n de planes.";
    }

    if ($clientesest == 0) {
        $sql = "select clientesnom from clientes where clientesest=0 and clientesip=" . $clientesip . " and clientesid <> " . $clientesid;
        $rs = sql::query($sql);
        $rsclientes = mysql_fetch_array($rs);
        if ($rsclientes['clientesnom'] != "") {
            $nombrecliente = $rsclientes['clientesnom'];
            $errores .= "|El nro de ip " . $clientesip . " se encuentra actualmente asignado para el cliente " . $nombrecliente;
        }
    }

    if ($clientesdes == "") {
        $errores .= "|Debe completar la descripcion";
    }

    if ($clientesnom == "") {
        $errores .= "|Debe completar el nombre";
    }

    //Mostrar Errores
    if ($errores != "") {
        f_imprime_errores($errores);
    } else {

        if ($clientesid > 0) {
            $sql = "update clientes set clientesdes='" . f_TSQL($clientesdes) . "', clientesmac='" . f_TSQL($clientesmac) . "', clientesper='$clientesper', clientesest='$clientesest', clientesip='$clientesip', clientesfecalt='$clientesfecalt', clientesfecbaj='$clientesfecbaj', clientespla='$clientespla', clientesnom='" . f_TSQL($clientesnom) . "', clientesdir='" . f_TSQL($clientesdir) . "', clientestel='" . f_TSQL($clientestel) . "', clientescui='" . f_TSQL($clientescui) . "', clientesema='" . f_TSQL($clientesema) . "', clientespro=" . $clientespro . ", clientessal=" . $clientessal . " where clientesid = $clientesid";
        } else {
            $sql = "insert into clientes (clientesdes, clientesmac, clientesper, clientesest, clientesip, clientesfecalt, clientesfecbaj, clientespla, clientesnom, clientesdir, clientestel, clientescui, clientesema,clientespro,clientessal) values "
                    . "('" . f_TSQL($clientesdes) . "', '" . f_TSQL($clientesmac) . "', '$clientesper', '$clientesest', '$clientesip', '$clientesfecalt', '$clientesfecbaj', '$clientespla', '" . f_TSQL($clientesnom) . "', '" . f_TSQL($clientesdir) . "', '" . f_TSQL($clientestel) . "', '" . f_TSQL($clientescui) . "', '" . f_TSQL($clientesema) . "', " . f_TSQL($clientespro) . ", " . f_TSQL($clientessal) . ")";
        }
        sql::execute($sql);
        $servidor->aplicar();
        header("Location: listar.php?list=clientes");
    }
} else {

    $sql = "select clientesid, clientesdes, clientesmac, clientesper, clientesest, clientesip, "
            . " clientesfecalt, clientesfecbaj, clientespla, clientesnom, clientesdir, clientestel, clientescui, clientesema,clientespro,clientessal "
            . " from clientes where clientesid = $clientesid";

    $rs = sql::query($sql);

    if ($fila = mysql_fetch_assoc($rs)) {

        $clientesdes = $fila['clientesdes'];
        $clientesmac = $fila['clientesmac'];
        $clientesper = $fila['clientesper'];
        $clientesest = $fila['clientesest'];
        $clientesip = $fila['clientesip'];
        $clientesfecalt = $fila['clientesfecalt'];
        $clientesfecbaj = $fila['clientesfecbaj'];
        $clientespla = $fila['clientespla'];
        $clientesnom = $fila['clientesnom'];
        $clientesdir = $fila['clientesdir'];
        $clientestel = $fila['clientestel'];
        $clientescui = $fila['clientescui'];
        $clientesema = $fila['clientesema'];
        $clientespro = $fila['clientespro'];
        $clientessal = $fila['clientessal'];
    }
}
?>

<script>
    function guardar() {
        document.datos.submit();
    }
</script>
<body>
    <h1>Editar Cliente</h1>
    <form name="datos" action="?ac=guardar" method="post">
        <table align=center width=50%>
            <input type="hidden" name="clientesid" value="<? echo $clientesid; ?>"/>
            <tr><th width="150px">Nombre</th><td><? f_HTML_TextBox("clientesnom", $clientesnom, $extras["TextBoxABM"], 45); ?></td></tr>
            <tr>
                <th>Descripci&oacute;n</th>
                <td><? f_HTML_TextBox("clientesdes", $clientesdes, $extras["TextBoxABM"], 45); ?></td>
            </tr>
            <tr>
                <th>Direcci&oacute;n MAC</th>
                <?
                if (isset($mac)) {
                    $clientesmac = $mac;
                }
                ?>
                <td><? f_HTML_TextBoxMAC("clientesmac", $clientesmac, $extras["SelectCantidadABM"], 6); ?></td>

            </tr>
            <tr><th>Estado</th><td><? f_HTML_Estado("clientesest", $clientesest, $extras["EstadoABM"]); ?></td></tr>
            <tr><th>N&uacute;mero IP</th>
                <td><? //f_HTML_TextBox("clientesip", $clientesip, $extras["TextBoxABM"], 3, 1);        ?>
                    <select name=clientesip>
                        <?
			$ipdelserver=explode(".",$ilan->ip);
			$ips = sql::query("select ip from ips where ip not in (select clientesip from clientes where clientesest=0 and clientesip <> '$clientesip') and ip not in ($ipdelserver[3]) and ip not between 251 and 254");
                        while ($caca = mysql_fetch_array($ips)) {
                            if ($clientesip == $caca['ip']) {
                                echo "<option value=" . $caca['ip'] . " selected>" . $red . "." . $caca['ip'] . "</option>";
                            } else {
                                echo "<option value=" . $caca['ip'] . ">" . $red . "." . $caca['ip'] . "</option>";
                            }
                        }
                        ?>
                    </select>
                </td>
            </tr>

            <tr><th>Fecha de Alta</th><td><? $clientesfecalt = $clientesfecalt ? $clientesfecalt : date("Ymd");
                        f_HTML_SelectFecha("clientesfecalt", $clientesfecalt, $extras["SelectFechaABM"]); ?></td></tr>
            <tr><th>Fecha de Baja</th><td><? f_HTML_SelectFecha("clientesfecbaj", $clientesfecbaj, $extras["SelectFechaABM"]); ?></td></tr>
            <tr><th>Plan</th><td>
                    <?
                    $sql = "select distinct planesid as id, planesnom as nombre, planesest as estado "
                            . " from planes "
                            . " where planesest = 0 "
                            . " order by 2";
                    f_HTML_SelectObjeto("clientespla", $clientespla, $extras["SelectABM"], $sql);
                    ?>
                </td>
            </tr>
            <tr><th>Direcci&oacute;n</th><td><? f_HTML_TextBox("clientesdir", $clientesdir, $extras["TextBoxABM"], 45); ?></td></tr>
            <tr><th>Tel&eacute;fono</th><td><? f_HTML_TextBox("clientestel", $clientestel, $extras["TextBoxABM"], 45); ?></td></tr>
            <tr><th>CUIT</th><td><? f_HTML_TextBox("clientescui", $clientescui, $extras["TextBoxABM"], 13, 12); ?></td></tr>
            <tr><th>E-mail</th><td><? f_HTML_TextBox("clientesema", $clientesema, $extras["TextBoxABM"], 45); ?></td></tr>
            <tr>
                <th>Enrutar al proxy</th>
                <td>
                    <?
                    if ($clientespro) {
                        $clientespro = " checked";
                    }
                    f_HTML_CheckBox("clientespro", 1, $clientespro);
                    ?>
                </td>
            </tr>
            <tr>
                <th>Salida Habilitada</th>
                <td>
                    <?	
                    if ($clientessal) {
                        $clientessal = " checked";
                    }f_HTML_CheckBox("clientessal", 1, $clientessal);
                    ?>
                </td>
            </tr>
    </form>
</table>
<br/>
<center>
    <? f_HTML_Button("boVolver", "Volver", $extras["ButtonABM"] . " onclick=\"location='listar.php?list=clientes'\"");?>
    <? f_HTML_Button("boGuardar", "Guardar", $extras["ButtonABM"] . " onclick=\"guardar();\""); ?>
</center>
</body>
