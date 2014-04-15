<?
include "librerias.php";
$syslog="";
$fd = fopen ("logzafiro.log", "r");
while(!feof ($fd)){
       	$syslog.=trim(fgets($fd,1024))."<br>";
}


?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<STYLE type=text/css>

BODY {SCROLLBAR-FACE-COLOR:#333333;
      SCROLLBAR-HIGHLIGHT-COLOR:#808080;
      SCROLLBAR-SHADOW-COLOR:#FFFFFF;
      SCROLLBAR-3DLIGHT-COLOR:#808080;
      SCROLLBAR-ARROW-COLOR:#808080;
      SCROLLBAR-TRACK-COLOR:#808080;
      SCROLLBAR-DARKSHADOW-COLOR:black
}
</STYLE>

<title>Fecha y hora</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body class=body>
	<font class=texto color=#ccccc><?echo $syslog;?></font>
</body>
</html>
