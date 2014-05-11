<?php

namespace Joe\ZafiroBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Joe\ZafiroBundle\Entity\Forwardeos;
use Joe\ZafiroBundle\Form\ForwardeosType;

/**
 * Forwardeos controller.
 *
 */
class ForwardeosController extends Controller
{

    /**
     * Lists all Forwardeos entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('JoeZafiroBundle:Forwardeos')->findAll();

        return $this->render('JoeZafiroBundle:Forwardeos:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new Forwardeos entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Forwardeos();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('forwardeos_show', array('id' => $entity->getId())));
        }

        return $this->render('JoeZafiroBundle:Forwardeos:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
    * Creates a form to create a Forwardeos entity.
    *
    * @param Forwardeos $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createCreateForm(Forwardeos $entity)
    {
        $form = $this->createForm(new ForwardeosType(), $entity, array(
            'action' => $this->generateUrl('forwardeos_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Forwardeos entity.
     *
     */
    public function newAction()
    {
        $entity = new Forwardeos();
        $form   = $this->createCreateForm($entity);

        return $this->render('JoeZafiroBundle:Forwardeos:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Forwardeos entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Forwardeos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Forwardeos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Forwardeos:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),        ));
    }

    /**
     * Displays a form to edit an existing Forwardeos entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Forwardeos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Forwardeos entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Forwardeos:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Forwardeos entity.
    *
    * @param Forwardeos $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Forwardeos $entity)
    {
        $form = $this->createForm(new ForwardeosType(), $entity, array(
            'action' => $this->generateUrl('forwardeos_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Forwardeos entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Forwardeos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Forwardeos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('forwardeos_edit', array('id' => $id)));
        }

        return $this->render('JoeZafiroBundle:Forwardeos:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Forwardeos entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('JoeZafiroBundle:Forwardeos')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Forwardeos entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('forwardeos'));
    }

    /**
     * Creates a form to delete a Forwardeos entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('forwardeos_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
