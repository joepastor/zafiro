<? include "inclusiones.php"; ?>

<body>
    <h1>Editar Regla de Firewall</h1>
    <?
    $id = f_Request("id");
    $comentario = f_Request("comentario");
    $comando = f_Request("comando");
    $orden = f_Request("orden");
    $estado = f_Request("estado");
    if (f_Request("ac") == "guardar") {
        $errores = "";
        //ip address
        $f = 0;
        unset($ips);
        if ($comando == "") {
            $errores .= "|Debe ingresar la regla iptables";
        }
        //Mostrar Errores
        if ($errores != "") {
            f_imprime_errores($errores);
        } else {
            if ($id > 0) {
                $sql = "update firewall set comando='" . $comando . "', comentario='" . $comentario . "',orden='" . $orden . "', estado=" . $estado . " where id = $id";
            } else {
                $sql = "insert into firewall (comando,comentario,orden,estado) values ('$comando','$comentario', $orden, $estado)";
            }
            sql::execute($sql);
            $servidor->aplicar();
            header("Location:listar.php?list=firewall");
        }
    } else {
        $sql = "select id,comentario,comando,orden,estado from firewall where id = $id";
        $rs = sql::query($sql);
        if ($fila = mysql_fetch_assoc($rs)) {
            $comentario = $fila['comentario'];
            $comando = $fila['comando'];
            $orden = $fila['orden'];
            $estado = $fila['estado'];
        }
    }
    ?>
    <script>
        function guardar() {
            document.datos.submit();
        }
    </script>
    <form name="datos" action="?mod=ABMfirewall&ac=guardar" method="post">
        <table align=center>
            <tr>
                <th>Comentario</th>
                <td colspan=3><? f_HTML_TextBox("comentario", $comentario, $extras["TextBoxABM"], 254, 80); ?></td>
            </tr>
            <tr>
                <th>Comando</th>
                <td>iptables <? f_HTML_TextBox("comando", $comando, $extras["TextBoxABM"], 254, 50); ?></td><th width=5%>Orden</td><td><? f_HTML_Hidden("id", $id);
    f_HTML_TextBox("orden", $orden, $extras["TextBoxABM"], 254, 5); ?></td>
            </tr>
            <tr>
                <th>Estado</th>
                <td>
                    <?
                    f_HTML_Hidden("id", $id);
                    f_HTML_Estado("estado", $estado, $extras["EstadoABM"]);
                    ?>
                </td>
            </tr>
        </table>
        <br/>
        <center>
            <? f_HTML_Button("boGuardar", "Guardar", $extras["ButtonABM"] . " onclick=\"guardar();\""); ?>
        </center>
    </form>
</body>
