<? include "inclusiones.php"; ?>
<body>
    <h1>Editar Plan</h1>
    <?
    $planesid = f_Request("planesid");
    $planesest = f_Request("planesest");
    $planesnom = f_Request("planesnom");
    $planescan = f_Request("planescan");
    $valor = f_Request("valor");

    if (f_Request("ac") == "guardar") {
        $errores = "";
        $dias = array();
        $horas = array();
        foreach ($_POST as $k => $v) {
            if (substr($k, 0, 7) == "chkDia_") {
                $dias[] = $v;
            } elseif (substr($k, 0, 8) == "chkHora_") {
                $horas[] = $v;
            }
        }
        if (count($dias) > 0 && count($horas) == 0) {

            $errores .= "|Debe seleccionar al menos una hora";
        }
        if (count($dias) == 0 && count($horas) > 0) {

            $errores .= "|Debe seleccionar al menos un día";
        }
        if ($planesnom == "") {
            $errores .= "|Debe completar el nombre";
        }
        if (!is_numeric($valor)) {
            $errores .= "|El valor debe ser un numero";
        }
        //Mostrar Errores
        if ($errores != "") {

            f_imprime_errores($errores);
        } else {
            if ($planesid > 0) {
                $sql = "UPDATE planes SET planesnom='" . f_TSQL($planesnom) .
                        "', planesest='" . f_TSQL($planesest) . "',valor=" . $valor . " " .
                        " WHERE planesid='" . $planesid . "'";
                sql::execute($sql);
                if (count($dias) > 0 && count($horas) > 0) {
                    $sql = "UPDATE planes SET planescan='" . $planescan .
                            "' WHERE planesid='" . $planesid . "'" .
                            " AND planesdia in (" . implode(",", $dias) . ")" .
                            " AND planeshor in (" . implode(",", $horas) . ")";
                    sql::execute($sql);
                    $servidor->aplicar();
                }
            } else {
                $sql = "SELECT max(planesid) as maxid FROM planes";
                $rs = sql::query($sql);
                $fila = mysql_fetch_assoc($rs);
                if (is_null($fila['maxid'])) {
                    $planesid = 1;
                } else {
                    $planesid = $fila['maxid'] + 1;
                }
                $planescan = 0;
                //$planesnom y $planesest ya estan seteados por POST
                $dias = array();
                for ($i = 1; $i <= 7; $i++) {
                    $dias[] = "SELECT $i ";
                }
                $dias = implode(" union ", $dias);
                $horas = array();
                for ($i = 0; $i <= 23; $i++) {
                    $horas[] = "SELECT $i ";
                }
                $horas = implode(" union ", $horas);
                $sql = "INSERT INTO planes select " . $planesid .
                        ",dia.*,hora.*, " . $planescan . "," . $planesest .
                        ",'" . $planesnom . "'," . $valor . " FROM (" .
                        $dias . ") as dia, (" . $horas . ") as hora";
                sql::execute($sql);
                $servidor->aplicar();
            }
            header("Location: abmplan.php?planesid=" . $planesid);
        }
    } else {
        $sql = "select planesid, planesest, planesnom,valor from planes where planesid = $planesid";
        $rs = sql::query($sql);
        if ($fila = mysql_fetch_assoc($rs)) {
            $planesest = $fila['planesest'];
            $planesnom = $fila['planesnom'];
            $valor = $fila['valor'];
        }
    }
    ?>
    <script>
        function guardar() {
            document.datos.submit();
        }

        function chequearTodoDias(valor) {
            f = document.datos.elements;
            for(i=0; i<f.length; i++) {
                if (f[i].name.substr(0,7)=="chkDia_"){
                    f[i].checked = valor;
                }
            }
        }

        function chequearTodoHoras(valor) {
            f = document.datos.elements;
            for(i=0; i<f.length; i++) {
                if (f[i].name.substr(0,8)=="chkHora_"){
                    f[i].checked = valor;
                }
            }
        }
    </script>
    <form name="datos" action="?mod=ABMplan&ac=guardar" method="post">
        <? f_HTML_Hidden("planesid", $planesid);?>
        <table align=center>
            <tr>
                <th>Nombre</th>
                <td><? f_HTML_TextBox("planesnom", $planesnom, $extras["TextBoxABM"], 45); ?></td>
                <th>Estado</th>
                <td><? f_HTML_Estado("planesest", $planesest, $extras["EstadoABM"]); ?></td>
                <th>Valor</th>
                <td><? f_HTML_TextBox("valor", $valor, $extras["TextBoxABM"], 5); ?></td>
            </tr>
        </table>
        <br>
        <? if ($planesid > 0) { ?>
            <table align=center>
                <caption>D&iacute;as</caption>
                <tr>
                    <td>
                        <table>
                            <tr><td><? $onclick = "onclick='chequearTodoDias(this.checked)'";
                                    f_HTML_CheckBox("chkAllDias", 0, $onclick . " " . $extras["CheckBoxABM"]); ?></td><td>Marcar todos</td></tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <? for ($i = 1; $i <= 7; $i++) { ?>
                                    <td><? f_HTML_CheckBox("chkDia_" . $i, $i, $extras["CheckBoxABM"]); ?></td>
                                    <td><? echo htmlentities(f_Nombre_Dia($i)) ?></td>
                                <? } ?>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table align="center">
                <caption>Horas</caption>
                <tr><td>
                        <table class=table>
                            <tr><td><? $onclick = "onclick='chequearTodoHoras(this.checked)'";
                            f_HTML_CheckBox("chkAllHoras", 0, $onclick . " " . $extras["CheckBoxABM"]); ?></td><td>Marcar todos</td></tr>
                        </table>
                    </td>
                    <td>
                        <table class=table align=center border=0>
                            <tr>
                                <?
                                for ($i = 0; $i <= 23; $i++) {
                                    if ($i % 24 == 0) {
                                        echo "</tr><tr>";
                                    }
                                    ?>
                                    <td align=center><? f_HTML_CheckBox("chkHora_" . $i, $i, $extras["CheckBoxABM"]);
                            echo "<br>" . $i; ?></td>
                                    <?
                                }
                                ?>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table class=table align=center>
                <tr><td>Canal de salida en horario seleccionado</td>
                    <td><?
                            $sql = "select canalesid as id, canalesnom as nombre, canalesest as estado "
                                    . " from canales "
                                    . " where canalesest = 0 "
                                    . " order by 2";
                            f_HTML_SelectObjeto("planescan", 0, $extras["SelectABM"], $sql, true);
                                ?>
                    </td>
                </tr>
        </form>
    </table><?
                } else {
                    echo "</form>";
                }
                            ?>
