<?php

define('DB_SERVERIP', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'flyinfo');

define('ACCESS_KEY_1', '1qaz2wsx');
define('ACCESS_KEY_2', '2wsx3edc');

define('T_TYPE', 'info_type'); // type_id (int) , display_default , display_zh , ...
define('T_LOCATION', 'info_location'); // local_id (long) ,latitude ,longitude , altitude , range , type_id , info_id , timestemp 
define('T_INFO','info_data'); // info_id (long), type_id, tag, img_url , shortcut_img_base64, title (Json 多國語系) , description (Json 多國語系) , memo(Json 多國語系) , timestemp

define('C_TYPE_ID','type_id');
define('C_INFO_ID','info_id');
define('C_LOCAL_ID','local_id');

define('SET_CHARACTER', 'set character set utf8');   // utf8或big5或此列加註移除
define('ERROR_CONNECT',   'Cannot connect server');  // 無法連接伺服器
define('ERROR_DATABASE',  'Cannot open database');  // 無法開啟資料庫
define('ERROR_CHARACTER', 'Character set error');  // 無法使用指定的校對字元集
define('ERROR_QUERY',     'Error in SQL Query');  // 無法執行資料庫查詢指令
define('ACCESS_DENY',     'Access denied');  // 無法執行資料庫查詢指令

?>
