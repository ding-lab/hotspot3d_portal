# Instructions to run
## Client Dependencies
### install virtualbox 4.3

	wget http://download.virtualbox.org/virtualbox/4.3.16/virtualbox-4.3_4.3.16-95972~Ubuntu~lucid_amd64.deb
	sudo dpkg -i virtualbox-4.3_4.3.16-95972~Ubuntu~lucid_amd64.deb

manually install ubuntu virtual machine ( ubuntu-14.04.1-desktop-amd64.iso ) 
install vim and do some necessary configuration steps

## Server Dependencies
## install a few of dependencies 

### install gcc

	sudo apt-get install build-essential

### install make

	sudo apt-get install make

### install Apache Tomcat 7 on ubuntu 14.04 

	sudo apt-get update

	sudo apt-get install tomcat7

#### Apache Tomcat Tools - optional 

	sudo apt-get install tomcat7-docs tomcat7-admin tomcat7-examples

#### Install Java Development Kit (Optional)

	sudo apt-get install default-jdk

### install ant and git 
In addition to JDK, the Tomcat documentation suggests also installing Apache Ant, which is used to build Java applications, and a source control system, such as git. Let's install both of those with the following command

	sudo apt-get install ant git

### install mysql server 5.6 
#### Note: set your root pass for mysql

	sudo apt-get install mysql-server-5.6

download mysql-connector-java-5.1.32.tar.gz for mysql connector 
http://dev.mysql.com/downloads/connector/j/5.1.html

## Setup portal & database
#### Note: currently jsmol fils have been integrated into hotspot3d_port repo

### install maven for package

	sudo apt-get install maven2

### clone hotspot3d_portal 

	git clone https://github.com/ding-lab/hotspot3d_portal.git
	cd hotspot3d_portal
	mvn package
	cp -r target/HotSpot3D /var/lib/tomcat7/webapps

### mysql database import using 3d_proximity databse identified by 'YouChoose'

	mysql -u root -p
	mysql> create database 3d_proximity;
	mysql> CREATE USER '3d_proximity'@'localhost' IDENTIFIED BY 'YouChoose';
	mysql> GRANT ALL PRIVILEGES ON 3d_proximity . * TO '3d_proximity'@'localhost';

### import 3d_proximity data into database 

	mysql -u root -p < src/main/config/mysql/3d_proximity.sql 

#### Note:  you can update the latest mysql data using mysqldump
