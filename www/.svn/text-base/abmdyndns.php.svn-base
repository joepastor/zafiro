<?
include "inclusiones.php";
?>
<body>
    <h1>DynDNS</h1>
    <?
    $sql3 = "";
    $sql2 = "";
//$id = f_Request("id");
    $servidor = f_Request("servidor");
    $protocolo = f_Request("protocolo");
    $interface = f_Request("interface");
    $usuario = f_Request("usuario");
    $password = f_Request("password");
    $dominio = f_Request("dominio");

//$estado = f_Request("estado");
    die();
    if (f_Request("ac") == "guardar") {
        $errores = "";
        //ip address
        $f = 0;
        unset($ips);
        if ($servidor == "") {
            $errores .= "|Debe ingresar un servidor";
        }

        if ($protocolo == "") {
            $errores .= "|Debe ingresar el protocolo";
        }
        //Mostrar Errores
        if ($errores != "") {
            f_imprime_errores($errores);
        } else {
            $ddclient = "";
            $ddclient.="pid=/var/run/ddclient.pid\n";
            $ddclient.="protocol=$protocolo\n";
            $ddclient.="use=if, if=$interface\n";
            $ddclient.="server=$servidor\n";
            $ddclient.="login=$usuario\n";
            $ddclient.="password=$password\n";
            $ddclient.="$dominio\n";
            $fd = fopen($servidor->dyndnsfile, "w+");
            fwrite($fd, $ddclient);
            fclose($fd);
            header("Location: abmdyndns.php");
        }
    } else {
        $archivo = fopen($servidor->dyndnsfile, "r");
        $contador = 0;
        while (!feof($archivo)) {
            $contador++;
            $dmesg = trim(fgets($archivo, 1024));
            $caca = explode("=", $dmesg);
            //echo $dmesg;
            //echo $caca[2]."<br>";
            switch ($caca[0]) {
                case "server";
                    $servidor = $caca[1];
                    break;
                case "login";
                    $usuario = $caca[1];
                    break;
                case "password";
                    $password = $caca[1];
                    break;
                case "use":
                    $interface = $caca[2];
                    break;
                case "protocol":
                    $protocolo = $caca[1];
            }
            if ($contador == 7) {
                $dominio = $caca[0];
            }
        }
    }

    if ($protocolo == "") {
        $protocolo = "dyndns2";
    }
    if (!$servidor) {
        $servidor = "members.dyndns.org";
    }
    ?>

    <script>
        function guardar() {
            document.datos.submit();
        }
    </script>
    <form name="datos" action="?mod=ABMdyndns&ac=guardar" method="post">
        <table align=center>
            <tr><th>Dominio</td><td><? f_HTML_TextBox("dominio", $dominio, $extras["TextBoxABM"], 254); ?></td></tr>
            <tr><th>Usuario</td><td><? f_HTML_TextBox("usuario", $usuario, $extras["TextBoxABM"], 254); ?></td></tr>
            <tr><th>Password</td><td><? f_HTML_TextBoxPassword("password", $password, $extras["TextBoxABM"], 254); ?></td></tr>
            <tr><th>Servidor</td><td><!--<? f_HTML_Hidden("id", $id); ?>--><? f_HTML_TextBox("servidor", $servidor, $extras["TextBoxABM"], 254); ?></td></tr>
            <tr><th>Protocolo</td><td><? f_HTML_TextBox("protocolo", $protocolo, $extras["TextBoxABM"], 254); ?></td></tr>
            <tr><th>Interface</td><td><? f_HTML_TextBox("interface", $interface, $extras["TextBoxABM"], 4); ?></td></tr>
            <!--<tr><th>Estado</td><td>
            <?
//f_HTML_Hidden("id", $id);
            f_HTML_Estado("estado", $estado, $extras["EstadoABM"]);
            ?>
            </td>
            </tr>-->
            <tr align=center><td colspan=4><? f_HTML_Button("boGuardar", "Guardar", $extras["ButtonABM"] . " onclick=\"guardar();\""); ?></td></tr>
        </table>
    </form>
</body>
