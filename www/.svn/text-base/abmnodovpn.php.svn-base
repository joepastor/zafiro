<? include "inclusiones.php"; ?>
<body>
    <h1>Editar Nodo VPN</h1>
    <?
    include "genkey.php";
    if (isset($_GET["borrar"])) {
        $extensiones = array(".ovpn", ".conf", ".key");
        foreach ($extensiones as $e) {
            if (!unlink($servidor->openvpndir . "/" . $_GET['borrar'] . $e)) {
                echo 'Atencion! No se pudo eliminar el nodo :' . $_GET['borrar'];
                die();
            }
        }
        header("Location: listar.php?list=nodos");
    }
    if (isset($_GET["nodo"])) {
        $nodo = $_GET["nodo"];
    }
    if (isset($_GET["accion"])) {
        $accion = $_GET["accion"];
    }


    $remoto = f_Request("remoto");
    $iptunelleft = f_Request("iptunelleft");
    $iptunelright = f_Request("iptunelright");
    $mascaratunel = f_Request("mascaratunel");
    $enruta = f_Request("enruta");
    $enrutamascara = f_Request("enrutamascara");
    $puertoleft = f_Request("puertoleft");
    $puertoright = f_Request("puertoright");
    $puerto = f_Request("puerto");
    $ping = f_Request("ping");
    $verb = f_Request("verb");
    $nombre = f_Request("nombre");
    $borrado = f_Request("borrado");
    $llave = f_Request("llave");

    if (f_Request("ac") == "guardar") {
        $errores = "";
        //ip address
        $f = 0;
        unset($ips);
        if ($nombre == "") {
            $errores .= "|Debe seleccionar un nombre para el nodo";
        }

        if ($remoto == "") {
            $errores .= "|Debe ingresar el nodo remoto";
        }
        //Mostrar Errores
        if ($errores != "") {
            f_imprime_errores($errores);
        } else {
            //Servidor
            $nodo = "";
            $nodo.="dev tun\n";
            if ($remoto == "float") {
                $nodo.="$remoto\n";
            } else {
                $nodo.="remote $remoto\n";
            }
            $nodo.="ifconfig $iptunelleft $iptunelright netmask $mascaratunel\n";
            $nodo.="secret $nombre.key\n";
            $nodo.="route $enruta $enrutamascara\n";
            $nodo.="rport $puertoright\n";
            $nodo.="lport $puertoleft\n";
            $nodo.="port $puerto\n";
            $nodo.="ping $ping\n";
            $nodo.="verb $verb\n";

            $file_to_write = $servidor->openvpndir . "/" . $nombre . ".conf";
            $fd = fopen($file_to_write, "w+");
            fwrite($fd, $nodo);
            fclose($fd);

            //Cliente Linux
            $nodo = "";
            $nodo.="dev tun\n";
            $nodo.="remote $iwan->ip\n";
            $nodo.="ifconfig $iptunelleft $iptunelright netmask $mascaratunel\n";
            $nodo.="secret $nombre.key\n";
            $nodo.="route $enruta $enrutamascara\n";
            $nodo.="rport $puertoright\n";
            $nodo.="lport $puertoleft\n";
            $nodo.="port $puerto\n";
            $nodo.="ping $ping\n";
            $nodo.="verb $verb\n";
            $file_to_write = $servidor->vpnclidir . "/" . $nombre . ".conf";
            $fd = fopen($file_to_write, "w+");
            fwrite($fd, $nodo);
            fclose($fd);
            
            //Cliente Windows
            $nodo = "";
            $nodo.="dev tun\n";
            $nodo.="remote $iwan->ip\n";
            $nodo.="ifconfig $iptunelright $iptunelleft netmask $mascaratunel\n";
            $nodo.="secret $nombre.key\n";
            $nodo.="route $enruta $enrutamascara\n";
            $nodo.="lport $puertoleft\n";
            $nodo.="rport $puertoright\n";
            $nodo.="port $puerto\n";
            $nodo.="proto udp\n";
            $nodo.="persist-tun\n";
            $nodo.="verb $verb\n";

            $file_to_write = $servidor->vpnclidir . "/" . $nombre . ".ovpn";
            $fd = fopen($file_to_write, "w+");
            fwrite($fd, $nodo);
            fclose($fd);

            // LLAVE
            $file_to_write = $servidor->openvpndir . "/" . $nombre . ".key";
            $fd = fopen($file_to_write, "w+");
            fwrite($fd, $llave);
            fclose($fd);
            
            //CARGA EL PUERTO EN EL FIREWALL
            //JOE: Acá habría que ver que sucede si un cliente quiere armar una red con un puerto en el nodo y otro puerto distinto en el
            //servidor. Ahora el puerto general que pone en el firewall es el que está en la variable $puerto. Pero si no llegara a se
            //ese, no funcionará la VPN.
            
            $sql="insert into firewall set comando='-A OUTPUT -p udp --dport $puerto -j ACCEPT',comentario='$nombre VPN OUT',orden=3";
            sql::execute($sql);
            $sql="insert into firewall set comando='-A INPUT -p udp --sport $puerto -j ACCEPT',comentario='$nombre VPN IN',orden=3";
            sql::execute($sql);
            $servidor->aplicar();
        }
        header("Location: listar.php?list=nodos");
    } else {
        if ($accion != "nuevo") {
            $nombre = $nodo;
            $archivo = fopen($servidor->openvpndir . "/" . $nombre . ".conf", "r");
            while (!feof($archivo)) {
                $dmesg = trim(fgets($archivo, 1024));
                $caca = explode(" ", $dmesg);
                switch ($caca[0]) {
                    case "float";
                        $remoto = $caca[0];
                        break;
                    case "remote";
                        $remoto = $caca[1];
                        break;
                    case "ifconfig":
                        $iptunelleft = $caca[1];
                        $iptunelright = $caca[2];
                        $mascaratunel = $caca[4];
                        break;
                    case "route":
                        $enruta = $caca[1];
                        $enrutamascara = $caca[2];
                        break;
                    case "rport":
                        $puertoright = $caca[1];
                        break;
                    case "lport":
                        $puertoleft = $caca[1];
                        break;
                    case "port":
                        $puerto = $caca[1];
                        break;
                    case "ping":
                        $ping = $caca[1];
                        break;
                    case "verb":
                        $verb = $caca[1];
                        break;
                }
            }
            fclose($archivo);

            $archivo = fopen($servidor->openvpndir . "/" . $nombre . ".key", "r");
            $llave = "";
            while (!feof($archivo)) {
                $llave.=trim(fgets($archivo, 1024)) . "\n";
            }
            fclose($archivo);
        } else {
            $genkey = new Aleatorios();
            $llave = "##\n2048 bit OpenVPN static key\n#\n";
            $llave.="-----BEGIN OpenVPN Static key V1-----\n";
            $k = $genkey->getAleatorio("hex", 512);
            while (strlen($k) > 0) {
                $llave.= substr($k, 0, 37) . "\n";
                $k = substr($k, 37, strlen($k));
            }
            $llave.="-----END OpenVPN Static key V1-----";
            $verb = 5;
            $ping = 15;
            $remoto = "float";
            $mascaratunel = "255.255.255.254";
            $enrutamascara = "255.255.255.0";
        }
    }
    ?>

    <script>
        function guardar() {
            document.datos.submit();
        }
    </script>
    <form name="datos" action="?mod=ABMipfija&ac=guardar" method="post">
        <table align=center>
            <tr align=center>
                <td width=25%>&nbsp;</td>
                <td>&nbsp;</td>
                <th>Llave</th>
            </tr>
            <tr>
                <th>Nombre del nodo</th>
                <td>
