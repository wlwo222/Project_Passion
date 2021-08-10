<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Passion for Fashion</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/prettyPhoto.css" rel="stylesheet">
<link href="/resources/css/price-range.css" rel="stylesheet">
<link href="/resources/css/animate.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
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
	<div class="membershipCSS">
	<sec:authorize access="isAnonymous()">
	        <a href="/party/customLogin">LOGIN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <a href="/party/joinMember"> JOIN US</a>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username"/>님 안녕하십니까 Welcome to POF
	    <a href="/party/customLogout">LOGOUT</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="/party/updateMember">회원정보수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="/party/myPage">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</sec:authorize>
</div>
		<!--header-->
		
		<div class="header_top">
		
			<div class="logomain">
			<a href="/homes/index"><img
								src="/resources/images/icon/blackPOF.png" alt="" /></a>
			</div>
			<!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header_top-->

		<div class="header-middle">
			<!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							
						</div>
						
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-user"
										aria-hidden="true"></i></a></li>
								<li><a href="/resources/checkout.html"><i
										class="fa fa-heart" aria-hidden="true"></i></a></li>
								<li><a href="/resources/cart.html"><i
										class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
								<li><a href="/party/customLogin"><i class="fa fa-lock" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!--/header-middle-->

		<div class="header-bottom">
			<!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="/resources/index.html" class="active">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="/resources/shop.html">Shop List</a></li>
										<li><a href="/resources/product-details.html">Product Details</a></li>
									</ul></li>
								<li class="dropdown"><a href="#">Blog<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="/resources/blog.html">Blog List</a></li>
										<li><a href="/resources/blog-single.html">Blog Single</a></li>
									</ul></li>
								<li><a href="/resources/404.html">Passion</a></li>
								<li><a href="/resources/ontact-us.html">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box" align="right">
							<form>
								<input type="text" placeholder="Passion for Fashion" /> <input type="submit"
									name="" value="검색">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-bottom-->
	</header>
</body>
</html>