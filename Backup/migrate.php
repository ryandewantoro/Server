<?php

header("Content-type:application/json");

//koneksi ke database
$connection = mysqli_connect("localhost", "root", "4rt1s4n", "radius") or die("Error " . mysqli_error($connection));

//menampilkan data dari database, table tb_anggota
$sql = "select * from radcheck";
$result = mysqli_query($connection, $sql) or die("Error " . mysqli_error($connection));

//membuat array
while ($row = mysqli_fetch_assoc($result)) {
    $ArrAnggota[] = $row;
}

echo json_encode($ArrAnggota, JSON_PRETTY_PRINT);

//tutup koneksi ke database
mysqli_close($connection);
?>
