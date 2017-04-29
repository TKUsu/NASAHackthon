<?php
include_once "../config.php"; // log.php 

$type = isset($_GET["type"]) ? $_GET["type"] : "unknow";

$latitude = isset($_GET["lat"]) ? $_GET["lat"] : "0.0";
$longitude = isset($_GET["long"]) ? $_GET["long"] : "0.0";
$access_key = isset($_GET["access_key"]) ? $_GET["access_key"] : "null"; //

if($type!="null"&&($access_key==ACCESS_KEY_1||$access_key==ACCESS_KEY_2)){ // write value

}else{ // error
	echo ACCESS_DENY;
}

?>