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
	
--p_id,product_size_type
create table s_product_add_info(
	p_id					varchar2(20),
	product_add_info_type	varchar2(50),
	description				varchar2(100),
	primary key (p_id, product_add_info_type),
	CONSTRAINT fk_add_pdinfo FOREIGN KEY(p_id) REFERENCES s_products(p_id));

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
--#######################################Category 입력 구간################################################
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
	
	
insert into categories(category_id, category_name)
	values('10000e', '기타모자');	

insert into categories(category_id, category_name)
	values('20000b', '긴팔티셔츠');
insert into categories(category_id, category_name)
	values('20000c', '민소매티셔츠');
insert into categories(category_id, category_name)
	values('20000d', '셔츠.블라우스');
insert into categories(category_id, category_name)
	values('20000e', '피케.카라티셔츠');
insert into categories(category_id, category_name)
	values('20000f', '맨투맨.스웨츠셔츠');
insert into categories(category_id, category_name)
	values('20000g', '후드티셔츠');
insert into categories(category_id, category_name)
	values('20000h', '니트스웨터');
	
	
insert into categories(category_id, category_name)
	values('30000b', '레깅스');
insert into categories(category_id, category_name)
	values('30000c', '슈트');
insert into categories(category_id, category_name)
	values('30000d', '트레이닝');
insert into categories(category_id, category_name)
	values('30000e', '슬렉스');
	
	
	
insert into categories(category_id, category_name)
	values('40000b', '운동화');
insert into categories(category_id, category_name)
	values('40000c', '샌들.슬리퍼.장화');

	
insert into categories(category_id, category_name) 
	values('5', '아우터'); 
insert into categories(category_id, category_name) 
	values('50000a', '후드집업');
insert into categories(category_id, category_name) 
	values('50000b', '환절기코트'); 
insert into categories(category_id, category_name) 
	values('50000c', '겨울코트'); 
insert into categories(category_id, category_name) 
	values('50000d', '재킷');
insert into categories(category_id, category_name) 
	values('50000e', '카디건'); 
insert into categories(category_id, category_name) 
	values('50000f', '기타아우터'); 
--#######################################Category 입력 구간################################################
--########################################Product 입력 구간################################################
insert into s_products(p_id, category_id, p_name, price)
	values('100', '20000g', 'denverhoodmantoman_green', '48000' );
