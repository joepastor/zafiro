<?php

namespace Joe\ZafiroBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Canales
 *
 * @ORM\Table(name="canales")
 * @ORM\Entity
 */
class Canales
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
     * @ORM\Column(name="subida", type="integer", nullable=false)
     */
    private $subida;

    /**
     * @var integer
     *
     * @ORM\Column(name="bajada", type="integer", nullable=false)
     */
    private $bajada;

    /**
     * @var integer
     *
     * @ORM\Column(name="estado", type="integer", nullable=false)
     */
    private $estado;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=45, nullable=false)
     */
    private $nombre;

    /**
     * @var integer
     * JOE Asi se hace un inner join
     * @ORM\OneToMany(targetEntity="PlanCanal",mappedBy="pc_canal")
     */
    private $canal_pc;


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
     * Set subida
     *
     * @param integer $subida
     * @return Canales
     */
    public function setSubida($subida)
    {
        $this->subida = $subida;

        return $this;
    }

    /**
     * Get subida
     *
     * @return integer 
     */
    public function getSubida()
    {
        return $this->subida;
    }

    /**
     * Set bajada
     *
     * @param integer $bajada
     * @return Canales
     */
    public function setBajada($bajada)
    {
        $this->bajada = $bajada;

        return $this;
    }

    /**
     * Get bajada
     *
     * @return integer 
     */
    public function getBajada()
    {
        return $this->bajada;
    }

    /**
     * Set estado
     *
     * @param integer $estado
     * @return Canales
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
     * Set nombre
     *
     * @param string $nombre
     * @return Canales
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre
     *
     * @return string 
     */
    public function getNombre()
    {
        return $this->nombre;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->canal_pc = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add canal_pc
     *
     * @param \Joe\ZafiroBundle\Entity\PlanCanal $canalPc
     * @return Canales
     */
    public function addCanalPc(\Joe\ZafiroBundle\Entity\PlanCanal $canalPc)
    {
        $this->canal_pc[] = $canalPc;

        return $this;
    }

    /**
     * Remove canal_pc
     *
     * @param \Joe\ZafiroBundle\Entity\PlanCanal $canalPc
     */
    public function removeCanalPc(\Joe\ZafiroBundle\Entity\PlanCanal $canalPc)
    {
        $this->canal_pc->removeElement($canalPc);
    }

    /**
     * Get canal_pc
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getCanalPc()
    {
        return $this->canal_pc;
    }
}
