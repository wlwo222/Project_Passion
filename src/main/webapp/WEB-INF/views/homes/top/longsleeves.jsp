<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<meta name="description" content="">
<meta name="author" content="">
<title>Home | E-Shopper</title>
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


	
<body>

<div class="membershipCSS">
	<sec:authorize access="isAnonymous()">
	        <a href="/party/customLogin">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <a href="/party/joinMember"> 회원가입</a>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username"/>님 안녕하십니까 Welcome to POF
	    <a href="/party/customLogout">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="/party/updateMember">회원정보수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="/party/myPage">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</sec:authorize>
</div>
<jsp:include page="/resources/header.jsp" flush="false"/>
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
									<h1>
										<span>E</span>-SHOPPER
									</h1>
									<h2>Free E-Commerce Template</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua.</p>
									<button type="button" class="btn btn-default get">Get
										it now</button>
								</div>
								<div class="col-sm-6">
									<img src="/resources/images/home/girl1.jpg"
										class="girl img-responsive" alt="" /> <img
										src="/resources/images/home/pricing.png" class="pricing"
										alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1>
										<span>E</span>-SHOPPER
									</h1>
									<h2>100% Responsive Design</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua.</p>
									<button type="button" class="btn btn-default get">Get
										it now</button>
								</div>
								<div class="col-sm-6">
									<img src="/resources/images/home/girl2.jpg"
										class="girl img-responsive" alt="" /> <img
										src="/resources/images/home/pricing.png" class="pricing"
										alt="" />
								</div>
							</div>

							<div class="item">
								<div class="col-sm-6">
									<h1>
										<span>E</span>-SHOPPER
									</h1>
									<h2>Free Ecommerce Template</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua.</p>
									<button type="button" class="btn btn-default get">Get
										it now</button>
								</div>
								<div class="col-sm-6">
									<img src="/resources/images/home/girl3.jpg"
										class="girl img-responsive" alt="" /> <img
										src="/resources/images/home/pricing.png" class="pricing"
										alt="" />
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
											<li><a href="/homes/top/hood">hood </a></li>
											<li><a href="/homes/top/longsleeves">longsleeves </a></li>
											<li><a href="/homes/top/mantoman">mantoman </a></li>
											<li><a href="/homes/top/pique">pique</a></li>
											<li><a href="/homes/top/shirt">shirt </a></li>
											<li><a href="/homes/top/shortsleeve">shortsleeve </a></li>
											<li><a href="/homes/top/sleeveless">sleeveless </a></li>
											<li><a href="/homes/top/sweater">sweater </a></li>
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
											<li><a href="/homes/hat/baseballcap">baseballcap</a></li>
											<li><a href="/homes/hat/beanie">beanie</a></li>
											<li><a href="/homes/hat/beret">beret</a></li>
											<li><a href="/homes/hat/fedora">fedora</a></li>
											<li><a href="/homes/hat/otherhats">otherhats</a></li>
											<li><a href="/homes/hat/trooper">trooper</a></li>
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
											<li><a href="/homes/outer/cardigan">cardigan</a></li>
											<li><a href="/homes/outer/hoodzipup">hoodzipup</a></li>
											<li><a href="/homes/outer/seasoncoat">seasoncoatt</a></li>
											<li><a href="/homes/outer/jacket">jacket</a></li>
											<li><a href="/homes/outer/otherouter">otherouter</a></li>
											<li><a href="/homes/outer/wintercoat">wintercoat</a></li>
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
											<li><a href="/homes/pants/leggings">leggings</a></li>
											<li><a href="/homes/pants/pants">pants</a></li>
											<li><a href="/homes/pants/slacks">slacks</a></li>
											<li><a href="/homes/pants/suit">suit</a></li>
											<li><a href="/homes/pants/training">training</a></li>
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
											<li><a href="/homes/shoes/sandalsslippersboots">sandalsslippersboots</a></li>
											<li><a href="/homes/shoes/shoes">shoes</a></li>
											<li><a href="/homes/shoes/sneakers">sneakers</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--/category-products-->
