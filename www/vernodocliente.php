

<?
echo "<body class=body>";
echo "<font color=white>";
include "librerias.php";
//include "red.class";
f_dibuja_titulo("Configuracion Cliente Nodo VPN");
if($_SESSION["permiso"]>1){
        echo "<center>No tiene permiso para acceder a esta sesi&oacute;n</center>";
        exit();
}

if(isset($_GET["nodo"])){
	$nodo=$_GET["nodo"];
}
$nombre=$nodo;
$archivo=fopen($openvpndir."/".$nombre.".conf","r");
while(!feof($archivo)){
        $dmesg=trim(fgets($archivo,1024));
        $caca=explode(" ",$dmesg);
        switch($caca[0]){
		case "float";
			$remoto=$caca[0];	
			break;
                case "remote";
                        $remoto=$caca[1];
                        break;
		case "ifconfig":
                       	$iptunelleft=$caca[1];
                        $iptunelright=$caca[2];
                        $mascaratunel=$caca[4];
                        break;
                case "route":
                        $enruta=$caca[1];
                        $enrutamascara=$caca[2];
                        break;
                case "rport":
                        $puertoright=$caca[1];
                        break;
		case "lport":
			$puertoleft=$caca[1];
                        break;
                case "port":
                        $puerto=$caca[1];
                        break;
                case "ping":
                        $ping=$caca[1];
                        break;
                case "verb":
                       $verb=$caca[1];
                        break;
        }
}
fclose($archivo);
$archivo=fopen($openvpndir."/".$nombre.".key","r");
$llave="";
while(!feof ($archivo)){
       	$llave.=trim(fgets($archivo,1024));
}
fclose($archivo);
echo "archivo $nombre.ovpn";
echo "<hr>";
echo "#El tag 'dev' indica cual es el dispositivo que se utilizará para la conexión<br>";
	echo "#Podría ser tun o tap. En este servidor, utilizaremos tun, por lo tanto, no es recomendable cambiarlo, a menos que usted sepa exactamente lo que hace<br>";
echo "dev tun<br>";
echo "<br>";
echo "#El tag 'remote' indica a que IP o dominio deberá conectarse el nodo<br>";
echo "#En el caso de que el nodo deba apuntar hacia otro lado, esta variable debe ser cambiada.<br>";
echo "#Por ejemplo, si el nodo contra el que usted intenta contectarse tiene la ip 190.2.45.233, el siguiente tag debería quedar de la siguiente manera<br>";
echo "# remote 190.2.45.223<br>";
echo "remote $remoto<br>";
echo "<br>";
global $iwan;
echo $ilan->ip;
echo "#<br>";
echo "#La linea ifconfig indica las ips de los nodos de la vpn, la de la izquierda, derecha y máscara de subred del enlace<br>";
$pepe=system("ifconfig eth1| grep 'inet ' | awk {'print $2'} | tr 'addr:' ' '");
echo $pepe;
echo "ifconfig $iptunelleft $iptunelright netmask $enrutamascara<br>";
echo "secret $nombre.key<br>";
echo "rport $puertoright<br>";
echo "lport $puertoleft<br>";
echo "port $puerto<br>";
echo "ping $ping<br>";
echo "verb $verb<br>";
echo "<hr>";
echo "archivo $nombre.key";
echo "<hr>";
echo "<pre>".$llave;
?>

