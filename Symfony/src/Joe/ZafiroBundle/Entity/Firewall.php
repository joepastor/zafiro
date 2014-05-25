<?php

namespace Joe\ZafiroBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Firewall
 *
 * @ORM\Table(name="firewall")
 * @ORM\Entity
 */
class Firewall
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
     * @ORM\Column(name="comando", type="string", length=255, nullable=false)
     */
    private $comando;

    /**
     * @var integer
     *
     * @ORM\Column(name="estado", type="boolean", nullable=true)
     */
    private $estado;

    /**
     * @var string
     *
     * @ORM\Column(name="comentario", type="string", length=255, nullable=false)
     */
    private $comentario;

    /**
     * @var integer
     *
     * @ORM\Column(name="orden", type="integer", nullable=true)
     */
    private $orden;



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
     * Set comando
     *
     * @param string $comando
     * @return Firewall
     */
    public function setComando($comando)
    {
        $this->comando = $comando;

        return $this;
    }

    /**
     * Get comando
     *
     * @return string 
     */
    public function getComando()
    {
        return $this->comando;
    }

    /**
     * Set estado
     *
     * @param integer $estado
     * @return Firewall
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
     * Set comentario
     *
     * @param string $comentario
     * @return Firewall
     */
    public function setComentario($comentario)
    {
        $this->comentario = $comentario;

        return $this;
    }

    /**
     * Get comentario
     *
     * @return string 
     */
    public function getComentario()
    {
        return $this->comentario;
    }

    /**
     * Set orden
     *
     * @param integer $orden
     * @return Firewall
     */
    public function setOrden($orden)
    {
        $this->orden = $orden;

        return $this;
    }

    /**
     * Get orden
     *
     * @return integer 
     */
    public function getOrden()
    {
        return $this->orden;
    }
    public static function estados(){
    	return array(
    			'1' => 'Activo',
    			'0' => 'Inactivo',
    	);
    }
    public function getNombreEstado(){
    	$a = $this->estados();
    	return $a[$this->estado];
    }
    public function toggle_estado()
    {
    	$valor=0;
    	$valor=($this->getEstado()) ? 0 : 1;
    	$this->setEstado($valor);
    
    }
}
