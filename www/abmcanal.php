<? include "inclusiones.php"; ?>
<body>
    <h1>Editar Canal</h1>
    <?
    $canalesid = f_Request("canalesid");
    $canalessub = f_Request("canalessub");
    $canalesbaj = f_Request("canalesbaj");
    $canalesest = f_Request("canalesest");
    $canalesnom = f_Request("canalesnom");

    if (f_Request("ac") == "guardar") {

        $errores = "";

        if ($canalesnom == "") {
            $errores .= "|Debe completar el nombre";
        }

        //Mostrar Errores
        if ($errores != "") {
            f_imprime_errores($errores);
        } else {

            if ($canalesid > 0) {
                if ($canalesest == 1) {
                    $rs = mysql_query("select planesid from planes where planescan=" . $canalesid, $db);
                    if ($fila = mysql_fetch_assoc($rs)) {
                        $error = "No se puede borrar el canal ya que tiene planes asociados";
                    } else {
                        $sql = "update canales set canalessub='$canalessub', canalesbaj='$canalesbaj', "
                                . "canalesest='$canalesest', canalesnom='" . f_TSQL($canalesnom) . "' where canalesid = $canalesid";
                    }
                } else {
                    $sql = "update canales set canalessub='$canalessub', canalesbaj='$canalesbaj', "
                            . "canalesest='$canalesest', canalesnom='" . f_TSQL($canalesnom) . "' where canalesid = $canalesid";
                }
            } else {
                $sql = "insert into canales (canalessub, canalesbaj, canalesest, canalesnom) values "
                        . "('$canalessub', '$canalesbaj', '$canalesest', '" . f_TSQL($canalesnom) . "')";
            }
            if (!$error) {
                sql::execute($sql);
                $servidor->aplicar();
            } else {
                echo $error;
                break;
            }
            header("Location: listar.php?list=canales");
        }
    } else {

        $sql = "select canalessub, canalesbaj, canalesest, canalesnom from canales where canalesid = $canalesid";
        $rs = sql::query($sql);
        if ($fila = mysql_fetch_assoc($rs)) {
            $canalessub = $fila['canalessub'];
            $canalesbaj = $fila['canalesbaj'];
            $canalesest = $fila['canalesest'];
            $canalesnom = $fila['canalesnom'];
        }
    }
    ?>

    <script>
        function guardar() {
            document.datos.submit();
        }
    </script>

    <form name="datos" action="?ac=guardar" method="post">
        <table>
            <tr>
                <th>Nombre</th>
                <td>
                    <? f_HTML_Hidden("canalesid", $canalesid); ?>
                    <? f_HTML_TextBox("canalesnom", $canalesnom, $extras["TextBoxABM"], 45); ?>
                </td>
            </tr>
            <tr>
                <th>Subida</th>
                <td><? f_HTML_SelectCantidad("canalessub", $canalessub, $extras["SelectCantidadABM"], 1, 4096); ?></td>
            </tr>
            <tr>
                <th>Bajada</th>
                <td><? f_HTML_SelectCantidad("canalesbaj", $canalesbaj, $extras["SelectCantidadABM"], 1, 4096); ?></td>
            </tr>
            <tr>
                <th>Estado</th>
                <td><? f_HTML_Estado("canalesest", $canalesest, $extras["EstadoABM"]); ?></td>
            </tr>
        </table>
    </form>
<center>
    <? f_HTML_Button("boGuardar", "Guardar", $extras["ButtonABM"] . " onclick=\"guardar();\""); ?>
</center>
</body>
