<?php
include_once('../simple_html_dom.php');

$target = 'http://www.beritaterheboh.com';

$html = file_get_html($target);

$list = $html->find('[class="item-title"]');
foreach ( $list as $item ) {
    echo $item->outertext;
}

$html = file_get_html('http://www.beritaterheboh.com/2021/08/pengamat-ini-tuding-kasus-dinar-candy.html');
$nama = $html->find('.post-title');
$harga = $html->find('.post-body-inner');
$img = $html->find('img');
//$img = preg_match_all('/<img[^>]+>/i',$html, $result);
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
//foreach($img as $key => $value){
//    print_r($value->outertext);
//echo "/<br>";}
preg_match_all('/<img[^>]+>/i',$html, $result);
//print_r($result);
echo $result[0][5];
echo '</br>';
?>
</td>
