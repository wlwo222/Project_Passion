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
<!--/head-->

<body>
	<header id="header">
		<!--header-->
		<div class="header_top">
			<!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href=""><i class="fa fa-phone"></i> +2 95 01 88
										821</a></li>
								<li><a href=""><i class="fa fa-envelope"></i>
										info@domain.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href=""><i class="fa fa-facebook"></i></a></li>
								<li><a href=""><i class="fa fa-twitter"></i></a></li>
								<li><a href=""><i class="fa fa-linkedin"></i></a></li>
								<li><a href=""><i class="fa fa-dribbble"></i></a></li>
								<li><a href=""><i class="fa fa-google-plus"></i></a></li>
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
							<a href="index.html"><img src="images/home/logo.png" alt="" /></a>
						</div>
						<div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button"
									class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									USA <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="">Canada</a></li>
									<li><a href="">UK</a></li>
								</ul>
							</div>

							<div class="btn-group">
								<button type="button"
									class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									DOLLAR <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="">Canadian Dollar</a></li>
									<li><a href="">Pound</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href=""><i class="fa fa-user"></i> Account</a></li>
								<li><a href=""><i class="fa fa-star"></i> Wishlist</a></li>
								<li><a href="checkout.html"><i class="fa fa-crosshairs"></i>
										Checkout</a></li>
								<li><a href="cart.html"><i class="fa fa-shopping-cart"></i>
										Cart</a></li>
								<li><a href="login.html" class="active"><i
										class="fa fa-lock"></i> Login</a></li>
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
								<li><a href="index.html">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="shop.html">Products</a></li>
										<li><a href="product-details.html">Product Details</a></li>
										<li><a href="checkout.html">Checkout</a></li>
										<li><a href="cart.html">Cart</a></li>
										<li><a href="login.html" class="active">Login</a></li>
									</ul></li>
								<li class="dropdown"><a href="#">Blog<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="blog.html">Blog List</a></li>
										<li><a href="blog-single.html">Blog Single</a></li>
									</ul></li>
								<li><a href="404.html">404</a></li>
								<li><a href="contact-us.html">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-bottom-->
	</header>
	<section id="form">
		<!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-7 col-sm-offset-2">
					<div class="login-form1">


						<div class="card-body">
							<form id="frmMember" method="post" action="/party/joinMember">

								<div class="form-group">
									<label>아이디(영문소문자/숫자, 4~16자)</label> <input id="userId"
										name="userId" class="form-control" pattern="[a-z0-9]{4,16}"
										required>
								</div>

								<div class="form-group">

										<label>비밀번호 :</label> <input type="password" id="password1"
											pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{10,16}$">(영문
										대소문자/숫자/특수문자 꼭 포함, 10자~16자) <br> <label>비밀번호확인 :</label>
										<input type="password" id="password2"> <input
											type="button" onclick="test()" value="확인">
						
								</div>

								<div class="form-group">
									<label>이름</label> <input name="name" class="form-control"
										pattern="" required>
								</div>

								<div class="form-group">
									<label>성별</label> <input type="radio" id="contactChoice1"
										name="male" value="1" checked> <label
										for="contactChoice1">남자</label> <input type="radio"
										id="contactChoice2" name="male" value="0"> <label
										for="contactChoice2">여자</label>
								</div>

								<div class="form-group">
									<label>생년월일</label> <input type="date" name="birthDate"
										class="form-control">
								</div>

								<div class="form-group">
									<form name="jusoform" id="form" method="post" action="">


										<div id="list"></div>
										<div  class="form-gid="callBackDiv">
											<table>
												<tr>
													<td>우편 번호</td>
													<td><input type="text" style="width: 100px;"
														id="roadFullAddr" name="roadFullAddr" style="float: left;" /> <input type="button" onClick="goPopup();" value="주소찾기" style="float: left; margin-right: 5px;" /></td>
												</tr>
												<tr>
													<td>도로명주소</td>
													<td><input type="text" style="width: 500px;"
														id="roadAddrPart1" name="roadAddrPart1" /></td>
												</tr>
												<tr>
													<td>상세주소</td>
													<td><input type="text" style="width: 500px;"
														id="addrDetail" name="addrDetail" /></td>
												</tr>

											</table>
										</div>

									</form>
								</div>
								<c:forEach items="${listCpType}" var="contactPointType"
									varStatus="s">
									<div class="form-group">
										<label>"${contactPointType.description}"</label> <input
											type="hidden"
											name="listContactPoint[${s.index}].contactPointType"
											value="${contactPointType.cpType}" class="form-control"
											readonly> <input id="${contactPointType.cpType}"
											name="listContactPoint[${s.index}].info" class="form-control">
									</div>
								</c:forEach>







								<input type='hidden' name='${_csrf.parameterName}'
									value='${_csrf.token}'>
								<button id="btnJoin" type="submit" class="btn-primary">가입</button>
								<button type="reset" class="btn-secondary">초기화</button>
							</form>


						</div>
					</div>


					<!--/login form-->
				</div>

			</div>
		</div>
		<script type="text/javascript">
		    function test() {
		      var p1 = document.getElementById('password1').value;
		      var p2 = document.getElementById('password2').value;
		      if( p1 != p2 ) {
		        alert("비밀번호가 일치 하지 않습니다");
		        return false;
		      } else{
		        alert("비밀번호가 일치합니다");
		        return true;
		      }
		
		    }
 		 </script>
	</section>

	<!-- /.container-fluid -->

	<!-- 자기소개 사진이나 동영상같은거 넣을때 활용하기 -->
	<!--  %@include file="../common/attachFileManagement.jsp"% -->
	<!-- End of Main Content -->

	<%@include file="../includes/footer.jsp"%>
	<script type="text/javascript">
		function goPopup() {
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("/apis/juso", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");

			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
			//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}

		function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
				roadAddrPart2, zipNo, detBdNmList
				
				
				) {
			
			
			document.form.roadAddrPart1.value = roadAddrPart1;
			document.form.roadAddrPart2.value = roadAddrPart2;
			document.form.addrDetail.value = addrDetail;
			
			
			document.form.zipNo.value = zipNo;
			//document.form.admCd.value = admCd;
			//document.form.rnMgtSn.value = rnMgtSn;
			//document.form.bdMgtSn.value = bdMgtSn;
			//document.form.detBdNmList.value = detBdNmList;
			/** 2017년 2월 추가제공 **/
			//document.form.bdNm.value = bdNm;
			//document.form.bdKdcd.value = bdKdcd;
			//document.form.siNm.value = siNm;
			//document.form.sggNm.value = sggNm;
			//document.form.emdNm.value = emdNm;
			//document.form.liNm.value = liNm;
			//document.form.rn.value = rn;
			//document.form.udrtYn.value = udrtYn;
			//document.form.buldMnnm.value = buldMnnm;
			//document.form.buldSlno.value = buldSlno;
			//document.form.mtYn.value = mtYn;
			//document.form.lnbrMnnm.value = lnbrMnnm;
			//document.form.lnbrSlno.value = lnbrSlno;
			/** 2017년 3월 추가제공 **/
			//document.form.emdNo.value = emdNo;

		}

		$(document).ready(function() {
			var csrfHN = "${_csrf.headerName}";
			var csrfTV = "${_csrf.token}";

			var phoneNumRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
			var cellNumRegExp = /^\d{3}-\d{3,4}-\d{4}$/;

			$("#userId").on("focusout", function(e) {
				var newBieId = $(this).val();
				//회원 ID가 유일한가를 Ajax로 검사하고 그렇지 못할 때는 Focus를 다시 받아야합니다. (우리가 개발해야되는거) -> 중복성 체크를 ajax로 해야됨
				var UserIdList = new Array();
				UserIdList = $
				{
					UserIdList
				}
				;
				//UserIdList.contains(container, contained)
				if (UserIdList.includes(newBieId)) {
					//중복일경우
					alert("cool");
				} else {
					//중복이 아닌경우
					alert("cooleeee");
				}
				//처음에 alert 넣어서 확인하기

			});

			$("#phoneNum  ").on("focusout", function() {
				var x = $(this).val()
				if (x.length > 0) {
					if (!x.match(phoneNumRegExp)) {
						alert("전화번호 형식은 00-0000-000 입니다");
					}
				}
			});

			$("#mobileNum ").on("focusout", function() {
				var x = $(this).val()
				if (x.length > 0) {
					if (!x.match(cellNumRegExp)) {
						alert("핸드폰번호 형식은 000-0000-000 입니다");
					}
				}
			});
		});

		/*
		var frmPost = $("#frmPost");
		
		$("#btnRegisterPost").on("click", function(e) {
			e.preventDefault();
			addAttachInfo(frmPost, "listAttachInStringFormat");
			frmPost.submit();
		});
		 */
	</script>

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
									Get the most recent updates from <br />our site and be updated
									your self...
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