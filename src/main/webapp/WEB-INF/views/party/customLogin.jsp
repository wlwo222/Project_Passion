<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Passion for Fashion</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/loginstyle.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/prettyPhoto.css" rel="stylesheet">
<link href="/resources/css/price-range.css" rel="stylesheet">
<link href="/resources/css/animate.css" rel="stylesheet">
<link href="/resources/css/loginstyle.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
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
      <div class="bg-img">
         <div class="content">
            <header><a href="/homes/index?pageNumber=1&amount=12"><img
								src="/resources/images/icon/logo4.png" alt="" /></a></header>
            <form action="/login" role="form" method="post">
            	<fieldset>
            	<div class="loginerror">
            	<p>${error}</p>
            	</div>
	               <div class="field">
	                  <span class="fa fa-user"></span>
	                  <input type="text" name="username" required placeholder="ID">
	               </div>
	               <div class="field space">
	                  <span class="fa fa-lock"></span>
	                  <input type="password" class="pass-key" name="password" required placeholder="Password">
	                  <span class="show">보이기</span>
	               </div>
		           <div class='checkbox'>
					<p><input type="checkbox" name='remember-me'>자동로그인</p>
				   </div>
               </fieldset>
               <div class="field">
               <input type="submit" value="login">
               </div>
               <input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
            </form>
            <div class="pass">
                  <a href="#">비밀번호 찾기</a>
               </div>
            <div class="login" >
               Or login with
            </div>
            <div class="links">
               <div class="kakao">
                  <a class="kakao1"></a>
               </div>
            </div>
            <div class="signup">
               회원이 아니시라면?
            <a href="/party/joinMember">회원 가입</a>
            </div>
         </div>
      </div>
      <script>
         const pass_field = document.querySelector('.pass-key');
         const showBtn = document.querySelector('.show');
         showBtn.addEventListener('click', function(){
          if(pass_field.type === "password"){
            pass_field.type = "text";
            showBtn.textContent = "숨기기";
            showBtn.style.color = "#3498db";
          }else{
            pass_field.type = "password";
            showBtn.textContent = "보이기";
            showBtn.style.color = "#222";
          }
         });
      </script>

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