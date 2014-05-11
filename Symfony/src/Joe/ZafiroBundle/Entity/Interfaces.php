<?php

namespace Joe\ZafiroBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Interfaces
 *
 * @ORM\Table(name="interfaces")
 * @ORM\Entity
 */
class Interfaces
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
     * @ORM\Column(name="device", type="string", length=7, nullable=false)
     */
    private $device;

    /**
     * @var string
     *
     * @ORM\Column(name="descripcion", type="string", length=45, nullable=false)
     */
    private $descripcion;

    /**
     * @var string
     *
     * @ORM\Column(name="ip", type="string", length=15, nullable=false)
     */
    private $ip;

    /**
     * @var string
     *
     * @ORM\Column(name="netmask", type="string", length=15, nullable=false)
     */
    private $netmask;

    /**
     * @var string
     *
     * @ORM\Column(name="network", type="string", length=15, nullable=false)
     */
    private $network;

    /**
     * @var string
     *
     * @ORM\Column(name="broadcast", type="string", length=15, nullable=false)
     */
    private $broadcast;

    /**
     * @var string
     *
     * @ORM\Column(name="gateway", type="string", length=15, nullable=true)
     */
    private $gateway;

    /**
     * @var boolean
     *
     * @ORM\Column(name="enabled", type="boolean", nullable=false)
     */
    private $enabled = '1';



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
     * Set device
     *
     * @param string $device
     * @return Interfaces
     */
    public function setDevice($device)
    {
        $this->device = $device;

        return $this;
    }

    /**
     * Get device
     *
     * @return string 
     */
    public function getDevice()
    {
        return $this->device;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return Interfaces
     */
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    /**
     * Get descripcion
     *
     * @return string 
     */
    public function getDescripcion()
    {
        return $this->descripcion;
    }

    /**
     * Set ip
     *
     * @param string $ip
     * @return Interfaces
     */
    public function setIp($ip)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip
     *
     * @return string 
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set netmask
     *
     * @param string $netmask
     * @return Interfaces
     */
    public function setNetmask($netmask)
    {
        $this->netmask = $netmask;

        return $this;
    }

    /**
     * Get netmask
     *
     * @return string 
     */
    public function getNetmask()
    {
        return $this->netmask;
    }

    /**
     * Set network
     *
     * @param string $network
     * @return Interfaces
     */
    public function setNetwork($network)
    {
        $this->network = $network;

        return $this;
    }

    /**
     * Get network
     *
     * @return string 
     */
    public function getNetwork()
    {
        return $this->network;
    }

    /**
     * Set broadcast
     *
     * @param string $broadcast
     * @return Interfaces
     */
    public function setBroadcast($broadcast)
    {
        $this->broadcast = $broadcast;

        return $this;
    }

    /**
     * Get broadcast
     *
     * @return string 
     */
    public function getBroadcast()
    {
        return $this->broadcast;
    }

    /**
     * Set gateway
     *
     * @param string $gateway
     * @return Interfaces
     */
    public function setGateway($gateway)
    {
        $this->gateway = $gateway;

        return $this;
    }

    /**
     * Get gateway
     *
     * @return string 
     */
    public function getGateway()
    {
        return $this->gateway;
    }

    /**
     * Set enabled
     *
     * @param boolean $enabled
     * @return Interfaces
     */
    public function setEnabled($enabled)
    {
        $this->enabled = $enabled;

        return $this;
    }

    /**
     * Get enabled
     *
     * @return boolean 
     */
    public function getEnabled()
    {
        return $this->enabled;
    }
}
