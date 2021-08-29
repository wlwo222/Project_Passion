drop table orders;
truncate table orders;
drop table cart;
truncate table cart;
drop table order_list;
truncate table order_list;

--order_id, quantity, p_id, total_price,  order_status, descrim, customer_addr, customer_name, customer_phnum, customer_id
create table orders(
    order_id            varchar2(10) 	primary key,
    p_id                varchar2(20) 	references s_products(p_id), 
    quantity			number(9),
    total_price         number(9),
    order_status        varchar2(500),
    descrim				varchar2(10)	not null,
    customer_id         varchar2(10) 	references s_party(user_id),
    customer_addr       varchar2(50) 	not null,
    customer_name       varchar2(50) 	not null,
    customer_phnum      varchar2(50) 	not null,
    reg_dt				timestamp		default sysdate not null,	--등록시점
	upt_dt				timestamp		default sysdate not null	--수정시점
);

insert into orders(order_id, quantity, p_id, total_price, order_status, descrim, customer_id, customer_addr, customer_name, customer_phnum)
	values('1', 5, '227', 78000 * 5, '입금전', 'order', 'admin', '여긴 어디인가', '유유', '010-3321-2223');
insert into orders(order_id, quantity, p_id, total_price, order_status, descrim, customer_id, customer_addr, customer_name, customer_phnum)
	values('2', 7, '237', 59000 * 7, '배송준비중', 'order', 'admin', '여긴 어디지요', '유유이우', '010-3321-2333');

create table cart(
	customer_id         varchar2(10),
    p_id                varchar2(20),
    p_count             number(9),
    reg_dt				timestamp		default sysdate not null,	--등록시점
	upt_dt				timestamp		default sysdate not null,	--수정시점
	primary key(customer_id, p_id)		
);

insert into cart(customer_id, p_id, p_count)
	values('admin', '55554', 2);
insert into cart(customer_id, p_id, p_count)
	values('mana1', '5244', 2);	

insert into cart(customer_id, p_id, p_count)
	values('admin', '52', 2);	


create table order_list(
    order_id            varchar2(10)        references orders(order_id),
    quantity            number(9),
    p_id                varchar2(500),
    total_price			number(9)
);