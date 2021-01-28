<?php
$url = 'http://localhost/presensi/data.php';
$res = file_get_contents($url);
$result = json_decode($res);
//var_dump($result);	
print_r($result);
?>