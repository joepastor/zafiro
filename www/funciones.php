<?
$popupjs = "<script language='JavaScript'>function popup(pagina) {var opciones='toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=508, height=365, top=85, left=140';window.open(pagina,'',opciones);}</script>";
//require("red.php");


function fncping($host,$count){
        $unix      =  1; //set this to 1 if you are on a *unix system
        $windows   =  0; //set this to 1 if you are on a windows system
        //globals on or off ?
        $register_globals = (bool) ini_get('register_gobals');
        $system = ini_get('system');
        $unix = (bool) $unix;
        $win  = (bool)  $windows;
        //
        // form submitted ?
        $return="";
        if($host && $count){
                // over count ?
                // replace bad chars
                $host= preg_replace ("/[^A-Za-z0-9.-]/","",$host);
                $count= preg_replace ("/[^0-9]/","",$count);
                //check target IP or domain
                echo "<pre>";
                if ($unix){
                        $caca = `ping -c$count -w$count $host > /dev/null`;
                        passthru("ping -c$count -w$count $host > /dev/null",$retval);
                        if($retval==0){
                                return 1;
                        }else{
                                return 0;
                        }
                        system("killall ping");// kill all ping processes in case there are some stalled ones or use echo 'ping' to execute ping without shell
                }else{
                        system("ping -n $count $host");
                }
        }
}

function fncgetinterfaceinterna() {
    $sql = "select configuraciondevpri from configuracion";
    $rs = mysql_query($sql);
    $int = mysql_fetch_assoc($rs);
    if ($int["configuraciondevpri"]) {
        return $int["configuraciondevpri"];
    } else {
        return "";
    }
}

function fncgetinterfaceexterna() {
    $sql = "select configuraciondevpub from configuracion";
    $rs = mysql_query($sql);
    $int = mysql_fetch_assoc($rs);
    if ($int["configuraciondevpub"]) {
        return $int["configuraciondevpub"];
    } else {
        return "";
    }
}

function fncidnodovpn() {
    $nroid = "select max(id) as id from openvpn";
    $rsnroid = mysql_query($nroid);
    $fila = mysql_fetch_assoc($rsnroid);
    if ($fila["id"] == 0) {
        return 1;
    } else {
        return $fila["id"] + 1;
    }
}

function f_RequestRed() {
    global $ilan;
    $x = explode(".", $ilan->ip);
    return $x[0] . "." . $x[1] . "." . $x[2];
}

function f_Request($nombre) {

    global $_POST;
    global $_GET;

    if (isset($_POST[$nombre])) {
        return $_POST[$nombre];
    }

    if (isset($_GET[$nombre])) {
        return $_GET[$nombre];
    }

    return "";
}

function f_RequestFecha($nombre) {

    $fecha = f_Request($nombre . "_3");
    if (f_Request($nombre . "_2") > 0 && f_Request($nombre . "_2") < 10) {
        $fecha .= "0";
    }
    $fecha .= f_Request($nombre . "_2");
    if (f_Request($nombre . "_1") > 0 && f_Request($nombre . "_1") < 10) {
        $fecha .= "0";
    }
    $fecha .= f_Request($nombre . "_1");
    return $fecha;
}

function f_carga_clase($nomclase) {

    global $sysop;

    $ruta = $sysop["ruta"] . "clases/class." . $nomclase . ".php";
    include_once($ruta);
}

function f_mostrar_plantilla($nombre, $objeto = null) {

    global $sysop;
    global $extras;

    $ruta = $sysop["ruta"] . "plantillas/template." . $nombre . ".php";
    include $ruta;
}

function f_TSQL($valor) {

    return str_replace("'", "''", stripslashes($valor));
}

function f_HTML_Button($nombre, $valor="", $extras="") {

    $valor = is_null($valor) ? "" : $valor;
    ?>
    <button name="<? echo $nombre ?>" id="<? echo $nombre ?>" type="button" value="" <? echo $extras ?> ><? echo htmlentities($valor) ?></button>
    <?
}

function f_HTML_CheckBox($nombre, $valor="", $extras="") {

    $valor = is_null($valor) ? "" : $valor;
    ?>
    <input name="<? echo $nombre ?>" id="<? echo $nombre ?>" type="checkbox" value="<? echo $valor ?>" <? echo $extras ?> >
    <?
}

