<?
include "inclusiones.php";
include "barra.php";
?>
<html>
    <title>Zafiro - <? echo $servidor->hostname; ?></title>
    <body>
        <div id="contenedor">
            <div id="cuerpo">
                <iframe id="body" name="body" src="resumen.php" height=100% width=100% frameborder=0></iframe>
            </div>        
        </div>
    </body>
</html>
