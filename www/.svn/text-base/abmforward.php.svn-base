<? include "inclusiones.php"; ?>
<body>
    <h1>Editar Regla NAT</h1>
    <?
    $forwardeosid = f_Request("forwardeosid");
    $forwardeospuesrc = f_Request("forwardeospuesrc");
    $forwardeospuedst = f_Request("forwardeospuedst");
    $forwardeosipsrc = f_Request("forwardeosipsrc");
    $forwardeosipdst = f_Request("forwardeosipdst");
    $forwardeosest = f_Request("forwardeosest");

    if (f_Request("ac") == "guardar") {

        $errores = "";

        if ($forwardeospuesrc < 1 || $forwardeospuesrc > 65535) {
            $errores .= "|El puerto de origen no es valido";
        }

        if ($forwardeospuedst < 1 || $forwardeospuedst > 65535) {
            $errores .= "|El puerto de destino no es valido";
        }

        //ip address
        $f = 0;
        for ($i = 1; $i <= 4; $i++) {
            $ips[$i] = f_Request("forwardeosipsrc_$i");
            if (!f_es_ip($ips[$i]) || $ips[$i] == "") {
                if ($f == 0) {
                    $errores .= "|La IP de origen no es valida";
                    $f = 1;
                }
            }
        }
        $forwardeosipsrc = implode(".", $ips);
        unset($ips);

        $f = 0;
        for ($i = 1; $i <= 4; $i++) {
            $ips[$i] = f_Request("forwardeosipdst_$i");
            if (!f_es_ip($ips[$i]) || $ips[$i] == "") {
                if ($f == 0) {
                    $errores .= "|La IP de destino no es valida";
                    $f = 1;
                }
            }
        }
        $forwardeosipdst = implode(".", $ips);
        unset($ips);

        //Mostrar Errores
        if ($errores != "") {
            f_imprime_errores($errores);
        } else {

            if ($forwardeosid > 0) {

                $sql = "update forwardeos set forwardeospuesrc='$forwardeospuesrc', forwardeospuedst='$forwardeospuedst',"
                        . " forwardeosipsrc='" . f_TSQL($forwardeosipsrc) . "', forwardeosipdst='" . f_TSQL($forwardeosipdst) . "',"
                        . " forwardeosest='$forwardeosest' where forwardeosid = $forwardeosid";
            } else {

                $sql = "insert into forwardeos (forwardeospuesrc, forwardeospuedst, forwardeosipsrc, forwardeosipdst, forwardeosest) values "
                        . "('$forwardeospuesrc', '$forwardeospuedst', '" . f_TSQL($forwardeosipsrc) . "', '" . f_TSQL($forwardeosipdst) . "', '$forwardeosest')";
            }
            sql::execute($sql);
            $servidor->aplicar();
            header("Location: listar.php?list=nat");
        }
    } else {

        $sql = "select forwardeosid, forwardeospuesrc, forwardeospuedst, forwardeosipsrc, forwardeosipdst, forwardeosest "
                . " from forwardeos where forwardeosid = $forwardeosid";
        $rs = sql::query($sql);
        if ($fila = mysql_fetch_assoc($rs)) {

            $forwardeosid = $fila['forwardeosid'];
            $forwardeospuesrc = $fila['forwardeospuesrc'];
            $forwardeospuedst = $fila['forwardeospuedst'];
            $forwardeosipsrc = $fila['forwardeosipsrc'];
            $forwardeosipdst = $fila['forwardeosipdst'];
            $forwardeosest = $fila['forwardeosest'];
        }
    }
    ?>

    <script>
        function guardar() {
            document.datos.submit();
        }
    </script>
    <form name="datos" action="?mod=ABMforward&ac=guardar" method="post">
        <table>
            <tr>
                <th>Puerto del servidor</th>
                <td>
                    <? f_HTML_Hidden("forwardeosid", $forwardeosid); ?>
                    <? f_HTML_TextBox("forwardeospuesrc", $forwardeospuesrc, $extras["TextBoxABM"], 5, 4); ?>
                </td>
            </tr>
            <tr>
                <th>Puerto del cliente</th>
                <td><? f_HTML_TextBox("forwardeospuedst", $forwardeospuedst, $extras["TextBoxABM"], 5, 4); ?></td>
            </tr>
            <tr>
                <th>IP Origen</th>
                <td><? f_HTML_TextBoxIP("forwardeosipsrc", $forwardeosipsrc, $extras["TextBoxABM"], 4); ?> (Ingresar 0.0.0.0 para indicar todas las ips)</td>
            </tr>
            <tr>
                <th>IP Destino</th>
                <td><? f_HTML_TextBoxIP("forwardeosipdst", $forwardeosipdst, $extras["TextBoxABM"], 4); ?></td>
            </tr>
            <tr>
                <th>Estado</th>
                <td><? f_HTML_Estado("forwardeosest", $forwardeosest, $extras["EstadoABM"]); ?></td>
            </tr>
        </table>
    </form>
    <center>
        <? f_HTML_Button("boGuardar", "Guardar", $extras["ButtonABM"] . " onclick=\"guardar();\""); ?>
    </center>
</body>
