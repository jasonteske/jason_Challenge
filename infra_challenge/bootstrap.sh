#!/bin/bash
yum update -y
yum install httpd.x86_64 -y
systemctl start httpd
systemctl enable httpd
sudo touch /etc/httpd/conf.d/jasonteske.com.conf
echo '<html>' >> /var/www/html/index.html
echo '<head>'  >> /var/www/html/index.html
echo '<title>Hello World</title>' >> /var/www/html/index.html
echo '</head>' >> /var/www/html/index.html
echo '<body>' >> /var/www/html/index.html
echo '<h1>Hello World!</h1>' >> /var/www/html/index.html
echo '</body>' >> /var/www/html/index.html
echo '</html>' >> /var/www/html/index.html
echo '<VirtualHost *:80>' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerAdmin me@jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerName jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerAlias www.jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  DocumentRoot /var/www/html' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ErrorLog ${APACHE_LOG_DIR}/error.log' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  RewriteEngine on' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  RewriteRule ^/(.*) https://%{HTTP_HOST}/$1 [R,L]' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '</VirtualHost>' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '<VirtualHost *:443>' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerAdmin me@jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerName jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerAlias www.jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  DocumentRoot /var/www/html' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ErrorLog ${APACHE_LOG_DIR}/error.log' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '</VirtualHost>' >> /etc/httpd/conf.d/jasonteske.com.conf
