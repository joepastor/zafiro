<?php

namespace Joe\ZafiroBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Planes
 *
 * @ORM\Table(name="planes")
 * @ORM\Entity
 */
class Planes
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
     * @ORM\Column(name="plan_canal", type="integer", nullable=false)
     */
    private $plan_canal;

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
     *
     * @ORM\Column(name="valor", type="integer", nullable=true)
     */
    private $valor;

    /**
     * @var integer
     * JOE Asi se hace un inner join
     * @ORM\ManyToOne(targetEntity="Clientes" ,inversedBy="clientes_plan")
     */
    private $plan_clientes;

    /**
     * @var integer
     * JOE Asi se hace un inner join
     * @ORM\ManyToOne(targetEntity="PlanCanal" ,inversedBy="pc_plan")
     */
    private $plan_pc;
    
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
     * Set plan_canal
     *
     * @param integer $plan_canal
     * @return Planes
     */
    public function setPlan_Canal($plan_canal)
    {
        $this->plan_canal = $plan_canal;

        return $this;
    }

    /**
     * Get plan_canal
     *
     * @return integer 
     */
    public function getPlan_Canal()
    {
        return $this->plan_canal;
    }

    /**
     * Set estado
     *
     * @param integer $estado
     * @return Planes
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
     * @return Planes
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
     * Set valor
     *
     * @param integer $valor
     * @return Planes
     */
    public function setValor($valor)
    {
        $this->valor = $valor;

        return $this;
    }

    /**
     * Get valor
     *
     * @return integer 
     */
    public function getValor()
    {
        return $this->valor;
    }
}
