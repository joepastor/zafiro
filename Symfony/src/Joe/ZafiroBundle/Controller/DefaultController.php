<?php

namespace Joe\ZafiroBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{	
    public function indexAction()
    {
        return $this->render('JoeZafiroBundle:Default:index.html.twig');
    }
    
    public function listAction($name)
    {
    	switch($name){
    		case "clientes":
    			return $this->render('JoeZafiroBundle:Default:clientes.html.twig', array('name' => $name));
    		case "canales":
    			return $this->render('JoeZafiroBundle:Default:canales.html.twig', array('name' => $name));
    	}
    	
    }  
}