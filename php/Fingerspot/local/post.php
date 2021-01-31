<?php
$url = 'http://localhost:8080/presensi/';
$res = file_get_contents($url);
?>
	<table>
                    <thead>
                      <tr>
                        <th style='width:40px'>No</th>
                        <th>pin</th>
                        <th>scan_date</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
				  $con = mysqli_connect("localhost:3309","root","putrisaljudan7kurcaci","presensi");
                    $tampil = mysqli_query($con,"SELECT * FROM att_log where status='1';");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    echo "<tr><td>$no</td>
                            <td>$r[pin]</td>
                            <td>$r[scan_date]</td>   
							<td><a href='post.php?update=$r[scan_date]'>update</a></td>  
                            </tr>";
                      $no++;
                      }
                      if (isset($_GET[update])){
                          mysql_query("UPDATE att_log SET status = 2 WHERE scan_date = '2020-04-16 20:34:37'");
						 // UPDATE att_log SET status='2' WHERE scan_date='$_GET[scan_date]'");
                          echo "<script>document.location='post.php';</script>";
                      }

                  ?>
                    </tbody>
                  </table>
<form name="input" method="POST" action="https://localhost/api/db.php">
	<textarea name="data"><?php echo $res; ?></textarea>
	<input type="submit" value="Submit">
</form>
