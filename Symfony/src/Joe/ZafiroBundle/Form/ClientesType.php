<?php

namespace Joe\ZafiroBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class ClientesType extends AbstractType
{
        /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('descripcion')
            ->add('macaddress')
            ->add('estado','choice', array(
            		'choices' => \Joe\ZafiroBundle\Entity\Clientes::estados()
            		))
            ->add('ip')
            ->add('fechaAlta')
            ->add('fechaBaja')
            ->add('clientes_plan')
            ->add('nombre')
            ->add('direccion')
            ->add('telefono')
            ->add('cuit')
            ->add('email', 'email',array('required'=>false))
            ->add('enrutaProxy')
            ->add('salidaHabilitada')
            ->add('clientes_interface')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Joe\ZafiroBundle\Entity\Clientes'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'joe_zafirobundle_clientes';
    }
}
