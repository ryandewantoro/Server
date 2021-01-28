<?php
$url = 'http://localhost:8080/presensi/';
$res = file_get_contents($url);
?>
<form name="input" method="POST" action="db.php">
	<textarea name="data"><?php echo $res; ?></textarea>
	<input type="submit" value="Submit">
</form>
