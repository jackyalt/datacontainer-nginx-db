FROM centos
RUN groupadd -g 101 nginx 
RUN useradd -u 101 -g 101 nginx 
RUN cd /usr/share && \
mkdir nginx && \
cd nginx && \
mkdir html
RUN cd /var && \
cd lib && \
mkdir myqsl
RUN yum install wget -y
RUN \
cd /usr/share/nginx/html && \
wget https://wordpress.org/latest.tar.gz && \
tar -xvf latest.tar.gz && \
rm -f latest.tar.gz && \
cp -R -f /usr/share/nginx/html/wordpress/* /usr/share/nginx/html && \
rm -rf wordpress/ && \
chown -R nginx:nginx . && \
chmod -R 755 .

