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
	values('1', '모자'); --1
insert into categories(category_id, category_name)
	values('10000f', '비니');
insert into categories(category_id, category_name) 
	values('2', '상의'); --2
insert into categories(category_id, category_name) 
	values('20000a', '반팔티셔츠'); --2
insert into categories(category_id, category_name) 
	values('3', '하의'); --3
insert into categories(category_id, category_name) 
	values('30000a', '팬츠'); --3
insert into categories(category_id, category_name) 
	values('4', '신발'); --4
insert into categories(category_id, category_name) 
	values('40000a', '구두'); --4
	
insert into categories(category_id, category_name)
	values('10000a', '야구모자');
insert into categories(category_id, category_name)
	values('10000b', '베레모');	
insert into categories(category_id, category_name)
	values('10000c', '트루퍼');
insert into categories(category_id, category_name)
	values('10000d', '페도라');	
insert into categories(category_id, category_name) 
	values('40000b', '캔버스화'); --4

-- p_id, category_id, p_name, price
 create table s_products(
    p_id                varchar2(500)     primary key,
    category_id         varchar2(10)     REFERENCES categories(category_id),
    p_name              varchar2(100)    ,
    price               number(10)       default 0 not null,
    is_selled			char(1)			 default 0 not null,		--판매상태 0일 때 아직 팔지 않음, 1일 때 팔림
    reg_dt              timestamp        default sysdate not null,   --등록시점
    upt_dt              timestamp        default sysdate not null    --수정시점
);

insert into s_products(p_id, category_id, p_name, price)
	values('1', '10000f', '해골비니', '50000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('2', '20000a', '곰돌이티셔츠', '12323' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('3', '30000a', '카키팬츠', '53454' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('4', '40000a', '캉캉구두', '36345' );

insert into s_products(p_id, category_id, p_name, price)
	values('5', '10000a', 'colorballcap_blue', '23212' );
insert into s_products(p_id, category_id, p_name, price)
	values('6', '10000a', 'colorballcap_green', '23212' );
insert into s_products(p_id, category_id, p_name, price)
	values('7', '10000a', 'colorballcap_red', '23212' );

insert into s_products(p_id, category_id, p_name, price)
	values('8', '10000a', '다저스야구모자_blue', '5000' );
	
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

--Insert into 할때 꼭 products Id를 조사 후에 p_id에 넣어주세영 
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
	values('score', '평점');
	
insert into s_product_add_info_type(product_add_info_type, description)
	values('image', '상품 이미지 경로');
	
insert into s_product_add_info_type(product_add_info_type, description)
	values('reviewcount', '리뷰 참여 횟수');

insert into s_product_add_info_type(product_add_info_type, description)
	values('color', '상품 색깔');
	
insert into s_product_add_info_type(product_add_info_type, description)
	values('quantity', '재고량');

insert into s_product_add_info_type(product_add_info_type, description)
	values('size', '사이즈');

######################################Order#################################################
create table order_list(
	order_number		number(12)		primary key,
	quantity			number(9),
	p_id				varchar2(500)
);