function f_HTML_Estado($nombre, $valor="0", $extras="") {

    global $arrEstado;
    $valor = is_null($valor) ? "" : $valor;
    ?>
    <select name="<? echo $nombre ?>" id="<? echo $nombre ?>" <? echo $extras ?> >
        <?
        $i = 0;
        $selected = ($valor == $i) ? " selected " : "";
        echo "<option value=\"{$i}\" {$selected} >Activo</option>";

        $i = 1;
        $selected = ($valor == $i) ? " selected " : "";
        echo "<option value=\"{$i}\" {$selected} >Inactivo</option>";

        $i = 2;
        $selected = ($valor == $i) ? " selected " : "";
        echo "<option value=\"{$i}\" {$selected} >Borrado</option>";
        ?>
    </select>
    <?
}

function f_HTML_Hidden($nombre, $valor="") {

    $valor = is_null($valor) ? "" : $valor;
    ?>
    <input name="<? echo $nombre ?>" id="<? echo $nombre ?>" type="hidden" value="<? echo htmlentities($valor) ?>" >
    <?
}

function f_HTML_SelectCantidad($nombre, $valor="", $extras="", $inicio, $fin, $nro_mask = 0, $mostrar_blanco = false) {

    $valor = is_null($valor) ? "" : $valor;
    ?>
    <select name="<? echo $nombre ?>" id="<? echo $nombre ?>" <? echo $extras ?> class="input-small">
        <?
        if ($mostrar_blanco) {
            echo "<option value=\"\" selected></option>";
        }

        for ($i = $inicio; $i <= $fin; $i++) {
            $selected = ($valor == $i) ? " selected " : "";
            $i_masked = $nro_mask - strlen($i) >= 0 ?
                    str_repeat("0", $nro_mask - strlen($i)) . $i : $i;
            echo "<option value=\"{$i}\" {$selected} >{$i_masked}</option>";
        }
        ?>
    </select>
    <?
}

function f_HTML_SelectFecha($nombre, $valor=null, $extras="") {

    $valor = is_null($valor) ? date("Ymd") : $valor;

    if ($valor) {
        $anio = substr($valor, 0, 4);
        $mes = substr($valor, 4, 2);
        $dia = substr($valor, 6, 2);
    } else {
        $anio = -1;
        $mes = -1;
        $dia = -1;
    }

    f_HTML_SelectCantidad($nombre . "_1", $dia, $extras = "", 1, 31, 2, TRUE);
    f_HTML_SelectCantidad($nombre . "_2", $mes, $extras = "", 1, 12, 2, TRUE);
    f_HTML_SelectCantidad($nombre . "_3", $anio, $extras = "", date("Y") - 10, date("Y") + 1, 4, TRUE);
}

function f_HTML_SelectObjeto($nombre, $valor=null, $extras="", $sql, $mostrar_blanco = false) {

    global $sql;
    $rs = sql::query($sql);
    ?>
    <select name="<? echo $nombre ?>" id="<? echo $nombre ?>" >
        <?
        if ($mostrar_blanco) {
            echo "<option value=\"\"></option>";
        }

        while ($fila = mysql_fetch_assoc($rs)) {
            $selected = $fila['id'] == $valor ? " selected " : "";
            echo "<option value=\"" . $fila['id'] . "\" " . $selected . ">" .
            addslashes($fila['nombre']) . "</option>";
        }
        ?>

    </select>
    <?
}

function f_HTML_SelectValores($nombre, $valor="", $extras="", $arr_valores) {
    ?>
    <select name="<? echo $nombre ?>" id="<? echo $nombre ?>" <? echo $extras ?> >
        <?
        foreach ($arr_valores as $k => $v) {
            $selected = ($valor == $k) ? " selected " : "";
            echo "<option value=\"{$k}\" {$selected} >{$v}</option>";
        }
        ?>
    </select>
    <?
}

