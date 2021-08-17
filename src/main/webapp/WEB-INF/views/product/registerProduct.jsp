<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready(function(){
	var csrfHN = "${_csrf.headerName}";
	var csrfTV = "${_csrf.token}";
	
	$(document).ajaxSend(
		function(e, xhr) {
			xhr.setRequestHeader(csrfHN, csrfTV);
		}
	);
	/*
	var frmPost = $("#frmPost");
	
	$("#btnRegisterPost").on("click", function(e) {
		e.preventDefault();
		addAttachInfo(frmPost, "listAttachInStringFormat");
		frmPost.submit();
	});
	*/
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
			<form id="frmProduct" method="post" action="/product/registerProduct">

				<div class="form-group">
					<label>카테고리</label> 
					<select name="categoryId">
					<c:forEach items="${categoryList}" var="cat">
						<option value="${cat.categoryId}">${cat.categoryName}</option><br>
					</c:forEach>
					</select>

				</div>
								
				<div class="form-group">
					<label>상품이름</label> <input  name="productName" class="form-control">
				</div>
				
				<div class="form-group">
					<label>수량</label> <input  name="quantity" class="form-control">
				</div>
				
				<div class="form-group">
					<label>가격</label> <input name="price" class="form-control">
				</div>
				
				<div class="form-group">
					<label>사이즈</label> <input  name="productSize" class="form-control">
				</div>
										
				<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
				<button id="btnJoin" type="submit" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-secondary">초기화</button>
			</form>
		</div>
	</div>
</div>
<!-- /.container-fluid -->
<!-- 자기소개 사진이나 동영상같은거 넣을때 활용하기 -->
<!--  %@include file="../common/attachFileManagement.jsp"% -->


<%@include file="../includes/footer.jsp"%>
</body>

</html>