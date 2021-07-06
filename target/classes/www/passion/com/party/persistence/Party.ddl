drop table p_party;



create table p_party(
     id   varchar2(50) primary key, -- hong
   name   varchar2(15),				-- 홍길동
address   varchar2(400),
    pwd   varchar2(100),
  email   varchar2(100),
  phnum   varchar2(50),
 likcat   varchar2(100)
);

insert into p_party(id,name,address,pwd,email,phnum) values ('admin', '지재','경기도 평택', '1234','wlwo222@naver.com','010-1234-1234');
insert into p_party(id,name,address,pwd,email,phnum) values ('jun', '경준','경기도 안양', '1234','Jun@naver.com','010-3434-5634');
insert into p_party(id,name,address,pwd,email,phnum) values ('chan', '승찬','경기도 수원', '1234','Chan@naver.com','010-3544-2534');
insert into p_party(id,name,address,pwd,email,phnum) values ('eun', '홍은','세종 특별자치시', '1234','Eun@naver.com','010-1224-1154');
insert into p_party(id,name,address,pwd,email,phnum) values ('woo', '현우','서울 금천구 시흥', '1234','Woo@naver.com','010-5643-1223');
