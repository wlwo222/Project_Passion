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
</head>
<body>
	<div class="navigation">
		<div class="toggle"></div>
		<ul>
			<li><a href="#"> <span class="icon"> <i
						class="fa fa-home" aria-hidden="true"></i></span> <span class="title">HOME</span>
			</a></li>
			<li><a href="#"> <span class="icon"> <i
						class="fa fa-user" aria-hidden="true"></i></span> <span class="title">마이페이지</span>
			</a></li>
			<li><a href="#"> <span class="icon"> <i
						class="fa fa-comment" aria-hidden="true"></i></span> <span class="title">고객센터</span>
			</a></li>
			<li><a href="#"> <span class="icon"> <i
						class="fa fa-lock" aria-hidden="true"></i></span> <span class="title">로그인</span>
			</a></li>
			<li><a href="#"> <span class="icon"> <i
						class="fa fa-sign-out" aria-hidden="true"></i></span> <span class="title">로그아웃</span>
			</a></li>
		</ul>
	</div>
	<!-- -------------- mini icon cart ----------------- -->
	<sec:authorize access="isAuthenticated()">
	<div class="navigationCart">
		<div class="toggle2"></div>
		<ul>
			<li><a href="#pop1" class="btn"> <span class="icon" id="carticon">
						<i class="fa fa-shopping-cart" aria-hidden="true"></i>
				</span> <span class="title"></span>
			</a></li>

		</ul>

	
		<div class="popup" id="pop1">
			<div class="header">
				<h1 class="df-lang-fxax-tit-cart">장바구니</h1>
				<a href="#none"><i class="fa fa-times" aria-hidden="true"></i></a>
				<p id="cartContent"></p>
			</div>
			<div class="footer">
				<a href="/order/basket.html"
					class="fxb-btn fxb-btn-ft df-lang-fxax-all">전체보기</a>
			</div>
		</div>
	</div>
	</sec:authorize>
</body>
<script src="/resources/js/jquery.js"></script>
<script>
var csrfHN = "${_csrf.headerName}";
var csrfTV = "${_csrf.token}";

$(document).ajaxSend(
	function(e, xhr) {
		xhr.setRequestHeader(csrfHN, csrfTV);
	});

$("#carticon").click(function(e){
	//버튼을 클릭하면 ajax로 로그인 정보를 보내고, 장바구니 데이터를 받습니다. 
	$.getJSON(
			"/order/callCart.json",
			function(replyObj) {
				if (replyObj)   {
					$("#cartContent").html(replyObj.productListforCart);
				}
			}
		).fail(
			function(errMsg){
				if (errMsg) {
					alert(errMsg);
				}
			}
		);
});
</script>
</html>