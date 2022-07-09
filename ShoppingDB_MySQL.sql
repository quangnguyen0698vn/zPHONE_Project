drop database if EXISTS ShoppingDB;
create database ShoppingDB;
 
USE `ShoppingDB`;

CREATE TABLE Account(
	`user_email` varchar(100) NOT NULL,
	`password` varchar(64) NOT NULL,
	`account_role` int NOT NULL,
	`user_name` varchar(50) NULL,
	`user_address` varchar(255) NULL,
	`user_phone` varchar(10) NULL,
	PRIMARY KEY 
	(
		`user_email` ASC
	) 
);

CREATE TABLE Product(
	`product_id` int AUTO_INCREMENT NOT NULL,
	`product_name` varchar(100) NOT NULL,
	`product_des` text(65535) NULL,
	`product_price` Decimal(12,2) NOT NULL,
	`product_img_source` varchar(255) NULL,
	`product_type` varchar(100) NULL,
	`product_brand` varchar(100) NULL,
	PRIMARY KEY 
	(
		`product_id` ASC
	) 
);

CREATE TABLE `Order`(
	`user_email` varchar(100) NULL,
	`order_id` int AUTO_INCREMENT NOT NULL,
	`order_status` int NULL,
	`order_date` datetime NOT NULL DEFAULT now(),
	`order_discount_code` varchar(8) NULL,
	`order_address` varchar(255) NOT NULL,
	PRIMARY KEY 
	(
		`order_id` ASC
	) 
);

DELIMITER //
create procedure GetProductsWithBrand (
		IN p_u int,
		IN p_v int,
		IN p_b varchar(50)
    )
begin
	SELECT p2.product_id, p2.product_name, p2.product_des, p2.product_price, p2.product_img_source, p2.product_type, p2.product_brand 
	FROM ( 
		SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as theRow 
		FROM Product p 
		WHERE p.product_brand = p_b
	) p2 
	WHERE (p2.theRow >= p_u) and (p2.theRow <= p_v);
end//
DELIMITER ;

DELIMITER //
create procedure GetProductsType (
		IN p_u int,
		IN p_v int,
		IN p_b varchar(50)
    )
begin
	SELECT p2.product_id, p2.product_name, p2.product_des, p2.product_price, p2.product_img_source, p2.product_type, p2.product_brand 
	FROM ( 
		SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as theRow 
		FROM Product p 
		WHERE p.product_type = p_b
	) p2 
	WHERE (p2.theRow >= p_u) and (p2.theRow <= p_v);
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS GetProducts;
delimiter //
create procedure GetProducts (
	p_u int,
	p_v int)
begin
	SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand FROM ( 
		SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as theRow 
		FROM Product p
	) p WHERE p.theRow >= p_u and p.theRow <= p_v;
end//
delimiter ;

DROP PROCEDURE IF EXISTS SearchProducts;
delimiter //
create procedure SearchProducts (
	p_u int,
	p_v int,
    keyword varchar(100) )
begin
	SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand FROM ( 
		SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as theRow 
		FROM Product p
        WHERE p.product_name like concat('%',keyword,'%')
	) p WHERE p.theRow >= p_u and p.theRow <= p_v;
end//
delimiter ;

DROP PROCEDURE IF EXISTS SearchProductsWithBrand;
delimiter //
create procedure SearchProductsWithBrand (
	p_u int,
	p_v int,
    keyword varchar(100),
    brand varchar(100) )
begin
	SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand FROM ( 
		SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as theRow 
		FROM Product p
        WHERE p.product_name like concat('%',keyword,'%') AND p.product_brand = brand
	) p WHERE p.theRow >= p_u and p.theRow <= p_v;
end//
delimiter ;

CREATE TABLE OrderDetail(
	`order_id` int NOT NULL,
	`product_id` int NOT NULL,
	`product_quantity` int NULL,
	`unit_price` Decimal(12,2) NULL,
	PRIMARY KEY 
	(
		`order_id` ASC,
		`product_id` ASC
	) 
);

