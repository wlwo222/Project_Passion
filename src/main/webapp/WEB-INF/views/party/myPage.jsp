<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>★ P ★ O ★ F ★</title>
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
<!-- Begin Page Content -->
<jsp:include page="/resources/header.jsp" flush="false" />
<body>
	<section class="my-page">
		<div class=""></div>
		<div class="df-myshop">
			<div class="row">
				<div class="col-sm-9 col-sm-offset-1">
					<!-- 주문처리현황 -->
					<div
						class="xans-element- xans-myshop xans-myshop-orderstate section orderState ">
						<h3 class="title">
							<span class="df-lang-orderstate">주문처리 현황</span> <span
								class="df-lang-orderstate-period">(최근3개월)</span>
						</h3>
						<div class="content">
							<ul class="order">
								<li class="step1"><span class="df-lang-order-step1">입금전</span>
									<a href="/myshop/order/list.html?order_status=shipped_before"
									class="count"><span
										id="xans_myshop_orderstate_shppied_before_count">0</span></a></li>
								<li class="step2"><span class="df-lang-order-step2">배송준비중</span>
									<a href="/myshop/order/list.html?order_status=shipped_standby"
									class="count"><span
										id="xans_myshop_orderstate_shppied_standby_count">0</span></a></li>
								<li class="step3"><span class="df-lang-order-step3">배송중</span>
									<a href="/myshop/order/list.html?order_status=shipped_begin"
									class="count"><span
										id="xans_myshop_orderstate_shppied_begin_count">0</span></a></li>
								<li class="step4"><span class="df-lang-order-step4">배송완료</span>
									<a href="/myshop/order/list.html?order_status=shipped_complate"
									class="count"><span
										id="xans_myshop_orderstate_shppied_complate_count">0</span></a></li>
							</ul>
							<ul class="css">
								<li class="cancel"><span class="df-lang-order-cancel">취소
										:</span> <a href="/myshop/order/list.html?order_status=order_cancel"
									class="count"><span
										id="xans_myshop_orderstate_order_cancel_count">0</span></a></li>
								<li class="exchange"><span class="df-lang-order-exchange">교환
										:</span> <a
									href="/myshop/order/list.html?order_status=order_exchange"
									class="count"><span
										id="xans_myshop_orderstate_order_exchange_count">0</span></a></li>
								<li class="return"><span class="df-lang-order-return">반품
										:</span> <a href="/myshop/order/list.html?order_status=order_return"
									class="count"><span
										id="xans_myshop_orderstate_order_return_count">0</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class=""></div>



	</section>
	<section class="public-footer">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-1">
				<div class="inside">
					<div class="head">
						<br>
						<h3>NOTICE</h3>
						<div class="icons cover">
							<a href="/board/index.html">
								<p>
									<img src="">
								</p> <span>POF 교환 및 환불 안내사항</span>
							</a> <a href="/myshop/order/list.html">
								<p>
									<img src="">
								</p> <span>구매 금액 별 무료배송 & 사은품 안내</span>
							</a> <a href="/board/product/list.html?board_no=6">
								<p>
									<img src="">
								</p> <span>POF 회원 등급제 혜택이 쏟아집니다!</span>
							</a> <a href="/board/review/list.html?board_no=4">
								<p>
									<img src="">
								</p> <span>POF 어플리케이션 출시 !</span>
							</a>
						</div>
					</div>

				</div>
			</div>

		</div>
		<footer id="footer">
			<!--Footer-->
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-sm-2">
							<div class="companyinfo">
								<h2>
									<span>e</span>-shopper
								</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing
									elit,sed do eiusmod tempor</p>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="col-sm-3">
								<div class="video-gallery text-center">
									<a href="#">
										<div class="iframe-img">
											<img src="/resources/img/model/9.jpg" alt="" />
										</div>
										<div class="overlay-icon">
											<i class="fa fa-play-circle-o"></i>
										</div>
									</a>
									<p>Circle of Hands</p>
									<h2>24 DEC 2014</h2>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="video-gallery text-center">
									<a href="#">
										<div class="iframe-img">
											<img src="/resources/img/model/8.jpg" alt="" />
										</div>
										<div class="overlay-icon">
											<i class="fa fa-play-circle-o"></i>
										</div>
									</a>
									<p>Circle of Hands</p>
									<h2>24 DEC 2014</h2>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="video-gallery text-center">
									<a href="#">
										<div class="iframe-img">
											<img src="/resources/img/model/7.jpg" alt="" />
										</div>
										<div class="overlay-icon">
											<i class="fa fa-play-circle-o"></i>
										</div>
									</a>
									<p>Circle of Hands</p>
									<h2>24 DEC 2014</h2>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="video-gallery text-center">
									<a href="#">
										<div class="iframe-img">
											<img src="/resources/img/model/6.jpg" alt="" />
										</div>
										<div class="overlay-icon">
											<i class="fa fa-play-circle-o"></i>
										</div>
									</a>
									<p>Circle of Hands</p>
									<h2>24 DEC 2014</h2>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="address">
								<img src="images/home/map.png" alt="" />
								<p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="footer-widget">
				<div class="container">
					<div class="row">
						<div class="col-sm-2">
							<div class="single-widget">
								<h2>Service</h2>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="">Online Help</a></li>
									<li><a href="">Contact Us</a></li>
									<li><a href="">Order Status</a></li>
									<li><a href="">Change Location</a></li>
									<li><a href="">FAQ’s</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="single-widget">
								<h2>Quock Shop</h2>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="">T-Shirt</a></li>
									<li><a href="">Mens</a></li>
									<li><a href="">Womens</a></li>
									<li><a href="">Gift Cards</a></li>
									<li><a href="">Shoes</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="single-widget">
								<h2>Policies</h2>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="">Terms of Use</a></li>
									<li><a href="">Privecy Policy</a></li>
									<li><a href="">Refund Policy</a></li>
									<li><a href="">Billing System</a></li>
									<li><a href="">Ticket System</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="single-widget">
								<h2>About Shopper</h2>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="">Company Information</a></li>
									<li><a href="">Careers</a></li>
									<li><a href="">Store Location</a></li>
									<li><a href="">Affillate Program</a></li>
									<li><a href="">Copyright</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3 col-sm-offset-1">
							<div class="single-widget">
								<h2>About Shopper</h2>
								<form action="#" class="searchform">
									<input type="text" placeholder="Your email address" />
									<button type="submit" class="btn btn-default">
										<i class="fa fa-arrow-circle-o-right"></i>
									</button>
									<p>
										Get the most recent updates from <br />our site and be
										updated your self...
									</p>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="footer-bottom">
				<div class="container">
					<div class="row">
						Shared by <i class="fa fa-love"></i><a
							href="https://bootstrapthemes.co">BootstrapThemes</a></span>
						</p>
					</div>
				</div>
			</div>

		</footer>
		<!--/Footer-->


		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="/resources/js/jquery.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="/resources/js/jquery.scrollUp.min.js"></script>
		<script src="/resources/js/price-range.js"></script>
		<script src="/resources/js/jquery.prettyPhoto.js"></script>
		<script src="/resources/js/main.js"></script>
</body>
</html>
