<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
	-------------################		상품목록 		######################------------------<br>
	<c:forEach items="${productList}" var="prod">
			<p>상품 이름 :${prod.productName}<br>
			상품 수량 : ${prod.quantity}<br>
			상품 가격 :${prod.price}<br>
			상품 사이즈 :${prod.productSize}<br></p>
	</c:forEach>
	
	
	
	
	
	
		
	-------------################		상품 수정부분		######################------------------<br>
	
	
	<c:forEach items="${productList}" var="prod">
		<a href="/product/updateProduct?ProductId=${prod.productId}">${prod.productName}</a><br>
	</c:forEach>
	
	
	-----------------------#################### 상품삭제  ######################-------------------------
	<br>

	<h1>상품을 날려보아요!</h1>

	<label>삭제할 상품 선택</label>
	<form id="frmProduct" method="post" action="/product/listByProduct">
				  
		<c:forEach items="${productList}" var="prod" varStatus="status">
			<p><label>${prod.productName}</label><input type="radio" name="ProductId" value="${prod.productId}"></p>
		</c:forEach>
		
		<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
		<button id="btnJoin" type="submit" class="btn btn-primary">선택 상품 삭제</button>
	</form>
</body>
</html>