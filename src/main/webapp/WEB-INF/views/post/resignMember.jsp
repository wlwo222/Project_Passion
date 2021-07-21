<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지마세여!</title>
</head>
<body>
	<h1>회원탈퇴 ㅠㅠ</h1>
	
	<form method="post" action="/party/resignMember">
		정말 돔황가시는건가요? <input type='text' name="UserId" value= <sec:authentication property="principal.username"/> readonly="readonly">님ㅠㅠ
		<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'><br>
		
		<button>언능 돔황챠!</button>
	</form>
</body>
</html>