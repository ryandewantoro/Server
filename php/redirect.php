<?php
//203.130.237.20
//echo $_SERVER['HTTP_HOST'].'||'.$_SERVER['HTTP_HOST'];
if ($_SERVER['HTTP_HOST']!='ais.umsida.ac.id') {//$_SERVER['HTTP_HOST']!='203.130.237.20' || $_SERVER['HTTP_HOST']=='203.130.237.20'
    header($_SERVER['SERVER_PROTOCOL'].' 400 Bad Request');
    echo 'Error 400 Bad Request';
    exit;
}
?>