<!-- ################################################################################Categories end################################################################################ -->
<!-- ################################################################################Product Start################################################################################ -->
						<div class="brands_products">
							<!--brands_products-->
							<h2>Brands</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#"> <span class="pull-right">(50)</span>Acne
									</a></li>
									<li><a href="#"> <span class="pull-right">(56)</span>Grüne
											Erde
									</a></li>
									<li><a href="#"> <span class="pull-right">(27)</span>Albiro
									</a></li>
									<li><a href="#"> <span class="pull-right">(32)</span>Ronhill
									</a></li>
									<li><a href="#"> <span class="pull-right">(5)</span>Oddmolly
									</a></li>
									<li><a href="#"> <span class="pull-right">(9)</span>Boudestijn
									</a></li>
									<li><a href="#"> <span class="pull-right">(4)</span>Rösch
											creative culture
									</a></li>
								</ul>
							</div>
						</div>
						<!--/brands_products-->

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
				</div>

				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">Features Items</h2>
						<script src="/resources/js/jquery.js"></script>
						<c:forEach items="${longsleeves}" var="product" varStatus="status">
						<!-- ProductVO -->
						 <div class="itemContainer">
							<div class="product-image-wrapper">
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="card">
											<div class="imgBx">
												<img alt="" src="${product.pdAddInfo[1].description}">
												<ul class="showAction">
													<li><i class="fa fa-heart" aria-hidden="true"></i>
													 <span>Add to Wishlist</span></li>
													<li><i class="fa fa-shopping-cart" aria-hidden="true"></i>
														<span>Add to Cart</span></li>
													<li><a class="fa fa-eye" aria-hidden="true" href="/homes/productDetail?productId=${product.productId}"></a> 
													<span>View Details</span></li>
												</ul>
											</div>
											<div class="content">
												<a class="productName" href="/homes/productDetail?productId=${product.productId}">
													<h3>${product.productName}</h3>
												</a>
												<div class="price_rating" id="${status.index}">
													<h2>${product.price}원
													</h2>
													<p></p> <!-- 별점 표시하는 부분 -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script>
						var score=${product.pdAddInfo[0].description};
						var printscore = "";
						printscore += "<div class='rating'>"
							switch(score){
							case 1 :
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "</div>";
								$("#${status.index}").append(printscore);
								break;
							case 2 :
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "</div>";
								$("#${status.index}").append(printscore);
								break;
							case 3 :
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "</div>";
								$("#${status.index}").append(printscore);
								break;
							case 4 :
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "</div>";
								$("#${status.index}").append(printscore);
								break;
							case 5 :
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "</div>";
								$("#${status.index}").append(printscore);
								break;
							}
						</script>
						</c:forEach>
											<!--features_items-->
