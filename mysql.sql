use test;
create table user(
    id int not null primary key auto_increment,  
    username varchar(100) not null,  
    password varchar(100) not null   
) ENGINE=InnoDB DEFAULT CHARSET=utf8;  
