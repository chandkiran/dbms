CREATE DATABASE gharmadb
CREATE TABLE tb_ghar(
name varchar(255) ,
ID int PRIMARY KEY NOT NULL,
members int NOT NULL,
address varchar(255)
);
INSERT INTO tb_ghar (name,ID,members,address)
VALUES
('kiran',23,4,'Kathmandu'),
('Aman',23,4,'Kanchanpur'),
('Hari',23,4,'baitadi'),
('Ram',23,4,'Pokhara'),
('Shyam',23,4,'lalitpur'),
('Ashish',23,4,'Bhaktapur');

DROP TABLE tb_ghar
SELECT * FROM tb_ghar