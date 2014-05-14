<?php

namespace Joe\ZafiroBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{	
    public function indexAction()
    {
        return $this->render('JoeZafiroBundle:Default:index.html.twig');
    }
}