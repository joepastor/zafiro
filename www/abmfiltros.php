<? include "inclusiones.php"; ?>
<body>
    <h1>Editar Filtros</h1>
    <?
    $id = f_Request("id");
    $tipo = f_Request("tipo");
    $estado = f_Request("estado");
    $nombre = f_Request("nombre");
    $ipsource = f_Request("ipsource");
    $ipdestino = f_Request("ipdestino");
    $puertosource = f_Request("puertosource");
    $puertodestino = f_Request("puertodestino");
    $interfaceentrada = f_Request("interfaceentrada");
    $interfacesalida = f_Request("interfacesalida");

    if (f_Request("ac") == "guardar") {
        $errores = "";
        //ip address
        $f = 0;
        if ($nombre == "") {
            $errores .= "|Debe ingresar el nombre para la regla de filtro";
        }
        if ($ipsource == "") {
            $errores .= "|Debe ingresar la ip de origen";
        }
        if ($ipdestino == "") {
            $errores .= "|Debe ingresar la ip destino";
        }
        if (!fncvalidaip($ipsource)) {
            $errores .= "|La ip origen es incorrecta";
        }
        echo fncvalidaip($ipsource);
        if (!fncvalidaip($ipdestino)) {
            $errores .= "|La ip destino es incorrecta";
        }
        //Mostrar Errores

        if ($errores != "") {
            f_imprime_errores($errores);
        } else {
            if ($id > 0) {
                $sql = "update filtros set nombre='$nombre',tipo='$tipo',ipsource='$ipsource',ipdestino='$ipdestino',puertosource='$puertosource',puertodestino='$puertodestino',estado=$estado,interfaceentrada='$interfaceentrada',interfacesalida='$interfacesalida' where id = $id";
            } else {
                $sql = "insert into filtros (nombre,tipo,ipsource,ipdestino,puertosource,puertodestino,estado,interfaceentrada,interfacesalida) values 
			('$nombre','$tipo','$ipsource','$ipdestino','$puertosource','$puertodestino',$estado,'$interfaceentrada', '$interfacesalida')";
            }
            sql::execute($sql);
            //break;
            $servidor->aplicar();
            header("Location: listar.php?list=filtros");
        }
    } else {
        $sql = "select id,ipsource,ipdestino,puertosource,puertodestino,nombre,tipo,estado,interfaceentrada,interfacesalida from filtros where id = $id";
        $rs = sql::query($sql);
        if ($fila = mysql_fetch_assoc($rs)) {
            $nombre = $fila['nombre'];
            $tipo = $fila['tipo'];
            $ipsource = $fila['ipsource'];
            $ipdestino = $fila['ipdestino'];
            $puertosource = $fila['puertosource'];
            $puertodestino = $fila['puertodestino'];
            $estado = $fila['estado'];
            $interfaceentrada = $fila['interfaceentrada'];
            $interfacesalida = $fila['interfacesalida'];
        }
    }
    ?>

    <script>
        function guardar() {
            document.datos.submit();
        }
    </script>
    <form name="datos" action="?mod=ABMfiltros&ac=guardar" method="post">
        <table align=center width=50%>
            <tr>
                <th>Nombre</th>
                <td colspan=3><? f_HTML_TextBox("nombre", $nombre, $extras["TextBoxABM"], 254, 45); ?></td>
                <th>Tipo de trafico</th>
                <td>
                    <select name=tipo>
                        <option value="ICMP" <? echo ($tipo == "ICMP") ? "selected":""; ?>>ICMP</option>
                        <option value="TCP" <? echo ($tipo == "TCP") ? "selected":""; ?>>TCP</option>
                        <option value="UDP" <? echo ($tipo == "UDP") ? "selected":""; ?>>UDP</option>
                    </select>
                </td>
                <th>Estado</th>
                <td>
                    <?
                    f_HTML_Hidden("id", $id);
                    f_HTML_Estado("estado", $estado, $extras["EstadoABM"]);
                    ?>
                </td>
            </tr>
            <tr>
                <th colspan=6>Origen</th>
            </tr>
            <tr>
                <th>IP</th>
                <td><? f_HTML_TextBox("ipsource", $ipsource, $extras["TextBoxABM"], 254, 15); ?></td>
                <th>Puertos</th>
                <td> <? f_HTML_TextBox("puertosource", $puertosource, $extras["TextBoxABM"], 254, 20); ?></td>
                <th>Interface</th>
                <td>
                    <select name=interfaceentrada>
                        <option value="<? echo $servidor->ilan;?>" <? echo ($interfaceentrada == $servidor->ilan) ? " selected": "";?>>LAN</option>
                        <option value="<? echo $servidor->iwan;?>" <? echo ($interfaceentrada == $servidor->iwan) ? " selected": "";?>>WAN</option>
                    </select>
                </td>
            </tr>
            <tr><th colspan=6>Destino</th></tr>
            <tr>
                <th>IP</th>
                <td> <? f_HTML_TextBox("ipdestino", $ipdestino, $extras["TextBoxABM"], 254, 15); ?></td>
                <th>Puertos</th>
                <td> <? f_HTML_TextBox("puertodestino", $puertodestino, $extras["TextBoxABM"], 254, 20); ?></td>
                <th>Interface</th>
                <td>
                    <select name=interfacesalida>
                        <option value="<? echo $servidor->ilan; ?>" <? echo ($interfacesalida == $servidor->ilan) ? " selected": "";?>>LAN</option>
                        <option value="<? echo $servidor->iwan; ?>" <? echo ($interfacesalida == $servidor->iwan) ? " selected": "";?>>WAN</option>
                    </select>
                </td>
            </tr>
        </table>
        <br/>
        <center><? f_HTML_Button("boGuardar", "Guardar", $extras["ButtonABM"] . " onclick=\"guardar();\""); ?></center>
    </form>
</body>