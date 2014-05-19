<?php

namespace Joe\ZafiroBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Filtros
 *
 * @ORM\Table(name="filtros")
 * @ORM\Entity
 */
class Filtros
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
     * @ORM\Column(name="nombre", type="string", length=255, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="tipo", type="string", length=10, nullable=false)
     */
    private $tipo;

    /**
     * @var string
     *
     * @ORM\Column(name="ipsource", type="string", length=15, nullable=true)
     */
    private $ipsource;

    /**
     * @var string
     *
     * @ORM\Column(name="ipdestino", type="string", length=15, nullable=true)
     */
    private $ipdestino;

    /**
     * @var string
     *
     * @ORM\Column(name="puertosource", type="string", length=255, nullable=true)
     */
    private $puertosource;

    /**
     * @var string
     *
     * @ORM\Column(name="puertodestino", type="string", length=255, nullable=true)
     */
    private $puertodestino;

    /**
     * @var integer
     *
     * @ORM\Column(name="estado", type="boolean", nullable=true)
     */
    private $estado;

    /**
     * @var string
     *
     * @ORM\Column(name="interfaceentrada", type="string", length=20, nullable=false)
     */
    private $interfaceentrada;

    /**
     * @var string
     *
     * @ORM\Column(name="interfacesalida", type="string", length=20, nullable=false)
     */
    private $interfacesalida;



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
     * Set nombre
     *
     * @param string $nombre
     * @return Filtros
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
     * Set tipo
     *
     * @param string $tipo
     * @return Filtros
     */
    public function setTipo($tipo)
    {
        $this->tipo = $tipo;

        return $this;
    }

    /**
     * Get tipo
     *
     * @return string 
     */
    public function getTipo()
    {
        return $this->tipo;
    }

    /**
     * Set ipsource
     *
     * @param string $ipsource
     * @return Filtros
     */
    public function setIpsource($ipsource)
    {
        $this->ipsource = $ipsource;

        return $this;
    }

    /**
     * Get ipsource
     *
     * @return string 
     */
    public function getIpsource()
    {
        return $this->ipsource;
    }

    /**
     * Set ipdestino
     *
     * @param string $ipdestino
     * @return Filtros
     */
    public function setIpdestino($ipdestino)
    {
        $this->ipdestino = $ipdestino;

        return $this;
    }

    /**
     * Get ipdestino
     *
     * @return string 
     */
    public function getIpdestino()
    {
        return $this->ipdestino;
    }

    /**
     * Set puertosource
     *
     * @param string $puertosource
     * @return Filtros
     */
    public function setPuertosource($puertosource)
    {
        $this->puertosource = $puertosource;

        return $this;
    }

    /**
     * Get puertosource
     *
     * @return string 
     */
    public function getPuertosource()
    {
        return $this->puertosource;
    }

    /**
     * Set puertodestino
     *
     * @param string $puertodestino
     * @return Filtros
     */
    public function setPuertodestino($puertodestino)
    {
        $this->puertodestino = $puertodestino;

        return $this;
    }

    /**
     * Get puertodestino
     *
     * @return string 
     */
    public function getPuertodestino()
    {
        return $this->puertodestino;
    }

    /**
     * Set estado
     *
     * @param integer $estado
     * @return Filtros
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
     * Set interfaceentrada
     *
     * @param string $interfaceentrada
     * @return Filtros
     */
    public function setInterfaceentrada($interfaceentrada)
    {
        $this->interfaceentrada = $interfaceentrada;

        return $this;
    }

    /**
     * Get interfaceentrada
     *
     * @return string 
     */
    public function getInterfaceentrada()
    {
        return $this->interfaceentrada;
    }

    /**
     * Set interfacesalida
     *
     * @param string $interfacesalida
     * @return Filtros
     */
    public function setInterfacesalida($interfacesalida)
    {
        $this->interfacesalida = $interfacesalida;

        return $this;
    }

    /**
     * Get interfacesalida
     *
     * @return string 
     */
    public function getInterfacesalida()
    {
        return $this->interfacesalida;
    }
}
