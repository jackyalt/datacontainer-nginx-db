docker network create exnet3

docker create -v /var/lib/mysql -v /usr/share/nginx/html --network exnet3 --name datacontainer jackyalt/datacontainer-nginx-db 

docker run --name db -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE1=wordpress -e MYSQL_USER1=wpress -e MYSQL_PASSWORD1=wpress --network exnet3 --volumes-from datacontainer orboan/dcsss-mariadb

docker run -d -p 8080:80 --network exnet3 --volumes-from datacontainer --name nginx-php wyveo/nginx-php-fpm 
