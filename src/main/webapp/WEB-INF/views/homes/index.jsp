<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<meta name="description" content="">
<meta name="author" content="">
<title>Home | E-Shopper</title>
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
	<jsp:include page="/resources/header.jsp" flush="false" />
	<section id="slider">
		<!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0"
								class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>

						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<img src="/resources/images/home/girl2.jpg"
										class="girl img-responsive" alt="" /> 
									
								</div>
								<div class="col-sm-6">
									<img src="/resources/images/model/nara.jpg"
										class="girl img-responsive" alt="" /> 
										<!-- <img src="/resources/images/home/pricing.png" class="pricing"
										alt="" /> -->
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<img src="/resources/images/model/boyong.jpg"
										class="girl img-responsive" alt="" /> 
									
								</div>
								<div class="col-sm-6">
									<img src="/resources/images/model/nara1.jpg"
										class="girl img-responsive" alt="" /> 
										<!-- <img src="/resources/images/home/pricing.png" class="pricing"
										alt="" /> -->
								</div>
							</div>

							<div class="item">
								<div class="col-sm-6">
									<img src="/resources/images/model/borum.jpg"
										class="girl img-responsive" alt="" /> 
									
								</div>
								<div class="col-sm-6">
									<img src="/resources/images/model/borum1.jpg"
										class="girl img-responsive" alt="" /> 
										<!-- <img src="/resources/images/home/pricing.png" class="pricing"
										alt="" /> -->
								</div>
							</div>

						</div>

						<a href="#slider-carousel" class="left control-carousel hidden-xs"
							data-slide="prev"> <i class="fa fa-angle-left"></i>
						</a> <a href="#slider-carousel"
							class="right control-carousel hidden-xs" data-slide="next"> <i
							class="fa fa-angle-right"></i>
						</a>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!--/slider-->

	<!-- ################################################################################Categories################################################################################ -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian">
							<!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#top"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Top
										</a>
									</h4>
								</div>
								<div id="top" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/top/hood?pageNumber=1&amount=12">hood </a></li>
											<li><a href="/homes/top/longsleeves?pageNumber=1&amount=12">longsleeves </a></li>
											<li><a href="/homes/top/mantoman?pageNumber=1&amount=12">mantoman </a></li>
											<li><a href="/homes/top/pique?pageNumber=1&amount=12">pique</a></li>
											<li><a href="/homes/top/shirt?pageNumber=1&amount=12">shirt </a></li>
											<li><a href="/homes/top/shortsleeve?pageNumber=1&amount=12">shortsleeve </a></li>
											<li><a href="/homes/top/sleeveless?pageNumber=1&amount=12">sleeveless </a></li>
											<li><a href="/homes/top/sweater?pageNumber=1&amount=12">sweater</a></li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#hat"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Hat
										</a>
									</h4>
								</div>
								<div id="hat" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/hat/baseballcap?pageNumber=1&amount=12">baseballcap</a></li>
											<li><a href="/homes/hat/beanie?pageNumber=1&amount=12">beanie</a></li>
											<li><a href="/homes/hat/beret?pageNumber=1&amount=12">beret</a></li>
											<li><a href="/homes/hat/fedora?pageNumber=1&amount=12">fedora</a></li>
											<li><a href="/homes/hat/otherhats?pageNumber=1&amount=12">otherhats</a></li>
											<li><a href="/homes/hat/trooper?pageNumber=1&amount=12">trooper</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#outer"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Outer
										</a>
									</h4>
								</div>
								<div id="outer" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/outer/cardigan?pageNumber=1&amount=12">cardigan</a></li>
											<li><a href="/homes/outer/hoodzipup?pageNumber=1&amount=12">hoodzipup</a></li>
											<li><a href="/homes/outer/seasoncoat?pageNumber=1&amount=12">seasoncoat</a></li>
											<li><a href="/homes/outer/jacket?pageNumber=1&amount=12">jacket</a></li>
											<li><a href="/homes/outer/otherouter?pageNumber=1&amount=12">otherouter</a></li>
											<li><a href="/homes/outer/wintercoat?pageNumber=1&amount=12">wintercoat</a></li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#pants"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Pants
										</a>
									</h4>
								</div>
								<div id="pants" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/pants/leggings?pageNumber=1&amount=12">leggings</a></li>
											<li><a href="/homes/pants/pants?pageNumber=1&amount=12">pants</a></li>
											<li><a href="/homes/pants/slacks?pageNumber=1&amount=12">slacks</a></li>
											<li><a href="/homes/pants/suit?pageNumber=1&amount=12">suit</a></li>
											<li><a href="/homes/pants/training?pageNumber=1&amount=12">training</a></li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#shoes"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Shoes
										</a>
									</h4>
								</div>
								<div id="shoes" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/shoes/sandalsslippersboots?pageNumber=1&amount=12">sandals,slippers,boots</a></li>
											<li><a href="/homes/shoes/shoes?pageNumber=1&amount=12">shoes</a></li>
											<li><a href="/homes/shoes/sneakers?pageNumber=1&amount=12">sneakers</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#pants"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Pants
										</a>
									</h4>
								</div>
								<div id="pants" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/pants/leggings?pageNumber=1&amount=12">leggings</a></li>
											<li><a href="/homes/pants/pants?pageNumber=1&amount=12">pants</a></li>
											<li><a href="/homes/pants/slacks?pageNumber=1&amount=12">slacks</a></li>
											<li><a href="/homes/pants/suit?pageNumber=1&amount=12">suit</a></li>
											<li><a href="/homes/pants/training?pageNumber=1&amount=12">training</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#shoes"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Shoes
										</a>
									</h4>
								</div>
								<div id="shoes" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/homes/pants/sandalsslippersboots?pageNumber=1&amount=12">sandals,slippers,boots</a></li>
											<li><a href="/homes/pants/shoes?pageNumber=1&amount=12">shoes</a></li>
											<li><a href="/homes/pants/sneakers?pageNumber=1&amount=12">sneakers</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--/category-products-->
						<!-- ################################################################################Categories end################################################################################ -->
						<!-- ################################################################################Product Start################################################################################ -->
						<div class="price-range">
							<!--price-range-->
							<h2>Price Range</h2>
							<div class="well text-center">
								<input type="text" class="span2" value="" data-slider-min="0"
									data-slider-max="600" data-slider-step="5"
									data-slider-value="[250,450]" id="sl2"><br /> <b
									class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div>
						<!--/price-range-->

						<div class="shipping text-center">
							<!--shipping-->
							<img src="/resources/images/home/shipping.jpg" alt="" />
						</div>
						<!--/shipping-->

					</div>

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
														<li><i class="fa fa-heart" aria-hidden="true"></i> <span>Add
																to Wishlist</span></li>


														<li><i class="fa fa-shopping-cart" aria-hidden="true">
																<a href="#pop3" class="btn"><input type="button"
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
													<div class="popup3" id="pop3">
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
																						<c:forEach items="${pdAddInfo}" var="productAddInfo">
																						
																						</c:forEach>
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
											</div>
										</div>
									</div>
								</div>
							<script>
								function cartButton_click() {
									var obj = document
											.getElementById('miniCartBox');
									var list = document
											.querySelector('#myList');
									var li = list.children;
									obj = obj.append(li);

								}
							</script>
							<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
						</c:forEach>
						<!--features_items-->
						<!-- ################################################################################Product End################################################################################ -->
						</div>
					</div>
					<div class='fa-pull-right'>
						${pagenation.pagingDiv}
					</div>
				</div>
			</div>
	</section>
	<!-- 페이징 처리 -->
	
	<!-- 풋 상단 notice  -->
	<div class="container1" id="sp-footer-design">
		<!--상단-->
		<div class="row">
			<div class="col-sm-6">
				<div class="inside">
					<div class="head">
						<br>
						<h3>NOTICE</h3>
						<div class="icons cover">
							<a href="/board/index.html">
								<p>
									<img src="">
								</p> <span>POF 교환 및 환불 안내사항</span>
							</a> <a href="/myshop/order/list.html">
								<p>
									<img src="">
								</p> <span>구매 금액 별 무료배송 & 사은품 안내</span>
							</a> <a href="/board/product/list.html?board_no=6">
								<p>
									<img src="">
								</p> <span>POF 회원 등급제 혜택이 쏟아집니다!</span>
							</a> <a href="/board/review/list.html?board_no=4">
								<p>
									<img src="">
								</p> <span>POF 어플리케이션 출시 !</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 풋 두번째 -->
	<div class="container2" id="sp-footer-design2">
		<div class="row">
			<div class="col-sm-4">
				<div class="logo bannermanage2-tricklink" banner-push="footerlogo">
					<a href="/"><img class="banne r_image" rel="258-14"
						src="/resources/images/p-service/14.png"></a> <br> <br>
				</div>
				<div class="description ">
					<span><br>주식회사 POF / POF</span> <span>Business Address
						: 16F 1633, 586, Gukchaebosang-ro, Jung-gu, Pyeongtaec, Republic
						of Korea</span>
					<!--자동사용<span>대구광역시 중구 국채보상로 586 (동성로2가) 16층 1633호 (동성로2가)</span>-->
					<span>대표자 : 원천지재</span> <span>개인정보보호책임자 : 원천지재 <!--smallmanblog@naver.com--></span>
					<br> <span>팩스 070-4009-6213&nbsp;&nbsp;</span> <span>사업자등록번호
						502-81-93867&nbsp;&nbsp;</span> <span>통신판매업신고
						2020-평택시-0715&nbsp;&nbsp;</span> <span><a href="#none" class=""
						onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=5028193867', 'bizCommPop', 'width=750, height=950;');return false;">사업자정보확인</a></span>
				</div>
				<div class="copyright ">
					<br>POF 상품/판매자/쇼핑 정보, 콘텐츠, UI 등에 대한 무단 복제, 전송, 배포, 스프래핑 등의 행위는
					저작권법, <a href="http://www.law.go.kr/lsInfoP.do?lsiSeq=105953"
						target="_blank">콘텐츠산업 진흥법</a>으로 금지됩니다.<br> COPYRIGHT(C) 2006
					POF LTD. ALL RIGHTS RESERVED. designed by <a
						href="//www.pandassi.com" target="_blank">POF</a>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="account">
					<span><br>ACCOUNT INFO <br>기업 457-093541-04-015
						예금주: (주)POF</span>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="WITH US">
					<div class="head">
						WITH US
						<div class="icons cover">
							<br> <a href="/board/index.html"> <span>COMPANY </span><br>
							</a> <a href="/myshop/order/list.html"> <span>AGREEMENT</span><br>
							</a> <a href="/board/product/list.html?board_no=6"> <span>PRIVACY
									POLICY</span><br>
							</a> <a href="/board/review/list.html?board_no=4"> <span>GUIDE</span>
							</a>
						</div>
					</div>
					<div class="m_head">
						<br>SNS SERVICE
						<div class="icons cover">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="RETURN">
					<div class="RETURN / EXCHANGE">
						<span>RETURN / EXCHANGE <br> 경기도 안양시 동안구 엘에스로 53번길 9
							(호계동) 미래타운 501호 자세한 교환·반품절차 안내는 문의란 및 공지사항을 참고해주세요<br></span>
						<ul class="du-grid">
							<br>
							<li class="du-cell"><a
								href="/board/free/list.html?board_no=1"><i
									class="large material-icons">airplay</i><span></span></a></li>
							<li class="du-cell"><a
								href="/board/product/list.html?board_no=6"><i
									class="large material-icons">chat</i><span></span></a></li>
							<li class="du-cell"><a
								href="/board/review/list.html?board_no=4"><i
									class="large material-icons">camera_alt</i><span></span></a></li>
							<li class="du-cell"><a href="/order/basket.html"><i
									class="large material-icons">shopping_cart</i><span></span></a></li>
							<li class="du-cell"><a href="/myshop/order/list.html"><i
									class="large material-icons">credit_card</i><span></span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-----------------miniCart----------------------------------->
	<jsp:include page="/resources/miniCart.jsp"></jsp:include>
	<script>
		const navigation = document.querySelector('.navigation');
		document.querySelector('.toggle').onclick = function() {
			this.classList.toggle('active');
			navigation.classList.toggle('active')
		};

	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$(".navigation").draggable({
				delay : 10
			});
		});
	</script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.scrollUp.min.js"></script>
	<script src="/resources/js/price-range.js"></script>
	<script src="/resources/js/jquery.prettyPhoto.js"></script>
	<script src="/resources/js/main.js"></script>
</body>
</html>