<?php

namespace Joe\ZafiroBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class InterfacesType extends AbstractType
{
        /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('device')
            ->add('descripcion')
            ->add('ip')
            ->add('netmask')
            ->add('network')
            ->add('broadcast')
            ->add('gateway')
            ->add('enabled')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Joe\ZafiroBundle\Entity\Interfaces'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'joe_zafirobundle_interfaces';
    }
}
