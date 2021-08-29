<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
			<form id="frmMember" method="post" action="/party/updateMember">

				<label>UserId</label> <input name="userId" type="hidden"
					value=<sec:authentication property="principal.username"/>
					class="form-control">
				<sec:authentication property="principal.username" />

				<div class="form-group">
					<label>비밀번호 :</label> 
					<input type="password" id="password1"
						name="userPwd" placeholder="영문자 숫자 6자리 이상"
						pattern="^([a-z0-9]){6,50}$" required="required"> <br>
					<label> 비밀번호확인 :</label> 
					<input type="password" id="password2">
					<input type="button" onclick="test()" value="확인">
				</div>

				<div class="form-group">
					<label>이름</label> <input name="name" class="form-control">
				</div>

				<div class="form-group">
					<input type="hidden" id="contactChoice1"
						name="male"
						value=<sec:authentication property="principal.curUser.male"/> readonly>
				</div>

				<div class="form-group">
					<label>"우편번호"</label> <input type="hidden"
						name="listContactPoint[3].contactPointType" value="zip_code  "
						class="form-control" readonly> <input id="zip_code  "
						placeholder="우편번호" name="listContactPoint[3].info"
						class="form-control" onclick="findAddr()">
				</div>

				<div class="form-group">
					<label>"주소지"</label> <input id="findAddr_roadAddress" type="hidden"
						name="listContactPoint[0].contactPointType" value="address   "
						class="form-control" readonly> <input id="address   "
						placeholder="Address" name="listContactPoint[0].info"
						class="form-control">
				</div>

				<div class="form-group">
					<label>"상세주소"</label> <input type="hidden"
						name="listContactPoint[4].contactPointType" value="d_addr    "
						class="form-control" readonly> <input id="d_addr    "
						id="상세주소" type="text" name="listContactPoint[4].info"
						class="form-control">
				</div>

				<div class="form-group">
					<label>"주소지에 있는 전화 번호"</label> <input type="hidden"
						name="listContactPoint[1].contactPointType" value="phoneNum  "
						class="form-control" readonly> <input id="phoneNum  "
						name="listContactPoint[1].info" class="form-control">
				</div>

				<div class="form-group">
					<label>"핸드폰 번호"</label> <input type="hidden"
						name="listContactPoint[2].contactPointType" value="mobileNum "
						class="form-control" readonly> <input id="mobileNum "
						name="listContactPoint[2].info" class="form-control">
				</div>

				<input type='hidden' name='${_csrf.parameterName}'
					value='${_csrf.token}'>
				<button id="btnJoin" type="submit" class="btn btn-primary">정보수정</button>
				<button type="reset" class="btn btn-secondary">초기화</button>

				<a href="/party/resignMember"> <input type="button"
					value="회원 탈퇴" style="position: absolute; right: 10px;" /></a>
			</form>
		</div>
	</div>
</div>


<!-- /.container-fluid -->

<!-- 자기소개 사진이나 동영상같은거 넣을때 활용하기 -->
<!--  %@include file="../common/attachFileManagement.jsp"% -->
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("zip_code  ").value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("address   ").value = roadAddr;
				}

				else if (jibunAddr !== '') {
					document.getElementById("address   ").value = jibunAddr;
				}

			}
		}).open();
	}
	
	function test() {
		var p1 = document.getElementById('password1').value;
		var p2 = document.getElementById('password2').value;
		if (p1 != p2) {
			alert("비밀번호가 일치 하지 않습니다");
			return false;
		} else {
			alert("비밀번호가 일치합니다");
			return true;
		}

	}

	$(document).ready(function() {
		var csrfHN = "${_csrf.headerName}";
		var csrfTV = "${_csrf.token}";

		$(document).ajaxSend(function(e, xhr) {
			xhr.setRequestHeader(csrfHN, csrfTV);
		});

		$("#userId").on("focusout", function(e) {
			//회원 ID가 유일한가를 Ajax로 검사하고 그렇지 못할 때는 Focus를 다시 받아야합니다. (우리가 개발해야되는거) -> 중복성 체크를 ajax로 해야됨
			//처음에 alert 넣어서 확인하기
		});

		/*
		var frmPost = $("#frmPost");
		
		$("#btnRegisterPost").on("click", function(e) {
			e.preventDefault();
			addAttachInfo(frmPost, "listAttachInStringFormat");
			frmPost.submit();
		});
		 */
	});
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

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

