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
				${prod.productName}<br>
				${prod.price}<br>
				${prod.productSize}<br>
	</c:forEach>
	
	
	
	
	
	
		
	-------------################		상품 수정부분		######################------------------<br>
	
	
	<c:forEach items="${productList}" var="prod">
		<a href="/product/updateProduct?ProductId=${prod.productId}">${prod.productName}</a><br>
	</c:forEach>
</body>
</html>