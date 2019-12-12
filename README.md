# MySQL + Java configuration

## MySQL 
MySQL server was installed
1. Start/Stop server MySQL : 

XAMPP control panel -> MySQL (Database Server) -> Start

OR

a) Windows
```
Open Run Window by Winkey + R
Type services.msc
Search MySQL service based on version installed.
Click stop, start or restart the service option
```
Or you can start/stop MySQL from the command prompt:
```
C:\> "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqld"
C:\> "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqladmin" -u root shutdown
```
Problems Starting the MySQL Server:
to check to mysql is running on:
```aidl
C:\>telnet localhost 3306
```
or export ports open and  find the mysqld.exe lines in "output.txt" file
```aidl
netstat -anob > output.txt
```
https://stackoverflow.com/questions/26970454/mysql-configuration-stops-at-starting-server

b) Linux

On Linux start/stop from the command line:
```
/etc/init.d/mysqld start 
/etc/init.d/mysqld stop 
/etc/init.d/mysqld restart
```
 
Some Linux flavours offer the service command too
```
service mysqld start 
service mysqld stop 
service mysqld restart
```
or
```
service mysql start
service mysql stop
service mysql restart
```
c) MAC
 start/stop/restart MySQL Server terminal.

For the version of MySQL older than 5.7:
```
sudo /usr/local/mysql/support-files/mysql.server start
sudo /usr/local/mysql/support-files/mysql.server stop
sudo /usr/local/mysql/support-files/mysql.server restart
```

For the MySQL version 5.7 and newer:
```
sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist
sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist
```

##MySQL Workbench

MySQL Workbench is a Visual database designing and modeling

2  Create your MySQL Server Connection: Click " +  " in MySQL Workbench Home Window

## Java JDBC 
Editor: IntelliJ IDEA was installed
3

New Project -> Java ->Create project from template
Project name : CursMySQL
Base package : cursmysql

4

Support for MySQL
File->Settings -> Plugins - > Database Navigator
Restart
View->Tool windows->DB Browser

5

jdbc  = Java DataBase Connector

Download:
https://dev.mysql.com/downloads/connector/j/5.1.html

Unzip

Editor:
File->Project Structure ->Libraris  + ADD driver mysql .jar

View import in the  External Libraries

6

We are developing the application