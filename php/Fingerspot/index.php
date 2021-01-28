<div class="container">
    <div class="row">
        <h3>Download Cecklog
            
        </h3>
<form action="" method='POST'>
	<div class="control-group">
		<label class="control-label" for="shift">Download Dari Mesin?</label>
		<div class="controls">
	     <select name="ip">
		<option value="192.168.16.100">mesin lokal</option>
			</select>
		</div>
	</div>

	<input type="hidden" name="key" size="5" value="0">
	<input type="Submit" name='Submit' value="Download">
</form>
<BR>

<?php
//echo $_POST['ip'];
if(isset($_POST['ip']) && isset($_POST['Submit'])){
	
	ini_set('max_execution_time', 600);
?>
	<table cellspacing="2" cellpadding="2" border="1">
		<tr align="center">
			<td><strong>UserID</strong></td>
			<td width="200"><strong>Tanggal & Jam</strong></td>
			<td><strong>Verifikasi</strong></td>
			<td><strong>Status</strong></td>
		</tr>
<?php
		$Connect = fsockopen($_POST['ip'], "80", $errno, $errstr, 1);
		if($Connect){
			$soap_request = '<GetAttLog><ArgComKey xsi:type="xsd:integer">'.
									$_POST['key']
									.'</ArgComKey><Arg><PIN xsi:type="xsd:integer">All</PIN></Arg></GetAttLog>';
			$newLine="\r\n";
			fputs($Connect, "POST /iWsService HTTP/1.0".$newLine);
			fputs($Connect, "Content-Type: text/xml".$newLine);
			fputs($Connect, "Content-Length: ".strlen($soap_request).$newLine.$newLine);
			fputs($Connect, $soap_request.$newLine);
			$buffer="";
			while($Response=fgets($Connect, 1024)){
				$buffer=$buffer.$Response;
			}
		}else{echo "Koneksi Gagal";}

		include("parse.php");
		$buffer=Parse_Data($buffer,"<GetAttLogResponse>","</GetAttLogResponse>");
		$buffer=explode("\r\n",$buffer);
		for($a=0;$a<count($buffer);$a++){
			$data=Parse_Data($buffer[$a],"<Row>","</Row>");
			$PIN=Parse_Data($data,"<PIN>","</PIN>");
			$DateTime=Parse_Data($data,"<DateTime>","</DateTime>");
			$Verified=Parse_Data($data,"<Verified>","</Verified>");
			$Status=Parse_Data($data,"<Status>","</Status>");
			if($PIN!=0){
				//$query = "INSERT INTO checkinout (userid,checktime, checktype) VALUES ('$PIN','$DateTime', '$Status')";
				//$hasil = mysql_query($query);
				echo "berhasil";
			}
?>
			<tr align="center">
				<td><?php echo $PIN;?></td>
				<td><?php echo $DateTime;?></td>
				<td><?php echo $Verified;?></td>
				<td><?php echo $Status;?></td>
			</tr>
<?php
		}
?>
	</table>
<?php
	
}
?>

</div>
</div>
