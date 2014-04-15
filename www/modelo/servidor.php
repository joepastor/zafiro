<?

class Servidor {

    var $zafirodir;
    var $openvpndir;
    var $archivosdir;
    var $dns;
    var $hostname;
    var $iwan;
    var $ilan;
    var $maxusers;
    var $dyndnsfile;
    var $hostnamefile;
    var $interfacesfile;
    var $resolvfile;
    var $placasinfo;
    var $msginiciofile;
    var $syslogfile;
    var $ip_forward;
    var $pingignore;
    var $vpnclidir;
    
    function __construct() {
        $this->zafirodir = "/zafiro";
        $this->archivosdir = $this->zafirodir . "/archivos";
        $this->openvpndir = "/etc/openvpn";
        $this->dyndnsfile = "/etc/ddclient.conf";
        $this->hostnamefile = "/etc/hostname";
        $this->iwan = "eth0";
        $this->ilan = "br2";
        $this->maxusers = 250;
        $this->interfacesfile = "/etc/network/interfaces";
        $this->resolvfile = "/etc/resolv.conf";
        $this->placasinfo = $this->archivosdir . "/placas.txt";
        $this->msginiciofile = "/var/log/dmesg";
        $this->syslogfile = "/var/log/syslog";
        $this->ip_forward = $this->archivosdir . "/ip_forward";
        $this->pingignore = $this->archivosdir . "/icmp_echo_ignore_all";
        $this->vpnclidir = $this->zafirodir."/vpnclientes";

        //DNSs
        $fd = fopen("/etc/resolv.conf", "r");
        $numero = 1;
        while (!feof($fd)) {
            $dmesg = trim(fgets($fd, 1024));
            $caca = explode(" ", $dmesg);
            if ($caca[0] == "nameserver") {
                $this->dns[$numero] = $caca[1];
                $numero++;
            }
        }

        //Hostname
        $fd = fopen($this->hostnamefile, "r");
        while (!feof($fd)) {
            $hn = trim(fgets($fd, 1024));
            $this->hostname.= $hn;
        }
    }

    function aplicar() {
	/*
        $file_to_write = $this->archivosdir . "/ejecutar";
        $fd = fopen($file_to_write, "w+");
        fwrite($fd, 1);
        fclose($fd);
	unset($_SESSION["aplicar"]);
	*/
	$_SESSION["aplicar"]=1;
    }

    function ejecutar() {
        $file_to_write = $this->archivosdir . "/ejecutar";
        $fd = fopen($file_to_write, "w+");
        fwrite($fd, 1);
        fclose($fd);
	$_SESSION["aplicar"]=NULL;
    }

    function getsalida() {
        $gestor = @fopen($this->ip_forward, "r");
        if ($gestor) {
            $bufer = fgets($gestor, 4096);
            fclose($gestor);
        }
        if ($bufer == 0) {
            return 0;
        } else {
            return 1;
        }
    }

    function getlimitacion() {
        $gestor = @fopen($this->archivosdir . "/liberado", "r");
        if ($gestor) {
            $bufer = fgets($gestor, 4096);
            fclose($gestor);
        }
        return intval($bufer);
    }

    function togglesalida() {
        if ($this->getsalida()=="1") {
            $salida = "0";
        } else {
            $salida = "1";
        }
        $file_to_write = $this->ip_forward;
        $fd = fopen($file_to_write, "w+");
        fwrite($fd, $salida);
        fclose($fd);
	$this->aplicar();
    }

    function getping() {
        global $servidor;
        $gestor = @fopen($servidor->pingignore, "r");
        if ($gestor) {
            $bufer = fgets($gestor, 4096);
            fclose($gestor);
        }
        //Aca está al reves porque el es IGNORE. Si devuelve uno es porque esta ignorando.
        if ($bufer == 0) {
            return 1; //Tengo ping
        } else {
            return 0; //No tengo ping
        }
    }
    
