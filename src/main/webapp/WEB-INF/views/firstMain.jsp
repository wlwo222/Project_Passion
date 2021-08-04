<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | E-Shopper</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/prettyPhoto.css" rel="stylesheet">
<link href="/resources/css/price-range.css" rel="stylesheet">
<link href="/resources/css/animate.css" rel="stylesheet">
<link href="/resources/css/firstMan.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="/resources/images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->

<body>
	<header id="header">
		<a href="#" class="logo">POF</a>
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Destination</a></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</header>
	<section>
		<div class="gradation">
			<h2 id="t-text">
			POF
			</h2>
			<img src="/resources/img/model/forest.png" id="forest"> <img
				src="/resources/img/model/rocks.png" id="rocks"> <img
				src="/resources/img/model/water.png" id="water"> <a href="/homes/index"
				id="g_btn">Go to shopping</a>
		</div>
	</section>
	<div class="sec">
		<h2>Welcome to our shoP ♥ Plz enjoy your time !</h2>
		<p>
		혼자서 불러보는 가슴 아픈 그 이름
		눈물이 새어 나올까봐 입술을 깨물고
		또 다시 다짐한 듯 가슴을 펴 보지만
		홀로 남겨진 내 모습이 더욱 초라해져
		
		사랑아 그리운 내 사랑아
		이렇게 아픈 내 사랑아
		얼마나 아프고 아파해야
		아물 수 있겠니
		
		사랑아 그리운 내 사랑아
		이렇게 아픈 내 사랑아
		얼마나 아프고 아파해야
		아물 수 있겠니
		
		사랑아 미련한 내 사랑아
		버릴 수 없는 내 욕심에
		못 다한 사랑이 서러워서
		또 이렇게 운다
		얼마나 아프고 아파해야
		아물 수 있겠니 내 사랑아
		</p>
	</div>
	<script>
		let text = document.getElementById('t-text');
		let btn = document.getElementById('g_btn');
		let rocks = document.getElementById('rocks');
		let forest = document.getElementById('forest');
		let water = document.getElementById('water');
		let header = document.getElementById('header');

		window
				.addEventListener('scroll', function() {
					let value = window.scrollY;

					text.style.top = 50 + value * -0.1 + '%';
					btn.style.marginTop = value * 1.5 + 'px';
					rocks.style.top = value * -0.12 + 'px';
					forest.style.top = value * 0.25 + 'px';
					header.style.top = value * 0.5 + 'px';
				})
	</script>
</body>
</html>