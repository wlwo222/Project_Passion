drop index idx_reply_board_id;
drop SEQUENCE seq_reply_id;
drop table s_reply;
drop table s_board;

--id, name, description

truncate table s_reply;

truncate table s_board;

create table s_board(
	id				number(9) primary key,
	name			varchar2(100),
	description		varchar2(1000),
	reg_dt			timestamp		default sysdate not null,	--등록시점
	upt_dt			timestamp		default sysdate not null
);
insert into s_board(id, name, description)
	values(1, '공지사항', 'Passion에서 드리는 공지사항');
insert into s_board(id, name, description)
	values(2, 'FAQ', '자주 문의되는 사항에 대한 답변들');
insert into s_board(id, name, description)
	values(3, '자유게시판', '회원이면 누구나 자유롭게 자신의 의견을 밝힐수 있어요.');
insert into s_board(id, name, description)
	values(4, '문의게시판', '궁금한 점을 여쭤보세요!');
insert into s_board(id, name, description)
	values(5, '판매게시판', '상품이 등록되는 게시판입니다.');

CREATE SEQUENCE seq_reply_id;
--id, writer_id, content, reg_dt, upt_dt, descrim, board_id, title, read_cnt, like_cnt, dislike_cnt
create table s_reply(
	id				varchar2(4000)	primary key,
	writer_id		varchar2(10)	REFERENCES s_party(user_id),
	content			varchar2(4000),
	reg_dt			timestamp		default sysdate not null,	--등록시점
	upt_dt			timestamp		default sysdate not null,
	descrim			varchar2(10)	not null,	--reply, post
	--descrim이 post일 경우 사용되는 정보들
	board_id		number(9)		REFERENCES s_board(id),
	title			varchar2(100),
	read_cnt		number(9)		default 0,
	like_cnt		number(9)		default 0,
	dislike_cnt		number(9)		default 0
);
create index idx_reply_board_id on s_reply(board_id, id);


-- reply를 만들때마다 product의 id를 붙여줘서 나중에 productId만 조회하더라도 리뷰, 게시판 내용, Product 정보가 조회
-- mybatis에서 select Key로 #{productId}||_getid(seq_reply_id) id값 부여.
-- 이렇게 하는 이유는 리뷰는 상품에 관한 것이지 게시판에 관한것이 아님. 따라서 상품을 끌어올 때 리뷰와 게시글이 딸려오게 할 것.
-- 나중에 데이터관리 (CRUD)도 편하게 like 연산자로 다룰 수 있음. <유지보수성>
