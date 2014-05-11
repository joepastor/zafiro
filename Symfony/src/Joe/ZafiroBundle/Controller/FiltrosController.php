<?php

namespace Joe\ZafiroBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Joe\ZafiroBundle\Entity\Filtros;
use Joe\ZafiroBundle\Form\FiltrosType;

/**
 * Filtros controller.
 *
 */
class FiltrosController extends Controller
{

    /**
     * Lists all Filtros entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('JoeZafiroBundle:Filtros')->findAll();

        return $this->render('JoeZafiroBundle:Filtros:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new Filtros entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Filtros();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('filtros_show', array('id' => $entity->getId())));
        }

        return $this->render('JoeZafiroBundle:Filtros:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
    * Creates a form to create a Filtros entity.
    *
    * @param Filtros $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createCreateForm(Filtros $entity)
    {
        $form = $this->createForm(new FiltrosType(), $entity, array(
            'action' => $this->generateUrl('filtros_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Filtros entity.
     *
     */
    public function newAction()
    {
        $entity = new Filtros();
        $form   = $this->createCreateForm($entity);

        return $this->render('JoeZafiroBundle:Filtros:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Filtros entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Filtros')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Filtros entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Filtros:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),        ));
    }

    /**
     * Displays a form to edit an existing Filtros entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Filtros')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Filtros entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Filtros:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Filtros entity.
    *
    * @param Filtros $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Filtros $entity)
    {
        $form = $this->createForm(new FiltrosType(), $entity, array(
            'action' => $this->generateUrl('filtros_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Filtros entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Filtros')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Filtros entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('filtros_edit', array('id' => $id)));
        }

        return $this->render('JoeZafiroBundle:Filtros:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Filtros entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('JoeZafiroBundle:Filtros')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Filtros entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('filtros'));
    }

    /**
     * Creates a form to delete a Filtros entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('filtros_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
