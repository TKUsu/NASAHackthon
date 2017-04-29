<?php
include_once "../config.php"; // log.php 

$access_key = isset($_GET["access_key"]) ? $_GET["access_key"] : "null"; //
$data_id = isset($_GET["data_id"]) ? $_GET["data_id"] : "-1"; //

if($access_key==ACCESS_KEY_READ_ONLY||$access_key==ACCESS_KEY_READ_WRITE){ // write value
	
	$sql = "SELECT * FROM `".T_INFO."` WHERE data_id = ".$data_id;
	//echo $sql."<br>";
	$connection = mysqli_connect(DB_SERVERIP, DB_USERNAME, DB_PASSWORD,DB_DATABASE ) or die(ERROR_CHARACTER);
	mysqli_query($connection, 'SET NAMES utf8'); // UTF8
	$result = $connection->query($sql);
	$rowArray = array();
	while($row = mysqli_fetch_assoc($result)) {
	    $rowArray[] = $row;
	}
	//echo "<br>";
	echo json_encode($rowArray); // 輸出 json 格式
	$result->free(); //  釋放 server 查詢結果 使用的記憶體
	//echo "<br>";

}else{ // error
	echo ACCESS_DENY;
}

?>