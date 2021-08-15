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














	








--모자는 45~65까지 사이즈마다 있는색깔 다 반영. 바지 90 ~ 120, 상의 90 ~ 110 신발 260 ~ 280  




	
	
	
	
	
	
	
	

--#########################linkleshirt 구간

	
--##############################stripesweater 구간
	
--############################야구모자###############################################
insert into s_products(p_id, category_id, p_name, price)
	values('5', '10000a', 'colorballcap_blue', '23000' );
insert into s_products(p_id, category_id, p_name, price)
	values('6', '10000a', 'colorballcap_green', '23000' );
	
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
	values('181', '50000c', 'minimalshortcoat_black', '178000' );
insert into s_products(p_id, category_id, p_name, price)
	values('182', '50000c', 'minimalshortcoat_brown', '178000' );
insert into s_products(p_id, category_id, p_name, price)
	values('183', '50000c', 'minimalshortcoat_white', '178000' );
	
insert into s_products(p_id, category_id, p_name, price)
	values('184', '50000c', 'singlecoat_blue', '149000' );
insert into s_products(p_id, category_id, p_name, price)
	values('185', '50000c', 'singlecoat_red', '149000' );

insert into s_products(p_id, category_id, p_name, price)
	values('8', '10000a', '다저스야구모자_blue', '5000' );