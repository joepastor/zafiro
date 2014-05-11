<?php

namespace Joe\ZafiroBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Forwardeos
 *
 * @ORM\Table(name="forwardeos")
 * @ORM\Entity
 */
class Forwardeos
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
     * @var integer
     *
     * @ORM\Column(name="puesrc", type="integer", nullable=false)
     */
    private $puesrc = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="puedst", type="integer", nullable=false)
     */
    private $puedst = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="ipdst", type="string", length=45, nullable=false)
     */
    private $ipdst = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="estado", type="integer", nullable=false)
     */
    private $estado = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="ipsrc", type="string", length=45, nullable=false)
     */
    private $ipsrc = '';



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
     * Set puesrc
     *
     * @param integer $puesrc
     * @return Forwardeos
     */
    public function setPuesrc($puesrc)
    {
        $this->puesrc = $puesrc;

        return $this;
    }

    /**
     * Get puesrc
     *
     * @return integer 
     */
    public function getPuesrc()
    {
        return $this->puesrc;
    }

    /**
     * Set puedst
     *
     * @param integer $puedst
     * @return Forwardeos
     */
    public function setPuedst($puedst)
    {
        $this->puedst = $puedst;

        return $this;
    }

    /**
     * Get puedst
     *
     * @return integer 
     */
    public function getPuedst()
    {
        return $this->puedst;
    }

    /**
     * Set ipdst
     *
     * @param string $ipdst
     * @return Forwardeos
     */
    public function setIpdst($ipdst)
    {
        $this->ipdst = $ipdst;

        return $this;
    }

    /**
     * Get ipdst
     *
     * @return string 
     */
    public function getIpdst()
    {
        return $this->ipdst;
    }

    /**
     * Set estado
     *
     * @param integer $estado
     * @return Forwardeos
     */
    public function setEstado($estado)
    {
        $this->estado = $estado;

        return $this;
    }

    /**
     * Get estado
     *
     * @return integer 
     */
    public function getEstado()
    {
        return $this->estado;
    }

    /**
     * Set ipsrc
     *
     * @param string $ipsrc
     * @return Forwardeos
     */
    public function setIpsrc($ipsrc)
    {
        $this->ipsrc = $ipsrc;

        return $this;
    }

    /**
     * Get ipsrc
     *
     * @return string 
     */
    public function getIpsrc()
    {
        return $this->ipsrc;
    }
}
