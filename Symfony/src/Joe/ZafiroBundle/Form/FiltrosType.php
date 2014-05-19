<?php

namespace Joe\ZafiroBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class FiltrosType extends AbstractType
{
        /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nombre')
            ->add('tipo','choice', array(
            		'choices' => array(
            			'TCP' => 'TCP',
            			'UDP' => 'UDP',
            			)
            		))
            ->add('ipsource')
            ->add('ipdestino')
            ->add('puertosource')
            ->add('puertodestino')
            ->add('interfaceentrada','entity',array(
					'class'=>'JoeZafiroBundle:Interfaces'))
            ->add('interfacesalida','entity',array(
					'class'=>'JoeZafiroBundle:Interfaces'))
			->add('estado')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Joe\ZafiroBundle\Entity\Filtros'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'joe_zafirobundle_filtros';
    }
}
