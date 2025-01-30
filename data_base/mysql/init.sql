CREATE USER 'docker_admin'@'%' IDENTIFIED BY 'd0ck3rp$$wrd';
CREATE DATABASE mydb;
GRANT ALL PRIVILEGES ON mydb.* TO 'docker_admin'@'%';
FLUSH PRIVILEGES;