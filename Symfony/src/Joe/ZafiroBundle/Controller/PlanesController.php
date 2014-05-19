<?php

namespace Joe\ZafiroBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Joe\ZafiroBundle\Entity\Planes;
use Joe\ZafiroBundle\Form\PlanesType;

/**
 * Planes controller.
 *
 */
class PlanesController extends Controller
{

    /**
     * Lists all Planes entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('JoeZafiroBundle:Planes')->findAll();

        return $this->render('JoeZafiroBundle:Planes:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new Planes entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Planes();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('planes_show', array('id' => $entity->getId())));
        }

        return $this->render('JoeZafiroBundle:Planes:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
    * Creates a form to create a Planes entity.
    *
    * @param Planes $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createCreateForm(Planes $entity)
    {
    	$ac=$this->getDoctrine()->getManager()->getRepository('JoeZafiroBundle:Canales')->getCanalesArray();

        $form = $this->createForm(new PlanesType($ac), $entity, array(
            'action' => $this->generateUrl('planes_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Planes entity.
     *
     */
    public function newAction()
    {
        $entity = new Planes();
        $form   = $this->createCreateForm($entity);

        return $this->render('JoeZafiroBundle:Planes:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Planes entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Planes')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Planes entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Planes:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),        ));
    }

    /**
     * Displays a form to edit an existing Planes entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Planes')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Planes entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('JoeZafiroBundle:Planes:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Planes entity.
    *
    * @param Planes $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Planes $entity)
    {
		$ac=$this->getDoctrine()->getManager()->getRepository('JoeZafiroBundle:Canales')->getCanalesArray();

        $form = $this->createForm(new PlanesType($ac), $entity, array(
            'action' => $this->generateUrl('planes_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Planes entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('JoeZafiroBundle:Planes')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Planes entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('planes_edit', array('id' => $id)));
        }

        return $this->render('JoeZafiroBundle:Planes:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Planes entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('JoeZafiroBundle:Planes')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Planes entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('planes'));
    }

    /**
     * Creates a form to delete a Planes entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('planes_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
