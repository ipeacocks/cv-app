# https://stackoverflow.com/a/40031181/2971192

FROM mariadb:latest

ENV MYSQL_ROOT_PASSWORD=my-secret-pw
ADD docker/mariadb/sqls/ /docker-entrypoint-initdb.d

EXPOSE 3306
