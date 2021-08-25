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

				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">Features Items</h2>
						<script src="/resources/js/jquery.js"></script>
							<!-- ProductVO -->
						<c:forEach items="${productList}" var="product" varStatus="status">
						<div class="itemContainer">
								<div class="product-image-wrapper">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="card">
												<div class="imgBx">
													<img alt="" src="${product.pdAddInfo[1].description}">
													<ul class="showAction">
														<li><i class="fa fa-heart" aria-hidden="true"></i>
														 <span>Add	to Wishlist</span></li>
														<li><i class="fa fa-shopping-cart" aria-hidden="true">
																<a href="#${product.productId}" class="btn"><input type="button"
																	onclick="cartButton_click()"></a>
														</i> <span>Add to Cart</span></li>
														<li><a class="fa fa-eye" aria-hidden="true"
															href="/homes/productDetail?productId=${product.productId}"></a>
															<span>View Details</span></li>
													</ul>
												</div>
												<div class="content">
													<a class="productName"
														href="/homes/productDetail?productId=${product.productId}">
														<h3>${product.productName}</h3>
													</a>
													<div class="price_rating" id="${status.index}">
														<h2>${product.price}원</h2>
														<p></p>
														<!-- 별점 표시하는 부분 -->
													</div>
												</div>
												<div class="navigationCart">
													<div class="popup3" id="${product.productId}">
														<div class="header">
															<h1>옵션 선택</h1>
															<a href="#none"><i class="fa fa-times"
																aria-hidden="true"></i></a>
														</div>
														<div class="content">
															<div class="product-detail">
																<h2 class="name">
																	<input type="hidden" id="${product.productId}">
																	<strong>${product.productName}</strong>
																</h2>
																<div class="productNormal ">
																	<div class="product-image imgArea ">
																		<img
																			src="//jb-shop.kr/web/product/tiny/202104/5b1a49254287b0bcd9c85e496c0d1429.webp"
																			onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
																			class=""> &nbsp;
																	</div>
																	<table border="1" summary=""
																		class="xans-element- xans-product xans-product-option xans-record-">
																		<caption>상품 옵션</caption>
																		<colgroup>
																			<col width="120px">
																			<col width="auto">
																		</colgroup>
																		<tbody></tbody>
																		<tbody class="product-option xans-record-">
																			<tr>
																				<th scope="row">Color</th>
																				<td><select option_product_no="6940"	option_select_element="ec-option-select-finder"
																					option_sort_no="1" option_type="T"
																					item_listing_type="S" option_title="Color"
																					product_type="product_option"
																					product_option_area="product_option_6940_0"
																					name="option1" id="product_option_id1"
																					class="ProductOption0" option_style="select"
																					required="true">
																						<%-- <c:forEach items="${pdAddInfo}" var="productAddInfo">
																						
																						</c:forEach> --%>
																				</select>
																					<p class="value"></p></td>
																			</tr>
																		</tbody>
																		<tbody class="product-option xans-record-">
																			<tr>
																				<th scope="row">Size</th>
																				<td><select option_product_no="6940"
																					option_select_element="ec-option-select-finder"
																					option_sort_no="2" option_type="T"
																					item_listing_type="S" option_title="SIze"
																					product_type="product_option"
																					product_option_area="product_option_6940_0"
																					name="option2" id="product_option_id2"
																					class="ProductOption0" option_style="select"
																					required="true"><option value="*"
																							selected="" link_image="">- [필수] 사이즈를 선택해 주세요 -</option>
																						<option value="**" disabled="" link_image="">-------------------</option></select>
																					<p class="value"></p></td>
																			</tr>
																		</tbody>
																		<tbody></tbody>
																	</table>
																</div>

																<div id="totalPrice" class="totalPrice">
																	<strong>총 상품금액</strong>(수량) : <span class="total"><strong><em>0</em></strong>
																		(0개)</span>
																</div>
																<p	class="ec-base-help txt11 displaynone EC-price-warning"></p>
															</div>
														</div>
														<div class="xans-element- xans-product xans-product-action ec-base-button ">
															<a href="#none" class="btnSubmitFix sizeS"	onclick="product_submit(1, '/exec/front/order/basket/', this)">
																<span id="btnBuy">바로구매하기</span>
															</a> <a href="#none" class="btnNormalFix sizeS "
																onclick="product_submit(2, '/exec/front/order/basket/', this)">
																장바구니 담기</a>
															<!-- 네이버 체크아웃 구매 버튼 -->
															<div id="NaverChk_Button">
																<div id="NC_ID_1629267985034364"
																	class="npay_storebtn_bx npay_type_A_2">
																	<div id="NPAY_BUTTON_BOX_ID" class="npay_button_box ">
																		<div class="npay_button">
																			<div class="npay_text">
																				<span class="npay_blind"></span>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
							<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
							<script>
								var score = ${product.pdAddInfo[0].description};
								var printscore = "";
								printscore += "<div class='rating'>"
								switch (score) {
								case 1:
									printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
									printscore += "</div>";
									$("#${status.index}").append(printscore);
									break;
								case 2:
									printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
									printscore += "</div>";
									$("#${status.index}").append(printscore);
									break;
								case 3:
									printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
									printscore += "</div>";
									$("#${status.index}").append(printscore);
									break;
								case 4:
									printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star' aria-hidden='true'></i>";
									printscore += "<i class='fa fa-star grey' aria-hidden='true'></i>";
									printscore += "</div>";
									$("#${status.index}").append(printscore);
									break;
								case 5:
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
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!--features_items-->
						<!-- ################################################################################Product End################################################################################ -->
					</div>
				</div>
		<jsp:include page="/resources/module2.jsp" flush="false" />
</body>
</html>