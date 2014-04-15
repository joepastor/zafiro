<?
if(isset($HTTP_GET_VARS["servidor"])){
	$return="";
	include "db.php";
	$sql="select nombre,usuariomysql,passwordmysql,ip from servidores where id=".$HTTP_GET_VARS["servidor"];
	$rs=mysql_query($sql);
	if($resultados=mysql_fetch_row($rs)){
		$dbclientes = mysql_connect($resultados[3], $resultados[1], $resultados[2]);
		mysql_select_db("zafiro",$dbclientes);
		$resultado=mysql_query("select clientesid,clientesnom from clientes where clientesest in (0,1)",$dbclientes);
		while($array=mysql_fetch_row($resultado)){
			$return.="<option value=".$array[0].">".$array[1]."</opion>";
		}
		mysql_close($dbclientes);
	}
}
?>
