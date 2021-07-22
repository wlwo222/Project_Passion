drop table categories;
drop table s_products;
drop table order_list;

CREATE SEQUENCE seq_product_id;
CREATE SEQUENCE seq_category_id;
create index idx_product_id on s_products(p_id);
-- p_id, category_name, quantity, p_name, price, p_size
create table s_products(
    p_id                varchar2(20)    primary key,
    category_id            number(10)        REFERENCES categories(category_id),
    quantity            number(9)        default 0 not null,
    p_name                varchar2(100)    ,
    price                number(10)        default 0 not null,
    p_size                varchar2(10),
    reg_dt                timestamp        default sysdate not null,    --등록시점
    upt_dt                timestamp        default sysdate not null    --수정시점
);
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values(seq_product_id.nextval, 2, 70, '자켓808', 189000, '100');
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values(seq_product_id.nextval, 3, 50, '냉장고바지', 5800000, 'free');
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values(seq_product_id.nextval, 1, 90, '페도라', 1819000, '27');
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values(seq_product_id.nextval, 4, 100, '아디다스운동화', 5800000, '270');
insert into s_products(p_id, category_id, quantity, p_name, price, p_size)
	values(seq_product_id.nextval, 100008, 100, '해골비니', 580, 'free');

-- category_id, category_name
create table categories(
	category_id			number(10)		primary key
	category_name		varchar2(50) 
	
);
insert into categories(category_id, category_name) 
	values(seq_category_id.nextval, '모자'); --1
	
insert into categories(category_id, category_name)
	values(1 || get_id(seq_product_id.nextval), '비니');

insert into categories(category_id, category_name) 
	values(seq_category_id.nextval, '상의'); --2
insert into categories(category_id, category_name) 
	values(seq_category_id.nextval, '하의'); --3
insert into categories(category_id, category_name) 
	values(seq_category_id.nextval, '신발'); --4	


create table order_list(
	order_number		number(12)		primary key,
	quantity			number(9),
	p_id				varchar2(500)
);

--p_id,product_size_type
create table s_product_size(
	p_id				varchar2(20),
	product_size_type	varchar2(50),
	primary key (p_id, product_size_type),
	CONSTRAINT fk_ps_size FOREIGN KEY(p_id) REFERENCES s_products(p_id)
);
insert into s_product_size_type(p_id,product_size_type)
	values('inch', '인치')

--product_size_type, description
create table s_product_size_type(
	product_size_type	varchar2(50)		primary key,
	description			varchar2(100)
);

insert into s_product_size_type(product_size_type, description)
	values('inch', '인치')
insert into s_product_size_type(product_size_type, description)
	values('mm', '밀리미터')
insert into s_product_size_type(product_size_type, description)
	values('cm', '센치미터')
insert into s_product_size_type(product_size_type, description)
	values('문', '발사이즈')
insert into s_product_size_type(product_size_type, description)
	values('직접입력', '사용자가 직접입력')	