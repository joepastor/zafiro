<? include "inclusiones.php"; ?>
<body>
    <h1>Editar IP Fija</h1>
    <?
    $sql3 = "";
    $sql2 = "";
    $ipsfijasid = f_Request("ipsfijasid");
    $ipsfijasip = f_Request("ipsfijasip");
    $ipsfijasusu = f_Request("ipsfijasusu");
    $ipsfijaspas = f_Request("ipsfijaspas");
    $ipsfijascli = f_Request("ipsfijascli");
    $ipsfijasest = f_Request("ipsfijasest");
    $ipsfijasint = f_Request("ipsfijasint");
    if (f_Request("ac") == "guardar") {
        $errores = "";
        //ip address
        $f = 0;
        for ($i = 1; $i <= 4; $i++) {
            $ips[$i] = f_Request("ipsfijasip_$i");
            if (!f_es_ip($ips[$i]) || $ips[$i] == "") {
                if ($f == 0) {
                    $errores .= "|La IP no es valida";
                    $f = 1;
                }
            }
        }
        $ipsfijasip = implode(".", $ips);
        unset($ips);

        if (!($ipsfijascli >= 1)) {
            $errores .= "|Debe seleccionar un cliente";
        }

        if ($ipsfijasint == "") {
            $errores .= "|Debe seleccionar la interface virtual";
        }

        //Mostrar Errores
        if ($errores != "") {
            f_imprime_errores($errores);
        } else {
            if ($ipsfijasid > 0) {
                if ($ipsfijasest == 0) {
                    $sqlexiste = "select interfacesvirtualesint from interfacesvirtuales where interfacesvirtualesint='$ipsfijasint' and interfacesvirtualesest=1";
                    $rsexiste = sql::query($sqlexiste);
                    if ($existe = mysql_fetch_assoc($rsexiste)) {
                        $ipsfijasint = fncinterfacevirtual();
                        $sql3 = "update ipsfijas set ipsfijasint='$ipsfijasint' where ipsfijasid=$ipsfijasid";
                        sql::execute($sql3);
                    }
                    $sql2 = "update interfacesvirtuales set interfacesvirtualesest=1 where interfacesvirtualesint='$ipsfijasint'";
                } else {
                    $sql2 = "update interfacesvirtuales set interfacesvirtualesest=0 where interfacesvirtualesint='$ipsfijasint'";
                }
                $sql = "update ipsfijas set ipsfijasip='" . f_TSQL($ipsfijasip) . "', ipsfijascli='$ipsfijascli', ipsfijasest='$ipsfijasest', ipsfijasint='$ipsfijasint' where ipsfijasid = $ipsfijasid";
            } else {
                $sql = "insert into ipsfijas (ipsfijasid, ipsfijasip, ipsfijascli, ipsfijasest,ipsfijasint) values "
                        . "($ipsfijasid, '" . f_TSQL($ipsfijasip) . "', '$ipsfijascli', '$ipsfijasest','$ipsfijasint')";
                $sql2 = "update interfacesvirtuales set interfacesvirtualesest=1 where interfacesvirtualesint='$ipsfijasint'";
            }
            sql::execute($sql);
            sql::execute($sql2);
            $servidor->aplicar();
            header("Location: listar.php?list=ipspublicas");
        }
    } else {

        $sql = "select ipsfijasid, ipsfijasip, ipsfijascli, ipsfijasest,ipsfijasint "
                . " from ipsfijas where ipsfijasid = $ipsfijasid";
        $rs = sql::query($sql);
        if ($fila = mysql_fetch_assoc($rs)) {
            $ipsfijasip = $fila['ipsfijasip'];
            $ipsfijascli = $fila['ipsfijascli'];
            $ipsfijasest = $fila['ipsfijasest'];
            $ipsfijasint = $fila['ipsfijasint'];
        }
    }
    ?>

    <script>
        function guardar() {
            document.datos.submit();
        }
    </script>
    <form name="datos" action="?mod=ABMipfija&ac=guardar" method="post">
        <table>
            <tr>
                <td>IP</td>
                <td>
                    <? f_HTML_Hidden("ipsfijasid", $ipsfijasid); ?>
                    <? f_HTML_TextBoxIP("ipsfijasip", $ipsfijasip, $extras["TextBoxABM"], 4); ?>
                </td>
            </tr>
            <tr>
                <td>Cliente</td>
                <td>
                    <?
                    $sql = "select clientesid as id, clientesnom as nombre, clientesest as estado "
                            . " from clientes "
                            . " where clientesest=0 "
                            . " order by 2";
                    f_HTML_SelectObjeto("ipsfijascli", $ipsfijascli, $extras["SelectABM"], $sql);
                    ?>
                </td>
            </tr>
            <tr>
                <td>Interface Virtual</td>
                <td>
                    <?
                    if (!$ipsfijasint) {
                        $sql = "select interfacesvirtualesint from interfacesvirtuales where interfacesvirtualesest=0 order by interfacesvirtualesint limit 1";
                        $rs = sql::query($sql);
                        $int = mysql_fetch_assoc($rs);
                        $ipsfijasint = $int["interfacesvirtualesint"];
                    }
                    echo f_HTML_Textbox("ipsfijasint", $ipsfijasint, "readonly");
                    ?>
                </td>
            </tr>
            <tr>
                <td>Estado</td>
                <td>
                    <?
                    f_HTML_Estado("ipsfijasest", $ipsfijasest, $extras["EstadoABM"]);
                    ?>
                </td>
            </tr>
        </table>
    </form>
<center><? f_HTML_Button("boGuardar", "Guardar", $extras["ButtonABM"] . " onclick=\"guardar();\""); ?></center>
</body>
