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
	values('4', '하의'); --3
insert into categories(category_id, category_name) 
	values('3', '신발'); --4
	
insert into categories(category_id, category_name)
	values('10000a', '야구모자');
insert into categories(category_id, category_name)
	values('10000b', '베레모');	
insert into categories(category_id, category_name)
	values('10000c', '트루퍼');
insert into categories(category_id, category_name)
	values('10000d', '페도라');	
insert into categories(category_id, category_name) 
	values('30000a', '캔버스화'); --4

-- p_id, category_name, quantity, p_name, price, p_size
 create table s_products(
    p_id                varchar2(20)     primary key,
    category_id         varchar2(10)     REFERENCES categories(category_id),
    quantity            number(9)        default 0 not null,
    p_name              varchar2(100)    ,
    price               number(10)       default 0 not null,
    p_size              varchar2(30),
    sellen				char(1)			 default 0 not null,		--판매상태 0일 때 아직 팔지 않음, 1일 때 파는 중, 2일 때 품절
    reg_dt              timestamp        default sysdate not null,   --등록시점
    upt_dt              timestamp        default sysdate not null    --수정시점
);
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('10', 2, 70, '자켓808', 189000, '100');
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('11', 4, 50, '냉장고바지', 5800000, 'free');
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('12', 1, 90, '페도라', 1819000, '27');
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('13', 3, 100, '아디다스운동화', 5800000, '270');
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('14', '10000f', 100, '해골비니', 580, 'free');
	
	
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('15', 2, 100, '반팔후드', 30000, '100'); 
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('16', 2, 100, '썬문반팔' 13900, '100'); 
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('17', 2, 100, '메롱 맨투맨' 30900, '100'); 
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('18', 2, 100, '아이즈 반팔' 28900, '100'); 	
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('19', 2, 100, '보스톤 맨투맨' 29900, '100'); 
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('20', 2, 100, '로즈 반팔티' 28900, '100'); 
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('21', 5, 100, '컬러풀 반바지' 24900, '100'); 
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values('22', 5, 100, '울프 반바지' 24900, '100'); 	
	
--p_id,product_size_type
create table s_product_add_info(
	p_id					varchar2(20),
	product_add_info_type	varchar2(50),
	description				varchar2(100),
	primary key (p_id, product_add_info_type),
	CONSTRAINT fk_add_pdinfo FOREIGN KEY(p_id) REFERENCES s_products(p_id));

--Insert into 할때 꼭 products Id를 조사 후에 p_id에 넣어주세영 
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('10', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('10', 'image', '/resources/images/productImg/jacket.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('10', 'reviewcount', 7);

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('11', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('11', 'image', '/resources/images/productImg/jacket.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('11', 'reviewcount', 1);

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('12', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('12', 'image', '/resources/images/productImg/jacket.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('12', 'reviewcount', 5);

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('13', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('13', 'image', '/resources/images/productImg/jacket.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('13', 'reviewcount', 11);

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('14', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('14', 'image', '/resources/images/productImg/jacket.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('14', 'reviewcount', 10);

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


######################################Order#################################################
create table order_list(
	order_number		number(12)		primary key,
	quantity			number(9),
	p_id				varchar2(500)
);