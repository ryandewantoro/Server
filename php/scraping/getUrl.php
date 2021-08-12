<?php
// example of how to use basic selector to retrieve HTML contents
include('../simple_html_dom.php');

// get DOM from URL or file
$html = file_get_html('http://192.168.62.206/tes/example/url.php');

// find all link
//foreach($html->find('a') as $e )
//echo $e->href . "</br><hr>";

// default
//foreach($html->find('a') as $e)
//    echo $e->href . '<br>';
//echo "<hr>";
// regex
preg_match_all('/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i',$html, $result);
$rand = rand(1, 7);
echo $result[0][$rand];
echo '</br>';
?>
