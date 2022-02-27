create database agroget;
use agroget;
create table farmer_info_tbl (farmer_id int not null auto_increment,
farmer_fname varchar(20) not null,farmer_lname varchar(20) not null,
farmer_mobile varchar(10) not null,farmer_email varchar(50) not null,
farmer_username varchar(50) not null,
farmer_password varchar(50) not null,farmer_address varchar(100) not null,
farmer_pincode varchar(6) not null,
farmer_kissan_card_id int, 
primary key (farmer_id), 
unique (farmer_email),
unique (farmer_mobile));

create table image_info_tbl(image_id int not null auto_increment,image_type varchar(255),
image_reference_id int,image_data longblob,
image_description varchar(50),
primary key(image_id),
foreign key(image_reference_id) references farmer_info_tbl(farmer_id));

alter table farmer_info_tbl add 
foreign key(farmer_kissan_card_id) 
references image_info_tbl(image_id);


create table renter_info_tbl(
renter_id int not null auto_increment, renter_fname varchar(20) not null,
renter_lname varchar(20) not null,
renter_mobile varchar(10) not null,renter_email varchar(20) not null,
renter_username varchar(50) not null,renter_password varchar(20) not null,
renter_address varchar(100) not null,renter_shop_details varchar(100) not null,
renter_shop_image_id int not null,
renter_is_approved tinyint(1) not null,
primary key (renter_id),
unique (renter_email),
unique (renter_mobile),
foreign key(renter_shop_image_id) references image_info_tbl(image_id)
);

create table equipment_info_tbl(equipment_id int not null auto_increment,equipment_name varchar(20) not null,
equipment_type varchar(20) not null,equipment_rate_type varchar(10) not null,
equipment_rate varchar(20) not null,
equipment_deacription varchar(255),equipment_status tinyint(1) not null,
renter_id int, 
primary key(equipment_id) ,
foreign key(renter_id) references renter_info_tbl(renter_id));

alter table image_info_tbl add 
foreign key(image_reference_id) 
references renter_info_tbl(renter_id);

alter table image_info_tbl add 
foreign key(image_reference_id) 
references equipment_info_tbl(equipment_id);

create table order_info_tbl(order_id int not null auto_increment,farmer_id int not null,
order_total_cost double ,order_status tinyint(1),
order_date date not null,
primary key(order_id),
foreign key(farmer_id) references farmer_info_tbl(farmer_id)
);

create table order_equipment_tbl(order_equipment_id int not null auto_increment,
orderid int not null,equipment_id int not null,from_date date not null,
from_time time,to_date date,to_time time,
order_equipment_status tinyint(1) not null,
service_address varchar(100) not null,
order_id int,
primary key(order_equipment_id),
foreign key(order_id) references order_info_tbl(order_id),
foreign key(equipment_id) references equipment_info_tbl(equipment_id)
);

create table feedback_info_tbl(feedback_id int not null auto_increment,
farmer_id int not null,
equipment_id int not null,feedback_rating int,
feedback_comments varchar(100),
primary key(feedback_id),
foreign key(farmer_id) references farmer_info_tbl(farmer_id),
foreign key(equipment_id) references equipment_info_tbl(equipment_id)
);







