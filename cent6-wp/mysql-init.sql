SET NAMES utf8;

CREATE DATABASE wordpress DEFAULT CHARSET utf8;

GRANT ALL PRIVILEGES ON wordpress.* TO wordpress@localhost IDENTIFIED BY '1234qwer';

FLUSH PRIVILEGES;

