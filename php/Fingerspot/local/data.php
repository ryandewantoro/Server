<?php
header('Content-Type: application/json');
$con = mysqli_connect("localhost:3309","root","","fin_pro");
$response =array();
if($con){
    $sql ="select * from att_log";
    $result = mysqli_query($con,$sql);

   if($result){
        $i=0;
        while($row = mysqli_fetch_assoc($result)){
            $response[$i]['tanggal'] = date('Y-m-d', strtotime($row['scan_date']));
			$response[$i]['jam'] = date('H:i:s', strtotime($row['scan_date']));
            $response[$i]['nip'] = $row ['pin'];
            $i++;
        }
        echo json_encode($response,JSON_PRETTY_PRINT);
    }
	
}	
else{
    echo "database failed";
}
?>