insert into s_products(p_id, category_id, p_name, price)
	values('101', '20000g', 'denverhoodmantoman_purple', '48000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('102', '20000g', 'hoodmantoman_black', '50000' );
insert into s_products(p_id, category_id, p_name, price)
	values('103', '20000g', 'hoodmantoman_white', '50000' );
insert into s_products(p_id, category_id, p_name, price)
	values('104', '20000g', 'hoodmantomanjumper_black', '56000' );
insert into s_products(p_id, category_id, p_name, price)
	values('105', '20000g', 'hoodmantomanjumper_white', '56000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('106', '20000g', 'nychoodmantoman_black', '45000' );
insert into s_products(p_id, category_id, p_name, price)
	values('107', '20000g', 'nychoodmantoman_green', '45000' );
	
--#######################longsleeves#######################
insert into s_products(p_id, category_id, p_name, price)
	values('108', '20000b', 'angellongsleeve_black', '56000' );
insert into s_products(p_id, category_id, p_name, price)
	values('109', '20000b', 'angellongsleeve_darkgray', '56000' );
insert into s_products(p_id, category_id, p_name, price)
	values('110', '20000b', 'angellongsleeve_white', '56000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('111', '20000b', 'shinelongsleeve_white', '49000' );
insert into s_products(p_id, category_id, p_name, price)
	values('112', '20000b', 'shinelongsleeve_black', '49000' );
insert into s_products(p_id, category_id, p_name, price)
	values('113', '20000b', 'shinelongsleeve_pink', '49000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('114', '20000b', 'tntramidustee_blue', '40000' );
insert into s_products(p_id, category_id, p_name, price)
	values('115', '20000b', 'tntramidustee_orange', '40000' );
insert into s_products(p_id, category_id, p_name, price)
	values('116', '20000b', 'tntramidustee_white', '40000' );
	
--#########################mantoman##########################
insert into s_products(p_id, category_id, p_name, price)
	values('117', '20000f', 'dogsweatshirt_gray', '38000' );
insert into s_products(p_id, category_id, p_name, price)
	values('118', '20000f', 'dogsweatshirt_red', '38000' );
insert into s_products(p_id, category_id, p_name, price)
	values('119', '20000f', 'dogsweatshirt_white', '38000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('120', '20000f', 'globesweatshirt_black', '25000' );
insert into s_products(p_id, category_id, p_name, price)
	values('121', '20000f', 'globesweatshirt_orange', '25000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('122', '20000f', 'leonsweatshirt_beige', '30000' );
insert into s_products(p_id, category_id, p_name, price)
	values('123', '20000f', 'leonsweatshirt_white', '30000' );
insert into s_products(p_id, category_id, p_name, price)
	values('124', '20000f', 'leonsweatshirt_yellow', '30000' );
	
--############################pique########################
insert into s_products(p_id, category_id, p_name, price)
	values('125', '20000e', 'oversizepoloshirt_darkgray', '98000' );
insert into s_products(p_id, category_id, p_name, price)
	values('126', '20000e', 'oversizepoloshirt_gray', '98000' );
insert into s_products(p_id, category_id, p_name, price)
	values('127', '20000e', 'oversizepoloshirt_navy', '98000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('128', '20000e', 'poloshirt_beige', '78000' );
insert into s_products(p_id, category_id, p_name, price)
	values('129', '20000e', 'poloshirt_black', '78000' );
insert into s_products(p_id, category_id, p_name, price)
	values('130', '20000e', 'poloshirt_blue', '78000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('131', '20000e', 'smalllogopoloshirt_black', '128000' );
insert into s_products(p_id, category_id, p_name, price)
	values('132', '20000e', 'smalllogopoloshirt_gray', '128000' );
insert into s_products(p_id, category_id, p_name, price)
	values('133', '20000e', 'smalllogopoloshirt_red', '128000' );

--###########################shirt#############################
insert into s_products(p_id, category_id, p_name, price)
	values('134', '20000d', 'diagonalfrillblouse_red', '68000' );
insert into s_products(p_id, category_id, p_name, price)
	values('135', '20000d', 'diagonalfrillblouse_white', '68000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('136', '20000d', 'shortsleevedshirt_blue', '58000' );
insert into s_products(p_id, category_id, p_name, price)
	values('137', '20000d', 'shortsleevedshirt_pink', '58000' );
insert into s_products(p_id, category_id, p_name, price)
	values('138', '20000d', 'shortsleevedshirt_white', '58000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('139', '20000d', 'vneckblouse_black', '28000' );
insert into s_products(p_id, category_id, p_name, price)
	values('140', '20000d', 'vneckblouse_blue', '28000' );
insert into s_products(p_id, category_id, p_name, price)
	values('141', '20000d', 'vneckblouse_sprite', '28000' );
		
--########################shortsleeve#########################
insert into s_products(p_id, category_id, p_name, price)
	values('142', '20000a', 'twitchtshirt_black', '58000' );
insert into s_products(p_id, category_id, p_name, price)
	values('143', '20000a', 'twitchtshirt_blue', '58000' );
insert into s_products(p_id, category_id, p_name, price)
	values('144', '20000a', 'twitchtshirt_white', '58000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('145', '20000a', 'universitytee_black&blue', '38000' );
insert into s_products(p_id, category_id, p_name, price)
	values('146', '20000a', 'universitytee_black&red', '38000' );
insert into s_products(p_id, category_id, p_name, price)
	values('147', '20000a', 'universitytee_white&red', '38000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('148', '20000a', 'visionsleeve_black', '25000' );
insert into s_products(p_id, category_id, p_name, price)
	values('149', '20000a', 'visionsleeve_purple', '25000' );
insert into s_products(p_id, category_id, p_name, price)
	values('150', '20000a', 'visionsleeve_white', '25000' );
	
--############################sleeveless#######################
insert into s_products(p_id, category_id, p_name, price)
	values('151', '20000c', 'beachsleeveless_black', '9000' );
	insert into s_products(p_id, category_id, p_name, price)
	values('152', '20000c', 'beachsleeveless_white', '9000' );
	insert into s_products(p_id, category_id, p_name, price)
	values('153', '20000c', 'beachsleeveless_yellow', '9000' );

insert into s_products(p_id, category_id, p_name, price)
	values('154', '20000c', 'symbolsleeveless_black', '10000' );
insert into s_products(p_id, category_id, p_name, price)
	values('155', '20000c', 'symbolsleeveless_lime', '10000' );
insert into s_products(p_id, category_id, p_name, price)
	values('156', '20000c', 'symbolsleeveless_white', '10000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('157', '20000c', 'womenssleeveless_pink', '12000' );
insert into s_products(p_id, category_id, p_name, price)
	values('158', '20000c', 'womenssleeveless_white', '12000' );
insert into s_products(p_id, category_id, p_name, price)
	values('159', '20000c', 'womenssleeveless_black', '12000' );
	
--############################sweater#########################
insert into s_products(p_id, category_id, p_name, price)
	values('160', '20000h', 'cashmeresweater_black', '78000' );
insert into s_products(p_id, category_id, p_name, price)
	values('161', '20000h', 'cashmeresweater_brown', '78000' );
insert into s_products(p_id, category_id, p_name, price)
	values('162', '20000h', 'cashmeresweater_darkblue', '78000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('163', '20000h', 'polonecksweater_black', '68000' );
insert into s_products(p_id, category_id, p_name, price)
	values('164', '20000h', 'polonecksweater_brown', '68000' );
insert into s_products(p_id, category_id, p_name, price)
	values('165', '20000h', 'polonecksweater_lime', '68000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('166', '20000h', 'stripesweater_beige', '58000' );
insert into s_products(p_id, category_id, p_name, price)
	values('167', '20000h', 'stripesweater_black', '58000' );
insert into s_products(p_id, category_id, p_name, price)
	values('168', '20000h', 'stripesweater_red', '58000' );
	
--############################shoes 샌들......#########################

insert into s_products(p_id, category_id, p_name, price)
	values('200', '40000c', 'flipflops_black', '45000' );
insert into s_products(p_id, category_id, p_name, price)
	values('201', '40000c', 'flipflops_brown', '45000' );
insert into s_products(p_id, category_id, p_name, price)
	values('202', '40000c', 'flipflops_white', '45000' );	
	
insert into s_products(p_id, category_id, p_name, price)
	values('203', '40000c', 'rainboots_black', '40000' );
insert into s_products(p_id, category_id, p_name, price)
	values('204', '40000c', 'rainboots_brown', '40000' );
insert into s_products(p_id, category_id, p_name, price)
	values('205', '40000c', 'rainboots_khaki', '40000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('206', '40000c', 'sandals_black45', '36000' );
insert into s_products(p_id, category_id, p_name, price)
	values('207', '40000c', 'sandals_black90', '36000' );
insert into s_products(p_id, category_id, p_name, price)
	values('208', '40000c', 'sandals_black180', '36000' );
	
--############################구두#########################

insert into s_products(p_id, category_id, p_name, price)
	values('206', '40000a', 'basement_00', '80000' );
insert into s_products(p_id, category_id, p_name, price)
	values('207', '40000a', 'basement_30', '80000' );
insert into s_products(p_id, category_id, p_name, price)
	values('208', '40000a', 'basement_45', '80000' );	
	
insert into s_products(p_id, category_id, p_name, price)
	values('209', '40000a', 'comandosol_00', '84000' );
insert into s_products(p_id, category_id, p_name, price)
	values('210', '40000a', 'comandosol_30', '84000' );
insert into s_products(p_id, category_id, p_name, price)
	values('211', '40000a', 'comandosol_90', '84000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('212', '40000a', 'derbyshoes_45', '91000' );
insert into s_products(p_id, category_id, p_name, price)
	values('213', '40000a', 'derbyshoes_90', '91000' );
insert into s_products(p_id, category_id, p_name, price)
	values('214', '40000a', 'derbyshoes_180', '91000' );

--############################운동화########################	
	
insert into s_products(p_id, category_id, p_name, price)
	values('215', '40000b', 'allstarshoes_black red', '61000' );
insert into s_products(p_id, category_id, p_name, price)
	values('216', '40000b', 'allstarshoes_black black', '61000' );
insert into s_products(p_id, category_id, p_name, price)
	values('217', '40000b', 'allstarshoes_black white', '61000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('218', '40000b', 'authenticshoes_black', '55000' );
insert into s_products(p_id, category_id, p_name, price)
	values('219', '40000b', 'authenticshoes_blue', '55000' );
insert into s_products(p_id, category_id, p_name, price)
	values('220', '40000b', 'authenticshoes_red', '55000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('221', '40000b', 'nyshoes_whilte1', '57000' );
insert into s_products(p_id, category_id, p_name, price)
	values('222', '40000b', 'nyshoes_whilte2', '57000' );
insert into s_products(p_id, category_id, p_name, price)
	values('223', '40000b', 'nyshoes_whilte3', '57000' );
	
	--#########################leggings#############################
insert into s_products(p_id, category_id, p_name, price)
	values('49', '30000b', 'barrelfitleggings_black', '28000' );
insert into s_products(p_id, category_id, p_name, price)
	values('50', '30000b', 'barrelfitleggings_deepblue', '28000' );	
insert into s_products(p_id, category_id, p_name, price)
	values('51', '30000b', 'barrelfitleggings_deeppurple', '28000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('52', '30000b', 'dailyleggings_black', '30000' );
insert into s_products(p_id, category_id, p_name, price)
	values('53', '30000b', 'dailyleggings_grey', '30000' );
insert into s_products(p_id, category_id, p_name, price)
	values('54', '30000b', 'dailyleggings_ivory', '30000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('55', '30000b', 'highwaistleggings_black', '25000' );
insert into s_products(p_id, category_id, p_name, price)
	values('56', '30000b', 'highwaistleggings_blue', '25000' );
insert into s_products(p_id, category_id, p_name, price)
	values('57', '30000b', 'highwaistleggings_pink', '25000' );
	
--#######################pant#######################
insert into s_products(p_id, category_id, p_name, price)
	values('58', '30000a', 'cottonfit_beige', '30000' );
insert into s_products(p_id, category_id, p_name, price)
	values('59', '30000a', 'cottonfit_khaki', '30000' );
insert into s_products(p_id, category_id, p_name, price)
	values('60', '30000a', 'cottonfit_white', '30000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('61', '30000a', 'taperedpants_white', '31000' );
insert into s_products(p_id, category_id, p_name, price)
	values('62', '30000a', 'taperedpants_beige', '31000' );
insert into s_products(p_id, category_id, p_name, price)
	values('63', '30000a', 'taperedpants_brown', '31000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('64', '30000a', 'widepants_black', '38000' );
insert into s_products(p_id, category_id, p_name, price)
	values('65', '30000a', 'widepants_khaki', '38000' );
insert into s_products(p_id, category_id, p_name, price)
	values('66', '30000a', 'widepants_white', '38000' );
	
--#########################slacks##########################
insert into s_products(p_id, category_id, p_name, price)
	values('67', '30000e', 'convinceslacks_black', '18000' );
insert into s_products(p_id, category_id, p_name, price)
	values('68', '30000e', 'convinceslacks_gray', '18000' );
insert into s_products(p_id, category_id, p_name, price)
	values('69', '30000e', 'convinceslacks_charcoalgray', '18000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('70', '30000e', 'nylonpants_black', '25000' );
insert into s_products(p_id, category_id, p_name, price)
	values('71', '30000e', 'nylonpants_darkbrown', '25000' );
insert into s_products(p_id, category_id, p_name, price)
	values('72', '30000e', 'nylonpants_khaki', '25000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('73', '30000e', 'wideslacks_black', '28000' );
insert into s_products(p_id, category_id, p_name, price)
	values('74', '30000e', 'wideslacks_darkbrown', '28000' );
insert into s_products(p_id, category_id, p_name, price)
	values('75', '30000e', 'wideslacks_white', '28000' );
	
--############################suit########################
insert into s_products(p_id, category_id, p_name, price)
	values('76', '30000c', 'bandedslacks_black', '48000' );
insert into s_products(p_id, category_id, p_name, price)
	values('77', '30000c', 'bandedslacks_brown', '48000' );
insert into s_products(p_id, category_id, p_name, price)
	values('78', '30000c', 'bandedslacks_lightgrey', '48000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('79', '30000c', 'bandingsetuppants_black', '50000' );
insert into s_products(p_id, category_id, p_name, price)
	values('80', '30000c', 'bandingsetuppants_gray', '50000' );
insert into s_products(p_id, category_id, p_name, price)
	values('81', '30000c', 'bandingsetuppants_khaki', '50000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('82', '30000c', 'belieftrauser_black', '68000' );
insert into s_products(p_id, category_id, p_name, price)
	values('83', '30000c', 'belieftrauser_brown', '68000' );
insert into s_products(p_id, category_id, p_name, price)
	values('84', '30000c', 'belieftrauser_darkbrown', '68000' );

--###########################training#############################
insert into s_products(p_id, category_id, p_name, price)
	values('85', '30000d', 'fdpants_black', '63000' );
insert into s_products(p_id, category_id, p_name, price)
	values('86', '30000d', 'fdpants_brown', '63000' );
insert into s_products(p_id, category_id, p_name, price)
	values('87', '30000d', 'fdpants_gray', '63000' );

insert into s_products(p_id, category_id, p_name, price)
	values('88', '30000d', 'latrainingpants_black', '50000' );
insert into s_products(p_id, category_id, p_name, price)
	values('89', '30000d', 'latrainingpants_brown', '50000' );
insert into s_products(p_id, category_id, p_name, price)
	values('90', '30000d', 'latrainingpants_purple', '50000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('91', '30000d', 'sweatpants_black', '48000' );
insert into s_products(p_id, category_id, p_name, price)
	values('92', '30000d', 'sweatpants_gray', '48000' );
insert into s_products(p_id, category_id, p_name, price)
	values('93', '30000d', 'sweatpants_white', '48000' );

--########################################Product 입력 구간################################################
--########################################Prodcut 세부 정보 구간###########################################
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('100', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('100', 'image', '/resources/images/productImg/consultation/hood/denverhoodmantoman/denverhoodmantoman_green.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)	
	values('100', 'reviewcount', 23523);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('100', 'quantity', 5896);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('100', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('100', 'color', 'green');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('101', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('101', 'image', '/resources/images/productImg/consultation/hood/denverhoodmantoman/denverhoodmantoman_purple.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('101', 'reviewcount', 5533);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('101', 'quantity', 103);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('101', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('101', 'color', 'purple');
	
--######################################denver hood man to man 구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('102', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('102', 'image', '/resources/images/productImg/consultation/hood/hoodmantoman/hoodmantoman_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('102', 'reviewcount', 567);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('102', 'quantity', 126);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('102', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('102', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('103', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('103', 'image', '/resources/images/productImg/consultation/hood/hoodmantoman/hoodmantoman_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('103', 'reviewcount', 570);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('103', 'quantity', 153);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('103', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('103', 'color', 'white');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('104', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('104', 'image', '/resources/images/productImg/consultation/hood/hoodmantoman/hoodmantomanjumper_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('104', 'reviewcount', 59);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('104', 'quantity', 124);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('104', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('104', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('105', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('105', 'image', '/resources/images/productImg/consultation/hood/hoodmantoman/hoodmantomanjumper_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('105', 'reviewcount', 5159);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('105', 'quantity', 1028);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('105', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('105', 'color', 'white');
	
--############################hood 	mantoman 구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('106', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('106', 'image', '/resources/images/productImg/consultation/hood/nychoodmantoman/nychoodmantoman_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('106', 'reviewcount', 699);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('106', 'quantity', 2012);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('106', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('106', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('107', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('107', 'image', '/resources/images/productImg/consultation/hood/nychoodmantoman/nychoodmantoman_green.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('107', 'reviewcount', 719);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('107', 'quantity', 248);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('107', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('107', 'color', 'green');	

--#######################nyc hood mantoman
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('108', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('108', 'image', '/resources/images/productImg/consultation/longsleeves/angellongsleeve/angellongsleeve_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('108', 'reviewcount', 819);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('108', 'quantity', 433);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('108', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('108', 'color', 'black');		

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('109', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('109', 'image', '/resources/images/productImg/consultation/longsleeves/angellongsleeve/angellongsleeve_darkgray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('109', 'reviewcount', 818);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('109', 'quantity', 462);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('109', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('109', 'color', 'darkgray');		
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('110', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('110', 'image', '/resources/images/productImg/consultation/longsleeves/angellongsleeve/angellongsleeve_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('110', 'reviewcount', 889);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('110', 'quantity', 792);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('110', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('110', 'color', 'white');	
	
--####################angel longsleeve 구간
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('111', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('111', 'image', '/resources/images/productImg/consultation/longsleeves/shinelongsleeve/shinelongsleeve_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('111', 'reviewcount', 919);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('111', 'quantity', 508);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('111', 'size', 110);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('111', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('112', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('112', 'image', '/resources/images/productImg/consultation/longsleeves/shinelongsleeve/shinelongsleeve_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('112', 'reviewcount', 910);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('112', 'quantity', 5438);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('112', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('112', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('113', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('113', 'image', '/resources/images/productImg/consultation/longsleeves/shinelongsleeve/shinelongsleeve_pink.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('113', 'reviewcount', 914);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('113', 'quantity', 564);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('113', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('113', 'color', 'pink');
	
--#######################shinelongsleeve 구간
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('114', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('114', 'image', '/resources/images/productImg/consultation/longsleeves/tntramidustee/tntramidustee_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('114', 'reviewcount', 991);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('114', 'quantity', 454);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('114', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('114', 'color', 'blue');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('115', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('115', 'image', '/resources/images/productImg/consultation/longsleeves/tntramidustee/tntramidustee_orange.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('115', 'reviewcount', 901);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('115', 'quantity', 642);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('115', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('115', 'color', 'orange');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('116', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('116', 'image', '/resources/images/productImg/consultation/longsleeves/tntramidustee/tntramidustee_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('116', 'reviewcount', 902);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('116', 'quantity', 643);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('116', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('116', 'color', 'white');	

--#########################tntramidustee 구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('117', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('117', 'image', '/resources/images/productImg/consultation/mantoman/dogsweatshirt/dogsweatshirt_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('117', 'reviewcount', 903);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('117', 'quantity', 651);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('117', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('117', 'color', 'gray');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('118', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('118', 'image', '/resources/images/productImg/consultation/mantoman/dogsweatshirt/dogsweatshirt_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('118', 'reviewcount', 103);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('118', 'quantity', 541);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('118', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('118', 'color', 'red');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('119', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('119', 'image', '/resources/images/productImg/consultation/mantoman/dogsweatshirt/dogsweatshirt_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('119', 'reviewcount', 104);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('119', 'quantity', 591);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('119', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('119', 'color', 'white');
	
--##################dogsweatshirt 구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('120', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('120', 'image', '/resources/images/productImg/consultation/mantoman/globesweatshirt/globesweatshirt_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('120', 'reviewcount', 18);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('120', 'quantity', 118);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('120', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('120', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('121', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('121', 'image', '/resources/images/productImg/consultation/mantoman/globesweatshirt/globesweatshirt_orange.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('121', 'reviewcount', 109);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('121', 'quantity', 211);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('121', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('121', 'color', 'orange');

--#####################globesweatshirt 구간	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('122', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('122', 'image', '/resources/images/productImg/consultation/mantoman/leonsweatshirt/leonsweatshirt_beige.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('122', 'reviewcount', 117);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('122', 'quantity', 241);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('122', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('122', 'color', 'beige');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('123', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('123', 'image', '/resources/images/productImg/consultation/mantoman/leonsweatshirt/leonsweatshirt_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('123', 'reviewcount', 102);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('123', 'quantity', 249);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('123', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('123', 'color', 'white');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('124', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('124', 'image', '/resources/images/productImg/consultation/mantoman/leonsweatshirt/leonsweatshirt_yellow.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('124', 'reviewcount', 1040);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('124', 'quantity', 531);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('124', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('124', 'color', 'yellow');	

--####################leonsweatshirt구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('125', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('125', 'image', '/resources/images/productImg/consultation/pique/oversizepoloshirt/oversizepoloshirt_darkgray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('125', 'reviewcount', 134);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('125', 'quantity', 319);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('125', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('125', 'color', 'darkgray');		
		
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('126', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('126', 'image', '/resources/images/productImg/consultation/pique/oversizepoloshirt/oversizepoloshirt_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('126', 'reviewcount', 167);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('126', 'quantity', 319);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('126', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('126', 'color', 'gray');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('127', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('127', 'image', '/resources/images/productImg/consultation/pique/oversizepoloshirt/oversizepoloshirt_navy.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('127', 'reviewcount', 169);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('127', 'quantity', 359);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('127', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('127', 'color', 'navy');	
	
--#########################oversizepoloshirt 구간
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('128', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('128', 'image', '/resources/images/productImg/consultation/pique/poloshirt/poloshirt_beige.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('128', 'reviewcount', 869);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('128', 'quantity', 499);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('128', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('128', 'color', 'beige');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('129', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('129', 'image', '/resources/images/productImg/consultation/pique/poloshirt/poloshirt_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('129', 'reviewcount', 267);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('129', 'quantity', 380);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('129', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('129', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('130', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('130', 'image', '/resources/images/productImg/consultation/pique/poloshirt/poloshirt_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('130', 'reviewcount', 189);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('130', 'quantity', 359);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('130', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('130', 'color', 'blue');	
	
--##################################poloshirt 구간
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('131', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('131', 'image', '/resources/images/productImg/consultation/pique/smalllogopoloshirt/smalllogopoloshirt_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)	
	values('131', 'reviewcount', 233);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('131', 'quantity', 587);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('131', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('131', 'color', 'black');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('132', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('132', 'image', '/resources/images/productImg/consultation/pique/smalllogopoloshirt/smalllogopoloshirt_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('132', 'reviewcount', 517);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('132', 'quantity', 186);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('132', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('132', 'color', 'gray');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('133', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('133', 'image', '/resources/images/productImg/consultation/pique/smalllogopoloshirt/smalllogopoloshirt_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('133', 'reviewcount', 172);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('133', 'quantity', 158);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('133', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('133', 'color', 'red');	

--#######################smalllogopoloshirt구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('134', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('134', 'image', '/resources/images/productImg/consultation/shirt/diagonalfrillblouse/diagonalfrillblouse_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('134', 'reviewcount', 89);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('134', 'quantity', 142);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('134', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('134', 'color', 'red');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('135', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('135', 'image', '/resources/images/productImg/consultation/shirt/diagonalfrillblouse/diagonalfrillblouse_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('135', 'reviewcount', 515);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('135', 'quantity', 108);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('135', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('135', 'color', 'white');
	
--############################diagonalfrillblouse구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('136', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('136', 'image', '/resources/images/productImg/consultation/shirt/shortsleevedshirt/shortsleevedshirt_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('136', 'reviewcount', 699);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('136', 'quantity', 202);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('136', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('136', 'color', 'blue');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('137', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('137', 'image', '/resources/images/productImg/consultation/shirt/shortsleevedshirt/shortsleevedshirt_pink.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('137', 'reviewcount', 709);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('137', 'quantity', 249);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('137', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('137', 'color', 'pink');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('138', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('138', 'image', '/resources/images/productImg/consultation/shirt/shortsleevedshirt/shortsleevedshirt_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('138', 'reviewcount', 819);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('138', 'quantity', 533);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('138', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('138', 'color', 'white');		

--##########################shortsleevedshirt 구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('139', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('139', 'image', '/resources/images/productImg/consultation/shirt/vneckblouse/vneckblouse_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('139', 'reviewcount', 816);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('139', 'quantity', 460);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('139', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('139', 'color', 'black');		
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('140', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('140', 'image', '/resources/images/productImg/consultation/shirt/vneckblouse/vneckblouse_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('140', 'reviewcount', 812);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('140', 'quantity', 702);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('140', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('140', 'color', 'blue');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('141', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('141', 'image', '/resources/images/productImg/consultation/shirt/vneckblouse/vneckblouse_sprite.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('141', 'reviewcount', 919);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('141', 'quantity', 508);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('141', 'size', 110);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('141', 'color', 'sprite');
	
--#############################vneckblouse구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('142', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('142', 'image', '/resources/images/productImg/consultation/shortsleeves/twitchtshirt/twitchtshirt_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('142', 'reviewcount', 915);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('142', 'quantity', 528);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('142', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('142', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('143', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('143', 'image', '/resources/images/productImg/consultation/shortsleeves/twitchtshirt/twitchtshirt_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('143', 'reviewcount', 1054);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('143', 'quantity', 504);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('143', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('143', 'color', 'blue');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('144', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('144', 'image', '/resources/images/productImg/consultation/shortsleeves/twitchtshirt/twitchtshirt_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('144', 'reviewcount', 992);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('144', 'quantity', 451);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('144', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('144', 'color', 'white');	
	
--##############################twitchtshirt

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('145', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('145', 'image', '/resources/images/productImg/consultation/shortsleeves/universitytee/universitytee_black&blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('145', 'reviewcount', 905);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('145', 'quantity', 641);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('145', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('145', 'color', 'black&blue');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('146', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('146', 'image', '/resources/images/productImg/consultation/shortsleeves/universitytee/universitytee_black&red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('146', 'reviewcount', 602);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('146', 'quantity', 645);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('146', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('146', 'color', 'black&red');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('147', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('147', 'image', '/resources/images/productImg/consultation/shortsleeves/universitytee/universitytee_white&red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('147', 'reviewcount', 203);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('147', 'quantity', 654);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('147', 'size', 100);
insert into s_product_add_info(p_i	d,product_add_info_type, description)
	values('147', 'color', 'white&red');	
	
--##########################universitytee 구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('148', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('148', 'image', '/resources/images/productImg/consultation/shortsleeves/visionsleeve/visionsleeve_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('148', 'reviewcount', 193);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('148', 'quantity', 540);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('148', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('148', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('149', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('149', 'image', '/resources/images/productImg/consultation/shortsleeves/visionsleeve/visionsleeve_purple.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('149', 'reviewcount', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('149', 'quantity', 590);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('149', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('149', 'color', 'purple');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('150', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('150', 'image', '/resources/images/productImg/consultation/shortsleeves/visionsleeve/visionsleeve_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('150', 'reviewcount', 518);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('150', 'quantity', 117);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('150', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('150', 'color', 'white');
	
--##########################visionsleeve
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('151', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('151', 'image', '/resources/images/productImg/consultation/sleeveless/beachsleeveless/beachsleeveless_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('151', 'reviewcount', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('151', 'quantity', 214);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('151', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('151', 'color', 'black');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('152', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('152', 'image', '/resources/images/productImg/consultation/sleeveless/beachsleeveless/beachsleeveless_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('152', 'reviewcount', 117);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('152', 'quantity', 241);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('152', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('152', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('153', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('153', 'image', '/resources/images/productImg/consultation/sleeveless/beachsleeveless/beachsleeveless_yellow.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('153', 'reviewcount', 82);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('153', 'quantity', 449);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('153', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('153', 'color', 'yellow');	

--#################################beachsleeveless 구간
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('154', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('154', 'image', '/resources/images/productImg/consultation/sleeveless/symbolsleeveless/symbolsleeveless_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('154', 'reviewcount', 800);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('154', 'quantity', 538);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('154', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('154', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('155', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('155', 'image', '/resources/images/productImg/consultation/sleeveless/symbolsleeveless/symbolsleeveless_lime.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('155', 'reviewcount', 134);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('155', 'quantity', 321);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('155', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('155', 'color', 'lime');		
		
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('156', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('156', 'image', '/resources/images/productImg/consultation/sleeveless/symbolsleeveless/symbolsleeveless_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('156', 'reviewcount', 267);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('156', 'quantity', 399);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('156', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('156', 'color', 'white');	
	
--#######################symbolsleeveless 구간
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('157', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('157', 'image', '/resources/images/productImg/consultation/sleeveless/womenssleeveless/womenssleeveless_pink.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('157', 'reviewcount', 160);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('157', 'quantity', 329);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('157', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('157', 'color', 'pink');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('158', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('158', 'image', '/resources/images/productImg/consultation/sleeveless/womenssleeveless/womenssleeveless_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('158', 'reviewcount', 849);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('158', 'quantity', 409);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('158', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('158', 'color', 'white');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('159', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('159', 'image', '/resources/images/productImg/consultation/sleeveless/womenssleeveless/womenssleeveless_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('159', 'reviewcount', 217);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('159', 'quantity', 389);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('159', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('159', 'color', 'black');	
	
--#########################womenssleeveless 구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('160', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('160', 'image', '/resources/images/productImg/consultation/sweater/cashmeresweater/cashmeresweater_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('160', 'reviewcount', 162);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('160', 'quantity', 369);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('160', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('160', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('161', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('161', 'image', '/resources/images/productImg/consultation/sweater/cashmeresweater/cashmeresweater_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('161', 'reviewcount', 5593);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('161', 'quantity', 19);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('161', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('161', 'color', 'brown');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('162', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('162', 'image', '/resources/images/productImg/consultation/sweater/cashmeresweater/cashmeresweater_darkblue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('162', 'reviewcount', 567);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('162', 'quantity', 126);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('162', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('162', 'color', 'darkblue');

--######################################cashmeresweater 구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('163', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('163', 'image', '/resources/images/productImg/consultation/sweater/polonecksweater/polonecksweater_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('163', 'reviewcount', 570);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('163', 'quantity', 153);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('163', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('163', 'color', 'black');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('164', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('164', 'image', '/resources/images/productImg/consultation/sweater/polonecksweater/polonecksweater_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('164', 'reviewcount', 601);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('164', 'quantity', 704);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('164', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('164', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('165', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('165', 'image', '/resources/images/productImg/consultation/sweater/polonecksweater/polonecksweater_lime.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('165', 'reviewcount', 5159);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('165', 'quantity', 1028);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('165', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('165', 'color', 'lime');
	
--############################polonecksweater 구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('166', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('166', 'image', '/resources/images/productImg/consultation/sweater/stripesweater/stripesweater_beige.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('166', 'reviewcount', 699);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('166', 'quantity', 2012);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('166', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('166', 'color', 'beige');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('167', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('167', 'image', '/resources/images/productImg/consultation/sweater/stripesweater/stripesweater_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('167', 'reviewcount', 749);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('167', 'quantity', 218);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('167', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('167', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('168', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('168', 'image', '/resources/images/productImg/consultation/sweater/stripesweater/stripesweater_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('168', 'reviewcount', 839);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('168', 'quantity', 431);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('168', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('168', 'color', 'red');	





--#############################3야구모자 구간
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
	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('7', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('7', 'image', '/resources/images/productImg/hat/baseballcap/colorballcap/colorballcap_bluegreen.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('7', 'reviewcount', 563);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('7', 'quantity', 120);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('7', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('7', 'color', 'red');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('8', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('8', 'image', '/resources/images/productImg/hat/baseballcap/ladodgers/ladodgers_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('8', 'reviewcount', 569);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('8', 'quantity', 152);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('8', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('8', 'color', 'blue');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('9', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('9', 'image', '/resources/images/productImg/hat/baseballcap/ladodgers/ladodgers_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('9', 'reviewcount', 559);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('9', 'quantity', 122);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('9', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('9', 'color', 'red');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('10', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('10', 'image', '/resources/images/productImg/hat/baseballcap/ladodgers/ladodgers_yellow.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('10', 'reviewcount', 519);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('10', 'quantity', 102);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('10', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('10', 'color', 'yellow');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('11', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('11', 'image', '/resources/images/productImg/hat/baseballcap/legacyballcap/legacyballcap_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('11', 'reviewcount', 599);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('11', 'quantity', 202);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('11', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('11', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('12', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('12', 'image', '/resources/images/productImg/hat/baseballcap/legacyballcap/legacyballcap_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('12', 'reviewcount', 729);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('12', 'quantity', 242);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('12', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('12', 'color', 'brown');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('13', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('13', 'image', '/resources/images/productImg/hat/baseballcap/legacyballcap/legacyballcap_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('13', 'reviewcount', 829);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('13', 'quantity', 442);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('13', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('13', 'color', 'white');		
--##################################### beanie구간
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('14', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('14', 'image', '/resources/images/productImg/hat/beanie/logobini/logobini_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('14', 'reviewcount', 819);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('14', 'quantity', 462);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('14', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('14', 'color', 'black');		
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('15', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('15', 'image', '/resources/images/productImg/hat/beanie/logobini/logobini_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('15', 'reviewcount', 389);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('15', 'quantity', 762);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('15', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('15', 'color', 'blue');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('16', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('16', 'image', '/resources/images/productImg/hat/beanie/logobini/logobini_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('16', 'reviewcount', 999);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('16', 'quantity', 502);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('16', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('16', 'color', 'red');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('17', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('17', 'image', '/resources/images/productImg/hat/beanie/shortbeanie/shortbeanie_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('17', 'reviewcount', 997);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('17', 'quantity', 543);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('17', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('17', 'color', 'brown');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('18', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('18', 'image', '/resources/images/productImg/hat/beanie/shortbeanie/shortbeanie_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('18', 'reviewcount', 996);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('18', 'quantity', 544);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('18', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('18', 'color', 'gray');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('19', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('19', 'image', '/resources/images/productImg/hat/beanie/shortbeanie/shortbeanie_purple.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('19', 'reviewcount', 991);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('19', 'quantity', 444);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('19', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('19', 'color', 'purple');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('20', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('20', 'image', '/resources/images/productImg/hat/beanie/stickcap/stickcap_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('20', 'reviewcount', 901);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('20', 'quantity', 644);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('20', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('20', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('21', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('21', 'image', '/resources/images/productImg/hat/beanie/stickcap/stickcap_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('21', 'reviewcount', 902);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('21', 'quantity', 643);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('21', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('21', 'color', 'brown');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('22', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('22', 'image', '/resources/images/productImg/hat/beanie/stickcap/stickcap_navy.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('22', 'reviewcount', 903);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('22', 'quantity', 641);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('22', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('22', 'color', 'navy');	
	
	--####################### 베레모 구간#################################################
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('340', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('340', 'image', '/resources/images/productImg/hat/beret/huntingberet/huntingberet_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('340', 'reviewcount', 103);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('340', 'quantity', 541);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('340', 'size', 40);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('340', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('23', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('23', 'image', '/resources/images/productImg/hat/beret/huntingberet/huntingberet_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('23', 'reviewcount', 104);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('23', 'quantity', 591);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('23', 'size', 40);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('23', 'color', 'red');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('24', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('24', 'image', '/resources/images/productImg/hat/beret/huntingberet/huntingberet_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('24', 'reviewcount', 108);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('24', 'quantity', 111);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('24', 'size', 40);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('24', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('325', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('325', 'image', '/resources/images/productImg/hat/beret/oxfordberet/oxfordberet_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('325', 'reviewcount', 1089);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('325', 'quantity', 1121);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('325', 'size', 40);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('325', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('326', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('326', 'image', '/resources/images/productImg/hat/beret/oxfordberet/oxfordberet_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('326', 'reviewcount', 1099);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('326', 'quantity', 1122);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('326', 'size', 40);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('326', 'color', 'blue');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('327', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('327', 'image', '/resources/images/productImg/hat/beret/oxfordberet/oxfordberet_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('327', 'reviewcount', 1097);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('327', 'quantity', 1162);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('327', 'size', 40);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('327', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('328', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('328', 'image', '/resources/images/productImg/hat/beret/woolberet/woolberet_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('328', 'reviewcount', 1597);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('328', 'quantity', 1362);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('328', 'size', 40);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('328', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('329', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('329', 'image', '/resources/images/productImg/hat/beret/woolberet/woolberet_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('329', 'reviewcount', 1899);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('329', 'quantity', 1862);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('329', 'size', 40);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('329', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('330', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('330', 'image', '/resources/images/productImg/hat/beret/woolberet/woolberet_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('330', 'reviewcount', 6597);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('330', 'quantity', 1662);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('330', 'size', 40);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('330', 'color', 'red');
	
--#####################################페도라 구간	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('25', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('25', 'image', '/resources/images/productImg/hat/fedora/classicfedora/classicfedora_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('25', 'reviewcount', 109);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('25', 'quantity', 211);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('25', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('25', 'color', 'black');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('26', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('26', 'image', '/resources/images/productImg/hat/fedora/classicfedora/classicfedora_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('26', 'reviewcount', 117);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('26', 'quantity', 241);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('26', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('26', 'color', 'red');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('27', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('27', 'image', '/resources/images/productImg/hat/fedora/classicfedora/classicfedora_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('27', 'reviewcount', 112);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('27', 'quantity', 243);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('27', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('27', 'color', 'brown');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('28', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('28', 'image', '/resources/images/productImg/hat/fedora/knitfedora/knitfedora_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('28', 'reviewcount', 104);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('28', 'quantity', 303);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('28', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('28', 'color', 'brown');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('29', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('29', 'image', '/resources/images/productImg/hat/fedora/knitfedora/knitfedora_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('29', 'reviewcount', 117);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('29', 'quantity', 313);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('29', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('29', 'color', 'white');		
		
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('30', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('30', 'image', '/resources/images/productImg/hat/fedora/knitfedora/knitfedora_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('30', 'reviewcount', 167);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('30', 'quantity', 317);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('30', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('30', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('31', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('31', 'image', '/resources/images/productImg/hat/fedora/originalfedora/originalfedora_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('31', 'reviewcount', 168);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('31', 'quantity', 319);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('31', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('31', 'color', 'brown');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('32', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('32', 'image', '/resources/images/productImg/hat/fedora/originalfedora/originalfedora_brownred.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('32', 'reviewcount', 868);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('32', 'quantity', 479);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('32', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('32', 'color', 'brownred');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('33', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('33', 'image', '/resources/images/productImg/hat/fedora/originalfedora/originalfedora_brownwhite.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('33', 'reviewcount', 864);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('33', 'quantity', 474);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('33', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('33', 'color', 'brownwhite');
--#################################기타모자 구간
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('34', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('34', 'image', '/resources/images/productImg/hat/otherhats/flowervisor/flowervisor_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('34', 'reviewcount', 874);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('34', 'quantity', 604);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('34', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('34', 'color', 'blue');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('35', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('35', 'image', '/resources/images/productImg/hat/otherhats/flowervisor/flowervisor_green.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('35', 'reviewcount', 875);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('35', 'quantity', 603);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('35', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('35', 'color', 'green');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('36', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('36', 'image', '/resources/images/productImg/hat/otherhats/flowervisor/flowervisor_orange.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('36', 'reviewcount', 879);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('36', 'quantity', 693);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('36', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('36', 'color', 'orange');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('37', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('37', 'image', '/resources/images/productImg/hat/otherhats/rafiafedora/rafiafedora_beige.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('37', 'reviewcount', 880);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('37', 'quantity', 694);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('37', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('37', 'color', 'beige');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('38', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('38', 'image', '/resources/images/productImg/hat/otherhats/rafiafedora/rafiafedora_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('38', 'reviewcount', 884);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('38', 'quantity', 6914);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('38', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('38', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('39', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('39', 'image', '/resources/images/productImg/hat/otherhats/rafiafedora/rafiafedora_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('39', 'reviewcount', 8834);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('39', 'quantity', 6911);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('39', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('39', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('40', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('40', 'image', '/resources/images/productImg/hat/otherhats/visor/visor_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('40', 'reviewcount', 1834);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('40', 'quantity', 6901);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('40', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('40', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('41', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('41', 'image', '/resources/images/productImg/hat/otherhats/visor/visor_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('41', 'reviewcount', 1534);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('41', 'quantity', 6902);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('41', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('41', 'color', 'blue');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('42', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('42', 'image', '/resources/images/productImg/hat/otherhats/visor/visor_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('42', 'reviewcount', 6834);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('42', 'quantity', 6904);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('42', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('42', 'color', 'red');
--##################################트루퍼 모자 구간
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('43', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('43', 'image', '/resources/images/productImg/hat/trooper/fishtrooper/fishtrooper_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('43', 'reviewcount', 3854);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('43', 'quantity', 9064);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('43', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('43', 'color', 'blue');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('44', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('44', 'image', '/resources/images/productImg/hat/trooper/fishtrooper/fishtrooper_khaki.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('44', 'reviewcount', 354);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('44', 'quantity', 964);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('44', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('44', 'color', 'khaki');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('45', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('45', 'image', '/resources/images/productImg/hat/trooper/fishtrooper/fishtrooper_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('45', 'reviewcount', 3594);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('45', 'quantity', 9964);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('45', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('45', 'color', 'red');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('46', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('46', 'image', '/resources/images/productImg/hat/trooper/steentrooper/steentrooper_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('46', 'reviewcount', 1359);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('46', 'quantity', 8464);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('46', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('46', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('47', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('47', 'image', '/resources/images/productImg/hat/trooper/steentrooper/steentrooper_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('47', 'reviewcount', 2359);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('47', 'quantity', 8414);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('47', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('47', 'color', 'brown');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('48', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('48', 'image', '/resources/images/productImg/hat/trooper/steentrooper/steentrooper_green.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('48', 'reviewcount', 1369);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('48', 'quantity', 8465);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('48', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('48', 'color', 'green');	






insert into s_product_add_info(p_id,product_add_info_type, description)
	values('200', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('200', 'image', '/resources/images/productImg/shoes/sandals,slippers,boots/flipflops/flipflops_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('200', 'reviewcount', 1400);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('200', 'quantity', 8471);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('200', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('200', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('201', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('201', 'image', '/resources/images/productImg/shoes/sandals,slippers,boots/flipflops/flipflops_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('201', 'reviewcount', 1401);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('201', 'quantity', 8472);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('201', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('201', 'color', 'brown');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('202', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('202', 'image', '/resources/images/productImg/shoes/sandals,slippers,boots/flipflops/flipflops_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('202', 'reviewcount', 1402);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('202', 'quantity', 8473);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('202', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('202', 'color', 'white');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('203', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('203', 'image', '/resources/images/productImg/shoes/sandals,slippers,boots/rainboots/rainboots_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('203', 'reviewcount', 1403);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('203', 'quantity', 8474);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('203', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('203', 'color', 'black');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('204', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('204', 'image', '/resources/images/productImg/shoes/sandals,slippers,boots/rainboots/rainboots_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('204', 'reviewcount', 1404);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('204', 'quantity', 8475);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('204', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('204', 'color', 'brown');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('205', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('205', 'image', '/resources/images/productImg/shoes/sandals,slippers,boots/rainboots/rainboots_khaki.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('205', 'reviewcount', 1405);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('205', 'quantity', 8476);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('205', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('205', 'color', 'khaki');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('206', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('206', 'image', '/resources/images/productImg/shoes/sandals,slippers,boots/sandals/sandals_black45.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('206', 'reviewcount', 1406);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('206', 'quantity', 8477);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('206', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('206', 'color', 'black45');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('207', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('207', 'image', '/resources/images/productImg/shoes/sandals,slippers,boots/sandals/sandals_black90.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('207', 'reviewcount', 1407);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('207', 'quantity', 8478);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('207', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('207', 'color', 'black90');		
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('208', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('208', 'image', '/resources/images/productImg/shoes/sandals,slippers,boots/sandals/sandals_black180.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('208', 'reviewcount', 1408);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('208', 'quantity', 8479);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('208', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('208', 'color', 'black180');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('209', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('209', 'image', '/resources/images/productImg/shoes/shoes/basement/basement_00.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('209', 'reviewcount', 1409);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('209', 'quantity', 8480);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('209', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('209', 'color', '00');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('210', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('210', 'image', '/resources/images/productImg/shoes/shoes/basement/basement_30.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('210', 'reviewcount', 1410);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('210', 'quantity', 8481);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('210', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('210', 'color', '30');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('211', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('211', 'image', '/resources/images/productImg/shoes/shoes/basement/basement_45.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('211', 'reviewcount', 1411);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('211', 'quantity', 8482);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('211', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('211', 'color', '45');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('212', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('212', 'image', '/resources/images/productImg/shoes/shoes/comandosol/comandosol_00.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('212', 'reviewcount', 1412);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('212', 'quantity', 8483);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('212', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('212', 'color', '00');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('213', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('213', 'image', '/resources/images/productImg/shoes/shoes/comandosol/comandosol_30.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('213', 'reviewcount', 1413);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('213', 'quantity', 8484);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('213', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('213', 'color', '30');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('214', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('214', 'image', '/resources/images/productImg/shoes/shoes/comandosol/comandosol_90.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('214', 'reviewcount', 1414);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('214', 'quantity', 8485);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('214', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('214', 'color', '90');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('215', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('215', 'image', '/resources/images/productImg/shoes/shoes/derbyshoes/derbyshoes_45.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('215', 'reviewcount', 1414);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('215', 'quantity', 8485);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('215', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('215', 'color', '45');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('216', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('216', 'image', '/resources/images/productImg/shoes/shoes/derbyshoes/derbyshoes_90.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('216', 'reviewcount', 1415);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('216', 'quantity', 8486);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('216', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('216', 'color', '90');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('217', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('217', 'image', '/resources/images/productImg/shoes/shoes/derbyshoes/derbyshoes_180.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('217', 'reviewcount', 1416);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('217', 'quantity', 8487);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('217', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('217', 'color', '180');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('218', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('218', 'image', '/resources/images/productImg/shoes/sneakers/allstarshoes/allstarshoes_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('218', 'reviewcount', 1417);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('218', 'quantity', 8488);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('218', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('218', 'color', 'red');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('219', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('219', 'image', '/resources/images/productImg/shoes/sneakers/allstarshoes/allstarshoes_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('219', 'reviewcount', 1418);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('219', 'quantity', 8489);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('219', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('219', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('220', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('220', 'image', '/resources/images/productImg/shoes/sneakers/allstarshoes/allstarshoes_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('220', 'reviewcount', 1419);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('220', 'quantity', 8490);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('220', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('220', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('221', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('221', 'image', '/resources/images/productImg/shoes/sneakers/authenticshoes/authenticshoes_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('221', 'reviewcount', 1420);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('221', 'quantity', 8491);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('221', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('221', 'color', 'black');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('222', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('222', 'image', '/resources/images/productImg/shoes/sneakers/authenticshoes/authenticshoes_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('222', 'reviewcount', 1421);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('222', 'quantity', 8492);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('222', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('222', 'color', 'blue');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('223', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('223', 'image', '/resources/images/productImg/shoes/sneakers/authenticshoes/authenticshoes_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('223', 'reviewcount', 1421);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('223', 'quantity', 8492);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('223', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('223', 'color', 'red');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('224', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('224', 'image', '/resources/images/productImg/shoes/sneakers/nyshoes/nyshoes_white1.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('224', 'reviewcount', 1422);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('224', 'quantity', 8493);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('224', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('224', 'color', 'white1');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('225', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('225', 'image', '/resources/images/productImg/shoes/sneakers/nyshoes/nyshoes_white2.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('225', 'reviewcount', 1423);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('225', 'quantity', 8494);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('225', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('225', 'color', 'white2');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('226', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('226', 'image', '/resources/images/productImg/shoes/sneakers/nyshoes/nyshoes_white3.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('226', 'reviewcount', 1424);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('226', 'quantity', 8495);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('226', 'size', 260);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('226', 'color', 'white3');	
	





--########################pants	 leggings	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('49', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('49', 'image', '/resources/images/productImg/pants/leggings/barrelfitleggings/barrelfitleggings_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('49', 'reviewcount', 1399);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('49', 'quantity', 8469);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('49', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('49', 'color', 'black');		

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('50', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('50', 'image', '/resources/images/productImg/pants/leggings/barrelfitleggings/barrelfitleggings_deepblue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('50', 'reviewcount', 1599);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('50', 'quantity', 8869);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('50', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('50', 'color', 'deepblue');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('51', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('51', 'image', '/resources/images/productImg/pants/leggings/barrelfitleggings/barrelfitleggings_deeppurple.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('51', 'reviewcount', 2599);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('51', 'quantity', 6869);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('51', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('51', 'color', 'deeppurple');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('52', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('52', 'image', '/resources/images/productImg/pants/leggings/dailyleggings/dailyleggings_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('52', 'reviewcount', 2779);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('52', 'quantity', 6179);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('52', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('52', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('53', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('53', 'image', '/resources/images/productImg/pants/leggings/dailyleggings/dailyleggings_grey.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('53', 'reviewcount', 5779);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('53', 'quantity', 5179);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('53', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('53', 'color', 'grey');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('54', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('54', 'image', '/resources/images/productImg/pants/leggings/dailyleggings/dailyleggings_ivory.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('54', 'reviewcount', 1979);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('54', 'quantity', 2074);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('54', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('54', 'color', 'ivory');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('55', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('55', 'image', '/resources/images/productImg/pants/leggings/highwaistleggings/highwaistleggings_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('55', 'reviewcount', 1579);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('55', 'quantity', 1327);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('55', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('55', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('56', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('56', 'image', '/resources/images/productImg/pants/leggings/highwaistleggings/highwaistleggings_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('56', 'reviewcount', 8439);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('56', 'quantity', 9327);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('56', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('56', 'color', 'blue');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('57', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('57', 'image', '/resources/images/productImg/pants/leggings/highwaistleggings/highwaistleggings_pink.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('57', 'reviewcount', 5579);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('57', 'quantity', 1127);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('57', 'size', 45);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('57', 'color', 'pink');
--###############################0a pants
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('58', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('58', 'image', '/resources/images/productImg/pants/pants/cottonfit/cottonfit_beige.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('58', 'reviewcount', 2979);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('58', 'quantity', 2727);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('58', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('58', 'color', 'beige');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('59', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('59', 'image', '/resources/images/productImg/pants/pants/cottonfit/cottonfit_khaki.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('59', 'reviewcount', 3279);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('59', 'quantity', 3727);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('59', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('59', 'color', 'khaki');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('60', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('60', 'image', '/resources/images/productImg/pants/pants/cottonfit/cottonfit_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('60', 'reviewcount', 6979);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('60', 'quantity', 2767);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('60', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('60', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('61', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('61', 'image', '/resources/images/productImg/pants/pants/taperedpants/taperedpants_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('61', 'reviewcount', 6970);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('61', 'quantity', 2067);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('61', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('61', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('62', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('62', 'image', '/resources/images/productImg/pants/pants/taperedpants/taperedpants_beige.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('62', 'reviewcount', 6900);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('62', 'quantity', 2007);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('62', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('62', 'color', 'beige');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('63', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('63', 'image', '/resources/images/productImg/pants/pants/taperedpants/taperedpants_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('63', 'reviewcount', 6909);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('63', 'quantity', 2707);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('63', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('63', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('64', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('64', 'image', '/resources/images/productImg/pants/pants/widepants/widepants_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('64', 'reviewcount', 1009);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('64', 'quantity', 4000);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('64', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('64', 'color', 'black');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('65', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('65', 'image', '/resources/images/productImg/pants/pants/widepants/widepants_khaki.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('65', 'reviewcount', 1019);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('65', 'quantity', 4001);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('65', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('65', 'color', 'khaki');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('66', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('66', 'image', '/resources/images/productImg/pants/pants/widepants/widepants_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('66', 'reviewcount', 1017);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('66', 'quantity', 4002);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('66', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('66', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('67', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('67', 'image', '/resources/images/productImg/pants/slacks/convinceslacks/convinceslacks_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('67', 'reviewcount', 101);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('67', 'quantity', 4003);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('67', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('67', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('68', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('68', 'image', '/resources/images/productImg/pants/slacks/convinceslacks/convinceslacks_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('68', 'reviewcount', 1401);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('68', 'quantity', 4004);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('68', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('68', 'color', 'gray');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('69', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('69', 'image', '/resources/images/productImg/pants/slacks/convinceslacks/convinceslacks_charcoalgray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('69', 'reviewcount', 1402);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('69', 'quantity', 4005);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('69', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('69', 'color', 'charcoalgray');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('70', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('70', 'image', '/resources/images/productImg/pants/slacks/nylonpants/nylonpants_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('70', 'reviewcount', 1403);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('70', 'quantity', 4006);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('70', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('70', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('71', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('71', 'image', '/resources/images/productImg/pants/slacks/nylonpants/nylonpants_darkbrown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('71', 'reviewcount', 1404);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('71', 'quantity', 4007);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('71', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('71', 'color', 'darkbrown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('72', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('72', 'image', '/resources/images/productImg/pants/slacks/nylonpants/nylonpants_khaki.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('72', 'reviewcount', 1405);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('72', 'quantity', 4008);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('72', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('72', 'color', 'khaki');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('73', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('73', 'image', '/resources/images/productImg/pants/slacks/wideslacks/wideslacks_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('73', 'reviewcount', 1406);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('73', 'quantity', 4009);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('73', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('73', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('74', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('74', 'image', '/resources/images/productImg/pants/slacks/wideslacks/wideslacks_darkbrown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('74', 'reviewcount', 1407);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('74', 'quantity', 4010);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('74', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('74', 'color', 'darkbrown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('75', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('75', 'image', '/resources/images/productImg/pants/slacks/wideslacks/wideslacks_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('75', 'reviewcount', 1408);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('75', 'quantity', 4011);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('75', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('75', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('76', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('76', 'image', '/resources/images/productImg/pants/suit/bandedslacks/bandedslacks_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('76', 'reviewcount', 1409);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('76', 'quantity', 4012);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('76', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('76', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('77', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('77', 'image', '/resources/images/productImg/pants/suit/bandedslacks/bandedslacks_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('77', 'reviewcount', 1410);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('77', 'quantity', 4013);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('77', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('77', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('78', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('78', 'image', '/resources/images/productImg/pants/suit/bandedslacks/bandedslacks_lightgrey.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('78', 'reviewcount', 1411);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('78', 'quantity', 4015);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('78', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('78', 'color', 'lightgrey');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('79', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('79', 'image', '/resources/images/productImg/pants/suit/bandingsetuppants/bandingsetuppants_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('79', 'reviewcount', 1412);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('79', 'quantity', 4016);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('79', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('79', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('80', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('80', 'image', '/resources/images/productImg/pants/suit/bandingsetuppants/bandingsetuppants_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('80', 'reviewcount', 1413);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('80', 'quantity', 4017);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('80', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('80', 'color', 'gray');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('81', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('81', 'image', '/resources/images/productImg/pants/suit/bandingsetuppants/bandingsetuppants_khaki.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('81', 'reviewcount', 1414);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('81', 'quantity', 4018);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('81', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('81', 'color', 'khaki');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('82', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('82', 'image', '/resources/images/productImg/pants/suit/belieftrauser/belieftrauser_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('82', 'reviewcount', 1415);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('82', 'quantity', 4019);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('82', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('82', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('83', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('83', 'image', '/resources/images/productImg/pants/suit/belieftrauser/belieftrauser_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('83', 'reviewcount', 1416);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('83', 'quantity', 4020);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('83', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('83', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('84', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('84', 'image', '/resources/images/productImg/pants/suit/belieftrauser/belieftrauser_darkbrown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('84', 'reviewcount', 1418);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('84', 'quantity', 4023);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('84', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('84', 'color', 'darkbrown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('85', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('85', 'image', '/resources/images/productImg/pants/training/fdpants/fdpants_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('85', 'reviewcount', 1419);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('85', 'quantity', 4024);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('85', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('85', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('86', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('86', 'image', '/resources/images/productImg/pants/training/fdpants/fdpants_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('86', 'reviewcount', 1420);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('86', 'quantity', 4025);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('86', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('86', 'color', 'brown');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('87', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('87', 'image', '/resources/images/productImg/pants/training/fdpants/fdpants_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('87', 'reviewcount', 1421);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('87', 'quantity', 4026);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('87', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('87', 'color', 'gray');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('88', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('88', 'image', '/resources/images/productImg/pants/training/latrainingpants/latrainingpants_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('88', 'reviewcount', 1422);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('88', 'quantity', 4027);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('88', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('88', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('89', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('89', 'image', '/resources/images/productImg/pants/training/latrainingpants/latrainingpants_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('89', 'reviewcount', 1423);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('89', 'quantity', 4028);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('89', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('89', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('90', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('90', 'image', '/resources/images/productImg/pants/training/latrainingpants/latrainingpants_purple.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('90', 'reviewcount', 1424);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('90', 'quantity', 4029);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('90', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('90', 'color', 'purple');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('91', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('91', 'image', '/resources/images/productImg/pants/training/sweatpants/sweatpants_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('91', 'reviewcount', 1425);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('91', 'quantity', 4030);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('91', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('91', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('92', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('92', 'image', '/resources/images/productImg/pants/training/sweatpants/sweatpants_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('92', 'reviewcount', 1426);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('92', 'quantity', 4031);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('92', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('92', 'color', 'gray');		
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('93', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('93', 'image', '/resources/images/productImg/pants/training/sweatpants/sweatpants_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('93', 'reviewcount', 1427);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('93', 'quantity', 4032);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('93', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('93', 'color', 'white');	




--모자는 45~65까지 사이즈마다 있는색깔 다 반영. 바지 90 ~ 120, 상의 90 ~ 110 신발 260 ~ 280  




	
	
	
	
	
	
	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('227', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('227', 'image', '/resources/images/productImg/outer/cardigan/angelcardigan/angelcardigan_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('227', 'reviewcount', 1425);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('227', 'quantity', 8496);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('227', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('227', 'color', 'black');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('228', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('228', 'image', '/resources/images/productImg/outer/cardigan/angelcardigan/angelcardigan_grey.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('228', 'reviewcount', 1426);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('228', 'quantity', 8497);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('228', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('228', 'color', 'grey');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('229', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('229', 'image', '/resources/images/productImg/outer/cardigan/angelcardigan/angelcardigan_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('229', 'reviewcount', 1427);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('229', 'quantity', 8498);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('229', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('229', 'color', 'white');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('230', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('230', 'image', '/resources/images/productImg/outer/cardigan/basecardigan/basecardigan_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('230', 'reviewcount', 1428);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('230', 'quantity', 8499);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('230', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('230', 'color', 'black');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('231', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('231', 'image', '/resources/images/productImg/outer/cardigan/basecardigan/basecardigan_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('231', 'reviewcount', 1429);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('231', 'quantity', 8500);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('231', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('231', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('232', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('232', 'image', '/resources/images/productImg/outer/cardigan/basecardigan/basecardigan_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('232', 'reviewcount', 1430);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('232', 'quantity', 8501);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('232', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('232', 'color', 'gray');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('233', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('233', 'image', '/resources/images/productImg/outer/cardigan/zipupcardigan/zipupcardigan_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('233', 'reviewcount', 1430);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('233', 'quantity', 8501);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('233', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('233', 'color', 'blue');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('234', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('234', 'image', '/resources/images/productImg/outer/cardigan/zipupcardigan/zipupcardigan_green.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('234', 'reviewcount', 1431);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('234', 'quantity', 8502);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('234', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('234', 'color', 'green');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('235', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('235', 'image', '/resources/images/productImg/outer/cardigan/zipupcardigan/zipupcardigan_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('235', 'reviewcount', 1432);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('235', 'quantity', 8503);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('235', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('235', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('236', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('236', 'image', '/resources/images/productImg/outer/hoodzipup/jacketsmoke/jacketsmoke_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('236', 'reviewcount', 1433);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('236', 'quantity', 8504);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('236', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('236', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('237', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('237', 'image', '/resources/images/productImg/outer/hoodzipup/jacketsmoke/jacketsmoke_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('237', 'reviewcount', 1434);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('237', 'quantity', 8505);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('237', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('237', 'color', 'gray');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('238', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('238', 'image', '/resources/images/productImg/outer/hoodzipup/jacketsmoke/jacketsmoke_khaki.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('238', 'reviewcount', 1435);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('238', 'quantity', 8506);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('238', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('238', 'color', 'khaki');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('239', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('239', 'image', '/resources/images/productImg/outer/hoodzipup/steve/steve_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('239', 'reviewcount', 1436);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('239', 'quantity', 8507);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('239', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('239', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('240', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('240', 'image', '/resources/images/productImg/outer/hoodzipup/steve/steve_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('240', 'reviewcount', 1437);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('240', 'quantity', 8508);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('240', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('240', 'color', 'gray');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('241', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('241', 'image', '/resources/images/productImg/outer/hoodzipup/steve/steve_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('241', 'reviewcount', 1438);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('241', 'quantity', 8509);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('241', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('241', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('242', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('242', 'image', '/resources/images/productImg/outer/hoodzipup/trainingzipup/trainingzipup_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('242', 'reviewcount', 1439);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('242', 'quantity', 8510);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('242', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('242', 'color', 'black');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('243', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('243', 'image', '/resources/images/productImg/outer/hoodzipup/trainingzipup/trainingzipup_purple.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('243', 'reviewcount', 1440);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('243', 'quantity', 8511);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('243', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('243', 'color', 'purple');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('244', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('244', 'image', '/resources/images/productImg/outer/hoodzipup/trainingzipup/trainingzipup_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('244', 'reviewcount', 1441);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('244', 'quantity', 8512);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('244', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('244', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('245', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('245', 'image', '/resources/images/productImg/outer/inbetweenseasonscoat/frenchcoat/frenchcoat_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('245', 'reviewcount', 1442);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('245', 'quantity', 8513);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('245', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('245', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('246', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('246', 'image', '/resources/images/productImg/outer/inbetweenseasonscoat/frenchcoat/frenchcoat_green.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('246', 'reviewcount', 1443);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('246', 'quantity', 8514);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('246', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('246', 'color', 'green');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('247', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('247', 'image', '/resources/images/productImg/outer/inbetweenseasonscoat/frenchcoat/frenchcoat_sand.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('247', 'reviewcount', 1444);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('247', 'quantity', 8515);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('247', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('247', 'color', 'sand');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('248', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('248', 'image', '/resources/images/productImg/outer/inbetweenseasonscoat/nellicoat/nellicoat_beige.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('248', 'reviewcount', 1445);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('248', 'quantity', 8516);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('248', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('248', 'color', 'beige');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('249', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('249', 'image', '/resources/images/productImg/outer/inbetweenseasonscoat/nellicoat/nellicoat_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('249', 'reviewcount', 1446);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('249', 'quantity', 8517);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('249', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('249', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('250', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('250', 'image', '/resources/images/productImg/outer/inbetweenseasonscoat/nellicoat/nellicoat_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('250', 'reviewcount', 1447);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('250', 'quantity', 8518);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('250', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('250', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('251', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('251', 'image', '/resources/images/productImg/outer/inbetweenseasonscoat/woolcoat/woolcoat_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('251', 'reviewcount', 1448);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('251', 'quantity', 8519);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('251', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('251', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('252', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('252', 'image', '/resources/images/productImg/outer/inbetweenseasonscoat/woolcoat/woolcoat_green.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('252', 'reviewcount', 1449);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('252', 'quantity', 8520);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('252', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('252', 'color', 'green');

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('253', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('253', 'image', '/resources/images/productImg/outer/inbetweenseasonscoat/woolcoat/woolcoat_pink.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('253', 'reviewcount', 1450);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('253', 'quantity', 8521);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('253', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('253', 'color', 'pink');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('254', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('254', 'image', '/resources/images/productImg/outer/wintercoat/maxidoublecoat/maxidoublecoat_charcoal.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('254', 'reviewcount', 1451);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('254', 'quantity', 8522);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('254', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('254', 'color', 'charcoal');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('255', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('255', 'image', '/resources/images/productImg/outer/wintercoat/maxidoublecoat/maxidoublecoat_beige.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('255', 'reviewcount', 1452);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('255', 'quantity', 8523);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('255', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('255', 'color', 'beige');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('256', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('256', 'image', '/resources/images/productImg/outer/wintercoat/maxidoublecoat/maxidoublecoat_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('256', 'reviewcount', 1453);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('256', 'quantity', 8524);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('256', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('256', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('257', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('257', 'image', '/resources/images/productImg/outer/wintercoat/minimalshortcoat/minimalshortcoat_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('257', 'reviewcount', 1454);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('257', 'quantity', 8525);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('257', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('257', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('258', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('258', 'image', '/resources/images/productImg/outer/wintercoat/minimalshortcoat/minimalshortcoat_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('258', 'reviewcount', 1455);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('258', 'quantity', 8526);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('258', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('258', 'color', 'brown');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('259', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('259', 'image', '/resources/images/productImg/outer/wintercoat/minimalshortcoat/minimalshortcoat_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('259', 'reviewcount', 1456);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('259', 'quantity', 8527);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('259', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('259', 'color', 'white');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('260', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('260', 'image', '/resources/images/productImg/outer/wintercoat/singlecoat/singlecoat_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('260', 'reviewcount', 1457);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('260', 'quantity', 8528);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('260', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('260', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('261', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('261', 'image', '/resources/images/productImg/outer/wintercoat/singlecoat/singlecoat_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('261', 'reviewcount', 1458);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('261', 'quantity', 8529);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('261', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('261', 'color', 'blue');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('262', 'score', 1);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('262', 'image', '/resources/images/productImg/outer/wintercoat/singlecoat/singlecoat_brown.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('262', 'reviewcount', 1459);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('262', 'quantity', 8530);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('262', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('262', 'color', 'brown');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('169', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('169', 'image', '/resources/images/productImg/outer/jacket/angeljacket/angeljacket_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)	
	values('169', 'reviewcount', 23523);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('169', 'quantity', 5896);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('169', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('169', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('170', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('170', 'image', '/resources/images/productImg/outer/jacket/angeljacket/angeljacket_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('170', 'reviewcount', 5833);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('170', 'quantity', 108);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('170', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('170', 'color', 'blue');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('171', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('171', 'image', '/resources/images/productImg/outer/jacket/angeljacket/angeljacket_gray.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('171', 'reviewcount', 1931);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('171', 'quantity', 108);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('171', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('171', 'color', 'gray');
	
--#################################angeljacket 구간

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('172', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('172', 'image', '/resources/images/productImg/outer/jacket/overfitjacket/overfitjacket_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('172', 'reviewcount', 547);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('172', 'quantity', 196);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('172', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('172', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('173', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('173', 'image', '/resources/images/productImg/outer/jacket/overfitjacket/overfitjacket_khaki.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('173', 'reviewcount', 579);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('173', 'quantity', 1021);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('173', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('173', 'color', 'khaki');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('174', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('174', 'image', '/resources/images/productImg/outer/jacket/overfitjacket/overfitjacket_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('174', 'reviewcount', 79);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('174', 'quantity', 129);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('174', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('174', 'color', 'white');
	
--##################################overfitjacket 구간
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('175', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('175', 'image', '/resources/images/productImg/outer/jacket/trackjacket/trackjacket_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('175', 'reviewcount', 2159);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('175', 'quantity', 1128);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('175', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('175', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('176', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('176', 'image', '/resources/images/productImg/outer/jacket/trackjacket/trackjacket_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('176', 'reviewcount', 199);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('176', 'quantity', 2019);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('176', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('176', 'color', 'blue');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('177', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('177', 'image', '/resources/images/productImg/outer/jacket/trackjacket/trackjacket_purple.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('177', 'reviewcount', 619);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('177', 'quantity', 194);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('177', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('177', 'color', 'purple');	

--#######################trackjacket 구간
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('178', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('178', 'image', '/resources/images/productImg/outer/otherouter/4pocketjacket/4pocketjacket_beige.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('178', 'reviewcount', 69);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('178', 'quantity', 183);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('178', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('178', 'color', 'beige');		

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('179', 'score', 4);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('179', 'image', '/resources/images/productImg/outer/otherouter/4pocketjacket/4pocketjacket_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('179', 'reviewcount', 218);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('179', 'quantity', 46);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('179', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('179', 'color', 'black');		
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('180', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('180', 'image', '/resources/images/productImg/outer/otherouter/4pocketjacket/4pocketjacket_white.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('180', 'reviewcount', 889);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('180', 'quantity', 792);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('180', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('180', 'color', 'white');	
	
--####################4pocketjacket 구간
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('181', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('181', 'image', '/resources/images/productImg/outer/otherouter/apartment/apartment_black.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('181', 'reviewcount', 819);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('181', 'quantity', 501);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('181', 'size', 110);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('181', 'color', 'black');
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('182', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('182', 'image', '/resources/images/productImg/outer/otherouter/apartment/apartment_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('182', 'reviewcount', 110);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('182', 'quantity', 543);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('182', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('182', 'color', 'blue');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('183', 'score', 3);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('183', 'image', '/resources/images/productImg/outer/otherouter/apartment/apartment_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('183', 'reviewcount', 914);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('183', 'quantity', 564);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('183', 'size', 105);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('183', 'color', 'red');
	
--#######################apartment 구간
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('184', 'score', 5);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('184', 'image', '/resources/images/productImg/outer/otherouter/linkleshirt/linkleshirt_blue.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('184', 'reviewcount', 291);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('184', 'quantity', 450);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('184', 'size', 100);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('184', 'color', 'blue');	

insert into s_product_add_info(p_id,product_add_info_type, description)
	values('185', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('185', 'image', '/resources/images/productImg/outer/otherouter/linkleshirt/linkleshirt_red.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('185', 'reviewcount', 901);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('185', 'quantity', 642);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('185', 'size', 90);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('185', 'color', 'red');	
	
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('186', 'score', 2);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('186', 'image', '/resources/images/consultation/outer/otherouter/linkleshirt/linkleshirt_yellow.jpg');
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('186', 'reviewcount', 951);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('186', 'quantity', 641);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('186', 'size', 95);
insert into s_product_add_info(p_id,product_add_info_type, description)
	values('186', 'color', 'yellow');	

--#########################linkleshirt 구간

	
--##############################stripesweater 구간
	
--############################야구모자###############################################
insert into s_products(p_id, category_id, p_name, price)
	values('5', '10000a', 'colorballcap_blue', '23000' );
insert into s_products(p_id, category_id, p_name, price)
	values('6', '10000a', 'colorballcap_green', '23000' );
insert into s_products(p_id, category_id, p_name, price)
	values('7', '10000a', 'colorballcap_bluegreen', '23000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('8', '10000a', 'ladodgers_blue', '28000' );
insert into s_products(p_id, category_id, p_name, price)
	values('9', '10000a', 'ladodgers_red', '28000' );
insert into s_products(p_id, category_id, p_name, price)
	values('10', '10000a', 'ladodgers_yellow', '28000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('11', '10000a', 'legacyballcap_black', '30000' );
insert into s_products(p_id, category_id, p_name, price)
	values('12', '10000a', 'legacyballcap_brown', '30000' );
insert into s_products(p_id, category_id, p_name, price)
	values('13', '10000a', 'legacyballcap_white', '30000' );
	
--############################비니###############################################	

insert into s_products(p_id, category_id, p_name, price)
	values('14', '10000f', 'logobini_black', '31000' );
insert into s_products(p_id, category_id, p_name, price)
	values('15', '10000f', 'logobini_blue', '31000' );
insert into s_products(p_id, category_id, p_name, price)
	values('16', '10000f', 'logobini_red', '31000' );	
	
insert into s_products(p_id, category_id, p_name, price)
	values('17', '10000f', 'shortbeanie_brown', '32000' );
insert into s_products(p_id, category_id, p_name, price)
	values('18', '10000f', 'shortbeanie_gray', '32000' );
insert into s_products(p_id, category_id, p_name, price)
	values('19', '10000f', 'shortbeanie_purple', '32000' );		
	
insert into s_products(p_id, category_id, p_name, price)
	values('20', '10000f', 'stickcap_black', '33000' );
insert into s_products(p_id, category_id, p_name, price)
	values('21', '10000f', 'stickcap_brown', '33000' );
insert into s_products(p_id, category_id, p_name, price)
	values('22', '10000f', 'stickcap_navy', '33000' );	
	
	
--############################베레모###############################################	
	
insert into s_products(p_id, category_id, p_name, price)
	values('340', '10000b', 'huntingberet_blue', '29000' );
insert into s_products(p_id, category_id, p_name, price)
	values('23', '10000b', 'huntingberet_brown', '29000' );
insert into s_products(p_id, category_id, p_name, price)
	values('24', '10000b', 'huntingberet_red', '29000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('325', '10000b', 'oxfordberet_black', '27000' );
insert into s_products(p_id, category_id, p_name, price)
	values('326', '10000b', 'oxfordberet_blue', '27000' );
insert into s_products(p_id, category_id, p_name, price)
	values('327', '10000b', 'oxfordbere_brown', '27000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('328', '10000b', 'woolberet_black', '26000' );
insert into s_products(p_id, category_id, p_name, price)
	values('329', '10000b', 'woolberet_brown', '26000' );
insert into s_products(p_id, category_id, p_name, price)
	values('330', '10000b', 'woolberet_red', '26000' );
	
--############################페도라###############################################	

insert into s_products(p_id, category_id, p_name, price)
	values('25', '10000d', 'classicfedora_black', '28000' );
insert into s_products(p_id, category_id, p_name, price)
	values('26', '10000d', 'classicfedora_brown', '28000' );
insert into s_products(p_id, category_id, p_name, price)
	values('27', '10000d', 'classicfedora_red', '28000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('28', '10000d', 'knitfedora_black', '25000' );
insert into s_products(p_id, category_id, p_name, price)
	values('29', '10000d', 'knitfedora_brown', '25000' );
insert into s_products(p_id, category_id, p_name, price)
	values('30', '10000d', 'knitfedora_white', '25000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('31', '10000d', 'originalfedora_brown', '26500' );
insert into s_products(p_id, category_id, p_name, price)
	values('32', '10000d', 'originalfedora_brownred', '26500' );
insert into s_products(p_id, category_id, p_name, price)
	values('33', '10000d', 'originalfedora_brownwhite', '26500' );
	
--############################기타모자###############################################	
insert into s_products(p_id, category_id, p_name, price)
	values('34', '10000e', 'flowervisor_blue', '27500' );
insert into s_products(p_id, category_id, p_name, price)
	values('35', '10000e', 'flowervisor_green', '27500' );
insert into s_products(p_id, category_id, p_name, price)
	values('36', '10000e', 'flowervisor_orange', '27500' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('37', '10000e', 'rafiafedora_beige', '22000' );
insert into s_products(p_id, category_id, p_name, price)
	values('38', '10000e', 'rafiafedora_black', '22000' );
insert into s_products(p_id, category_id, p_name, price)
	values('39', '10000e', 'rafiafedora_brown', '22000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('40', '10000e', 'visor_black', '23000' );
insert into s_products(p_id, category_id, p_name, price)
	values('41', '10000e', 'visor_blue', '23000' );
insert into s_products(p_id, category_id, p_name, price)
	values('42', '10000e', 'visor_red', '23000' );
	
--############################트루퍼###############################################	

insert into s_products(p_id, category_id, p_name, price)
	values('43', '10000c', 'fishtrooper_blue', '31000' );
insert into s_products(p_id, category_id, p_name, price)
	values('44', '10000c', 'fishtrooper_khaki', '31000' );
insert into s_products(p_id, category_id, p_name, price)
	values('45', '10000c', 'fishtrooper_red', '31000' );	
	
insert into s_products(p_id, category_id, p_name, price)
	values('46', '10000c', 'steentrooper_black', '36000' );
insert into s_products(p_id, category_id, p_name, price)
	values('47', '10000c', 'steentrooper_brown', '36000' );
insert into s_products(p_id, category_id, p_name, price)
	values('48', '10000c', 'steentrooper_green', '36000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('49', '10000c', 'stringtrooper_black', '30000' );
insert into s_products(p_id, category_id, p_name, price)
	values('50', '10000c', 'stringtrooper_blue', '30000' );
insert into s_products(p_id, category_id, p_name, price)
	values('51', '10000c', 'steentrooper_brown', '30000' );
	
	
--############################아우터 카디건###############################################	

insert into s_products(p_id, category_id, p_name, price)
	values('227', '50000e', 'angelcardigan_black', '78000' );
insert into s_products(p_id, category_id, p_name, price)
	values('228', '50000e', 'angelcardigan_grey', '78000' );
insert into s_products(p_id, category_id, p_name, price)
	values('229', '50000e', 'angelcardigan_white', '78000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('230', '50000e', 'basecardigan_black', '66000' );
insert into s_products(p_id, category_id, p_name, price)
	values('231', '50000e', 'basecardigan_brown', '66000' );
insert into s_products(p_id, category_id, p_name, price)
	values('232', '50000e', 'basecardigan_gray', '66000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('233', '50000e', 'zipupcardigan_blue', '55000' );
insert into s_products(p_id, category_id, p_name, price)
	values('234', '50000e', 'zipupcardigan_green', '55000' );
insert into s_products(p_id, category_id, p_name, price)
	values('235', '50000e', 'zipupcardigan_white', '55000' );
	
--############################후드집업###############################################	

insert into s_products(p_id, category_id, p_name, price)
	values('236', '50000a', 'jacketsmoke_black', '59000' );
insert into s_products(p_id, category_id, p_name, price)
	values('237', '50000a', 'jacketsmoke_gray', '59000' );
insert into s_products(p_id, category_id, p_name, price)
	values('238', '50000a', 'jacketsmoke_khaki', '59000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('239', '50000a', 'steve_black', '89000' );
insert into s_products(p_id, category_id, p_name, price)
	values('240', '50000a', 'steve_gray', '89000' );
insert into s_products(p_id, category_id, p_name, price)
	values('241', '50000a', 'steve_white', '89000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('242', '50000a', 'trainingzipup_black', '54000' );
insert into s_products(p_id, category_id, p_name, price)
	values('243', '50000a', 'trainingzipup_purple', '54000' );
insert into s_products(p_id, category_id, p_name, price)
	values('244', '50000a', 'trainingzipup_white', '54000' );
	
--############################환절기 코트###############################################	

insert into s_products(p_id, category_id, p_name, price)
	values('245', '50000b', 'frenchcoat_black', '64000' );
insert into s_products(p_id, category_id, p_name, price)
	values('246', '50000b', 'frenchcoat_green', '64000' );
insert into s_products(p_id, category_id, p_name, price)
	values('247', '50000b', 'frenchcoat_sand', '64000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('248', '50000b', 'nellicoat_beige', '68000' );
insert into s_products(p_id, category_id, p_name, price)
	values('249', '50000b', 'nellicoat_black', '68000' );
insert into s_products(p_id, category_id, p_name, price)
	values('250', '50000b', 'nellicoat_brown', '68000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('251', '50000b', 'woolcoat_black', '49000' );
insert into s_products(p_id, category_id, p_name, price)
	values('252', '50000b', 'woolcoat_green', '49000' );
insert into s_products(p_id, category_id, p_name, price)
	values('253', '50000b', 'woolcoat_pink', '49000' );

--############################재킷###############################################	

insert into s_products(p_id, category_id, p_name, price)
	values('254', '50000d', 'angeljacket_black', '100000' );
insert into s_products(p_id, category_id, p_name, price)
	values('255', '50000d', 'angeljacket_blue', '100000' );
insert into s_products(p_id, category_id, p_name, price)
	values('256', '50000d', 'angeljacket_gray', '100000' );	
	
insert into s_products(p_id, category_id, p_name, price)
	values('257', '50000d', 'overfitjacket_black', '110000' );
insert into s_products(p_id, category_id, p_name, price)
	values('258', '50000d', 'overfitjacket_khaki', '110000' );
insert into s_products(p_id, category_id, p_name, price)
	values('259', '50000d', 'overfitjacket_white', '110000' );	
	
insert into s_products(p_id, category_id, p_name, price)
	values('260', '50000d', 'trackjacket_black', '95000' );
insert into s_products(p_id, category_id, p_name, price)
	values('261', '50000d', 'trackjacket_blue', '95000' );
insert into s_products(p_id, category_id, p_name, price)
	values('262', '50000d', 'trackjacket_purple', '95000' );	
	
--############################기타아우터###############################################	
	
insert into s_products(p_id, category_id, p_name, price)
	values('169', '50000f', '4pocketjacket_beige', '74000' );
insert into s_products(p_id, category_id, p_name, price)
	values('170', '50000f', '4pocketjacket_black', '74000' );
insert into s_products(p_id, category_id, p_name, price)
	values('171', '50000f', '4pocketjacket_white', '74000' );	
	
insert into s_products(p_id, category_id, p_name, price)
	values('172', '50000f', 'apartment_black', '88000' );
insert into s_products(p_id, category_id, p_name, price)
	values('173', '50000f', 'apartment_blue', '88000' );
insert into s_products(p_id, category_id, p_name, price)
	values('174', '50000f', 'apartment_red', '88000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('175', '50000f', 'linkleshirt_blue', '96000' );
insert into s_products(p_id, category_id, p_name, price)
	values('176', '50000f', 'linkleshirt_red', '96000' );
insert into s_products(p_id, category_id, p_name, price)
	values('177', '50000f', 'linkleshirt_yellow', '96000' );
	
--############################겨울코트###############################################	

insert into s_products(p_id, category_id, p_name, price)
	values('178', '50000c', 'maxidoublecoat__charcoal', '156000' );
insert into s_products(p_id, category_id, p_name, price)
	values('179', '50000c', 'maxidoublecoat__beige', '156000' );
insert into s_products(p_id, category_id, p_name, price)
	values('180', '50000c', 'maxidoublecoat__black', '156000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('181', '50000c', 'minimalshortcoat_black', '178000' );
insert into s_products(p_id, category_id, p_name, price)
	values('182', '50000c', 'minimalshortcoat_brown', '178000' );
insert into s_products(p_id, category_id, p_name, price)
	values('183', '50000c', 'minimalshortcoat_white', '178000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('184', '50000c', 'singlecoat_black', '149000' );
insert into s_products(p_id, category_id, p_name, price)
	values('185', '50000c', 'singlecoat_blue', '149000' );
insert into s_products(p_id, category_id, p_name, price)
	values('186', '50000c', 'singlecoat_brown', '149000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('8', '10000a', '다저스야구모자_blue', '5000' );