function f_HTML_TextBox($nombre, $valor="", $extras="", $maxlength="", $size="") {

    $valor = is_null($valor) ? "" : $valor;
    $maxlength = $maxlength >= 1 ? " maxlength=\"{$maxlength}\" " : "";
    $size = $size >= 1 ? " size=\"{$size}\" " : "";
    ?>
    <input name="<? echo $nombre ?>" id="<? echo $nombre ?>" 
           type="text" value="<? echo htmlentities($valor) ?>" 
           <? echo $extras . $maxlength . $size ?>>
           <?
       }

       function f_HTML_TextArea($nombre, $valor="", $extras="", $maxlength="", $size="") {

           $valor = is_null($valor) ? "" : $valor;
           $maxlength = $maxlength >= 1 ? " maxlength=\"{$maxlength}\" " : "";
           $size = $size >= 1 ? " size=\"{$size}\" " : "";
           ?>
    <input class=textarea name="<? echo $nombre ?>" id="<? echo $nombre ?>" 
           type="text" value="<? echo htmlentities($valor) ?>" 
           <? echo $extras . $maxlength . $size ?>>
           <?
       }

       function f_HTML_TextBoxPassword($nombre, $valor="", $extras="", $maxlength="", $size="") {

           $valor = is_null($valor) ? "" : $valor;
           $maxlength = $maxlength >= 1 ? " maxlength=\"{$maxlength}\" " : "";
           $size = $size >= 1 ? " size=\"{$size}\" " : "";
           ?>
    <input name="<? echo $nombre ?>" id="<? echo $nombre ?>" 
           type="password" value="<? echo htmlentities($valor) ?>" 
           <? echo $extras . $maxlength . $size ?> >
           <?
       }

       function f_HTML_TextBoxMAC($nombre, $valor="", $extras="", $nro_bloques) {

           $valor = is_null($valor) ? "" : $valor;

           $arr_valores = explode(":", $valor);

           for ($i = 1; $i <= 6; $i++) {

               if ($i > 1) {
                   echo ":";
               }
               $v = isset($arr_valores[$i - 1]) ? $arr_valores[$i - 1] : "";
               ?>
        <input name="<? echo $nombre . "_$i" ?>" id="<? echo $nombre . "_$i" ?>" class="input-mini"
               type="text" value="<? echo $v ?>" 
               maxlength="2" size="1">
               <?
           }
       }

       function f_HTML_TextBoxIP($nombre, $valor="", $extras="", $nro_bloques) {

           $valor = is_null($valor) ? "" : $valor;

           $arr_valores = explode(".", $valor);

           for ($i = 1; $i <= $nro_bloques; $i++) {

               if ($i > 1) {
                   echo ".";
               }
               $v = isset($arr_valores[$i - 1]) ? $arr_valores[$i - 1] : "";
               ?>
        <input name="<? echo $nombre . "_$i" ?>" id="<? echo $nombre . "_$i" ?>" 
               type="text" value="<? echo $v ?>" 
               maxlength="3" size="2" >
               <?
           }
       }

       function f_Nombre_Mes($numero) {

           $nombre[1] = "Enero";
           $nombre[2] = "Febrero";
           $nombre[3] = "Marzo";
           $nombre[4] = "Abril";
           $nombre[5] = "Mayo";
           $nombre[6] = "Junio";
           $nombre[7] = "Julio";
           $nombre[8] = "Agosto";
           $nombre[9] = "Septiembre";
           $nombre[10] = "Octubre";
           $nombre[11] = "Noviembre";
           $nombre[12] = "Diciembre";

           return $nombre[$numero];
       }

       function f_Nombre_Dia($numero) {

           $nombre[1] = "Lunes";
           $nombre[2] = "Martes";
           $nombre[3] = "Miércoles";
           $nombre[4] = "Jueves";
           $nombre[5] = "Viernes";
           $nombre[6] = "Sábado";
           $nombre[7] = "Domingo";
           return $nombre[$numero];
       }

       function f_es_mac($valor) {

           $chars = "1234567890ABCDEF";
           $valor = strtoupper($valor);
           if (strlen($valor) != 2) {
               return false;
           }
           for ($i = 0; $i < strlen($valor); $i++) {
               if (strpos($chars, $valor{$i}) === false) {
                   return false;
               }
           }
           return true;
       }

       function f_es_ip($valor) {

           $chars = "1234567890";
           $valor = strtoupper($valor);
           if ($valor > 254 || $valor < 0) {
               return false;
           }
           for ($i = 0; $i < strlen($valor); $i++) {
               if (strpos($chars, $valor{$i}) === false) {
                   return false;
               }
           }
           return true;
       }

       function fncvalidaip($ip) {
           $trozos = explode(".", $ip);
           $contador = 0;
           $error = 1;
           foreach ($trozos as $pis => $valor) {
               if (is_numeric($valor)) {
                   if ($valor > 254 || $valor < 0) {
                       return false;
                   } else {
                       $contador++;
                   }
               } else {
                   return false;
               }
           }
           if ($contador != 4) {
               return false;
           }
           return true;
       }

       function f_imprime_errores($errores) {

           $arr = explode("|", $errores);
           $msg = array();
           foreach ($arr as $value) {
               if ($value != "") {
                   $msg[] = addslashes($value);
               }
           }
           $msg = implode("\\n", $msg);
           ?>
    <script>
        alert('Atencion:\n\n<? echo $msg ?>');
    </script>
    <?
}
?>