<center><? f_HTML_Button("boGuardar", "Guardar", $extras["ButtonABM"] . " onclick=\"guardar();\""); ?></center>
<?
if ($planesid > 0) {
    $sql = "SELECT planesdia, planeshor, canalesnom, planescan FROM planes left join canales on (planescan=canalesid) WHERE planesid=" . $planesid . " ORDER BY planesdia, planeshor";
    $rs = sql::query($sql, $db);

    function imprimir_linea($dia, $diaant, $hora, $horaant, $canal) {
        $strdia = ($dia != $diaant) ? f_Nombre_Dia($dia) . " a " .
                f_Nombre_Dia($diaant) : f_Nombre_Dia($dia);
        $strhora = ($hora != $horaant) ? $hora . " a " . $horaant : $hora;
        ?>
        <tr><td><? echo $strdia ?></td><td><? echo $strhora ?></td><td><? echo $canal ?></td></tr>
    <? } ?>
    <br>
    <table align=center>
        <caption>Resumen del Plan</caption>
        <tr><th>D&iacute;a</th><th>Hora</th><th>Canal</th></tr>
        <?
        $ult_canal = -1;
        $strcanal = "";
        $cortar_dia = false;
        while ($fila = mysql_fetch_assoc($rs)) {
            if ($ult_canal != $fila['planescan'] || ($cortar_dia && ($diaant != $fila["planesdia"]) )) {
                if ($ult_canal != -1) {
                    imprimir_linea($dia, $diaant, $hora, $horaant, $strcanal);
                }
                $ult_canal = $fila['planescan'];
                $strcanal = $fila['canalesnom'];
                $dia = $fila['planesdia'];
                $hora = $fila['planeshor'];
                $cortar_dia = true;
            }
            $diaant = $fila['planesdia'];
            $horaant = $fila['planeshor'];
        }
        if ($ult_canal != -1) {
            imprimir_linea($dia, $diaant, $hora, $horaant, $strcanal);
        }
        ?>
    </table>
<? } ?>
</body>
