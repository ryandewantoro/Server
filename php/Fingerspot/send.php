<?php
$con = mysqli_connect("localhost:3309","root","putrisaljudan7kurcaci","presensi");

if(isset($_POST['data'])){
	
	$data = json_decode($_POST['data'], TRUE);
	$file = fopen('debug.txt', 'a+');
	foreach($data as $d){
		$nip = mysqli_real_escape_string($con, $d['nip']);
		$tanggal = mysqli_real_escape_string($con, $d['tanggal']);
		$jam = mysqli_real_escape_string($con, $d['jam']);
		$insert = mysqli_query($con, "insert into terima (nip, tanggal, jam) values ('".$nip."', '".$tanggal."', '".$jam."')");
	}

}
header("Location: post.php");
die();
?>
