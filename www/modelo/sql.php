<?php

class sql {
    function connect() {
        try {
		$db = mysql_connect("localhost", "zafiro", "j483nd8-34/23f--ds");
		$db_selected = mysql_select_db("zafiro", $db);
		if (!$db) {
            		throw new Exception('Error de conexion');
		} else {
                	return $db;
		}
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    function execute($query) {
        $connect = sql::connect();
        mysql_query($query,$connect);
    }
    function query($query) {
        $connect = sql::connect();
        $rs = mysql_query($query,$connect);
        return $rs;
    }
}