    function toggleping() {
        global $servidor;
        // En este caso se asigna de esta forma porque si el ping devuelve 1 (que tiene ping) escribe el mismo valor en el PING IGNORE, que cuando está seteado en 1 ignora los pings ;)
        $ignorar=$this->getping();
        $fd = fopen($servidor->pingignore, "w+");
        fwrite($fd, $ignorar);
        fclose($fd);
	$this->aplicar();
    }

    function togglelimitar() {
        if ($this->getlimitacion()=="1") {
            $limitar = "0";
        } else {
            $limitar = "1";
        }
        $file_to_write = $this->archivosdir . "/liberado";
        $fd = fopen($file_to_write, "w+");
        fwrite($fd, $limitar);
        fclose($fd);
	$this->aplicar();
    }

    function getreiniciarred() {
        $gestor = @fopen($this->archivosdir . "/reiniciarred", "r");
        if ($gestor) {
            $bufer = fgets($gestor, 4096);
            fclose($gestor);
        }
        return intval($bufer);
    }

    function togglereiniciarred() {
        if ($this->getreiniciarred()=="1") {
            $reiniciar = "0";
        } else {
            $reiniciar = "1";
        }
        $file_to_write = $this->archivosdir . "/reiniciarred";
        $fd = fopen($file_to_write, "w+");
        fwrite($fd, $reiniciar);
        fclose($fd);
	$this->aplicar();
    }

    function getreiniciardhcp() {
        $gestor = @fopen($this->archivosdir . "/reiniciardhcp", "r");
        if ($gestor) {
            $bufer = fgets($gestor, 4096);
            fclose($gestor);
        }
        return intval($bufer);
    }

    function togglereiniciardhcp() {
        if ($this->getreiniciardhcp()=="1") {
            $reiniciar = "0";
        } else {
            $reiniciar = "1";
        }
        $file_to_write = $this->archivosdir . "/reiniciardhcp";
        $fd = fopen($file_to_write, "w+");
        fwrite($fd, $reiniciar);
        fclose($fd);
	$this->aplicar();
    }

    function getreiniciarvpn() {
        $gestor = @fopen($this->archivosdir . "/reiniciarvpn", "r");
        if ($gestor) {
            $bufer = fgets($gestor, 4096);
            fclose($gestor);
        }
        return intval($bufer);
    }

    function togglereiniciarvpn() {
        if ($this->getreiniciarvpn()=="1") {
            $reiniciar = "0";
        } else {
            $reiniciar = "1";
        }
        $file_to_write = $this->archivosdir . "/reiniciarvpn";
        $fd = fopen($file_to_write, "w+");
        fwrite($fd, $reiniciar);
        fclose($fd);
	$this->aplicar();
    }

    function getapagarservidor() {
        $gestor = @fopen($this->archivosdir . "/apagarservidor", "r");
        if ($gestor) {
            $bufer = fgets($gestor, 4096);
            fclose($gestor);
        }
        return intval($bufer);
    }

    function apagar() {
        $apagar = 0;
        if (!$this->getapagarservidor()) {
            $apagar = 1;
            echo "apago";
        }
        $apagar = 1;
        $file_to_write = $this->archivosdir . "/apagarservidor";
        $fd = fopen($file_to_write, "w+");
        fwrite($fd, $apagar);
        fclose($fd);
	$this->aplicar();
    }

    function getreiniciarservidor() {
        $gestor = @fopen($this->archivosdir . "/reiniciarservidor", "r");
        if ($gestor) {
            $bufer = fgets($gestor, 4096);
            fclose($gestor);
        }
        return intval($bufer);
    }

    function reiniciar() {
        if (!$this->getreiniciarservidor()) {
            $reiniciar = "1";
        } else {
            $reiniciar = "0";
        }
        $file_to_write = $this->archivosdir . "/reiniciarservidor";
        $fd = fopen($file_to_write, "w+");
        fwrite($fd, $reiniciar);
        fclose($fd);
	$this->aplicar();
    }

    function interfaces_additional(){
	$additional="# Telefonia\nauto eth1\niface eth1 inet static\n\taddress 0.0.0.0\n";
       return $additional;
    }

}

include "ilan.php";
include "iwan.php";

?>
