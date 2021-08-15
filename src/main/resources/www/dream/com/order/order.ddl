drop table orders;
truncate table orders;
drop table cart;
truncate table cart;
drop table order_list;
truncate table order_list;

create table orders(
    customer_id         varchar2(10) 	references s_party(user_id),
    order_status        varchar2(500),
    customer_addr       varchar2(50) 	not null,
    order_id            varchar2(10) 	primary key,
    customer_name       varchar2(50) 	not null,
    customer_phnum      varchar2(50) 	not null,
    p_id                varchar2(20) 	references s_products(p_id), 
    total_price         number(9),
    descrim				varchar2(10)	not null,
    reg_dt				timestamp		default sysdate not null,	--등록시점
	upt_dt				timestamp		default sysdate not null	--수정시점
);

insert into orders(customer_id, order_status, customer_addr, order_id, customer_name, customer_phnum, p_id, descrim)
	values('admin', '입금전', '서울시구로구구로동구로타워1호', 1, 'power', '01011119999', '2', 'orders');
insert into orders(customer_id, order_status, customer_addr, order_id, customer_name, customer_phnum, p_id, descrim)
	values('mana1', '장바구니', '서울시구로구구로동구로타워1호', 2, '빡빡이형님', '01011119999', '2', 'wishlist');

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
    p_id                varchar2(500)
);