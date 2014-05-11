<?php

namespace Joe\ZafiroBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Joe\ZafiroBundle\Entity\Interfaces;
use Joe\ZafiroBundle\Form\InterfacesType;

/**
 * Interfaces controller.
 *
 */
class InterfacesController extends Controller
{

    /**
     * Lists all Interfaces entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('JoeZafiroBundle:Interfaces')->findAll();

        return $this->render('JoeZafiroBundle:Interfaces:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new Interfaces entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Interfaces();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('interfaces_show', array('id' => $entity->getId())));
        }

        return $this->render('JoeZafiroBundle:Interfaces:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
    * Creates a form to create a Interfaces entity.
    *
    * @param Interfaces $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createCreateForm(Interfaces $entity)
    {
        $form = $this->createForm(new InterfacesType(), $entity, array(
            'action' => $this->generateUrl('interfaces_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Interfaces entity.
     *
     */
    public function newAction()
    {
        $entity = new Interfaces();
        $form   = $this->createCreateForm($entity);

        return $this->render('JoeZafiroBundle:Interfaces:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Interfaces entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Interfaces')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Interfaces entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Interfaces:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),        ));
    }

    /**
     * Displays a form to edit an existing Interfaces entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Interfaces')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Interfaces entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Interfaces:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Interfaces entity.
    *
    * @param Interfaces $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Interfaces $entity)
    {
        $form = $this->createForm(new InterfacesType(), $entity, array(
            'action' => $this->generateUrl('interfaces_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Interfaces entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Interfaces')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Interfaces entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('interfaces_edit', array('id' => $id)));
        }

        return $this->render('JoeZafiroBundle:Interfaces:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Interfaces entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('JoeZafiroBundle:Interfaces')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Interfaces entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('interfaces'));
    }

    /**
     * Creates a form to delete a Interfaces entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('interfaces_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
