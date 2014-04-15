<?
include "configuracion.php";
$db = mysql_connect($sysop["db_host"], $sysop["db_user"], $sysop["db_pass"]);
$db_selected = mysql_select_db($sysop["db_name"], $db);
?>
