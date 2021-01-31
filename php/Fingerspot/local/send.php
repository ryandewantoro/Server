<?php 
$con = mysqli_connect("localhost:3309","root","putrisaljudan7kurcaci","presensi");
$tampil = mysqli_query($con,"SELECT * FROM att_log where status='1';");
$data = array();
while($r=mysqli_fetch_array($tampil)){
	$tgljm = explode(" ",$r['scan_date']);
	array_push($data, array(
			'tanggal'=> $tgljm[0],
			'jam' => $tgljm[1],
			'nip' => $r['pin']
		)
	);
	// update status
	mysqli_query($con,"UPDATE att_log set status='2' where scan_date='".$r['scan_date']."'");
}
// send json
$json = json_encode($data);
//echo $json.'<br><br>Response: ';

function cpost($url = '', $data = '')
{
	// $url = 'https://jurnal.sdamada.sch.id/api/post.php';
	// $data = '{"name": "linuxize", "email": "linuxize@example.com"}';
	//$data = array(1, 2, 3, 4, 5);
	$curl = curl_init();
	
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($curl, CURLOPT_POST, 1);
	curl_setopt($curl, CURLOPT_POSTFIELDS, $data);

	curl_setopt($curl, CURLOPT_URL, $url);
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);

	$result = curl_exec($curl);
	curl_close($curl);
	$res = json_decode($result, true);
	return $res;
}
$res = cpost('https://localhost/api/finger.php', $json);
//$res = cpost('http://192.168.77.8/res.php', $json);
print_r($res);
?>