<?
$readonly = "";
if ($accion == "editar") {
    $readonly = " readonly=yes";
}
f_HTML_TextBox("nombre", $nombre, $extras["TextBoxABM"] . $readonly, 254)
?>
                </td>
                <td rowspan=12>
                    <textarea name='llave' rows=20 cols=38><? echo $llave; ?></textarea>
                </td>
            </tr>
            <tr>
                <th>Remoto</th>
                <td><? f_HTML_Hidden("remoto", $remoto); ?><? f_HTML_TextBox("remoto", $remoto, $extras["TextBoxABM"], 254); ?></td>
            </tr>
            <tr>
                <th>IP Izquierda</th>
                <td><? f_HTML_TextBox("iptunelleft", $iptunelleft, $extras["TextBoxABM"], 254); ?></td>
            </tr>
            <tr>
                <th>IP Derecha</th>
                <td><? f_HTML_TextBox("iptunelright", $iptunelright, $extras["TextBoxABM"], 254); ?></td>
            </tr>
            <tr>
                <th>M&aacute;scara del t&uacute;nel</th>
                <td><? f_HTML_TextBox("mascaratunel", $mascaratunel, $extras["TextBoxABM"], 254); ?></td>
            </tr>
            <tr>
                <th>Enruta hacia (red o IP)</th>
                <td><? f_HTML_TextBox("enruta", $enruta, $extras["TextBoxABM"], 254); ?></td>
            </tr>
            <tr>
                <th>M&aacute;scara de la ruta</th>
                <td><? f_HTML_TextBox("enrutamascara", $enrutamascara, $extras["TextBoxABM"], 254); ?></td>
            </tr>
            <tr>
                <th>Puerto a utilizar</th>
                <td><? f_HTML_TextBox("puerto", $puerto, $extras["TextBoxABM"] . " onchange='getElementById(\"puertoright\").value=this.value;getElementById(\"puertoleft\").value=this.value;'", 254); ?></td>
            </tr>
            <tr>
                <th>Puerto a utilizar izquierda</th>
                <td><? f_HTML_TextBox("puertoleft", $puertoleft, $extras["TextBoxABM"], 254); ?></td>
            </tr>
            <tr>
                <th>Puerto a utilizar derecha</th>
                <td><? f_HTML_TextBox("puertoright", $puertoright, $extras["TextBoxABM"], 254); ?></td>
            </tr>
            <tr>
                <th>Ping</th>
                <td><? f_HTML_TextBox("ping", $ping, $extras["TextBoxABM"], 254); ?></td>
            </tr>
            <tr>
                <th>Verbosity</th>
                <td><? f_HTML_TextBox("verb", $verb, $extras["TextBoxABM"], 254); ?></td>
            </tr>
        </table>
    </form>
<center>
<? f_HTML_Button("boGuardar", "Guardar", $extras["ButtonABM"] . " onclick=\"guardar();\""); ?>
    <button type=button onclick="location='abmnodovpn.php?borrar=<? echo $nombre; ?>'">Borrar</button>
</center>
</body>
