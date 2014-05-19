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
     * @ORM\Column(name="estado", type="boolean", nullable=false)
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
     *
     * @ORM\Column(name="d0h00", type="integer", nullable=true)
     */
    private $d0h00;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h01", type="integer", nullable=true)
     */
    private $d0h01;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h02", type="integer", nullable=true)
     */
    private $d0h02;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h03", type="integer", nullable=true)
     */
    private $d0h03;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h04", type="integer", nullable=true)
     */
    private $d0h04;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h05", type="integer", nullable=true)
     */
    private $d0h05;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h06", type="integer", nullable=true)
     */
    private $d0h06;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h07", type="integer", nullable=true)
     */
    private $d0h07;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h08", type="integer", nullable=true)
     */
    private $d0h08;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h09", type="integer", nullable=true)
     */
    private $d0h09;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h10", type="integer", nullable=true)
     */
    private $d0h10;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h11", type="integer", nullable=true)
     */
    private $d0h11;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h12", type="integer", nullable=true)
     */
    private $d0h12;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h13", type="integer", nullable=true)
     */
    private $d0h13;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h14", type="integer", nullable=true)
     */
    private $d0h14;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h15", type="integer", nullable=true)
     */
    private $d0h15;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h16", type="integer", nullable=true)
     */
    private $d0h16;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h17", type="integer", nullable=true)
     */
    private $d0h17;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h18", type="integer", nullable=true)
     */
    private $d0h18;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h19", type="integer", nullable=true)
     */
    private $d0h19;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h20", type="integer", nullable=true)
     */
    private $d0h20;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h21", type="integer", nullable=true)
     */
    private $d0h21;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h22", type="integer", nullable=true)
     */
    private $d0h22;

    /**
     * @var integer
     *
     * @ORM\Column(name="d0h23", type="integer", nullable=true)
     */
    private $d0h23;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h00", type="integer", nullable=true)
     */
    private $d1h00;
    
    /**
     * @var integer
     *
     * @ORM\Column(name="d1h01", type="integer", nullable=true)
     */
    private $d1h01;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h02", type="integer", nullable=true)
     */
    private $d1h02;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h03", type="integer", nullable=true)
     */
    private $d1h03;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h04", type="integer", nullable=true)
     */
    private $d1h04;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h05", type="integer", nullable=true)
     */
    private $d1h05;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h06", type="integer", nullable=true)
     */
    private $d1h06;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h07", type="integer", nullable=true)
     */
    private $d1h07;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h08", type="integer", nullable=true)
     */
    private $d1h08;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h09", type="integer", nullable=true)
     */
    private $d1h09;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h10", type="integer", nullable=true)
     */
    private $d1h10;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h11", type="integer", nullable=true)
     */
    private $d1h11;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h12", type="integer", nullable=true)
     */
    private $d1h12;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h13", type="integer", nullable=true)
     */
    private $d1h13;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h14", type="integer", nullable=true)
     */
    private $d1h14;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h15", type="integer", nullable=true)
     */
    private $d1h15;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h16", type="integer", nullable=true)
     */
    private $d1h16;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h17", type="integer", nullable=true)
     */
    private $d1h17;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h18", type="integer", nullable=true)
     */
    private $d1h18;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h19", type="integer", nullable=true)
     */
    private $d1h19;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h20", type="integer", nullable=true)
     */
    private $d1h20;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h21", type="integer", nullable=true)
     */
    private $d1h21;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h22", type="integer", nullable=true)
     */
    private $d1h22;

    /**
     * @var integer
     *
     * @ORM\Column(name="d1h23", type="integer", nullable=true)
     */
    private $d1h23;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h00", type="integer", nullable=true)
     */
    private $d2h00;
    
    /**
     * @var integer
     *
     * @ORM\Column(name="d2h01", type="integer", nullable=true)
     */
    private $d2h01;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h02", type="integer", nullable=true)
     */
    private $d2h02;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h03", type="integer", nullable=true)
     */
    private $d2h03;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h04", type="integer", nullable=true)
     */
    private $d2h04;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h05", type="integer", nullable=true)
     */
    private $d2h05;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h06", type="integer", nullable=true)
     */
    private $d2h06;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h07", type="integer", nullable=true)
     */
    private $d2h07;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h08", type="integer", nullable=true)
     */
    private $d2h08;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h09", type="integer", nullable=true)
     */
    private $d2h09;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h10", type="integer", nullable=true)
     */
    private $d2h10;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h11", type="integer", nullable=true)
     */
    private $d2h11;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h12", type="integer", nullable=true)
     */
    private $d2h12;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h13", type="integer", nullable=true)
     */
    private $d2h13;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h14", type="integer", nullable=true)
     */
    private $d2h14;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h15", type="integer", nullable=true)
     */
    private $d2h15;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h16", type="integer", nullable=true)
     */
    private $d2h16;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h17", type="integer", nullable=true)
     */
    private $d2h17;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h18", type="integer", nullable=true)
     */
    private $d2h18;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h19", type="integer", nullable=true)
     */
    private $d2h19;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h20", type="integer", nullable=true)
     */
    private $d2h20;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h21", type="integer", nullable=true)
     */
    private $d2h21;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h22", type="integer", nullable=true)
     */
    private $d2h22;

    /**
     * @var integer
     *
     * @ORM\Column(name="d2h23", type="integer", nullable=true)
     */
    private $d2h23;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h00", type="integer", nullable=true)
     */
    private $d3h00;
    
    /**
     * @var integer
     *
     * @ORM\Column(name="d3h01", type="integer", nullable=true)
     */
    private $d3h01;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h02", type="integer", nullable=true)
     */
    private $d3h02;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h03", type="integer", nullable=true)
     */
    private $d3h03;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h04", type="integer", nullable=true)
     */
    private $d3h04;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h05", type="integer", nullable=true)
     */
    private $d3h05;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h06", type="integer", nullable=true)
     */
    private $d3h06;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h07", type="integer", nullable=true)
     */
    private $d3h07;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h08", type="integer", nullable=true)
     */
    private $d3h08;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h09", type="integer", nullable=true)
     */
    private $d3h09;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h10", type="integer", nullable=true)
     */
    private $d3h10;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h11", type="integer", nullable=true)
     */
    private $d3h11;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h12", type="integer", nullable=true)
     */
    private $d3h12;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h13", type="integer", nullable=true)
     */
    private $d3h13;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h14", type="integer", nullable=true)
     */
    private $d3h14;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h15", type="integer", nullable=true)
     */
    private $d3h15;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h16", type="integer", nullable=true)
     */
    private $d3h16;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h17", type="integer", nullable=true)
     */
    private $d3h17;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h18", type="integer", nullable=true)
     */
    private $d3h18;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h19", type="integer", nullable=true)
     */
    private $d3h19;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h20", type="integer", nullable=true)
     */
    private $d3h20;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h21", type="integer", nullable=true)
     */
    private $d3h21;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h22", type="integer", nullable=true)
     */
    private $d3h22;

    /**
     * @var integer
     *
     * @ORM\Column(name="d3h23", type="integer", nullable=true)
     */
    private $d3h23;
    /**
     * @var integer
     *
     * @ORM\Column(name="d4h00", type="integer", nullable=true)
     */
    private $d4h00;
    
    /**
     * @var integer
     *
     * @ORM\Column(name="d4h01", type="integer", nullable=true)
     */
    private $d4h01;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h02", type="integer", nullable=true)
     */
    private $d4h02;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h03", type="integer", nullable=true)
     */
    private $d4h03;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h04", type="integer", nullable=true)
     */
    private $d4h04;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h05", type="integer", nullable=true)
     */
    private $d4h05;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h06", type="integer", nullable=true)
     */
    private $d4h06;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h07", type="integer", nullable=true)
     */
    private $d4h07;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h08", type="integer", nullable=true)
     */
    private $d4h08;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h09", type="integer", nullable=true)
     */
    private $d4h09;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h10", type="integer", nullable=true)
     */
    private $d4h10;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h11", type="integer", nullable=true)
     */
    private $d4h11;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h12", type="integer", nullable=true)
     */
    private $d4h12;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h13", type="integer", nullable=true)
     */
    private $d4h13;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h14", type="integer", nullable=true)
     */
    private $d4h14;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h15", type="integer", nullable=true)
     */
    private $d4h15;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h16", type="integer", nullable=true)
     */
    private $d4h16;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h17", type="integer", nullable=true)
     */
    private $d4h17;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h18", type="integer", nullable=true)
     */
    private $d4h18;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h19", type="integer", nullable=true)
     */
    private $d4h19;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h20", type="integer", nullable=true)
     */
    private $d4h20;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h21", type="integer", nullable=true)
     */
    private $d4h21;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h22", type="integer", nullable=true)
     */
    private $d4h22;

    /**
     * @var integer
     *
     * @ORM\Column(name="d4h23", type="integer", nullable=true)
     */
    private $d4h23;
    /**
     * @var integer
     *
     * @ORM\Column(name="d5h00", type="integer", nullable=true)
     */
    private $d5h00;
    
    /**
     * @var integer
     *
     * @ORM\Column(name="d5h01", type="integer", nullable=true)
     */
    private $d5h01;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h02", type="integer", nullable=true)
     */
    private $d5h02;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h03", type="integer", nullable=true)
     */
    private $d5h03;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h04", type="integer", nullable=true)
     */
    private $d5h04;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h05", type="integer", nullable=true)
     */
    private $d5h05;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h06", type="integer", nullable=true)
     */
    private $d5h06;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h07", type="integer", nullable=true)
     */
    private $d5h07;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h08", type="integer", nullable=true)
     */
    private $d5h08;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h09", type="integer", nullable=true)
     */
    private $d5h09;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h10", type="integer", nullable=true)
     */
    private $d5h10;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h11", type="integer", nullable=true)
     */
    private $d5h11;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h12", type="integer", nullable=true)
     */
    private $d5h12;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h13", type="integer", nullable=true)
     */
    private $d5h13;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h14", type="integer", nullable=true)
     */
    private $d5h14;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h15", type="integer", nullable=true)
     */
    private $d5h15;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h16", type="integer", nullable=true)
     */
    private $d5h16;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h17", type="integer", nullable=true)
     */
    private $d5h17;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h18", type="integer", nullable=true)
     */
    private $d5h18;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h19", type="integer", nullable=true)
     */
    private $d5h19;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h20", type="integer", nullable=true)
     */
    private $d5h20;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h21", type="integer", nullable=true)
     */
    private $d5h21;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h22", type="integer", nullable=true)
     */
    private $d5h22;

    /**
     * @var integer
     *
     * @ORM\Column(name="d5h23", type="integer", nullable=true)
     */
    private $d5h23;
    /**
     * @var integer
     *
     * @ORM\Column(name="d6h00", type="integer", nullable=true)
     */
    private $d6h00;
    
    /**
     * @var integer
     *
     * @ORM\Column(name="d6h01", type="integer", nullable=true)
     */
    private $d6h01;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h02", type="integer", nullable=true)
     */
    private $d6h02;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h03", type="integer", nullable=true)
     */
    private $d6h03;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h04", type="integer", nullable=true)
     */
    private $d6h04;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h05", type="integer", nullable=true)
     */
    private $d6h05;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h06", type="integer", nullable=true)
     */
    private $d6h06;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h07", type="integer", nullable=true)
     */
    private $d6h07;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h08", type="integer", nullable=true)
     */
    private $d6h08;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h09", type="integer", nullable=true)
     */
    private $d6h09;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h10", type="integer", nullable=true)
     */
    private $d6h10;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h11", type="integer", nullable=true)
     */
    private $d6h11;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h12", type="integer", nullable=true)
     */
    private $d6h12;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h13", type="integer", nullable=true)
     */
    private $d6h13;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h14", type="integer", nullable=true)
     */
    private $d6h14;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h15", type="integer", nullable=true)
     */
    private $d6h15;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h16", type="integer", nullable=true)
     */
    private $d6h16;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h17", type="integer", nullable=true)
     */
    private $d6h17;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h18", type="integer", nullable=true)
     */
    private $d6h18;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h19", type="integer", nullable=true)
     */
    private $d6h19;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h20", type="integer", nullable=true)
     */
    private $d6h20;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h21", type="integer", nullable=true)
     */
    private $d6h21;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h22", type="integer", nullable=true)
     */
    private $d6h22;

    /**
     * @var integer
     *
     * @ORM\Column(name="d6h23", type="integer", nullable=true)
     */
    private $d6h23;

    /**
     * @var integer
     * JOE Asi se hace un inner join
     * @ORM\OneToMany(targetEntity="Clientes" ,mappedBy="clientes_plan")
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
     * Set d0h00
     *
     * @param integer $d0h00
     * @return Planes
     */
    public function setD0h00($d0h00)
    {
        $this->d0h00 = $d0h00;

        return $this;
    }

    /**
     * Get d0h00
     *
     * @return integer 
     */
    public function getD0h00()
    {
        return $this->d0h00;
    }

    /**
     * Set d0h01
     *
     * @param integer $d0h01
     * @return Planes
     */
    public function setD0h01($d0h01)
    {
        $this->d0h01 = $d0h01;

        return $this;
    }

    /**
     * Get d0h01
     *
     * @return integer 
     */
    public function getD0h01()
    {
        return $this->d0h01;
    }

    /**
     * Set d0h02
     *
     * @param integer $d0h02
     * @return Planes
     */
    public function setD0h02($d0h02)
    {
        $this->d0h02 = $d0h02;

        return $this;
    }

    /**
     * Get d0h02
     *
     * @return integer 
     */
    public function getD0h02()
    {
        return $this->d0h02;
    }

    /**
     * Set d0h03
     *
     * @param integer $d0h03
     * @return Planes
     */
    public function setD0h03($d0h03)
    {
        $this->d0h03 = $d0h03;

        return $this;
    }

    /**
     * Get d0h03
     *
     * @return integer 
     */
    public function getD0h03()
    {
        return $this->d0h03;
    }

    /**
     * Set d0h04
     *
     * @param integer $d0h04
     * @return Planes
     */
    public function setD0h04($d0h04)
    {
        $this->d0h04 = $d0h04;

        return $this;
    }

    /**
     * Get d0h04
     *
     * @return integer 
     */
    public function getD0h04()
    {
        return $this->d0h04;
    }

    /**
     * Set d0h05
     *
     * @param integer $d0h05
     * @return Planes
     */
    public function setD0h05($d0h05)
    {
        $this->d0h05 = $d0h05;

        return $this;
    }

    /**
     * Get d0h05
     *
     * @return integer 
     */
    public function getD0h05()
    {
        return $this->d0h05;
    }

    /**
     * Set d0h06
     *
     * @param integer $d0h06
     * @return Planes
     */
    public function setD0h06($d0h06)
    {
        $this->d0h06 = $d0h06;

        return $this;
    }

    /**
     * Get d0h06
     *
     * @return integer 
     */
    public function getD0h06()
    {
        return $this->d0h06;
    }

    /**
     * Set d0h07
     *
     * @param integer $d0h07
     * @return Planes
     */
    public function setD0h07($d0h07)
    {
        $this->d0h07 = $d0h07;

        return $this;
    }

    /**
     * Get d0h07
     *
     * @return integer 
     */
    public function getD0h07()
    {
        return $this->d0h07;
    }

    /**
     * Set d0h08
     *
     * @param integer $d0h08
     * @return Planes
     */
    public function setD0h08($d0h08)
    {
        $this->d0h08 = $d0h08;

        return $this;
    }

    /**
     * Get d0h08
     *
     * @return integer 
     */
    public function getD0h08()
    {
        return $this->d0h08;
    }

    /**
     * Set d0h09
     *
     * @param integer $d0h09
     * @return Planes
     */
    public function setD0h09($d0h09)
    {
        $this->d0h09 = $d0h09;

        return $this;
    }

    /**
     * Get d0h09
     *
     * @return integer 
     */
    public function getD0h09()
    {
        return $this->d0h09;
    }

    /**
     * Set d0h10
     *
     * @param integer $d0h10
     * @return Planes
     */
    public function setD0h10($d0h10)
    {
        $this->d0h10 = $d0h10;

        return $this;
    }

    /**
     * Get d0h10
     *
     * @return integer 
     */
    public function getD0h10()
    {
        return $this->d0h10;
    }

    /**
     * Set d0h11
     *
     * @param integer $d0h11
     * @return Planes
     */
    public function setD0h11($d0h11)
    {
        $this->d0h11 = $d0h11;

        return $this;
    }

    /**
     * Get d0h11
     *
     * @return integer 
     */
    public function getD0h11()
    {
        return $this->d0h11;
    }

    /**
     * Set d0h12
     *
     * @param integer $d0h12
     * @return Planes
     */
    public function setD0h12($d0h12)
    {
        $this->d0h12 = $d0h12;

        return $this;
    }

    /**
     * Get d0h12
     *
     * @return integer 
     */
    public function getD0h12()
    {
        return $this->d0h12;
    }

    /**
     * Set d0h13
     *
     * @param integer $d0h13
     * @return Planes
     */
    public function setD0h13($d0h13)
    {
        $this->d0h13 = $d0h13;

        return $this;
    }

    /**
     * Get d0h13
     *
     * @return integer 
     */
    public function getD0h13()
    {
        return $this->d0h13;
    }

    /**
     * Set d0h14
     *
     * @param integer $d0h14
     * @return Planes
     */
    public function setD0h14($d0h14)
    {
        $this->d0h14 = $d0h14;

        return $this;
    }

    /**
     * Get d0h14
     *
     * @return integer 
     */
    public function getD0h14()
    {
        return $this->d0h14;
    }

    /**
     * Set d0h15
     *
     * @param integer $d0h15
     * @return Planes
     */
    public function setD0h15($d0h15)
    {
        $this->d0h15 = $d0h15;

        return $this;
    }

    /**
     * Get d0h15
     *
     * @return integer 
     */
    public function getD0h15()
    {
        return $this->d0h15;
    }

    /**
     * Set d0h16
     *
     * @param integer $d0h16
     * @return Planes
     */
    public function setD0h16($d0h16)
    {
        $this->d0h16 = $d0h16;

        return $this;
    }

    /**
     * Get d0h16
     *
     * @return integer 
     */
    public function getD0h16()
    {
        return $this->d0h16;
    }

    /**
     * Set d0h17
     *
     * @param integer $d0h17
     * @return Planes
     */
    public function setD0h17($d0h17)
    {
        $this->d0h17 = $d0h17;

        return $this;
    }

    /**
     * Get d0h17
     *
     * @return integer 
     */
    public function getD0h17()
    {
        return $this->d0h17;
    }

    /**
     * Set d0h18
     *
     * @param integer $d0h18
     * @return Planes
     */
    public function setD0h18($d0h18)
    {
        $this->d0h18 = $d0h18;

        return $this;
    }

    /**
     * Get d0h18
     *
     * @return integer 
     */
    public function getD0h18()
    {
        return $this->d0h18;
    }

    /**
     * Set d0h19
     *
     * @param integer $d0h19
     * @return Planes
     */
    public function setD0h19($d0h19)
    {
        $this->d0h19 = $d0h19;

        return $this;
    }

    /**
     * Get d0h19
     *
     * @return integer 
     */
    public function getD0h19()
    {
        return $this->d0h19;
    }

    /**
     * Set d0h20
     *
     * @param integer $d0h20
     * @return Planes
     */
    public function setD0h20($d0h20)
    {
        $this->d0h20 = $d0h20;

        return $this;
    }

    /**
     * Get d0h20
     *
     * @return integer 
     */
    public function getD0h20()
    {
        return $this->d0h20;
    }

    /**
     * Set d0h21
     *
     * @param integer $d0h21
     * @return Planes
     */
    public function setD0h21($d0h21)
    {
        $this->d0h21 = $d0h21;

        return $this;
    }

    /**
     * Get d0h21
     *
     * @return integer 
     */
    public function getD0h21()
    {
        return $this->d0h21;
    }

    /**
     * Set d0h22
     *
     * @param integer $d0h22
     * @return Planes
     */
    public function setD0h22($d0h22)
    {
        $this->d0h22 = $d0h22;

        return $this;
    }

    /**
     * Get d0h22
     *
     * @return integer 
     */
    public function getD0h22()
    {
        return $this->d0h22;
    }

    /**
     * Set d0h23
     *
     * @param integer $d0h23
     * @return Planes
     */
    public function setD0h23($d0h23)
    {
        $this->d0h23 = $d0h23;

        return $this;
    }

    /**
     * Get d0h23
     *
     * @return integer 
     */
    public function getD0h23()
    {
        return $this->d0h23;
    }

    /**
     * Set d1h01
     *
     * @param integer $d1h01
     * @return Planes
     */
    public function setD1h01($d1h01)
    {
        $this->d1h01 = $d1h01;

        return $this;
    }

    /**
     * Get d1h01
     *
     * @return integer 
     */
    public function getD1h01()
    {
        return $this->d1h01;
    }

    /**
     * Set d1h02
     *
     * @param integer $d1h02
     * @return Planes
     */
    public function setD1h02($d1h02)
    {
        $this->d1h02 = $d1h02;

        return $this;
    }

    /**
     * Get d1h02
     *
     * @return integer 
     */
    public function getD1h02()
    {
        return $this->d1h02;
    }

    /**
     * Set d1h03
     *
     * @param integer $d1h03
     * @return Planes
     */
    public function setD1h03($d1h03)
    {
        $this->d1h03 = $d1h03;

        return $this;
    }

    /**
     * Get d1h03
     *
     * @return integer 
     */
    public function getD1h03()
    {
        return $this->d1h03;
    }

    /**
     * Set d1h04
     *
     * @param integer $d1h04
     * @return Planes
     */
    public function setD1h04($d1h04)
    {
        $this->d1h04 = $d1h04;

        return $this;
    }

    /**
     * Get d1h04
     *
     * @return integer 
     */
    public function getD1h04()
    {
        return $this->d1h04;
    }

    /**
     * Set d1h05
     *
     * @param integer $d1h05
     * @return Planes
     */
    public function setD1h05($d1h05)
    {
        $this->d1h05 = $d1h05;

        return $this;
    }

    /**
     * Get d1h05
     *
     * @return integer 
     */
    public function getD1h05()
    {
        return $this->d1h05;
    }

    /**
     * Set d1h06
     *
     * @param integer $d1h06
     * @return Planes
     */
    public function setD1h06($d1h06)
    {
        $this->d1h06 = $d1h06;

        return $this;
    }

    /**
     * Get d1h06
     *
     * @return integer 
     */
    public function getD1h06()
    {
        return $this->d1h06;
    }

    /**
     * Set d1h07
     *
     * @param integer $d1h07
     * @return Planes
     */
    public function setD1h07($d1h07)
    {
        $this->d1h07 = $d1h07;

        return $this;
    }

    /**
     * Get d1h07
     *
     * @return integer 
     */
    public function getD1h07()
    {
        return $this->d1h07;
    }

    /**
     * Set d1h08
     *
     * @param integer $d1h08
     * @return Planes
     */
    public function setD1h08($d1h08)
    {
        $this->d1h08 = $d1h08;

        return $this;
    }

    /**
     * Get d1h08
     *
     * @return integer 
     */
    public function getD1h08()
    {
        return $this->d1h08;
    }

    /**
     * Set d1h09
     *
     * @param integer $d1h09
     * @return Planes
     */
    public function setD1h09($d1h09)
    {
        $this->d1h09 = $d1h09;

        return $this;
    }

    /**
     * Get d1h09
     *
     * @return integer 
     */
    public function getD1h09()
    {
        return $this->d1h09;
    }

    /**
     * Set d1h10
     *
     * @param integer $d1h10
     * @return Planes
     */
    public function setD1h10($d1h10)
    {
        $this->d1h10 = $d1h10;

        return $this;
    }

    /**
     * Get d1h10
     *
     * @return integer 
     */
    public function getD1h10()
    {
        return $this->d1h10;
    }

    /**
     * Set d1h11
     *
     * @param integer $d1h11
     * @return Planes
     */
    public function setD1h11($d1h11)
    {
        $this->d1h11 = $d1h11;

        return $this;
    }

    /**
     * Get d1h11
     *
     * @return integer 
     */
    public function getD1h11()
    {
        return $this->d1h11;
    }

    /**
     * Set d1h12
     *
     * @param integer $d1h12
     * @return Planes
     */
    public function setD1h12($d1h12)
    {
        $this->d1h12 = $d1h12;

        return $this;
    }

    /**
     * Get d1h12
     *
     * @return integer 
     */
    public function getD1h12()
    {
        return $this->d1h12;
    }

    /**
     * Set d1h13
     *
     * @param integer $d1h13
     * @return Planes
     */
    public function setD1h13($d1h13)
    {
        $this->d1h13 = $d1h13;

        return $this;
    }

    /**
     * Get d1h13
     *
     * @return integer 
     */
    public function getD1h13()
    {
        return $this->d1h13;
    }

    /**
     * Set d1h14
     *
     * @param integer $d1h14
     * @return Planes
     */
    public function setD1h14($d1h14)
    {
        $this->d1h14 = $d1h14;

        return $this;
    }

    /**
     * Get d1h14
     *
     * @return integer 
     */
    public function getD1h14()
    {
        return $this->d1h14;
    }

    /**
     * Set d1h15
     *
     * @param integer $d1h15
     * @return Planes
     */
    public function setD1h15($d1h15)
    {
        $this->d1h15 = $d1h15;

        return $this;
    }

    /**
     * Get d1h15
     *
     * @return integer 
     */
    public function getD1h15()
    {
        return $this->d1h15;
    }

    /**
     * Set d1h16
     *
     * @param integer $d1h16
     * @return Planes
     */
    public function setD1h16($d1h16)
    {
        $this->d1h16 = $d1h16;

        return $this;
    }

    /**
     * Get d1h16
     *
     * @return integer 
     */
    public function getD1h16()
    {
        return $this->d1h16;
    }

    /**
     * Set d1h17
     *
     * @param integer $d1h17
     * @return Planes
     */
    public function setD1h17($d1h17)
    {
        $this->d1h17 = $d1h17;

        return $this;
    }

    /**
     * Get d1h17
     *
     * @return integer 
     */
    public function getD1h17()
    {
        return $this->d1h17;
    }

    /**
     * Set d1h18
     *
     * @param integer $d1h18
     * @return Planes
     */
    public function setD1h18($d1h18)
    {
        $this->d1h18 = $d1h18;

        return $this;
    }

    /**
     * Get d1h18
     *
     * @return integer 
     */
    public function getD1h18()
    {
        return $this->d1h18;
    }

    /**
     * Set d1h19
     *
     * @param integer $d1h19
     * @return Planes
     */
    public function setD1h19($d1h19)
    {
        $this->d1h19 = $d1h19;

        return $this;
    }

    /**
     * Get d1h19
     *
     * @return integer 
     */
    public function getD1h19()
    {
        return $this->d1h19;
    }

    /**
     * Set d1h20
     *
     * @param integer $d1h20
     * @return Planes
     */
    public function setD1h20($d1h20)
    {
        $this->d1h20 = $d1h20;

        return $this;
    }

    /**
     * Get d1h20
     *
     * @return integer 
     */
    public function getD1h20()
    {
        return $this->d1h20;
    }

    /**
     * Set d1h21
     *
     * @param integer $d1h21
     * @return Planes
     */
    public function setD1h21($d1h21)
    {
        $this->d1h21 = $d1h21;

        return $this;
    }

    /**
     * Get d1h21
     *
     * @return integer 
     */
    public function getD1h21()
    {
        return $this->d1h21;
    }

    /**
     * Set d1h22
     *
     * @param integer $d1h22
     * @return Planes
     */
    public function setD1h22($d1h22)
    {
        $this->d1h22 = $d1h22;

        return $this;
    }

    /**
     * Get d1h22
     *
     * @return integer 
     */
    public function getD1h22()
    {
        return $this->d1h22;
    }

    /**
     * Set d1h23
     *
     * @param integer $d1h23
     * @return Planes
     */
    public function setD1h23($d1h23)
    {
        $this->d1h23 = $d1h23;

        return $this;
    }

    /**
     * Get d1h23
     *
     * @return integer 
     */
    public function getD1h23()
    {
        return $this->d1h23;
    }

    /**
     * Set d2h01
     *
     * @param integer $d2h01
     * @return Planes
     */
    public function setD2h01($d2h01)
    {
        $this->d2h01 = $d2h01;

        return $this;
    }

    /**
     * Get d2h01
     *
     * @return integer 
     */
    public function getD2h01()
    {
        return $this->d2h01;
    }

    /**
     * Set d2h02
     *
     * @param integer $d2h02
     * @return Planes
     */
    public function setD2h02($d2h02)
    {
        $this->d2h02 = $d2h02;

        return $this;
    }

    /**
     * Get d2h02
     *
     * @return integer 
     */
    public function getD2h02()
    {
        return $this->d2h02;
    }

    /**
     * Set d2h03
     *
     * @param integer $d2h03
     * @return Planes
     */
    public function setD2h03($d2h03)
    {
        $this->d2h03 = $d2h03;

        return $this;
    }

    /**
     * Get d2h03
     *
     * @return integer 
     */
    public function getD2h03()
    {
        return $this->d2h03;
    }

    /**
     * Set d2h04
     *
     * @param integer $d2h04
     * @return Planes
     */
    public function setD2h04($d2h04)
    {
        $this->d2h04 = $d2h04;

        return $this;
    }

    /**
     * Get d2h04
     *
     * @return integer 
     */
    public function getD2h04()
    {
        return $this->d2h04;
    }

    /**
     * Set d2h05
     *
     * @param integer $d2h05
     * @return Planes
     */
    public function setD2h05($d2h05)
    {
        $this->d2h05 = $d2h05;

        return $this;
    }

    /**
     * Get d2h05
     *
     * @return integer 
     */
    public function getD2h05()
    {
        return $this->d2h05;
    }

    /**
     * Set d2h06
     *
     * @param integer $d2h06
     * @return Planes
     */
    public function setD2h06($d2h06)
    {
        $this->d2h06 = $d2h06;

        return $this;
    }

    /**
     * Get d2h06
     *
     * @return integer 
     */
    public function getD2h06()
    {
        return $this->d2h06;
    }

    /**
     * Set d2h07
     *
     * @param integer $d2h07
     * @return Planes
     */
    public function setD2h07($d2h07)
    {
        $this->d2h07 = $d2h07;

        return $this;
    }

    /**
     * Get d2h07
     *
     * @return integer 
     */
    public function getD2h07()
    {
        return $this->d2h07;
    }

    /**
     * Set d2h08
     *
     * @param integer $d2h08
     * @return Planes
     */
    public function setD2h08($d2h08)
    {
        $this->d2h08 = $d2h08;

        return $this;
    }

    /**
     * Get d2h08
     *
     * @return integer 
     */
    public function getD2h08()
    {
        return $this->d2h08;
    }

    /**
     * Set d2h09
     *
     * @param integer $d2h09
     * @return Planes
     */
    public function setD2h09($d2h09)
    {
        $this->d2h09 = $d2h09;

        return $this;
    }

    /**
     * Get d2h09
     *
     * @return integer 
     */
    public function getD2h09()
    {
        return $this->d2h09;
    }

    /**
     * Set d2h10
     *
     * @param integer $d2h10
     * @return Planes
     */
    public function setD2h10($d2h10)
    {
        $this->d2h10 = $d2h10;

        return $this;
    }

    /**
     * Get d2h10
     *
     * @return integer 
     */
    public function getD2h10()
    {
        return $this->d2h10;
    }

    /**
     * Set d2h11
     *
     * @param integer $d2h11
     * @return Planes
     */
    public function setD2h11($d2h11)
    {
        $this->d2h11 = $d2h11;

        return $this;
    }

    /**
     * Get d2h11
     *
     * @return integer 
     */
    public function getD2h11()
    {
        return $this->d2h11;
    }

    /**
     * Set d2h12
     *
     * @param integer $d2h12
     * @return Planes
     */
    public function setD2h12($d2h12)
    {
        $this->d2h12 = $d2h12;

        return $this;
    }

    /**
     * Get d2h12
     *
     * @return integer 
     */
    public function getD2h12()
    {
        return $this->d2h12;
    }

    /**
     * Set d2h13
     *
     * @param integer $d2h13
     * @return Planes
     */
    public function setD2h13($d2h13)
    {
        $this->d2h13 = $d2h13;

        return $this;
    }

    /**
     * Get d2h13
     *
     * @return integer 
     */
    public function getD2h13()
    {
        return $this->d2h13;
    }

    /**
     * Set d2h14
     *
     * @param integer $d2h14
     * @return Planes
     */
    public function setD2h14($d2h14)
    {
        $this->d2h14 = $d2h14;

        return $this;
    }

    /**
     * Get d2h14
     *
     * @return integer 
     */
    public function getD2h14()
    {
        return $this->d2h14;
    }

    /**
     * Set d2h15
     *
     * @param integer $d2h15
     * @return Planes
     */
    public function setD2h15($d2h15)
    {
        $this->d2h15 = $d2h15;

        return $this;
    }

    /**
     * Get d2h15
     *
     * @return integer 
     */
    public function getD2h15()
    {
        return $this->d2h15;
    }

    /**
     * Set d2h16
     *
     * @param integer $d2h16
     * @return Planes
     */
    public function setD2h16($d2h16)
    {
        $this->d2h16 = $d2h16;

        return $this;
    }

    /**
     * Get d2h16
     *
     * @return integer 
     */
    public function getD2h16()
    {
        return $this->d2h16;
    }

    /**
     * Set d2h17
     *
     * @param integer $d2h17
     * @return Planes
     */
    public function setD2h17($d2h17)
    {
        $this->d2h17 = $d2h17;

        return $this;
    }

    /**
     * Get d2h17
     *
     * @return integer 
     */
    public function getD2h17()
    {
        return $this->d2h17;
    }

    /**
     * Set d2h18
     *
     * @param integer $d2h18
     * @return Planes
     */
    public function setD2h18($d2h18)
    {
        $this->d2h18 = $d2h18;

        return $this;
    }

    /**
     * Get d2h18
     *
     * @return integer 
     */
    public function getD2h18()
    {
        return $this->d2h18;
    }

    /**
     * Set d2h19
     *
     * @param integer $d2h19
     * @return Planes
     */
    public function setD2h19($d2h19)
    {
        $this->d2h19 = $d2h19;

        return $this;
    }

    /**
     * Get d2h19
     *
     * @return integer 
     */
    public function getD2h19()
    {
        return $this->d2h19;
    }

    /**
     * Set d2h20
     *
     * @param integer $d2h20
     * @return Planes
     */
    public function setD2h20($d2h20)
    {
        $this->d2h20 = $d2h20;

        return $this;
    }

    /**
     * Get d2h20
     *
     * @return integer 
     */
    public function getD2h20()
    {
        return $this->d2h20;
    }

    /**
     * Set d2h21
     *
     * @param integer $d2h21
     * @return Planes
     */
    public function setD2h21($d2h21)
    {
        $this->d2h21 = $d2h21;

        return $this;
    }

    /**
     * Get d2h21
     *
     * @return integer 
     */
    public function getD2h21()
    {
        return $this->d2h21;
    }

    /**
     * Set d2h22
     *
     * @param integer $d2h22
     * @return Planes
     */
    public function setD2h22($d2h22)
    {
        $this->d2h22 = $d2h22;

        return $this;
    }

    /**
     * Get d2h22
     *
     * @return integer 
     */
    public function getD2h22()
    {
        return $this->d2h22;
    }

    /**
     * Set d2h23
     *
     * @param integer $d2h23
     * @return Planes
     */
    public function setD2h23($d2h23)
    {
        $this->d2h23 = $d2h23;

        return $this;
    }

    /**
     * Get d2h23
     *
     * @return integer 
     */
    public function getD2h23()
    {
        return $this->d2h23;
    }

    /**
     * Set d3h01
     *
     * @param integer $d3h01
     * @return Planes
     */
    public function setD3h01($d3h01)
    {
        $this->d3h01 = $d3h01;

        return $this;
    }

    /**
     * Get d3h01
     *
     * @return integer 
     */
    public function getD3h01()
    {
        return $this->d3h01;
    }

    /**
     * Set d3h02
     *
     * @param integer $d3h02
     * @return Planes
     */
    public function setD3h02($d3h02)
    {
        $this->d3h02 = $d3h02;

        return $this;
    }

    /**
     * Get d3h02
     *
     * @return integer 
     */
    public function getD3h02()
    {
        return $this->d3h02;
    }

    /**
     * Set d3h03
     *
     * @param integer $d3h03
     * @return Planes
     */
    public function setD3h03($d3h03)
    {
        $this->d3h03 = $d3h03;

        return $this;
    }

    /**
     * Get d3h03
     *
     * @return integer 
     */
    public function getD3h03()
    {
        return $this->d3h03;
    }

    /**
     * Set d3h04
     *
     * @param integer $d3h04
     * @return Planes
     */
    public function setD3h04($d3h04)
    {
        $this->d3h04 = $d3h04;

        return $this;
    }

    /**
     * Get d3h04
     *
     * @return integer 
     */
    public function getD3h04()
    {
        return $this->d3h04;
    }

    /**
     * Set d3h05
     *
     * @param integer $d3h05
     * @return Planes
     */
    public function setD3h05($d3h05)
    {
        $this->d3h05 = $d3h05;

        return $this;
    }

    /**
     * Get d3h05
     *
     * @return integer 
     */
    public function getD3h05()
    {
        return $this->d3h05;
    }

    /**
     * Set d3h06
     *
     * @param integer $d3h06
     * @return Planes
     */
    public function setD3h06($d3h06)
    {
        $this->d3h06 = $d3h06;

        return $this;
    }

    /**
     * Get d3h06
     *
     * @return integer 
     */
    public function getD3h06()
    {
        return $this->d3h06;
    }

    /**
     * Set d3h07
     *
     * @param integer $d3h07
     * @return Planes
     */
    public function setD3h07($d3h07)
    {
        $this->d3h07 = $d3h07;

        return $this;
    }

    /**
     * Get d3h07
     *
     * @return integer 
     */
    public function getD3h07()
    {
        return $this->d3h07;
    }

    /**
     * Set d3h08
     *
     * @param integer $d3h08
     * @return Planes
     */
    public function setD3h08($d3h08)
    {
        $this->d3h08 = $d3h08;

        return $this;
    }

    /**
     * Get d3h08
     *
     * @return integer 
     */
    public function getD3h08()
    {
        return $this->d3h08;
    }

    /**
     * Set d3h09
     *
     * @param integer $d3h09
     * @return Planes
     */
    public function setD3h09($d3h09)
    {
        $this->d3h09 = $d3h09;

        return $this;
    }

    /**
     * Get d3h09
     *
     * @return integer 
     */
    public function getD3h09()
    {
        return $this->d3h09;
    }

    /**
     * Set d3h10
     *
     * @param integer $d3h10
     * @return Planes
     */
    public function setD3h10($d3h10)
    {
        $this->d3h10 = $d3h10;

        return $this;
    }

    /**
     * Get d3h10
     *
     * @return integer 
     */
    public function getD3h10()
    {
        return $this->d3h10;
    }

    /**
     * Set d3h11
     *
     * @param integer $d3h11
     * @return Planes
     */
    public function setD3h11($d3h11)
    {
        $this->d3h11 = $d3h11;

        return $this;
    }

    /**
     * Get d3h11
     *
     * @return integer 
     */
    public function getD3h11()
    {
        return $this->d3h11;
    }

    /**
     * Set d3h12
     *
     * @param integer $d3h12
     * @return Planes
     */
    public function setD3h12($d3h12)
    {
        $this->d3h12 = $d3h12;

        return $this;
    }

    /**
     * Get d3h12
     *
     * @return integer 
     */
    public function getD3h12()
    {
        return $this->d3h12;
    }

    /**
     * Set d3h13
     *
     * @param integer $d3h13
     * @return Planes
     */
    public function setD3h13($d3h13)
    {
        $this->d3h13 = $d3h13;

        return $this;
    }

    /**
     * Get d3h13
     *
     * @return integer 
     */
    public function getD3h13()
    {
        return $this->d3h13;
    }

    /**
     * Set d3h14
     *
     * @param integer $d3h14
     * @return Planes
     */
    public function setD3h14($d3h14)
    {
        $this->d3h14 = $d3h14;

        return $this;
    }

    /**
     * Get d3h14
     *
     * @return integer 
     */
    public function getD3h14()
    {
        return $this->d3h14;
    }

    /**
     * Set d3h15
     *
     * @param integer $d3h15
     * @return Planes
     */
    public function setD3h15($d3h15)
    {
        $this->d3h15 = $d3h15;

        return $this;
    }

    /**
     * Get d3h15
     *
     * @return integer 
     */
    public function getD3h15()
    {
        return $this->d3h15;
    }

    /**
     * Set d3h16
     *
     * @param integer $d3h16
     * @return Planes
     */
    public function setD3h16($d3h16)
    {
        $this->d3h16 = $d3h16;

        return $this;
    }

    /**
     * Get d3h16
     *
     * @return integer 
     */
    public function getD3h16()
    {
        return $this->d3h16;
    }

    /**
     * Set d3h17
     *
     * @param integer $d3h17
     * @return Planes
     */
    public function setD3h17($d3h17)
    {
        $this->d3h17 = $d3h17;

        return $this;
    }

    /**
     * Get d3h17
     *
     * @return integer 
     */
    public function getD3h17()
    {
        return $this->d3h17;
    }

    /**
     * Set d3h18
     *
     * @param integer $d3h18
     * @return Planes
     */
    public function setD3h18($d3h18)
    {
        $this->d3h18 = $d3h18;

        return $this;
    }

    /**
     * Get d3h18
     *
     * @return integer 
     */
    public function getD3h18()
    {
        return $this->d3h18;
    }

    /**
     * Set d3h19
     *
     * @param integer $d3h19
     * @return Planes
     */
    public function setD3h19($d3h19)
    {
        $this->d3h19 = $d3h19;

        return $this;
    }

    /**
     * Get d3h19
     *
     * @return integer 
     */
    public function getD3h19()
    {
        return $this->d3h19;
    }

    /**
     * Set d3h20
     *
     * @param integer $d3h20
     * @return Planes
     */
    public function setD3h20($d3h20)
    {
        $this->d3h20 = $d3h20;

        return $this;
    }

    /**
     * Get d3h20
     *
     * @return integer 
     */
    public function getD3h20()
    {
        return $this->d3h20;
    }

    /**
     * Set d3h21
     *
     * @param integer $d3h21
     * @return Planes
     */
    public function setD3h21($d3h21)
    {
        $this->d3h21 = $d3h21;

        return $this;
    }

    /**
     * Get d3h21
     *
     * @return integer 
     */
    public function getD3h21()
    {
        return $this->d3h21;
    }

    /**
     * Set d3h22
     *
     * @param integer $d3h22
     * @return Planes
     */
    public function setD3h22($d3h22)
    {
        $this->d3h22 = $d3h22;

        return $this;
    }

    /**
     * Get d3h22
     *
     * @return integer 
     */
    public function getD3h22()
    {
        return $this->d3h22;
    }

    /**
     * Set d3h23
     *
     * @param integer $d3h23
     * @return Planes
     */
    public function setD3h23($d3h23)
    {
        $this->d3h23 = $d3h23;

        return $this;
    }

    /**
     * Get d3h23
     *
     * @return integer 
     */
    public function getD3h23()
    {
        return $this->d3h23;
    }

    /**
     * Set d4h01
     *
     * @param integer $d4h01
     * @return Planes
     */
    public function setD4h01($d4h01)
    {
        $this->d4h01 = $d4h01;

        return $this;
    }

    /**
     * Get d4h01
     *
     * @return integer 
     */
    public function getD4h01()
    {
        return $this->d4h01;
    }

    /**
     * Set d4h02
     *
     * @param integer $d4h02
     * @return Planes
     */
    public function setD4h02($d4h02)
    {
        $this->d4h02 = $d4h02;

        return $this;
    }

    /**
     * Get d4h02
     *
     * @return integer 
     */
    public function getD4h02()
    {
        return $this->d4h02;
    }

    /**
     * Set d4h03
     *
     * @param integer $d4h03
     * @return Planes
     */
    public function setD4h03($d4h03)
    {
        $this->d4h03 = $d4h03;

        return $this;
    }

    /**
     * Get d4h03
     *
     * @return integer 
     */
    public function getD4h03()
    {
        return $this->d4h03;
    }

    /**
     * Set d4h04
     *
     * @param integer $d4h04
     * @return Planes
     */
    public function setD4h04($d4h04)
    {
        $this->d4h04 = $d4h04;

        return $this;
    }

    /**
     * Get d4h04
     *
     * @return integer 
     */
    public function getD4h04()
    {
        return $this->d4h04;
    }

    /**
     * Set d4h05
     *
     * @param integer $d4h05
     * @return Planes
     */
    public function setD4h05($d4h05)
    {
        $this->d4h05 = $d4h05;

        return $this;
    }

    /**
     * Get d4h05
     *
     * @return integer 
     */
    public function getD4h05()
    {
        return $this->d4h05;
    }

    /**
     * Set d4h06
     *
     * @param integer $d4h06
     * @return Planes
     */
    public function setD4h06($d4h06)
    {
        $this->d4h06 = $d4h06;

        return $this;
    }

    /**
     * Get d4h06
     *
     * @return integer 
     */
    public function getD4h06()
    {
        return $this->d4h06;
    }

    /**
     * Set d4h07
     *
     * @param integer $d4h07
     * @return Planes
     */
    public function setD4h07($d4h07)
    {
        $this->d4h07 = $d4h07;

        return $this;
    }

    /**
     * Get d4h07
     *
     * @return integer 
     */
    public function getD4h07()
    {
        return $this->d4h07;
    }

    /**
     * Set d4h08
     *
     * @param integer $d4h08
     * @return Planes
     */
    public function setD4h08($d4h08)
    {
        $this->d4h08 = $d4h08;

        return $this;
    }

    /**
     * Get d4h08
     *
     * @return integer 
     */
    public function getD4h08()
    {
        return $this->d4h08;
    }

    /**
     * Set d4h09
     *
     * @param integer $d4h09
     * @return Planes
     */
    public function setD4h09($d4h09)
    {
        $this->d4h09 = $d4h09;

        return $this;
    }

    /**
     * Get d4h09
     *
     * @return integer 
     */
    public function getD4h09()
    {
        return $this->d4h09;
    }

    /**
     * Set d4h10
     *
     * @param integer $d4h10
     * @return Planes
     */
    public function setD4h10($d4h10)
    {
        $this->d4h10 = $d4h10;

        return $this;
    }

    /**
     * Get d4h10
     *
     * @return integer 
     */
    public function getD4h10()
    {
        return $this->d4h10;
    }

    /**
     * Set d4h11
     *
     * @param integer $d4h11
     * @return Planes
     */
    public function setD4h11($d4h11)
    {
        $this->d4h11 = $d4h11;

        return $this;
    }

    /**
     * Get d4h11
     *
     * @return integer 
     */
    public function getD4h11()
    {
        return $this->d4h11;
    }

    /**
     * Set d4h12
     *
     * @param integer $d4h12
     * @return Planes
     */
    public function setD4h12($d4h12)
    {
        $this->d4h12 = $d4h12;

        return $this;
    }

    /**
     * Get d4h12
     *
     * @return integer 
     */
    public function getD4h12()
    {
        return $this->d4h12;
    }

    /**
     * Set d4h13
     *
     * @param integer $d4h13
     * @return Planes
     */
    public function setD4h13($d4h13)
    {
        $this->d4h13 = $d4h13;

        return $this;
    }

    /**
     * Get d4h13
     *
     * @return integer 
     */
    public function getD4h13()
    {
        return $this->d4h13;
    }

    /**
     * Set d4h14
     *
     * @param integer $d4h14
     * @return Planes
     */
    public function setD4h14($d4h14)
    {
        $this->d4h14 = $d4h14;

        return $this;
    }

    /**
     * Get d4h14
     *
     * @return integer 
     */
    public function getD4h14()
    {
        return $this->d4h14;
    }

    /**
     * Set d4h15
     *
     * @param integer $d4h15
     * @return Planes
     */
    public function setD4h15($d4h15)
    {
        $this->d4h15 = $d4h15;

        return $this;
    }

    /**
     * Get d4h15
     *
     * @return integer 
     */
    public function getD4h15()
    {
        return $this->d4h15;
    }

    /**
     * Set d4h16
     *
     * @param integer $d4h16
     * @return Planes
     */
    public function setD4h16($d4h16)
    {
        $this->d4h16 = $d4h16;

        return $this;
    }

    /**
     * Get d4h16
     *
     * @return integer 
     */
    public function getD4h16()
    {
        return $this->d4h16;
    }

    /**
     * Set d4h17
     *
     * @param integer $d4h17
     * @return Planes
     */
    public function setD4h17($d4h17)
    {
        $this->d4h17 = $d4h17;

        return $this;
    }

    /**
     * Get d4h17
     *
     * @return integer 
     */
    public function getD4h17()
    {
        return $this->d4h17;
    }

    /**
     * Set d4h18
     *
     * @param integer $d4h18
     * @return Planes
     */
    public function setD4h18($d4h18)
    {
        $this->d4h18 = $d4h18;

        return $this;
    }

    /**
     * Get d4h18
     *
     * @return integer 
     */
    public function getD4h18()
    {
        return $this->d4h18;
    }

    /**
     * Set d4h19
     *
     * @param integer $d4h19
     * @return Planes
     */
    public function setD4h19($d4h19)
    {
        $this->d4h19 = $d4h19;

        return $this;
    }

    /**
     * Get d4h19
     *
     * @return integer 
     */
    public function getD4h19()
    {
        return $this->d4h19;
    }

    /**
     * Set d4h20
     *
     * @param integer $d4h20
     * @return Planes
     */
    public function setD4h20($d4h20)
    {
        $this->d4h20 = $d4h20;

        return $this;
    }

    /**
     * Get d4h20
     *
     * @return integer 
     */
    public function getD4h20()
    {
        return $this->d4h20;
    }

    /**
     * Set d4h21
     *
     * @param integer $d4h21
     * @return Planes
     */
    public function setD4h21($d4h21)
    {
        $this->d4h21 = $d4h21;

        return $this;
    }

    /**
     * Get d4h21
     *
     * @return integer 
     */
    public function getD4h21()
    {
        return $this->d4h21;
    }

    /**
     * Set d4h22
     *
     * @param integer $d4h22
     * @return Planes
     */
    public function setD4h22($d4h22)
    {
        $this->d4h22 = $d4h22;

        return $this;
    }

    /**
     * Get d4h22
     *
     * @return integer 
     */
    public function getD4h22()
    {
        return $this->d4h22;
    }

    /**
     * Set d4h23
     *
     * @param integer $d4h23
     * @return Planes
     */
    public function setD4h23($d4h23)
    {
        $this->d4h23 = $d4h23;

        return $this;
    }

    /**
     * Get d4h23
     *
     * @return integer 
     */
    public function getD4h23()
    {
        return $this->d4h23;
    }

    /**
     * Set d5h01
     *
     * @param integer $d5h01
     * @return Planes
     */
    public function setD5h01($d5h01)
    {
        $this->d5h01 = $d5h01;

        return $this;
    }

    /**
     * Get d5h01
     *
     * @return integer 
     */
    public function getD5h01()
    {
        return $this->d5h01;
    }

    /**
     * Set d5h02
     *
     * @param integer $d5h02
     * @return Planes
     */
    public function setD5h02($d5h02)
    {
        $this->d5h02 = $d5h02;

        return $this;
    }

    /**
     * Get d5h02
     *
     * @return integer 
     */
    public function getD5h02()
    {
        return $this->d5h02;
    }

    /**
     * Set d5h03
     *
     * @param integer $d5h03
     * @return Planes
     */
    public function setD5h03($d5h03)
    {
        $this->d5h03 = $d5h03;

        return $this;
    }

    /**
     * Get d5h03
     *
     * @return integer 
     */
    public function getD5h03()
    {
        return $this->d5h03;
    }

    /**
     * Set d5h04
     *
     * @param integer $d5h04
     * @return Planes
     */
    public function setD5h04($d5h04)
    {
        $this->d5h04 = $d5h04;

        return $this;
    }

    /**
     * Get d5h04
     *
     * @return integer 
     */
    public function getD5h04()
    {
        return $this->d5h04;
    }

    /**
     * Set d5h05
     *
     * @param integer $d5h05
     * @return Planes
     */
    public function setD5h05($d5h05)
    {
        $this->d5h05 = $d5h05;

        return $this;
    }

    /**
     * Get d5h05
     *
     * @return integer 
     */
    public function getD5h05()
    {
        return $this->d5h05;
    }

    /**
     * Set d5h06
     *
     * @param integer $d5h06
     * @return Planes
     */
    public function setD5h06($d5h06)
    {
        $this->d5h06 = $d5h06;

        return $this;
    }

    /**
     * Get d5h06
     *
     * @return integer 
     */
    public function getD5h06()
    {
        return $this->d5h06;
    }

    /**
     * Set d5h07
     *
     * @param integer $d5h07
     * @return Planes
     */
    public function setD5h07($d5h07)
    {
        $this->d5h07 = $d5h07;

        return $this;
    }

    /**
     * Get d5h07
     *
     * @return integer 
     */
    public function getD5h07()
    {
        return $this->d5h07;
    }

    /**
     * Set d5h08
     *
     * @param integer $d5h08
     * @return Planes
     */
    public function setD5h08($d5h08)
    {
        $this->d5h08 = $d5h08;

        return $this;
    }

    /**
     * Get d5h08
     *
     * @return integer 
     */
    public function getD5h08()
    {
        return $this->d5h08;
    }

    /**
     * Set d5h09
     *
     * @param integer $d5h09
     * @return Planes
     */
    public function setD5h09($d5h09)
    {
        $this->d5h09 = $d5h09;

        return $this;
    }

    /**
     * Get d5h09
     *
     * @return integer 
     */
    public function getD5h09()
    {
        return $this->d5h09;
    }

    /**
     * Set d5h10
     *
     * @param integer $d5h10
     * @return Planes
     */
    public function setD5h10($d5h10)
    {
        $this->d5h10 = $d5h10;

        return $this;
    }

    /**
     * Get d5h10
     *
     * @return integer 
     */
    public function getD5h10()
    {
        return $this->d5h10;
    }

    /**
     * Set d5h11
     *
     * @param integer $d5h11
     * @return Planes
     */
    public function setD5h11($d5h11)
    {
        $this->d5h11 = $d5h11;

        return $this;
    }

    /**
     * Get d5h11
     *
     * @return integer 
     */
    public function getD5h11()
    {
        return $this->d5h11;
    }

    /**
     * Set d5h12
     *
     * @param integer $d5h12
     * @return Planes
     */
    public function setD5h12($d5h12)
    {
        $this->d5h12 = $d5h12;

        return $this;
    }

    /**
     * Get d5h12
     *
     * @return integer 
     */
    public function getD5h12()
    {
        return $this->d5h12;
    }

    /**
     * Set d5h13
     *
     * @param integer $d5h13
     * @return Planes
     */
    public function setD5h13($d5h13)
    {
        $this->d5h13 = $d5h13;

        return $this;
    }

    /**
     * Get d5h13
     *
     * @return integer 
     */
    public function getD5h13()
    {
        return $this->d5h13;
    }

    /**
     * Set d5h14
     *
     * @param integer $d5h14
     * @return Planes
     */
    public function setD5h14($d5h14)
    {
        $this->d5h14 = $d5h14;

        return $this;
    }

    /**
     * Get d5h14
     *
     * @return integer 
     */
    public function getD5h14()
    {
        return $this->d5h14;
    }

    /**
     * Set d5h15
     *
     * @param integer $d5h15
     * @return Planes
     */
    public function setD5h15($d5h15)
    {
        $this->d5h15 = $d5h15;

        return $this;
    }

    /**
     * Get d5h15
     *
     * @return integer 
     */
    public function getD5h15()
    {
        return $this->d5h15;
    }

    /**
     * Set d5h16
     *
     * @param integer $d5h16
     * @return Planes
     */
    public function setD5h16($d5h16)
    {
        $this->d5h16 = $d5h16;

        return $this;
    }

    /**
     * Get d5h16
     *
     * @return integer 
     */
    public function getD5h16()
    {
        return $this->d5h16;
    }

    /**
     * Set d5h17
     *
     * @param integer $d5h17
     * @return Planes
     */
    public function setD5h17($d5h17)
    {
        $this->d5h17 = $d5h17;

        return $this;
    }

    /**
     * Get d5h17
     *
     * @return integer 
     */
    public function getD5h17()
    {
        return $this->d5h17;
    }

    /**
     * Set d5h18
     *
     * @param integer $d5h18
     * @return Planes
     */
    public function setD5h18($d5h18)
    {
        $this->d5h18 = $d5h18;

        return $this;
    }

    /**
     * Get d5h18
     *
     * @return integer 
     */
    public function getD5h18()
    {
        return $this->d5h18;
    }

    /**
     * Set d5h19
     *
     * @param integer $d5h19
     * @return Planes
     */
    public function setD5h19($d5h19)
    {
        $this->d5h19 = $d5h19;

        return $this;
    }

    /**
     * Get d5h19
     *
     * @return integer 
     */
    public function getD5h19()
    {
        return $this->d5h19;
    }

    /**
     * Set d5h20
     *
     * @param integer $d5h20
     * @return Planes
     */
    public function setD5h20($d5h20)
    {
        $this->d5h20 = $d5h20;

        return $this;
    }

    /**
     * Get d5h20
     *
     * @return integer 
     */
    public function getD5h20()
    {
        return $this->d5h20;
    }

    /**
     * Set d5h21
     *
     * @param integer $d5h21
     * @return Planes
     */
    public function setD5h21($d5h21)
    {
        $this->d5h21 = $d5h21;

        return $this;
    }

    /**
     * Get d5h21
     *
     * @return integer 
     */
    public function getD5h21()
    {
        return $this->d5h21;
    }

    /**
     * Set d5h22
     *
     * @param integer $d5h22
     * @return Planes
     */
    public function setD5h22($d5h22)
    {
        $this->d5h22 = $d5h22;

        return $this;
    }

    /**
     * Get d5h22
     *
     * @return integer 
     */
    public function getD5h22()
    {
        return $this->d5h22;
    }

    /**
     * Set d5h23
     *
     * @param integer $d5h23
     * @return Planes
     */
    public function setD5h23($d5h23)
    {
        $this->d5h23 = $d5h23;

        return $this;
    }

    /**
     * Get d5h23
     *
     * @return integer 
     */
    public function getD5h23()
    {
        return $this->d5h23;
    }

    /**
     * Set d6h01
     *
     * @param integer $d6h01
     * @return Planes
     */
    public function setD6h01($d6h01)
    {
        $this->d6h01 = $d6h01;

        return $this;
    }

    /**
     * Get d6h01
     *
     * @return integer 
     */
    public function getD6h01()
    {
        return $this->d6h01;
    }

    /**
     * Set d6h02
     *
     * @param integer $d6h02
     * @return Planes
     */
    public function setD6h02($d6h02)
    {
        $this->d6h02 = $d6h02;

        return $this;
    }

    /**
     * Get d6h02
     *
     * @return integer 
     */
    public function getD6h02()
    {
        return $this->d6h02;
    }

    /**
     * Set d6h03
     *
     * @param integer $d6h03
     * @return Planes
     */
    public function setD6h03($d6h03)
    {
        $this->d6h03 = $d6h03;

        return $this;
    }

    /**
     * Get d6h03
     *
     * @return integer 
     */
    public function getD6h03()
    {
        return $this->d6h03;
    }

    /**
     * Set d6h04
     *
     * @param integer $d6h04
     * @return Planes
     */
    public function setD6h04($d6h04)
    {
        $this->d6h04 = $d6h04;

        return $this;
    }

    /**
     * Get d6h04
     *
     * @return integer 
     */
    public function getD6h04()
    {
        return $this->d6h04;
    }

    /**
     * Set d6h05
     *
     * @param integer $d6h05
     * @return Planes
     */
    public function setD6h05($d6h05)
    {
        $this->d6h05 = $d6h05;

        return $this;
    }

    /**
     * Get d6h05
     *
     * @return integer 
     */
    public function getD6h05()
    {
        return $this->d6h05;
    }

    /**
     * Set d6h06
     *
     * @param integer $d6h06
     * @return Planes
     */
    public function setD6h06($d6h06)
    {
        $this->d6h06 = $d6h06;

        return $this;
    }

    /**
     * Get d6h06
     *
     * @return integer 
     */
    public function getD6h06()
    {
        return $this->d6h06;
    }

    /**
     * Set d6h07
     *
     * @param integer $d6h07
     * @return Planes
     */
    public function setD6h07($d6h07)
    {
        $this->d6h07 = $d6h07;

        return $this;
    }

    /**
     * Get d6h07
     *
     * @return integer 
     */
    public function getD6h07()
    {
        return $this->d6h07;
    }

    /**
     * Set d6h08
     *
     * @param integer $d6h08
     * @return Planes
     */
    public function setD6h08($d6h08)
    {
        $this->d6h08 = $d6h08;

        return $this;
    }

    /**
     * Get d6h08
     *
     * @return integer 
     */
    public function getD6h08()
    {
        return $this->d6h08;
    }

    /**
     * Set d6h09
     *
     * @param integer $d6h09
     * @return Planes
     */
    public function setD6h09($d6h09)
    {
        $this->d6h09 = $d6h09;

        return $this;
    }

    /**
     * Get d6h09
     *
     * @return integer 
     */
    public function getD6h09()
    {
        return $this->d6h09;
    }

    /**
     * Set d6h10
     *
     * @param integer $d6h10
     * @return Planes
     */
    public function setD6h10($d6h10)
    {
        $this->d6h10 = $d6h10;

        return $this;
    }

    /**
     * Get d6h10
     *
     * @return integer 
     */
    public function getD6h10()
    {
        return $this->d6h10;
    }

    /**
     * Set d6h11
     *
     * @param integer $d6h11
     * @return Planes
     */
    public function setD6h11($d6h11)
    {
        $this->d6h11 = $d6h11;

        return $this;
    }

    /**
     * Get d6h11
     *
     * @return integer 
     */
    public function getD6h11()
    {
        return $this->d6h11;
    }

    /**
     * Set d6h12
     *
     * @param integer $d6h12
     * @return Planes
     */
    public function setD6h12($d6h12)
    {
        $this->d6h12 = $d6h12;

        return $this;
    }

    /**
     * Get d6h12
     *
     * @return integer 
     */
    public function getD6h12()
    {
        return $this->d6h12;
    }

    /**
     * Set d6h13
     *
     * @param integer $d6h13
     * @return Planes
     */
    public function setD6h13($d6h13)
    {
        $this->d6h13 = $d6h13;

        return $this;
    }

    /**
     * Get d6h13
     *
     * @return integer 
     */
    public function getD6h13()
    {
        return $this->d6h13;
    }

    /**
     * Set d6h14
     *
     * @param integer $d6h14
     * @return Planes
     */
    public function setD6h14($d6h14)
    {
        $this->d6h14 = $d6h14;

        return $this;
    }

    /**
     * Get d6h14
     *
     * @return integer 
     */
    public function getD6h14()
    {
        return $this->d6h14;
    }

    /**
     * Set d6h15
     *
     * @param integer $d6h15
     * @return Planes
     */
    public function setD6h15($d6h15)
    {
        $this->d6h15 = $d6h15;

        return $this;
    }

    /**
     * Get d6h15
     *
     * @return integer 
     */
    public function getD6h15()
    {
        return $this->d6h15;
    }

    /**
     * Set d6h16
     *
     * @param integer $d6h16
     * @return Planes
     */
    public function setD6h16($d6h16)
    {
        $this->d6h16 = $d6h16;

        return $this;
    }

    /**
     * Get d6h16
     *
     * @return integer 
     */
    public function getD6h16()
    {
        return $this->d6h16;
    }

    /**
     * Set d6h17
     *
     * @param integer $d6h17
     * @return Planes
     */
    public function setD6h17($d6h17)
    {
        $this->d6h17 = $d6h17;

        return $this;
    }

    /**
     * Get d6h17
     *
     * @return integer 
     */
    public function getD6h17()
    {
        return $this->d6h17;
    }

    /**
     * Set d6h18
     *
     * @param integer $d6h18
     * @return Planes
     */
    public function setD6h18($d6h18)
    {
        $this->d6h18 = $d6h18;

        return $this;
    }

    /**
     * Get d6h18
     *
     * @return integer 
     */
    public function getD6h18()
    {
        return $this->d6h18;
    }

    /**
     * Set d6h19
     *
     * @param integer $d6h19
     * @return Planes
     */
    public function setD6h19($d6h19)
    {
        $this->d6h19 = $d6h19;

        return $this;
    }

    /**
     * Get d6h19
     *
     * @return integer 
     */
    public function getD6h19()
    {
        return $this->d6h19;
    }

    /**
     * Set d6h20
     *
     * @param integer $d6h20
     * @return Planes
     */
    public function setD6h20($d6h20)
    {
        $this->d6h20 = $d6h20;

        return $this;
    }

    /**
     * Get d6h20
     *
     * @return integer 
     */
    public function getD6h20()
    {
        return $this->d6h20;
    }

    /**
     * Set d6h21
     *
     * @param integer $d6h21
     * @return Planes
     */
    public function setD6h21($d6h21)
    {
        $this->d6h21 = $d6h21;

        return $this;
    }

    /**
     * Get d6h21
     *
     * @return integer 
     */
    public function getD6h21()
    {
        return $this->d6h21;
    }

    /**
     * Set d6h22
     *
     * @param integer $d6h22
     * @return Planes
     */
    public function setD6h22($d6h22)
    {
        $this->d6h22 = $d6h22;

        return $this;
    }

    /**
     * Get d6h22
     *
     * @return integer 
     */
    public function getD6h22()
    {
        return $this->d6h22;
    }

    /**
     * Set d6h23
     *
     * @param integer $d6h23
     * @return Planes
     */
    public function setD6h23($d6h23)
    {
        $this->d6h23 = $d6h23;

        return $this;
    }

    /**
     * Get d6h23
     *
     * @return integer 
     */
    public function getD6h23()
    {
        return $this->d6h23;
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
    
    /**
     * Get bwactual
     * By Joe
     * @return integer
     */
    public function getbwactual()
    {
    	$actual="d".date("w")."h".date("H");
    	return $this->$actual;
    }

    /**
     * Set d1h00
     *
     * @param integer $d1h00
     * @return Planes
     */
    public function setD1h00($d1h00)
    {
        $this->d1h00 = $d1h00;

        return $this;
    }

    /**
     * Get d1h00
     *
     * @return integer 
     */
    public function getD1h00()
    {
        return $this->d1h00;
    }

    /**
     * Set d2h00
     *
     * @param integer $d2h00
     * @return Planes
     */
    public function setD2h00($d2h00)
    {
        $this->d2h00 = $d2h00;

        return $this;
    }

    /**
     * Get d2h00
     *
     * @return integer 
     */
    public function getD2h00()
    {
        return $this->d2h00;
    }

    /**
     * Set d3h00
     *
     * @param integer $d3h00
     * @return Planes
     */
    public function setD3h00($d3h00)
    {
        $this->d3h00 = $d3h00;

        return $this;
    }

    /**
     * Get d3h00
     *
     * @return integer 
     */
    public function getD3h00()
    {
        return $this->d3h00;
    }

    /**
     * Set d4h00
     *
     * @param integer $d4h00
     * @return Planes
     */
    public function setD4h00($d4h00)
    {
        $this->d4h00 = $d4h00;

        return $this;
    }

    /**
     * Get d4h00
     *
     * @return integer 
     */
    public function getD4h00()
    {
        return $this->d4h00;
    }

    /**
     * Set d5h00
     *
     * @param integer $d5h00
     * @return Planes
     */
    public function setD5h00($d5h00)
    {
        $this->d5h00 = $d5h00;

        return $this;
    }

    /**
     * Get d5h00
     *
     * @return integer 
     */
    public function getD5h00()
    {
        return $this->d5h00;
    }

    /**
     * Set d6h00
     *
     * @param integer $d6h00
     * @return Planes
     */
    public function setD6h00($d6h00)
    {
        $this->d6h00 = $d6h00;

        return $this;
    }

    /**
     * Get d6h00
     *
     * @return integer 
     */
    public function getD6h00()
    {
        return $this->d6h00;
    }
}
