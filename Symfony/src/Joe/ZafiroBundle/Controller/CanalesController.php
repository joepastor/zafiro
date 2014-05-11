<?php

namespace Joe\ZafiroBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Joe\ZafiroBundle\Entity\Canales;
use Joe\ZafiroBundle\Form\CanalesType;

/**
 * Canales controller.
 *
 */
class CanalesController extends Controller
{

    /**
     * Lists all Canales entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('JoeZafiroBundle:Canales')->findAll();

        return $this->render('JoeZafiroBundle:Canales:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new Canales entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Canales();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('canales_show', array('id' => $entity->getId())));
        }

        return $this->render('JoeZafiroBundle:Canales:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
    * Creates a form to create a Canales entity.
    *
    * @param Canales $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createCreateForm(Canales $entity)
    {
        $form = $this->createForm(new CanalesType(), $entity, array(
            'action' => $this->generateUrl('canales_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Canales entity.
     *
     */
    public function newAction()
    {
        $entity = new Canales();
        $form   = $this->createCreateForm($entity);

        return $this->render('JoeZafiroBundle:Canales:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Canales entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Canales')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Canales entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Canales:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),        ));
    }

    /**
     * Displays a form to edit an existing Canales entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Canales')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Canales entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Canales:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Canales entity.
    *
    * @param Canales $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Canales $entity)
    {
        $form = $this->createForm(new CanalesType(), $entity, array(
            'action' => $this->generateUrl('canales_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Canales entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Canales')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Canales entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('canales_edit', array('id' => $id)));
        }

        return $this->render('JoeZafiroBundle:Canales:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Canales entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('JoeZafiroBundle:Canales')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Canales entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('canales'));
    }

    /**
     * Creates a form to delete a Canales entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('canales_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
