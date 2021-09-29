<?php
include_once('simple_html_dom.php');
$target = 'http://www.beritaterheboh.com';
$html = file_get_html($target);

// link url
$list = $html->find('[class="item-title"]');
foreach ( $list as $item ) {
    echo $item->outertext;
}
?>
