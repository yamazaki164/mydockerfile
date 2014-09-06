FROM	ubuntu:latest

RUN     echo "root:1234qwer" | chpasswd
RUN     useradd -d /home/homepage -m -s /bin/bash homepage
RUN     echo "homepage:1234qwer" | chpasswd

RUN	apt-get update
RUN	apt-get install -y supervisor openssh-server openssh-client openssh-sftp-server sudo man git-sh 
RUN	apt-get install -y llvm-dev clang openssl libssl-dev make sqlite3 mariadb-server mariadb-client libsqlite3-dev

ADD	service.conf /etc/supervisor/conf.d/service.conf
RUN	sed -i '/\[supervisord\]/a\nodaemon=true' /etc/supervisor/supervisord.conf

WORKDIR	/home/homepage
RUN	git clone https://github.com/sstephenson/rbenv.git .rbenv
RUN	git clone https://github.com/sstephenson/ruby-build.git .rbenv/plugins/ruby-build
RUN	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> .bashrc
RUN	echo 'eval "$(rbenv init -)"' >> .bashrc

ENV	HOME	/home/homepage
ENV	PATH	$HOME/.rbenv/bin:$PATH
RUN	rbenv install 2.1.2
RUN	chown -R homepage:homepage .rbenv

ENV	HOME	/root
WORKDIR	/root

CMD	["/usr/bin/supervisord"]
