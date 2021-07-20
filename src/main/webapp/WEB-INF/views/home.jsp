<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	
	<sec:authorize access="isAnonymous()">
		<a href="/party/customLogin">로그인</a>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<c:forEach items="${boardList}" var="board">
			<a href="/post/listBySearch?boardId=${board.id}">${board.name}</a>
			<br>
		</c:forEach>
		<a href="/party/customLogout">로그아웃</a>
		<a href="/party/updateMember">회원정보수정관리페이지</a>
	</sec:authorize>
		
	<a href="/party/joinMember"> 회원가입</a>
	<a href="/product/listByProduct"> 상품구경하러가기</a>
	<a href="/product/registerProduct"> 상품맹글기</a>
</body>
</html>