<!-- ################################################################################Product End################################################################################ -->
					<div class="category-tab">
						<!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tshirt" data-toggle="tab">T-Shirt</a></li>
								<li><a href="#blazers" data-toggle="tab">Blazers</a></li>
								<li><a href="#sunglass" data-toggle="tab">Sunglass</a></li>
								<li><a href="#kids" data-toggle="tab">Kids</a></li>
								<li><a href="#poloshirt" data-toggle="tab">Polo shirt</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="tshirt">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="blazers">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart">
												<i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart">
												<i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="sunglass">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart">
												<i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart">
												<i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="kids">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="poloshirt">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/resources/images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--/category-tab-->
					<div class="recommended_items">
						<!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>
						<div id="recommended-item-carousel" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/resources/images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/resources/images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/resources/images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/resources/images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/resources/images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/resources/images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<a class="left recommended-item-control"
								href="#recommended-item-carousel" data-slide="prev"> <i
								class="fa fa-angle-left"></i>
							</a> <a class="right recommended-item-control"
								href="#recommended-item-carousel" data-slide="next"> <i
								class="fa fa-angle-right"></i>
							</a>
						</div>
					</div>
					<!--/recommended_items-->

				</div>
			</div>
		</div>
	</section>
	<!-- 풋 상단 notice  -->
	<div class="container1" id="sp-footer-design">
		<!--상단-->
		<div class="row">
			<div class="col-sm-6">
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
	</div>
	<!-- 풋 두번째 -->
	<div class="container2" id="sp-footer-design2">
		<div class="row">
			<div class="col-sm-4">
				<div class="logo bannermanage2-tricklink" banner-push="footerlogo">
					<a href="/"><img class="banne r_image" rel="258-14"
						src="/resources/images/p-service/14.png"></a> <br> <br>
				</div>
				<div class="description ">
					<span><br>주식회사 POF / POF</span> <span>Business Address
						: 16F 1633, 586, Gukchaebosang-ro, Jung-gu, Pyeongtaec, Republic
						of Korea</span>
					<!--자동사용<span>대구광역시 중구 국채보상로 586 (동성로2가) 16층 1633호 (동성로2가)</span>-->
					<span>대표자 : 원천지재</span> <span>개인정보보호책임자 : 원천지재 <!--smallmanblog@naver.com--></span>
					<br> <span>팩스 070-4009-6213&nbsp;&nbsp;</span> <span>사업자등록번호
						502-81-93867&nbsp;&nbsp;</span> <span>통신판매업신고
						2020-평택시-0715&nbsp;&nbsp;</span> <span><a href="#none" class=""
						onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=5028193867', 'bizCommPop', 'width=750, height=950;');return false;">사업자정보확인</a></span>
				</div>
				<div class="copyright ">
					<br>POF 상품/판매자/쇼핑 정보, 콘텐츠, UI 등에 대한 무단 복제, 전송, 배포, 스프래핑 등의 행위는
					저작권법, <a href="http://www.law.go.kr/lsInfoP.do?lsiSeq=105953"
						target="_blank">콘텐츠산업 진흥법</a>으로 금지됩니다.<br> COPYRIGHT(C) 2006
					POF LTD. ALL RIGHTS RESERVED. designed by <a
						href="//www.pandassi.com" target="_blank">POF</a>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="account">
					<span><br>ACCOUNT INFO <br>기업 457-093541-04-015
						예금주: (주)POF</span>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="WITH US">
					<div class="head">
						WITH US
						<div class="icons cover">
							<br> <a href="/board/index.html"> <span>COMPANY </span><br>
							</a> <a href="/myshop/order/list.html"> <span>AGREEMENT</span><br>
							</a> <a href="/board/product/list.html?board_no=6"> <span>PRIVACY
									POLICY</span><br>
							</a> <a href="/board/review/list.html?board_no=4"> <span>GUIDE</span>
							</a>
						</div>
					</div>
					<div class="m_head">
						<br>SNS SERVICE
						<div class="icons cover">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="RETURN">
					<div class="RETURN / EXCHANGE">
						<span>RETURN / EXCHANGE <br> 경기도 안양시 동안구 엘에스로 53번길 9
							(호계동) 미래타운 501호 자세한 교환·반품절차 안내는 문의란 및 공지사항을 참고해주세요<br></span>
						<ul class="du-grid">
							<br>
							<li class="du-cell"><a
								href="/board/free/list.html?board_no=1"><i
									class="large material-icons">airplay</i><span></span></a></li>
							<li class="du-cell"><a
								href="/board/product/list.html?board_no=6"><i
									class="large material-icons">chat</i><span></span></a></li>
							<li class="du-cell"><a
								href="/board/review/list.html?board_no=4"><i
									class="large material-icons">camera_alt</i><span></span></a></li>
							<li class="du-cell"><a href="/order/basket.html"><i
									class="large material-icons">shopping_cart</i><span></span></a></li>
							<li class="du-cell"><a href="/myshop/order/list.html"><i
									class="large material-icons">credit_card</i><span></span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--하단정보-->
	<div class="navigation">
		<div class="toggle"></div>
		<ul>
			<li><a href="#"> <span class="icon">
			<i class="fa fa-home" aria-hidden="true"></i></span> <span class="title">HOME</span>
			</a></li>
			<li><a href="#"> <span class="icon">
			<i class="fa fa-user" aria-hidden="true"></i></span> <span class="title">마이페이지</span>
			</a></li>
			<li><a href="#"> <span class="icon">
			<i class="fa fa-comment" aria-hidden="true"></i></span> <span class="title">문자</span>
			</a></li>
			<li><a href="#"> <span class="icon">
			<i class="fa fa-lock" aria-hidden="true"></i></span> <span class="title">로그인</span>
			</a></li>
			<li><a href="#"> <span class="icon">
			<i class="fa fa-cog" aria-hidden="true"></i></span> <span class="title">설정</span>
			</a></li>
			<li><a href="#"> <span class="icon">
			<i class="fa fa-sign-out" aria-hidden="true"></i></span> <span class="title">로그아웃</span>
			</a></li>
		</ul>
	</div>
	<script>
		const navigation = document.querySelector('.navigation');
		document.querySelector('.toggle').onclick = function() {
			this.classList.toggle('active');
			navigation.classList.toggle('active')
		};
		
		$(document).ready(function(e){
			var printscore = "";
			
		});
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$(".navigation").draggable({delay:10});
		});
	</script>	
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.scrollUp.min.js"></script>
	<script src="/resources/js/price-range.js"></script>
	<script src="/resources/js/jquery.prettyPhoto.js"></script>
	<script src="/resources/js/main.js"></script>
</body>
</html>