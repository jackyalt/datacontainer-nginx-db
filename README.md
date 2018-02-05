# datacontainer-nginx-db
#### This repository contains the wordpress installation and a mapping of the /usr/share/nginx/html and /var/lib/mysql directories
## Docker run example:
docker create -v /var/lib/mysql -v /var/www/html --network exnet2 --name datacontainer jackyalt/datacontainer-nginx-db

## Before installing WordPress, you must have a database installed
#### Example:
docker run --name db -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE1=wordpress -e MYSQL_USER1=wpress -e MYSQL_PASSWORD1=wpress orboan/dcsss-mariadb

## You can use the following script
#### This script creates a network for the containers and a datacontainer to map the mysql and nginx directories. And run the containers of nginx and mariadb

docker network create exnet3

docker create -v /var/lib/mysql -v /usr/share/nginx/html --network exnet3 --name datacontainer jackyalt/datacontainer-nginx-db

docker run -d -p 8080:80 --volumes-from datacontainer --network exnet3 --name nginx-php wyveo/nginx-php-fpm 

docker run --name db -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE1=wordpress -e MYSQL_USER1=wpress -e MYSQL_PASSWORD1=wpress --network exnet2 --volumes-from datacontainer orboan/dcsss-mariadb

