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
<link href="/resources/css/joinstyle.css" rel="stylesheet">
<link href="/resources/css/sexBox.css" rel="stylesheet">
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
<style type="text/css">


</style>
</head>
<!--/head-->
<body>

	
	<section id="form">
		<!--form-->
	 <div class="bg-img">
		<div class="content">
		  <header><a href="/homes/index?pageNumber=1&amount=12"><img
								src="/resources/images/icon/투명배경POF.png" alt="" /></a></header>
				<div class="col-sm-7 col-sm-offset-2">
						<div class="joins">
							<form id="frmMember" method="post" action="/party/joinMember">

								<div class="form-group">
									<label>아이디</label> <input id="userId" name="userId"
										class="form-control" pattern="[a-z0-9]{4,16}" required
										placeholder="영문소문자/숫자, 4~16자">
								</div>

								<div class="form-group">
									<label>비밀번호</label> <br> <input type="password"
										id="password1" name="userPwd" placeholder="영문자 숫자 6자리 이상"
										pattern="^([a-z0-9]){6,50}$" required="required">
								</div>
								<div class="form-group">
									<input type="password" id="password2" placeholder="비밀번호확인">
								</div>

								<div class="form-group">
									<label>이름</label> <input name="name" class="form-control">
								</div>
								<br>
								<br>
								<div class="form-group">
									<div class="box">
										<p>성별</p>
										<label for="contactChoice1"> 
										<input type="radio" id="contactChoice1" 
										name="male" value="1">
											<span class="man">남자</span>
										</label> 
										
										<label for="contactChoice2"> 
										<input type="radio" id="contactChoice2"
										name="male" value="0">
											<span class="female">여자</span>
										</label>
									</div>
								</div>
								<br>
								<br>
								<div class="form-group">
									<label>생년월일</label> <input type="date" name="birthDate"
										value="1990-06-01" class="form-control">
								</div>

								<div class="form-group">
									<label>우편번호</label> <input type="hidden"
										name="listContactPoint[3].contactPointType" value="zip_code  "
										class="form-control" readonly> <input id="zip_code"
										placeholder="우편번호" name="listContactPoint[3].info"
										class="form-control" onclick="findAddr()">
								</div>

								<div class="form-group">
									<label>주소지</label> <input id="findAddr_roadAddress"
										type="hidden" name="listContactPoint[0].contactPointType"
										value="address   " class="form-control" readonly> <input
										id="address" placeholder="Address"
										name="listContactPoint[0].info" class="form-control">
								</div>

								<div class="form-group">
									<label>상세주소</label> <input type="hidden"
										name="listContactPoint[4].contactPointType" value="d_addr    "
										class="form-control" readonly> <input id="d_addr"
										type="text" name="listContactPoint[4].info"
										class="form-control">
								</div>

								<div class="form-group">
									<label>자택 전화번호</label> <input type="hidden"
										name="listContactPoint[1].contactPointType" value="phoneNum  "
										class="form-control" readonly> <input id="phoneNum"
										name="listContactPoint[1].info" class="form-control"
										placeholder="-는 생략바랍니다">
								</div>

								<div class="form-group">
									<label>핸드폰 번호</label> <input type="hidden"
										name="listContactPoint[2].contactPointType" value="mobileNum "
										class="form-control" readonly> <input id="mobileNum"
										name="listContactPoint[2].info" class="form-control"
										placeholder="-는 생략바랍니다">
								</div>

								<input type='hidden' name='${_csrf.parameterName}'
									value='${_csrf.token}'>
									
								<div class="join-btn">
					               <input type="submit" value="가입">
					               </div>
								
							</form>


					</div>

					<!--/login form-->
				</div>

			</div>
	</div>
	</section>

	<!-- /.container-fluid -->

	<!-- 자기소개 사진이나 동영상같은거 넣을때 활용하기 -->
	<!--  %@include file="../common/attachFileManagement.jsp"% -->
	<!-- End of Main Content -->

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		
		var csrfHN = "${_csrf.headerName}";
		var csrfTV = "${_csrf.token}";

		var phoneNumRegExp = "/^\d{2,3}-\d{3,4}-\d{4}$/";
		var cellNumRegExp = /^\d{3}-\d{3,4}-\d{4}$/;

		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function findAddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수
							var jibunAddr = data.jibunAddress; // 지번 주소 변수
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById("zip_code").value = data.zonecode;
							if (roadAddr !== '') {
								document.getElementById("address").value = roadAddr;
							}

							else if (jibunAddr !== '') {
								document.getElementById("address").value = jibunAddr;
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

			$("#userId").on("focusout", function() {
				var idchk = 0;
				var userId = $(this).val();
				var strLength = $(this).length;
				$.ajax({
					async: true,
		            type : 'GET',
		            data : userId,
		            url : "/party/idCheck?userId=" + userId,
		            dataType : "json",
		            contentType: "application/json; charset=UTF-8",
					success : function(data) {							
						if (data.cnt > 0) {
							alert('다른 아이디로 입력하시오');
							$("#userId").val('');
						} else if (data.cnt === 0 && strLength > 0) {
							alert('사용 가능한 아이디입니다');	
							idchk = 1;
						}
						}, 
						error : function(error) {
							console.log("fail" + error);
						}
					});
				});

			$("#phoneNum").on("focusout", function() {
				var phoneNumRegExp = /^\d{2,3}\d{3,4}\d{4}$/;
				var x = $(this).val();
				if (x.length > 0) {
					if (!x.match(phoneNumRegExp)) {
						alert("자택 전화번호 형식 확인바랍니다");
						$(this).val('');
					}
				}
			});

			$("#mobileNum").on("focusout",function() {
				var cellphoneNumRegExp = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
				var x = $(this).val();
				if (x.length > 0) {
					if (!x.match(cellphoneNumRegExp)) {
						alert("핸드폰번호 형식은 01★-0000-000 입니다");
						$(this).val('');
					}
				}
			});

			$("#password2").on("focusout",function() {
					var p1 = document
							.getElementById('password1').value;

					var forSubmit = "";
					if (p1 == $(this).val()) {
						alert("비밀번호가 일치합니다");
						
						forSubmit = "true";
					} else {
						alert("비밀번호를 다시 확인합시다");
						forSubmit = "false";
						$(this).val('');
					}
				});
		});
	</script>

	<script src="/resources/js/jquery.js"></script>
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