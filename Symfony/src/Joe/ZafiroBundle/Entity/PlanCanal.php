<?php

namespace Joe\ZafiroBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PlanCanal
 *
 * @ORM\Table(name="plan_canal")
 * @ORM\Entity
 */
class PlanCanal
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="canales_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $canalesId;

    /**
     * @var integer
     *
     * @ORM\Column(name="planes_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $planesId;

    /**
     * @var integer
     *
     * @ORM\Column(name="dia", type="integer", nullable=true)
     */
    private $dia;

    /**
     * @var integer
     *
     * @ORM\Column(name="hora", type="integer", nullable=true)
     */
    private $hora;

    /**
     * @var integer
     * JOE Asi se hace un inner join
     * @ORM\OneToMany(targetEntity="Planes",mappedBy="plan_pc")
     */
    private $pc_plan;
    
    /**
     * @var integer
     * JOE Asi se hace un inner join
     * @ORM\OneToMany(targetEntity="Canales",mappedBy="canal_pc")
     */
    private $pc_canal;

    /**
     * Set id
     *
     * @param integer $id
     * @return PlanCanal
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
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
     * Set canalesId
     *
     * @param integer $canalesId
     * @return PlanCanal
     */
    public function setCanalesId($canalesId)
    {
        $this->canalesId = $canalesId;

        return $this;
    }

    /**
     * Get canalesId
     *
     * @return integer 
     */
    public function getCanalesId()
    {
        return $this->canalesId;
    }

    /**
     * Set planesId
     *
     * @param integer $planesId
     * @return PlanCanal
     */
    public function setPlanesId($planesId)
    {
        $this->planesId = $planesId;

        return $this;
    }

    /**
     * Get planesId
     *
     * @return integer 
     */
    public function getPlanesId()
    {
        return $this->planesId;
    }

    /**
     * Set dia
     *
     * @param integer $dia
     * @return PlanCanal
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
     * @return PlanCanal
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
     * Constructor
     */
    public function __construct()
    {
        $this->pc_plan = new \Doctrine\Common\Collections\ArrayCollection();
        $this->pc_canal = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add pc_plan
     *
     * @param \Joe\ZafiroBundle\Entity\Planes $pcPlan
     * @return PlanCanal
     */
    public function addPcPlan(\Joe\ZafiroBundle\Entity\Planes $pcPlan)
    {
        $this->pc_plan[] = $pcPlan;

        return $this;
    }

    /**
     * Remove pc_plan
     *
     * @param \Joe\ZafiroBundle\Entity\Planes $pcPlan
     */
    public function removePcPlan(\Joe\ZafiroBundle\Entity\Planes $pcPlan)
    {
        $this->pc_plan->removeElement($pcPlan);
    }

    /**
     * Get pc_plan
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getPcPlan()
    {
        return $this->pc_plan;
    }

    /**
     * Add pc_canal
     *
     * @param \Joe\ZafiroBundle\Entity\Canales $pcCanal
     * @return PlanCanal
     */
    public function addPcCanal(\Joe\ZafiroBundle\Entity\Canales $pcCanal)
    {
        $this->pc_canal[] = $pcCanal;

        return $this;
    }

    /**
     * Remove pc_canal
     *
     * @param \Joe\ZafiroBundle\Entity\Canales $pcCanal
     */
    public function removePcCanal(\Joe\ZafiroBundle\Entity\Canales $pcCanal)
    {
        $this->pc_canal->removeElement($pcCanal);
    }

    /**
     * Get pc_canal
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getPcCanal()
    {
        return $this->pc_canal;
    }
}
