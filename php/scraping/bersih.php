<?php
include_once('../simple_html_dom.php');
$target = 'http://192.168.62.206/tes/example/url.php';
$html = file_get_html($target);

preg_match_all('/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i',$html, $result);
$rand = rand(1, 7);
$scraping =  $result[0][$rand];
$a = file_get_html($scraping);
$nama = $a->find('.post-title');
$harga = $a->find('.post-body-inner');
?>
<table>
<tr>
<th>Judul</th>
<th>Isi</th>
<th>Gambar</th>
</tr>
<td>
<?php
foreach ($nama as $key => $value) {
echo $value->plaintext;
echo "</br>";}
?>
</td>
<td>
<?php
foreach ($harga as $key => $value) {
echo $value->plaintext;
echo "</br>";}
?>
</td>
<td>
<?php
preg_match_all('/<img[^>]+>/i',$a, $img);
echo $img[0][5];
echo '</br>';
?>
</td>
