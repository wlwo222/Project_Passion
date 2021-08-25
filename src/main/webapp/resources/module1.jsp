<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
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

	<jsp:include page="/resources/header.jsp" flush="false" />
	<section id="slider">
		<!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0"
								class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>

						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<img src="/resources/images/model/nara1.jpg"
										class="girl img-responsive" alt="" /> 
									
								</div>
								<div class="col-sm-6">
									<img src="/resources/images/model/nara.jpg"
										class="girl img-responsive" alt="" /> 
										<!-- <img src="/resources/images/home/pricing.png" class="pricing"
										alt="" /> -->
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<img src="/resources/images/model/boyong.jpg"
										class="girl img-responsive" alt="" /> 
									
								</div>
								<div class="col-sm-6">
									<img src="/resources/images/home/girl2.jpg"
										class="girl img-responsive" alt="" /> 
										<!-- <img src="/resources/images/home/pricing.png" class="pricing"
										alt="" /> -->
								</div>
							</div>

							<div class="item">
								<div class="col-sm-6">
									<img src="/resources/images/model/borum.jpg"
										class="girl img-responsive" alt="" /> 
									
								</div>
								<div class="col-sm-6">
									<img src="/resources/images/model/borum1.jpg"
										class="girl img-responsive" alt="" /> 
										<!-- <img src="/resources/images/home/pricing.png" class="pricing"
										alt="" /> -->
								</div>
							</div>

						</div>

						<a href="#slider-carousel" class="left control-carousel hidden-xs"
							data-slide="prev"> <i class="fa fa-angle-left"></i>
						</a> <a href="#slider-carousel"
							class="right control-carousel hidden-xs" data-slide="next"> <i
							class="fa fa-angle-right"></i>
						</a>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!--/slider-->

	<!-- ################################################################################Categories################################################################################ -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian">
							<!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#top"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Top
										</a>
									</h4>
								</div>
								<div id="top" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/top/hood?pageNumber=1&amount=12">hood </a></li>
											<li><a href="/homes/top/longsleeves?pageNumber=1&amount=12">longsleeves </a></li>
											<li><a href="/homes/top/mantoman?pageNumber=1&amount=12">mantoman </a></li>
											<li><a href="/homes/top/pique?pageNumber=1&amount=12">pique</a></li>
											<li><a href="/homes/top/shirt?pageNumber=1&amount=12">shirt </a></li>
											<li><a href="/homes/top/shortsleeve?pageNumber=1&amount=12">shortsleeve </a></li>
											<li><a href="/homes/top/sleeveless?pageNumber=1&amount=12">sleeveless </a></li>
											<li><a href="/homes/top/sweater?pageNumber=1&amount=12">sweater</a></li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#hat"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Hat
										</a>
									</h4>
								</div>
								<div id="hat" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/hat/baseballcap?pageNumber=1&amount=12">baseballcap</a></li>
											<li><a href="/homes/hat/beanie?pageNumber=1&amount=12">beanie</a></li>
											<li><a href="/homes/hat/beret?pageNumber=1&amount=12">beret</a></li>
											<li><a href="/homes/hat/fedora?pageNumber=1&amount=12">fedora</a></li>
											<li><a href="/homes/hat/otherhats?pageNumber=1&amount=12">otherhats</a></li>
											<li><a href="/homes/hat/trooper?pageNumber=1&amount=12">trooper</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#outer"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Outer
										</a>
									</h4>
								</div>
								<div id="outer" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/outer/cardigan?pageNumber=1&amount=12">cardigan</a></li>
											<li><a href="/homes/outer/hoodzipup?pageNumber=1&amount=12">hoodzipup</a></li>
											<li><a href="/homes/outer/seasoncoat?pageNumber=1&amount=12">seasoncoat</a></li>
											<li><a href="/homes/outer/jacket?pageNumber=1&amount=12">jacket</a></li>
											<li><a href="/homes/outer/otherouter?pageNumber=1&amount=12">otherouter</a></li>
											<li><a href="/homes/outer/wintercoat?pageNumber=1&amount=12">wintercoat</a></li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#pants"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Pants
										</a>
									</h4>
								</div>
								<div id="pants" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/pants/leggings?pageNumber=1&amount=12">leggings</a></li>
											<li><a href="/homes/pants/pants?pageNumber=1&amount=12">pants</a></li>
											<li><a href="/homes/pants/slacks?pageNumber=1&amount=12">slacks</a></li>
											<li><a href="/homes/pants/suit?pageNumber=1&amount=12">suit</a></li>
											<li><a href="/homes/pants/training?pageNumber=1&amount=12">training</a></li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#shoes"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Shoes
										</a>
									</h4>
								</div>
								<div id="shoes" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/shoes/sandalsslippersboots?pageNumber=1&amount=12">sandals,slippers,boots</a></li>
											<li><a href="/homes/shoes/shoes?pageNumber=1&amount=12">shoes</a></li>
											<li><a href="/homes/shoes/sneakers?pageNumber=1&amount=12">sneakers</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
						<!--/category-products-->
						<!-- ################################################################################Categories end################################################################################ -->
						<!-- ################################################################################Product Start################################################################################ -->
						<div class="price-range">
							<!--price-range-->
							<h2>Price Range</h2>
							<div class="well text-center">
								<input type="text" class="span2" value="" data-slider-min="0"
									data-slider-max="600" data-slider-step="5"
									data-slider-value="[250,450]" id="sl2"><br /> <b
									class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div>
						<!--/price-range-->

						<div class="shipping text-center">
							<!--shipping-->
							<img src="/resources/images/home/shipping.jpg" alt="" />
						</div>
						<!--/shipping-->

					</div>
</html>