ALTER TABLE OrderDetail  ADD FOREIGN KEY(`order_id`)
REFERENCES `Order`(`order_id`);

ALTER TABLE OrderDetail  ADD FOREIGN KEY(`product_id`)
REFERENCES Product (`product_id`);

SET FOREIGN_KEY_CHECKS = 0;
truncate table Product;
SET FOREIGN_KEY_CHECKS = 1;


-- Product table

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 11 Pro Max 512GB',N'Màn hình: 6.5", Super Retina XDR
HĐH: iOS 13
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',43.990,'https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-600x600.jpg','cellphone','apple');

insert into  Product(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 11 Pro Max 256GB',N'Màn hình: 6.5", Super Retina XDR
HĐH: iOS 13
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',37.990,'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg','cellphone',
'apple');

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xs Max 256GB',N'Màn hình: 6.5", Super Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 4 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',32.990,'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-600x600.jpg','cellphone',
'apple');

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone X 256GB',N'Màn hình: 5.8", Super Retina
HĐH: iOS 12
CPU: Apple A11 Bionic 6 nhân
RAM: 3 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',27.990,'https://cdn.tgdd.vn/Products/Images/42/190324/iphone-xs-256gb-white-600x600.jpg','cellphone',
'apple');

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xs 64GB',N'Màn hình: 5.8", Super Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 4 GB, ROM: 64 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',24.990,'https://cdn.tgdd.vn/Products/Images/42/190321/iphone-xs-max-gold-600x600.jpg','cellphone',
'apple');

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xr 128GB',N'Màn hình: 6.1", Liquid Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 3 GB, ROM: 128 GB
Camera: 12 MP, Selfie: 7 MP',17.990,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone',
'apple');

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xr 128GB',N'Màn hình: 6.1", Liquid Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 3 GB, ROM: 128 GB
Camera: 12 MP, Selfie: 7 MP',17.990,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone',
'apple');

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 8 Plus 64GB',N'Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A11 Bionic 6 nhân
RAM: 3 GB, ROM: 64 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',16.590,'https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-hh-600x600.jpg','cellphone',
'apple');

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 7 Plus 32GB',N'Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A10 Fusion 4 nhân 64-bit
RAM: 3 GB, ROM: 32 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',12.490,'https://cdn.tgdd.vn/Products/Images/42/78124/iphone-7-plus-32gb-gold-600x600.jpg','cellphone',
'apple');

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 7 32GB',N'Màn hình: 4.7", Retina HD
HĐH: iOS 12
CPU: Apple A10 Fusion 4 nhân 64-bit
RAM: 2 GB, ROM: 32 GB
Camera: 12 MP, Selfie: 7 MP',10.490,'https://cdn.tgdd.vn/Products/Images/42/74110/iphone-7-gold-600x600.jpg','cellphone',
'apple'); 

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand) values
('Xiaomi Redmi Note 10 Pro (8GB/128GB)','Màn hình:  AMOLED6.67"Full HD+ 
Hệ điều hành:  Android 11 
Camera sau:  Chính 108 MP & Phụ 8 MP, 5 MP, 2 MP 
Camera trước:  16 MP 
Chip:  Snapdragon 732G 
RAM:  8 GB Bộ nhớ trong:  128 GB 
SIM:  2 Nano SIM Hỗ trợ 4G 
Pin, Sạc:  5020 mAh33 W',320.39,'https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro-thumb-xam-600x600-600x600.jpg','cellphone', 'xiaomi')
,('Xiaomi 11T 5G 256GB ','Màn hình:  AMOLED6.67"Full HD+ 
Hệ điều hành:  Android 11 
Camera sau:  Chính 108 MP & Phụ 8 MP, 5 MP 
Camera trước:  16 MP 
Chip:  MediaTek Dimensity 1200 
RAM:  8 GB 
Bộ nhớ trong:  256 GB 
SIM:  2 Nano SIM Hỗ trợ 5G 
Pin, Sạc:  5000 mAh67 W',513.26,'https://cdn.tgdd.vn/Products/Images/42/251216/Xiaomi-11T-Grey-600x600.jpg','cellphone', 'xiaomi')
,('Xiaomi Redmi 9C (4GB/128GB)','Màn hình:  IPS LCD6.53"HD+ 
Hệ điều hành:  Android 10 
Camera sau:  Chính 13 MP & Phụ 2 MP, 2 MP 
Camera trước:  5 MP 
Chip:  MediaTek Helio G35 
RAM:  4 GB 
Bộ nhớ trong:  128 GB 
SIM:  2 Nano SIM Hỗ trợ 4G 
Pin, Sạc:  5000 mAh10 W',149.29,'https://cdn.tgdd.vn/Products/Images/42/246937/xiaomi-redmi-9c-4gb-cam-1-600x600.jpg','cellphone', 'xiaomi')
,('Xiaomi Redmi 9A','Màn hình:  IPS LCD6.53"HD+ 
Hệ điều hành:  Android 10 
Camera sau:  13 MP 
Camera trước:  5 MP 
Chip:  MediaTek Helio G25
RAM:  2 GB 
Bộ nhớ trong:  32 GB
SIM:  2 Nano SIM Hỗ trợ 4G 
Pin, Sạc:  5000 mAh10 W',106.51,'https://cdn.tgdd.vn/Products/Images/42/218734/xiaomi-redmi-9a-grey-600x600-1-600x600.jpg','cellphone', 'xiaomi')
,('Xiaomi Redmi 10C 128GB','Màn hình:  IPS LCD6.71"HD+
Hệ điều hành:  Android 11
Camera sau:  Chính 50 MP & Phụ 2 MP
Camera trước:  5 MP
Chip:  Snapdragon 680 8 nhân
RAM:  4 GB
Bộ nhớ trong:  128 GB 
SIM:  2 Nano SIMHỗ trợ 4G 
Pin, Sạc:  5000 mAh18 W',157.84,'https://cdn.tgdd.vn/Products/Images/42/275155/xiaomi-redmi-10c-%C4%91en-thumb-600x600.jpg','cellphone', 'xiaomi')
,('Xiaomi 11 Lite 5G NE','Màn hình:  AMOLED6.55"Full HD+
Hệ điều hành:  Android 11
Camera sau:  Chính 64 MP & Phụ 8 MP, 5 MP
Camera trước:  20 MP
Chip:  Snapdragon 778G 5G 8 nhân
RAM:  8 GB
Bộ nhớ trong:  128 GB 
SIM:  2 Nano SIM (SIM 2 chung khe thẻ nhớ) Hỗ trợ 5G 
Pin, Sạc:  4250 mAh33 W',405.94,'https://cdn.tgdd.vn/Products/Images/42/249427/xiaomi-11-lite-5g-ne-pink-600x600.jpg','cellphone', 'xiaomi')
,('Xiaomi Redmi Note 11 Pro 5G','Màn hình:  AMOLED6.67"Full HD+
Hệ điều hành:  Android 11
Camera sau:  Chính 108 MP & Phụ 8 MP, 2 MP
Camera trước:  16 MP
Chip:  Snapdragon 695 5G 8 nhân
RAM:  8 GB
Bộ nhớ trong:  128 GB 
SIM:  2 Nano SIM (SIM 2 chung khe thẻ nhớ) Hỗ trợ 5G 
Pin, Sạc:  5000 mAh67 W',384.55,'https://cdn.tgdd.vn/Products/Images/42/246640/TimerThumb/xiaomi-redmi-note-11-pro-5g-(4).jpg','cellphone', 'xiaomi')
,('Xiaomi Redmi 10C 128GB','Màn hình:  IPS LCD6.71"HD+
Hệ điều hành:  Android 11
Camera sau:  Chính 50 MP & Phụ 2 MP
Camera trước:  5 MP
Chip:  Snapdragon 680 8 nhân
RAM:  4 GB
Bộ nhớ trong:  128 GB 
SIM:  2 Nano SIM Hỗ trợ 4G 
Pin, Sạc:  5000 mAh18 W',157.84,'https://cdn.tgdd.vn/Products/Images/42/275155/xiaomi-redmi-10c-%C4%91en-thumb-600x600.jpg','cellphone', 'xiaomi')
,('Xiaomi 11 Lite 5G NE','Màn hình:  AMOLED6.55"Full HD+
Hệ điều hành:  Android 11
Camera sau:  Chính 64 MP & Phụ 8 MP, 5 MP
Camera trước:  20 MP
Chip:  Snapdragon 778G 5G 8 nhân
RAM:  8 GB
Bộ nhớ trong:  128 GB 
SIM:  2 Nano SIM (SIM 2 chung khe thẻ nhớ) Hỗ trợ 5G 
Pin, Sạc:  4250 mAh33 W',405.94,'https://cdn.tgdd.vn/Products/Images/42/249427/xiaomi-11-lite-5g-ne-pink-600x600.jpg','cellphone', 'xiaomi')
,('Xiaomi Redmi Note 11 Pro 5G','Màn hình:  AMOLED6.67"Full HD+
Hệ điều hành:  Android 11
Camera sau:  Chính 108 MP & Phụ 8 MP, 2 MP
Camera trước:  16 MP
Chip:  Snapdragon 695 5G 8 nhân
RAM:  8 GB
Bộ nhớ trong:  128 GB 
SIM:  2 Nano SIM (SIM 2 chung khe thẻ nhớ) Hỗ trợ 5G 
Pin, Sạc:  5000 mAh67 W',384.55,'https://cdn.tgdd.vn/Products/Images/42/246640/TimerThumb/xiaomi-redmi-note-11-pro-5g-(4).jpg','cellphone', 'xiaomi');

-- samsung

insert into Product(product_name,product_des,product_price,product_img_source,product_type,product_brand) values
('Samsung Galaxy S22 Ultra 5G 128GB','Màn hình 6.8", 
Chip Snapdragon 8 Gen 1 8 nhân  
RAM 8 GB, ROM 128 GB  
Camera sau: Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP  
Camera trước: 40 MP  
Pin 5000 mAh, Sạc 45 W',320.39,'https://cdn.tgdd.vn/Products/Images/42/235838/Galaxy-S22-Ultra-Burgundy-600x600.jpg','cellphone', 'samsung')
,('Samsung Galaxy A03 3GB','Màn hình 6.5", 
Chip Unisoc T606 8 nhân  
RAM 3 GB, ROM 32 GB  
Camera sau: Chính 48 MP & Phụ 2 MP  
Camera trước: 5 MP  
Pin 5000 mAh, Sạc 7.8 W',513.26,'https://cdn.tgdd.vn/Products/Images/42/251856/samsung-galaxy-a03-xanh-thumb-600x600.jpg','cellphone', 'samsung')
,('Samsung Galaxy A52s 5G 128GB','Màn hình 6.5", 
Chip Snapdragon 778G 5G 8 nhân  
RAM 8 GB, ROM 128 GB  
Camera sau: Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP  
Camera trước: 32 MP  
Pin 4500 mAh, Sạc 25 W',149.29,'https://cdn.tgdd.vn/Products/Images/42/247507/samsung-galaxy-a52s-5g-violet-600x600.jpg','cellphone', 'samsung')
,('Samsung Galaxy S22 Ultra 5G 256GB','Màn hình 6.8", 
Chip Snapdragon 8 Gen 1 8 nhân  
RAM 12 GB, ROM 256 GB  
Camera sau: Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP  
Camera trước: 40 MP  
Pin 5000 mAh, Sạc 45 W',106.51,'https://cdn.tgdd.vn/Products/Images/42/283114/Samsung-Galaxy-s22-ultra-thumb-4-600x600.jpg','cellphone', 'samsung')
,('Samsung Galaxy Z Fold3 5G 256GB','Màn hình Chính 7.6" & Phụ 6.2", 
Chip Snapdragon 888  
RAM 12 GB, ROM 256 GB  
Camera sau: 3 camera 12 MP  
Camera trước: 10 MP & 4 MP  
Pin 4400 mAh, Sạc 25 W',157.84,'https://cdn.tgdd.vn/Products/Images/42/226935/samsung-galaxy-z-fold-3-silver-1-600x600.jpg','cellphone', 'samsung')
,('Samsung Galaxy S22+ 5G 128GB','Màn hình 6.6", 
Chip Snapdragon 8 Gen 1 8 nhân  
RAM 8 GB, ROM 128 GB  
Camera sau: Chính 50 MP & Phụ 12 MP, 10 MP  
Camera trước: 10 MP  
Pin 4500 mAh, Sạc 45 W',405.94,'https://cdn.tgdd.vn/Products/Images/42/242439/Galaxy-S22-Plus-White-600x600.jpg','cellphone', 'samsung')
,('Samsung Galaxy S22 5G 128GB','Màn hình 6.1", 
Chip Snapdragon 8 Gen 1 8 nhân  
RAM 8 GB, ROM 128 GB  
Camera sau: Chính 50 MP & Phụ 12 MP, 10 MP  
Camera trước: 10 MP  
Pin 3700 mAh, Sạc 25 W',384.55,'https://cdn.tgdd.vn/Products/Images/42/231110/Galaxy-S22-Black-600x600.jpg','cellphone', 'samsung')
,('Samsung Galaxy Z Flip3 5G 128GB','Màn hình Chính 6.7" & Phụ 1.9", 
Chip Snapdragon 888  
RAM 8 GB, ROM 128 GB  
Camera sau: 2 camera 12 MP  
Camera trước: 10 MP  
Pin 3300 mAh, Sạc 15 W',157.84,'https://cdn.tgdd.vn/Products/Images/42/229949/samsung-galaxy-z-flip-3-cream-1-600x600.jpg','cellphone', 'samsung')
,('Samsung Galaxy Z Flip3 5G 128GB','Màn hình Chính 6.7" & Phụ 1.9", 
Chip Snapdragon 888  
RAM 8 GB, ROM 128 GB  
Camera sau: 2 camera 12 MP  
Camera trước: 10 MP  
Pin 3300 mAh, Sạc 15 W',405.94,'https://cdn.tgdd.vn/Products/Images/42/281366/Samsung-Galaxy-Z-Flip-3-600x600.jpg','cellphone', 'samsung')
,('Samsung Galaxy S21 FE 5G (6GB/128GB)','Màn hình 6.4", 
Chip Exynos 2100  
RAM 6 GB, ROM 128 GB  
Camera sau: Chính 12 MP & Phụ 12 MP, 8 MP  
Camera trước: 32 MP  
Pin 4500 mAh, Sạc 25 W',384.55,'https://cdn.tgdd.vn/Products/Images/42/267211/Samsung-Galaxy-S21-FE-tim-600x600.jpg','cellphone', 'samsung');


-- account table
-- admin password is 'admin12345' encrypted by SHA-256 as below
insert into Account (`user_email`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES (N'admin@funix.edu.vn', N'41e5653fc7aeb894026d6bb7b2db7f65902b454945fa8fd65a6327047b5277fb', 1, N'Nguyễn Ngọc Quang', N'Tổ chức giáo dục trực tuyến Funix', N'0375431485');
-- customerGetProducts
-- customer password is '123456789'
insert into Account (`user_email`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES (N'quangnguyen@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, N'Nguyễn Quang', N'Trường Đời', N'9375431485');

select * from `Order`;
select * from `OrderDetail`;

