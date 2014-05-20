update clientes set estado=3 where estado=0 and id>0;
update clientes set estado=0 where estado in (1,2) and id>0;
update clientes set estado=1 where estado=3 and id>0;

# Insert de la tabla acciones
INSERT INTO `acciones` VALUES (1,0,'Apaga el sistema','shutdown -h now'),(2,0,'Reinicia el servidor','reboot'),(3,0,'Reiniciar servicio de red','/etc/init.d/networking restart'),(4,0,'Reiniciar VPN','/etc/init.d/openvpn restart'),(5,0,'DHCP','/etc/init.d/isc-dhcp-server restart'),(6,0,'Ejecutar Zafiro',NULL);
# Insert de la tabla interfaces
