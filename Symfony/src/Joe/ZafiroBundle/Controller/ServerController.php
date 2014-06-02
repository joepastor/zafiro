<?php

namespace Joe\ZafiroBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Joe\ZafiroBundle\Entity\Canales;
use Joe\ZafiroBundle\Form\CanalesType;

use Symfony\Component\Process\Process;

/**
 * Server controller.
 *
 */
class ServerController extends Controller
{

    public function networkinfoAction(Request $r) 
    {
    	
    	$form = $this
    	->get('form.factory')->createNamedBuilder('')
    	->setMethod("POST")
    	->add('hostname', 'text')
    	->add('comando','choice',array(
    			'choices'=>array(
    				'whois' => 'Whois',
    				'traceroute' => 'Traza de ruta',
    				'nslookup' => 'Informacion de IP',
    				'dig' => 'Informacion de Dominio',
					'nmap' => 'Deteccion de equipos',
					'ping' => 'Ping',
    			),
    			'required' => true,
    			'expanded'=>'false',))
    	->add('submit', 'submit', array('label' => 'Consultar'))
    	->setAction($this->generateUrl("networkinfo"))
    	->getForm();
    	
    	//$f=$r->get("form");
    	$datos="";
    	$resultado="";
    	
    	if($r->get("hostname") != ""){
    		$comando="";
    		if($r->get("comando")=="whois"){
    			$comando=$r->get("comando").' '.$r->get("hostname");
    		}
    		if($r->get("comando")=="traceroute"){
    			$comando=$r->get("comando").' -m 10 -w 1 -n '.$r->get("hostname").' ';
    		}
    		if($r->get("comando")=="nslookup"){
    			$comando=$r->get("comando").' '.$r->get("hostname");
    		}
    		if($r->get("comando")=="dig"){
    			$comando=$r->get("comando").' '.$r->get("hostname");
    		}
    		if($r->get("comando")=="nmap"){
    			$comando=$r->get("comando").' 172.16.0.*';
    		}
    		if($r->get("comando")=="ping"){
    			$comando=$r->get("comando").' -c 4 '.$r->get("hostname");
    		}
    		$process = new Process($comando);
			$process->run(function ($type, $buffer) {
			    if (Process::ERR === $type) {
			        $res='ERR > '.$buffer;
			    } else {
			        $res='OUT > '.$buffer;
			    }
			});
			$resultado = $process->getOutput();
    	}

    	return $this->render('JoeZafiroBundle:Server:networkinfo.html.twig', array(
    		'form'=>$form->createView(),
    		'resultado'=>$resultado,
    	));
    	
    }
    
    public function networkinfo_comandoAction(Request $r)
    {	
    	if($r->get("info")!=""){
    		switch($r->get("info")){
    			case "arp":
    				echo $this->getarp();
    				$comando=$r->get("info")." -n";
    				break;
    			case "ifconfig":
    				$comando=$r->get("info");
    				break;
    			case "route":
    				$comando=$r->get("info")." -n";
    				break;
    			case "dmesg":
    				$comando=$r->get("info");
    				break;
				case "syslog":
    				$comando="tail /var/log/system.log";
    				break;
    				
    			default:
    				$comando="";
    				break;
    		}
    		$process = new Process($comando);
    		$process->run(function ($type, $buffer) {
    			if (Process::ERR === $type) {
    				$res='ERR > '.$buffer;
    			} else {
    				$res='OUT > '.$buffer;
    			}
    		});
    		echo $comando;
    		$resultado = $process->getOutput();
    		echo system($comando);
    	}
    	
    		
	   	return $this->render('JoeZafiroBundle:Server:networkinfo_comando.html.twig', array(
	   		'resultado'=>$resultado,
	   		'nombre'=>$r->get("info")
	   	));

    }
    
    public function actionAction($name)
    {
    	$id=0;
    	$msg="";
		switch($name){
			case "aplicar":
				$id=6;
				$msg="Los cambios se estan aplicando en el servidor.";												
				break;
			case "apagar":
				$id=1;
				$msg="El servidor se apagará en breve.";
				break;
			case "reiniciar":
				$id=2;
				$msg="El servidor se reiniciará en breve.";
				break;
			case "reiniciar_red":
				$msg="El servidor está reiniciando el servicio de red.\nAlgunos clientes serán desconectados temporalmente.";
				$id=3;
				break;
			case "reiniciar_vpn":
				$msg="Se está reiniciando el servicio de VPN.\n\rPosiblemnte algunos clientes serán desconectados temporalmente.";
				$id=4;
				break;
			case "reiniciar_dhcp":
				$msg="El servidor está reiniciando el servicio de asignación automática de IP (DHCP)";
				$id=5;
				break;
			case "shape":
				$msg="El servidor está aplicando nuevos seteos de ancho de banda";
				$id=7;
				break;
		}
    	if($id<>0){
    		$em = $this->getDoctrine()->getEntityManager();
    		$connection = $em->getConnection();
    		$statement = $connection->prepare("update acciones set valor=1 where id=".$id);
    		$statement->execute();
    	}
    	return $this->render('JoeZafiroBundle:Server:actions.html.twig',array(
    			'servicio' => $name,
    			'mensaje' => $msg,
    	));
    }
    
    public function getarp() {
    	$resultado="";
    	$resultado.="<h1>Tabla ARP del sistema</h1>";
        $resultado.="<table align=center>";
        $resultado.="<tr><th>IP</th><th>HW Tipo</th><th>Flags</th><th>MAC</th><th>Mask</th><th>Dispositivo</th></tr>";
		$fd = fopen("/proc/net/arp", "r");
		$erra = 0;
		while (!feof($fd)) {
			$caca = trim(fgets($fd, 1024));
			if ($erra == 1) {
				$resultado.="<tr>";
				$trozos = explode(" ", $caca);
				$c = 0;
				$incompleto = 0;
				foreach ($trozos as $pis => $valor) {
					if ($valor != "") {
						if ($valor == "(incomplete)") {
							$resultado.="<td>&nbsp;</td>";
							$resultado.="<td>".$valor."</td>";
							$resultado.="<td>&nbsp;</td>";
							$incompleto = 1;
						} else {
							if ($c == 3) {
								if (!$incompleto) {
									$resultado.="<td><a href=abmcliente.php?mac=".$valor."&clientesid=0>".$valor."</a></td>";
								} else {
									$resultado.="<td>" . $valor . "</td>";
								}
							} else {
								$resultado.="<td>" . $valor . "</td>";
							}
						}
						$c++;
					}
				}
				$resultado.="</tr>";
			}
			$erra = 1;
		}
		$resultado.="</table>";
		return $resultado;
    }
}