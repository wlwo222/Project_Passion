<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<meta name="description" content="">
<meta name="author" content="">
<title>Passion for Fashion</title>
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

<body>
	<jsp:include page="/resources/module1.jsp" flush="false" />
						
				<c:forEach items="${jacket}" var="product" varStatus="status">
						<!-- ProductVO -->
						 <div class="itemContainer">
							<div class="product-image-wrapper">
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="card">
											<div class="imgBx">
												<img alt="" src="${product.pdAddInfo[1].description}">
									<ul class="showAction">
														<li><i class="fa fa-heart" aria-hidden="true"></i></li>


														<li><a class="fa fa-shopping-cart" aria-hidden="true"
																 href="#pop3" ><input type="button"
																	onclick="cartButton_click()"></a>
														<span>Add to Cart</span></li>


														<li><a class="fa fa-eye" aria-hidden="true"
															href="/homes/productDetail?productId=${product.productId}"></a>
															<span>View Details</span></li>
													</ul>
											</div>
											<div class="content">
												<a class="productName" href="/homes/productDetail?productId=${product.productId}">
													<h3>${product.productName}</h3>
												</a>
												<div class="price_rating" id="${status.index}">
													<h2>${product.price}원
													</h2>
													<p></p> <!-- 별점 표시하는 부분 -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script>
						var score=${product.pdAddInfo[0].description};
						var printscore = "";
						printscore += "<div class='rating'>"
							switch(score){
							case 1 :
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "</div>";
								$("#${status.index}").append(printscore);
								break;
							case 2 :
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "</div>";
								$("#${status.index}").append(printscore);
								break;
							case 3 :
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "</div>";
								$("#${status.index}").append(printscore);
								break;
							case 4 :
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
								printscore += "</div>";
								$("#${status.index}").append(printscore);
								break;
							case 5 :
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
								printscore += "</div>";
								$("#${status.index}").append(printscore);
								break;
							}
						</script>
						</c:forEach>
				<jsp:include page="/resources/module2.jsp" flush="false" />		
</body>
</html>