<?php
$fp = fopen('php://input', 'r');
$data = stream_get_contents($fp);

//print_r($data);

if($data != ''){
    $data = json_decode($data, TRUE);
    $con = mysqli_connect("localhost","sdamadas_jurnal","udm#G%n~cZhH","sdamadas_jurnal");

	foreach($data as $d){
	    $nip = mysqli_real_escape_string($con, $d['nip']);
		$tanggal = mysqli_real_escape_string($con, $d['tanggal']);
		$jam = mysqli_real_escape_string($con, $d['jam']);
		$insert = mysqli_query($con, "insert into rb_absensi_gukar (nip, tanggal, jam, lokasi, alamat, jarak, status) values ('".$nip."', '".$tanggal."', '".$jam."','0' ,'sekolah' ,'0' ,'WFO' )");
	}
	
    print_r('{"status_code":200, "result":"Berhasil"}');
    exit;
}
print_r('{"status_code":500}');
?>
