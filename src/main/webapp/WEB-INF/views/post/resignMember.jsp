<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/party/resignMember">
		정말 돔황가시는건가요? 
		<input type='text' name="userId" 
		value= <sec:authentication property="principal.username"/> readonly>
		탈퇴를 위해서 비밀번호를 확인하시오
		<input type="password" name="userPwd">
		<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'><br>
		
		<button>언능 돔황챠!</button>
	</form>
</body>
<script src="/resources/js/jquery.js"></script>
<script type="text/javascript">
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
</html>