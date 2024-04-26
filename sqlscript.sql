CREATE DATABASE mydatabase1;
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'testpwdd';
GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'localhost';
FLUSH PRIVILEGES;
Use mydatabase;
show tables;
CREATE TABLE TestTable(name varchar(20));
INSERT INTO TestTable(Name) VALUES ('Rahul2');
show tables;