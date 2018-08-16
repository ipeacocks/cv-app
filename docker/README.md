### Docker

Login to Docker Hub:
```
$ sudo docker login
```
Go to root dir of this repo, build and push images to Docker Hub:
```
$ sudo docker build -t cv-mariadb -f docker/mariadb/Dockerfile .
$ sudo docker tag cv-mariadb your_account/cv-mariadb
$ sudo docker push your_account/cv-mariadb
```
Where **your_account** is your account on Docker Hub.
```
$ sudo docker build -t cv-uwsgi -f docker/uwsgi/Dockerfile .
$ sudo docker tag cv-uwsgi your_account/cv-uwsgi
$ sudo docker push your_account/cv-uwsgi
```
```
$ sudo docker build -t cv-nginx -f docker/nginx/Dockerfile .
$ sudo docker tag cv-nginx your_account/cv-nginx
$ sudo docker push your_account/cv-nginx
```
All prebuilt images you can find there:

https://hub.docker.com/r/ipeacocks/cv-mariadb/    
https://hub.docker.com/r/ipeacocks/cv-uwsgi/    
https://hub.docker.com/r/ipeacocks/cv-nginx/    
