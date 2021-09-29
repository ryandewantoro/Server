<?php
include_once('simple_html_dom.php');
$target = 'http://192.168.62.206/berita/url.php';
$html = file_get_html($target);
preg_match_all('/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i',$html, $result);
$rand = rand(1, 7);
$scraping =  $result[0][$rand];
$a = file_get_html($scraping);
$nama = $a->find('.post-title');
$harga = $a->find('.post-body-inner');

foreach ($nama as $key => $value) {
$judulx =  $value->plaintext;}

foreach ($harga as $key => $value) {
$isix =  $value->plaintext;}

$servername = "localhost";
$username = "ryan";
$password = "ryan";
$dbname = "laravel";
$conn = mysqli_connect($servername, $username, $password, $dbname);
$datenow = date("Y/m/d");
$bb = implode(" ",$gambar);
$content = str_replace("&nbsp;", "", $isix);
$cek = mysqli_num_rows (mysqli_query($conn, "SELECT judul FROM berita WHERE judul='$judulx'"));
if($cek > 0) {
        echo "dobel";
      header("refresh: 3");
    }
    else{

$b = file_get_contents($scraping);
$dom = new DOMDocument(); @$dom->loadHTML($b);
$xpath = new DOMXPath($dom);
$images = $xpath->query('//img/@src');
$img = array(); foreach ($images as $image) {
    $img[] = $image->nodeValue;
}
$gambar = $img[5];
$rrr = rand(10,100);
$file = uniqid(rand(), true) . '.png';
file_put_contents($file, file_get_contents($gambar));
}
$content = str_replace("&nbsp;", "", $isix);
$cek = mysqli_num_rows (mysqli_query($conn, "SELECT judul FROM berita WHERE judul='$judulx'"));
if($cek > 0) {
      header("refresh: 3");
    }
    else{

$sql = "INSERT INTO berita (url, judul, isi, gambar, tgl)
VALUES ('$scraping', '$judulx', '$content', '$file', '$datenow')";
if (mysqli_query($conn, $sql)) {
  echo "berhasil";
header("refresh: 3");
} else {
  echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
mysqli_close($conn);
}
?>
