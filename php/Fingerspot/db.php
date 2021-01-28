<?php
$con = mysqli_connect("localhost:3309","root","putrisaljudan7kurcaci","presensi");
$insert = mysqli_query($con, "insert into terima (nip, tanggal, jam) values ('".$data['nip']."', '".$data['tanggal']."', '".$data['jam']."')");


if(isset($_POST['data'])){
	
	$data = json_decode($_POST['data'], TRUE);
	$file = fopen('debug.txt', 'a+');
	foreach($data as $d){
		$nip = mysqli_real_escape_string($con, $d['nip']);
		$insert = mysqli_query($con, "insert into terima (nip, tanggal, jam) values ('".$data['nip']."', '".$data['tanggal']."', '".$data['jam']."')");
	}

}
?>
