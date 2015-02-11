FROM	centos:latest
ENV	dockeruser	ec2-user

RUN	echo "root:1234qwer" | chpasswd
RUN	useradd $dockeruser
RUN	echo "$dockeruser:1234qwer" | chpasswd

RUN	rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN	yum install -y sudo openssh-server man wget telnet openssh-clients supervisor zip unzip redis gcc gcc-c++ make zlib libyaml-devel nodejs tar openssl-devel git bzip2 patch libxml2-devel libxslt-devel sqlite-devel readline-devel bzip2-devel 

RUN	cp -p /usr/share/zoneinfo/Japan /etc/localtime

ADD	pyenv.sh	/etc/profile.d/pyenv.sh
ENV	PYENV_ROOT	/opt/pyenv
RUN	git clone https://github.com/yyuu/pyenv.git /opt/pyenv

RUN	/opt/pyenv/bin/pyenv install 2.7.7
RUN	/opt/pyenv/bin/pyenv global 2.7.7
RUN	/opt/pyenv/bin/pyenv rehash
RUN	/opt/pyenv/shims/pip install gunicorn
RUN	/opt/pyenv/shims/pip install bottle

RUN	/opt/pyenv/bin/pyenv install 3.4.2
RUN	/opt/pyenv/bin/pyenv global 3.4.2
RUN	/opt/pyenv/bin/pyenv rehash
RUN	/opt/pyenv/shims/pip install gunicorn
RUN	/opt/pyenv/shims/pip install bottle

USER	ec2-user
WORKDIR	/home/ec2-user
