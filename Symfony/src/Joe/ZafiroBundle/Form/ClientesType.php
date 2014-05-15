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
            ->add('clientesper')
            ->add('estado','choice', array(
            		'choices' => array(
            			'1' => 'Activo',
            			'0' => 'Inactivo',
            			)
            		))
            ->add('ip')
            ->add('fechaAlta')
            ->add('fechaBaja')
            ->add('plan')
            ->add('clientes_plan')
            ->add('nombre')
            ->add('direccion')
            ->add('telefono')
            ->add('cuit')
            ->add('email', 'email',array('required'=>false))
            ->add('enrutaProxy')
            ->add('salidaHabilitada')
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
