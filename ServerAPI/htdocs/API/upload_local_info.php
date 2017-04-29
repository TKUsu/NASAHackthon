<?php
include_once "../config.php"; // log.php 

$type = isset($_GET["type"]) ? $_GET["type"] : "unknow";
$access_key = isset($_GET["access_key"]) ? $_GET["access_key"] : "null"; //

if($type!="null"&&($access_key==ACCESS_KEY_1||$access_key==ACCESS_KEY_2)){ // write value

}else{ // error
	echo ACCESS_DENY;
}

?>