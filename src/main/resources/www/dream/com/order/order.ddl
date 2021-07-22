drop table orders;
drop SEQUENCE seq_order_id;

CREATE SEQUENCE seq_order_id;

-- 
create table orders(
    customer_id      varchar2(10) references s_party(user_id),
    order_status    varchar2(10),
    customer_addr    varchar2(10) not null,
    order_id        varchar2(10) primary key,
    customer_name    varchar2(10) not null,
    customer_phnum    varchar2(10) not null,
    p_id            varchar2(20) references s_products(p_id), 
    total_price        number(9),
);

create table wishlist(
    customer_id        varchar2(10) primary key,
    p_id               varchar2(20),
    p_count            number(9)
);

create table order_list(
    order_id            varchar2(10)        references orders(order_id),
    quantity            number(9),
    p_id                varchar2(500)
);