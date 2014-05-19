<?php
namespace Joe\ZafiroBundle\Entity;

use Doctrine\ORM\EntityRepository;
use ClassesWithParents\A;

class CanalesRepository extends EntityRepository
{
	public function getCanalesArray()
	{
		$o=$this->getEntityManager()->getRepository('JoeZafiroBundle:Canales')->findAll();
		$a=array();
		foreach ($o as $canal)
		{
				$a[$canal->getId()]=$canal->getNombre();
		}
		return $a;
	}
}