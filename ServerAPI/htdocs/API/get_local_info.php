<?php
include_once "../config.php"; // log.php 

$type = isset($_GET["type"]) ? $_GET["type"] : "1,2,3"; // default 0 (all)  
$latitude = isset($_GET["lat"]) ? $_GET["lat"] : "0.0";
$longitude = isset($_GET["long"]) ? $_GET["long"] :"0.0";
$access_key = isset($_GET["access_key"]) ? $_GET["access_key"] : "null"; //

if($type!="null"&&($access_key==ACCESS_KEY_READ_ONLY||$access_key==ACCESS_KEY_READ_WRITE)){ // write value
	
	$sql = "";

	if($type=="all"){
		$sql = "SELECT * FROM `info_location` LIMIT 40";
	}else{
	//$type  = "1,3";
	$typeArray = explode(",", $type);
	$typeLength = count($typeArray);
	$valueSet ="";
	  for($i =0;$i<(int)$typeLength;$i++){
	  	if((int)$i == ((int)$typeLength-1 ))  $valueSet = $valueSet . $typeArray[$i]; 
	  	else $valueSet = $valueSet . $typeArray[$i] ."," ; 
	  }	
  	// 
  	$lat_Max = (double) $latitude + (double)(1.0); 
  	$lat_Min = (double) $latitude - (double)(1.0); 
  	$long_Max = (double) $longitude + (double)(2.0); 
  	$long_Min = (double) $longitude - (double)(2.0); 

	// 
	$sql = "SELECT * FROM `info_location` WHERE type_id IN (".$valueSet.") 
	AND latitude < ".$lat_Max." AND latitude > ".$lat_Min."
    AND longitude <".$long_Max." AND longitude > ".$long_Min."
    LIMIT 30";
	//echo $sql."<br>";
	}
	
	$connection = mysqli_connect(DB_SERVERIP, DB_USERNAME, DB_PASSWORD,DB_DATABASE ) or die(ERROR_CHARACTER);
	mysqli_query($connection, 'SET NAMES utf8'); // UTF8
	$result = $connection->query($sql);
	$rowArray = array();
	while($row = mysqli_fetch_assoc($result)) {
	    $rowArray[] = $row;
	}
	
	echo json_encode($rowArray); // 輸出 json 格式
	$result->free(); //  釋放 server 查詢結果 使用的記憶體

}else{ // error
	echo ACCESS_DENY;
}

?>