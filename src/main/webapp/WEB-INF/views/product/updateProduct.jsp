<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품을 업데이트 해보아요!</title>
</head>
<body>
	<h1>상품을 업데이트 해보아요!</h1>
	
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
			<form id="frmProduct" method="post" action="/product/updateProduct">
				
				<div class="form-group">
					<label>수정할 상품 : </label>${Product.productName} 
				</div>
				
				<div class="form-group">
					<label>바꿀 상품 이름</label> <input name="productName" placeholder="캬캬" class="form-control">
				</div>
				<div class="form-group">
					<label>바꿀 상품 재고량</label> <input name="quantity" placeholder="숫자만가능합니다." class="form-control">
				</div>
				<div class="form-group">
					<label>바꿀 상품 가격</label> <input name="price" placeholder="이것도 숫자만가능합니다" class="form-control">
				</div>
				<div class="form-group">
					<label>바꿀 상품 사이즈</label> <input name="productSize" placeholder="이건 아무거나 가능" class="form-control">
				</div>
				
				
				<input name="productId" type="hidden" value="${Product.productId}" class="form-control">
				<input name="categoryId" type="hidden" value="${Product.categoryId}">
				<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
				<button id="btnJoin" type="submit" class="btn btn-primary">상품정보수정</button>
				<button type="reset" class="btn btn-secondary">초기화</button>
			</form>
		</div>
	</div>
</div>	
</body>
</html>