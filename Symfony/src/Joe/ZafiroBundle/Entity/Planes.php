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
     * @ORM\Column(name="plan", type="integer", nullable=false)
     */
    private $plan;

    /**
     * @var integer
     *
     * @ORM\Column(name="dia", type="integer", nullable=false)
     */
    private $dia = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="hora", type="integer", nullable=false)
     */
    private $hora = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="canal", type="integer", nullable=false)
     */
    private $canal = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="estado", type="integer", nullable=false)
     */
    private $estado = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=45, nullable=false)
     */
    private $nombre = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="valor", type="integer", nullable=true)
     */
    private $valor;

    /**
     * @var integer
     * JOE Asi se hace un inner join
     * @ORM\OneToMany(targetEntity="Clientes",mappedBy="clientes_plan")
     */
	private $plan_clientes;
	
	public function __toString()
	{
		return $this->getNombre();
	}
	
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
     * Set plan
     *
     * @param integer $plan
     * @return Planes
     */
    public function setPlan($plan)
    {
        $this->plan = $plan;

        return $this;
    }

    /**
     * Get plan
     *
     * @return integer 
     */
    public function getPlan()
    {
        return $this->plan;
    }

    /**
     * Set dia
     *
     * @param integer $dia
     * @return Planes
     */
    public function setDia($dia)
    {
        $this->dia = $dia;

        return $this;
    }

    /**
     * Get dia
     *
     * @return integer 
     */
    public function getDia()
    {
        return $this->dia;
    }

    /**
     * Set hora
     *
     * @param integer $hora
     * @return Planes
     */
    public function setHora($hora)
    {
        $this->hora = $hora;

        return $this;
    }

    /**
     * Get hora
     *
     * @return integer 
     */
    public function getHora()
    {
        return $this->hora;
    }

    /**
     * Set canal
     *
     * @param integer $canal
     * @return Planes
     */
    public function setCanal($canal)
    {
        $this->canal = $canal;

        return $this;
    }

    /**
     * Get canal
     *
     * @return integer 
     */
    public function getCanal()
    {
        return $this->canal;
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
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->plan_clientes = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add plan_clientes
     *
     * @param \Joe\ZafiroBundle\Entity\Clientes $planClientes
     * @return Planes
     */
    public function addPlanCliente(\Joe\ZafiroBundle\Entity\Clientes $planClientes)
    {
        $this->plan_clientes[] = $planClientes;

        return $this;
    }

    /**
     * Remove plan_clientes
     *
     * @param \Joe\ZafiroBundle\Entity\Clientes $planClientes
     */
    public function removePlanCliente(\Joe\ZafiroBundle\Entity\Clientes $planClientes)
    {
        $this->plan_clientes->removeElement($planClientes);
    }

    /**
     * Get plan_clientes
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getPlanClientes()
    {
        return $this->plan_clientes;
    }
}
