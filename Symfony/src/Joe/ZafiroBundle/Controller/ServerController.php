<?php

namespace Joe\ZafiroBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Joe\ZafiroBundle\Entity\Canales;
use Joe\ZafiroBundle\Form\CanalesType;

/**
 * Server controller.
 *
 */
class ServerController extends Controller
{

    public function infoAction($name)
    {
    	switch($name){
    		case "placas":
    			$file="/Users/Joe/placas.txt";
    			break;
    		case "dmesg":
    			$file="/Users/Joe/dmesg.txt";
    			break;
    	}
    	$c="";
        $fd = fopen($file, "r");
        if ($fd) {
        	while (!feof($fd)) {
        		$c.=trim(fgets($fd, 1024)) . "\n";
        	}
        }

        return $this->render('JoeZafiroBundle:Server:index.html.twig',array(
            'datos' => $c,
        ));
    }
    public function whoisAction(){
    	$placas="";
    	return $this->render('JoeZafiroBundle:Server:whois.html.twig',array(
    			'datos' => $placas,
    	));
    }
    
    public function toolsAction($parameter)
    {
    	switch($parameter){
    		
    	}
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
}
