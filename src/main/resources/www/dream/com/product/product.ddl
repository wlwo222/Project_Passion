drop table s_product_add_info;
drop table s_s_product_add_info_type;
drop table s_products;
drop table categories;
drop table order_list;

CREATE SEQUENCE seq_product_id;
CREATE SEQUENCE seq_category_id;

-- category_id, category_name
create table categories(
	category_id			varchar2(20)		primary key,
	category_name		varchar2(50) 
);
insert into categories(category_id, category_name) 
	values('1', 'HAT'); --1
insert into categories(category_id, category_name)
	values('10000a', 'BASEBALLCAP');
insert into categories(category_id, category_name)
	values('10000b', 'BERET');	
insert into categories(category_id, category_name)
	values('10000c', 'TROOPER');
insert into categories(category_id, category_name)
	values('10000d', 'FEDORA');	
insert into categories(category_id, category_name)
	values('10000e', 'OTHER HATS');
insert into categories(category_id, category_name)
	values('10000f', 'BEANIE');

insert into categories(category_id, category_name) 
	values('2', 'TOP'); --2
insert into categories(category_id, category_name) 
	values('20000a', 'T-SHIRT'); --2
insert into categories(category_id, category_name)
	values('20000b', 'LONG T-SHIRT');
insert into categories(category_id, category_name)
	values('20000c', 'MIN T-SHIRT');
insert into categories(category_id, category_name)
	values('20000d', 'SHIRT, BLOUSE');
insert into categories(category_id, category_name)
	values('20000e', 'PIQUE');
insert into categories(category_id, category_name)
	values('20000f', 'MANTOMAN');
insert into categories(category_id, category_name)
	values('20000g', 'HOOD');
insert into categories(category_id, category_name)
	values('20000h', 'SWEATER');
	
insert into categories(category_id, category_name) 
	values('3', 'PANTS'); --3
insert into categories(category_id, category_name) 
	values('30000a', 'PANTS'); --3
insert into categories(category_id, category_name)
	values('30000b', 'LEGGINGS');
insert into categories(category_id, category_name)
	values('30000c', 'SUIT');
insert into categories(category_id, category_name)
	values('30000d', 'TRAINING');
insert into categories(category_id, category_name)
	values('30000e', 'SLACKS');
	
	
insert into categories(category_id, category_name) 
	values('4', 'SHOES'); --4
insert into categories(category_id, category_name) 
	values('40000a', 'SHOES'); --4
insert into categories(category_id, category_name)
	values('40000c', 'SANDLE, SLIPPERS, BOOTS');
insert into categories(category_id, category_name) 
	values('40000b', 'CANVAS'); --4

	
insert into categories(category_id, category_name) 
	values('5', 'OUTER'); 
insert into categories(category_id, category_name) 
	values('50000a', 'HOODZIPUP');
insert into categories(category_id, category_name) 
	values('50000b', 'SEASONCOAT'); 
insert into categories(category_id, category_name) 
	values('50000c', 'WINTERCOAT'); 
insert into categories(category_id, category_name) 
	values('50000d', 'JACKET');
insert into categories(category_id, category_name) 
	values('50000e', 'CARDIGAN'); 
insert into categories(category_id, category_name) 
	values('50000f', 'OTHEROUTER'); 
	
-- p_id, category_id, p_name, price
 create table s_products(
    p_id                varchar2(500)     primary key,
    category_id         varchar2(10)     REFERENCES categories(category_id),
    p_name              varchar2(100)    ,
    price               number(10)       default 0 not null,
    is_selled			char(1)			 default 0 not null,		--???????????? 0??? ??? ?????? ?????? ??????, 1??? ??? ??????
    reg_dt              timestamp        default sysdate not null,   --????????????
    upt_dt              timestamp        default sysdate not null    --????????????
);

insert into s_products(p_id, category_id, p_name, price)
	values('1', '10000f', '????????????', '50000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('2', '20000a', '??????????????????', '12323' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('3', '30000a', '????????????', '53454' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('4', '40000a', '????????????', '36345' );

insert into s_products(p_id, category_id, p_name, price)
	values('5', '10000a', 'colorballcap_blue', '23212' );
insert into s_products(p_id, category_id, p_name, price)
	values('6', '10000a', 'colorballcap_green', '23212' );
insert into s_products(p_id, category_id, p_name, price)
	values('7', '10000a', 'colorballcap_red', '23212' );

insert into s_products(p_id, category_id, p_name, price)
	values('8', '10000a', '?????????????????????_blue', '5000' );
	
--p_id,product_size_type
create table s_product_add_info(
	p_id					varchar2(20),
	product_add_info_type	varchar2(50),
	description				varchar2(100),
	primary key (p_id, product_add_info_type),
	CONSTRAINT fk_add_pdinfo FOREIGN KEY(p_id) REFERENCES s_products(p_id));
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('5', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('5', 'image', '/resources/images/productImg/hat/baseballcap/colorballcap/colorballcap_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('5', 'reviewcount', 2323);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('5', 'quantity', 56456);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('5', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('5', 'color', 'blue');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('6', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('6', 'image', '/resources/images/productImg/hat/baseballcap/colorballcap/colorballcap_green.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('6', 'reviewcount', 533);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('6', 'quantity', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('6', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('6', 'color', 'green');

--Insert into ?????? ??? products Id??? ?????? ?????? p_id??? ??????????????? 
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('1', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('1', 'image', '/resources/images/productImg/jacket.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('1', 'reviewcount', 7);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('1', 'quantity', 89);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('1', 'size', 50);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('1', 'color', 'black');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('2', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('2', 'image', '/resources/images/productImg/jacket.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('2', 'reviewcount', 57);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('2', 'quantity', 123);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('2', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('2', 'color', 'white');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('3', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('3', 'image', '/resources/images/productImg/jacket.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('3', 'reviewcount', 122);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('3', 'quantity', 66);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('3', 'size', 'free');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('3', 'color', 'khaki');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('4', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('4', 'image', '/resources/images/productImg/jacket.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('4', 'reviewcount', 2221);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('4', 'quantity', 334);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('4', 'size', 270);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('4', 'color', 'black');

--product_size_type, description
create table s_product_add_info_type(
	product_add_info_type	varchar2(50)		primary key,
	description				varchar2(100));

insert into s_product_add_info_type(product_add_info_type, description)
	values('score', '??????');
	
insert into s_product_add_info_type(product_add_info_type, description)
	values('image', '?????? ????????? ??????');
	
insert into s_product_add_info_type(product_add_info_type, description)
	values('reviewcount', '?????? ?????? ??????');

insert into s_product_add_info_type(product_add_info_type, description)
	values('color', '?????? ??????');
	
insert into s_product_add_info_type(product_add_info_type, description)
	values('quantity', '?????????');

insert into s_product_add_info_type(product_add_info_type, description)
	values('size', '?????????');