<?php

namespace Joe\ZafiroBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class PlanesType extends AbstractType
{
	
	private $canales;
	
	public function __construct($Canales){
		$this->canales=$Canales;
	}
     /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
    	$defaultData = array('valor' => 'Type your message here');
    	 
        $builder
            ->add('nombre')
            ->add('valor')
        	->add('estado')
        ;
		for($d=0;$d<7;$d++){
			for($h=0;$h<24;$h++){
				$h1=str_pad($h,2,"0",STR_PAD_LEFT);
				$builder->add('d'.$d.'h'.$h1,'choice',
            		array(
					'choices'=>$this->canales,
            		'label'=>'Dia '.$d.' hora '.$h1,
				));				
			}
		}
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Joe\ZafiroBundle\Entity\Planes'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'joe_zafirobundle_planes';
    }
}
