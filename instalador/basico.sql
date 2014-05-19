update clientes set estado=3 where estado=0 and id>0;
update clientes set estado=0 where estado in (1,2) and id>0;
update clientes set estado=1 where estado=3 and id>0;

# Insert de la tabla acciones

# Insert de la tabla interfaces
