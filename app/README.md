## CV app

This directory contains simple CV app.

Written on:

* Bootstrap 4
* Python 3
* Flask Framework
* SQLAlchemy
* MariaDB

## Local Installation

Install MariaDB:
```
# docker run --detach --name mariadb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:latest
# apt-get install libmysqlclient-dev
```
Create user/password for my cv app:
```
$ mysql -uroot -h127.0.0.1 -pmy-secret-pw
```
```
> create database my_cv_db;
> grant all privileges on my_cv_db.* to 'my_cv_user'@'%' IDENTIFIED BY 'my-secret-pw' with grant option;
> flush privileges;
```
Then clone this code:
```
$ git clone git@github.com:ipeacocks/cv-task.git
```
Simply create virtualenv:
```
$ cd cv-task/app
$ virtualenv --no-site-packages env
```
Activate virtual env:
```
$ source env/bin/activate
```
**Make sure that virtualenv created env with `python3`.**    
That's almost it. Use `requirements.txt` to setup all python dependencies:
```
$ pip install -r project/requirements.txt
```
Point `cv-mariadb.my-zone` to `127.0.0.1` in `/etc/hosts`:
```
$ cat /etc/hosts
...
127.0.0.1       localhost cv-mariadb.my-zone
```
Create new user/db and import basic data:
```
$ python project/db_create.py
```
And finally launch:
```
$ python project/run.py
```
`project/db_create.py` file uses SQLAlchemy library for data populating of DB. So you can add new data there, launch this script for uploading it to MySQL and after you have to upload new dump to `../docker/mariadb/sqls/populate_data.sql`:
```
$ python project/db_create.py
$ mysqldump -umy_cv_user -pmy-secret-pw -B my_cv_db -h127.0.0.1 > ../docker/mariadb/sqls/populate_data.sql
```
Then rebuild and push newer image from root directory of this repo:
```
$ sudo docker build -t cv-mariadb -f docker/mariadb/Dockerfile .
$ sudo docker tag cv-mariadb your_account/cv-mariadb
$ sudo docker push your_account/cv-mariadb
```
Recreate `cv-mariadb` AWS service from console.

Probably useful links:    
https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-ubuntu-16-04    
https://stackoverflow.com/questions/27766794/switching-from-sqlite-to-mysql-with-flask-sqlalchemy    
https://medium.com/@greut/minimal-python-deployment-on-docker-with-uwsgi-bc5aa89b3d35    

