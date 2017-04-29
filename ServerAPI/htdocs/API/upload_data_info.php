<?php
include_once "../config.php"; // log.php 

$access_key = isset($_GET["access_key"]) ? $_GET["access_key"] : "null"; //
$type_id = isset($_GET["type_id"]) ? $_GET["type_id"] : "-1";// 未分類
$tag = isset($_GET["tag"]) ? $_GET["tag"] : "NULL";
$img_url = isset($_GET["img_url"]) ? $_GET["img_url"] : "NULL";
$shortcut_img_base64 = isset($_GET["base64"]) ? $_GET["base64"] : "NULL";
$title = isset($_GET["title"]) ? $_GET["title"] : "NULL";
$description = isset($_GET["description"]) ? $_GET["description"] : "NULL";
$memo = isset($_GET["memo"]) ? $_GET["memo"] : "{}";// 空 json
$points = isset($_GET["points"]) ? $_GET["points"] : "0,0";// 0,0+20.0,100+

if($access_key==ACCESS_KEY_READ_WRITE){ // write value

	// insert "Data" table

	// check important parameter 
	if($type_id=="-1"||(!is_numeric($type_id))){
		echo "\"type_id\" not correct";
		exit();
	} 
	if($title=="NULL"||$title==""){
		echo "\"title\" not NULL or Empty";
		exit();
	} 
	if($description=="NULL"||$description==""){
		echo "\"description\" not NULL or Empty";
		exit();
	} 

	$sql_insert_Data = "INSERT INTO `".T_INFO."` (`type_id`, `tag`, `img_url`, `shortcut_img_base64`, `title`, `description`, `memo`) VALUES( ".
		$type_id.",'".$tag."','".$img_url."','".$shortcut_img_base64."','".$title."','".$description."','".$memo."')";
	// echo $sql_insert_Data;
	$connection = mysqli_connect(DB_SERVERIP, DB_USERNAME, DB_PASSWORD,DB_DATABASE ) or die(ERROR_CHARACTER);
	mysqli_query($connection, $sql_insert_Data); // UTF8
	$data_id = mysqli_insert_id($connection);
	echo "data_id = ".$data_id;

	// insert "location" table
	if($points=="0,0"||$points==""){
		echo "\"points\" not corrent . Should be ( lat,long|lat,long|... )";
		exit();
	} 
	

	

// 	INSERT INTO `info_location` ( `type_id`, `data_id`, `latitude`, `longitude`, `altitude`, `area_code`, `multi_zone`,`shortcut_img_base64`) VALUES
// ( 1, 1, 72.0276249, 100.430462, 0, '', '',NULL),
// ( 1, 1, 76.8914998, -162.17566, 0, '', '',NULL),
// ( 1, 1, 72.2614842, -43.4729121, 0, '', '',NULL);



}else{ // error
	echo ACCESS_DENY;
}

?>