<?php

namespace Joe\ZafiroBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Interfacesvirtuales
 *
 * @ORM\Table(name="interfacesvirtuales")
 * @ORM\Entity
 */
class Interfacesvirtuales
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="interfacesvirtualesint", type="string", length=7, nullable=true)
     */
    private $interfacesvirtualesint;

    /**
     * @var integer
     *
     * @ORM\Column(name="interfacesvirtualesest", type="integer", nullable=true)
     */
    private $interfacesvirtualesest;



    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set interfacesvirtualesint
     *
     * @param string $interfacesvirtualesint
     * @return Interfacesvirtuales
     */
    public function setInterfacesvirtualesint($interfacesvirtualesint)
    {
        $this->interfacesvirtualesint = $interfacesvirtualesint;

        return $this;
    }

    /**
     * Get interfacesvirtualesint
     *
     * @return string 
     */
    public function getInterfacesvirtualesint()
    {
        return $this->interfacesvirtualesint;
    }

    /**
     * Set interfacesvirtualesest
     *
     * @param integer $interfacesvirtualesest
     * @return Interfacesvirtuales
     */
    public function setInterfacesvirtualesest($interfacesvirtualesest)
    {
        $this->interfacesvirtualesest = $interfacesvirtualesest;

        return $this;
    }

    /**
     * Get interfacesvirtualesest
     *
     * @return integer 
     */
    public function getInterfacesvirtualesest()
    {
        return $this->interfacesvirtualesest;
    }
}
