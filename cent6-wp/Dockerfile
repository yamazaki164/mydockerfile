FROM	centos:6.4
ADD	yum.mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN	echo "root:1234qwer" | chpasswd
RUN	useradd homepage
RUN	echo "homepage:1234qwer" | chpasswd
RUN	echo "NETWORKING=yes" >> /etc/sysconfig/network

RUN	rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN	yum install -y sudo openssh-server httpd MariaDB-server man wget telnet openssh-clients supervisor zip unzip 
RUN	yum install -y php php-mbstring php-gd php-fpm php-mcrypt php-pdo php-mysql php-xml php-pecl-apc
RUN	yum install -y phpMyAdmin

ADD	supervisord.conf /etc/supervisord.conf

WORKDIR	/home/homepage
RUN	wget http://ja.wordpress.org/latest-ja.tar.gz
RUN	tar zxf latest-ja.tar.gz
RUN	chown apache.apache wordpress && chmod -R g+w wordpress
RUN	chmod 755 /home/homepage

ADD	httpd/wordpress.conf /etc/httpd/conf.d/httpd-wordpress.conf
ADD	httpd/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf

WORKDIR	/root/
ADD	mysql-init.sql /root/mysql-init.sql
RUN	/etc/init.d/mysql start && sleep 15; mysql -u root < mysql-init.sql && rm mysql-init.sql

EXPOSE	22 80 443 3306
CMD	["/usr/bin/supervisord"]
