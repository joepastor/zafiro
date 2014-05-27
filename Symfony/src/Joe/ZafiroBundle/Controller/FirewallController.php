<?php

namespace Joe\ZafiroBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Joe\ZafiroBundle\Entity\Firewall;
use Joe\ZafiroBundle\Form\FirewallType;

/**
 * Firewall controller.
 *
 */
class FirewallController extends Controller
{

    /**
     * Lists all Firewall entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        
        $query = $em->createQueryBuilder()
        ->select('c')
        ->from('JoeZafiroBundle:Firewall','c')
        ->getQuery();
        
        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
        		$query,
        		$this->get('request')->query->get('page', 1)/*page number*/,
        		999/*limit per page*/
        );
        
        return $this->render('JoeZafiroBundle:Firewall:index.html.twig', array('entities' => $pagination));
        		
        //$entities = $em->getRepository('JoeZafiroBundle:Firewall')->findAll();

        //return $this->render('JoeZafiroBundle:Firewall:index.html.twig', array(
        //    'entities' => $entities,
        //));
		
        		
    }
    /**
     * Creates a new Firewall entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Firewall();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('firewall_show', array('id' => $entity->getId())));
        }

        return $this->render('JoeZafiroBundle:Firewall:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
    * Creates a form to create a Firewall entity.
    *
    * @param Firewall $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createCreateForm(Firewall $entity)
    {
        $form = $this->createForm(new FirewallType(), $entity, array(
            'action' => $this->generateUrl('firewall_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Firewall entity.
     *
     */
    public function newAction()
    {
        $entity = new Firewall();
        $form   = $this->createCreateForm($entity);

        return $this->render('JoeZafiroBundle:Firewall:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Firewall entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Firewall')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Firewall entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Firewall:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),        ));
    }

    /**
     * Displays a form to edit an existing Firewall entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Firewall')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Firewall entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Firewall:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Firewall entity.
    *
    * @param Firewall $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Firewall $entity)
    {
        $form = $this->createForm(new FirewallType(), $entity, array(
            'action' => $this->generateUrl('firewall_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Firewall entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Firewall')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Firewall entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('firewall_edit', array('id' => $id)));
        }

        return $this->render('JoeZafiroBundle:Firewall:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Firewall entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('JoeZafiroBundle:Firewall')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Firewall entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('firewall'));
    }

    /**
     * Creates a form to delete a Firewall entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('firewall_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
    
    public function toggle_estadoAction($id)
    {
    	/*
    	 * JOE
    	* */
    
    	$em = $this->getDoctrine()->getManager();
    	$firewall = $em->getRepository('JoeZafiroBundle:Firewall')->find($id);
    	$firewall->toggle_estado();
    	$em->flush();
    
    	return $this->forward("JoeZafiroBundle:Firewall:index");
    }
}
