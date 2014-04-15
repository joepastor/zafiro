<?
include "db.php";
$rs=mysql_query("select id,nombre,ip from servidores",$db);
while($rsr=mysql_fetch_row($rs)){
	echo "<option value=".$rsr[0].">".$rsr[1]." - ".$rsr[2]."</option>";
}
?>


