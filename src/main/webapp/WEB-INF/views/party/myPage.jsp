<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>★ P ★ O ★ F ★</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/prettyPhoto.css" rel="stylesheet">
<link href="/resources/css/price-range.css" rel="stylesheet">
<link href="/resources/css/animate.css" rel="stylesheet">

<link href="/resources/css/orderProductsInfo.css" rel="stylesheet">
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
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<!-- Begin Page Content -->
<jsp:include page="/resources/header.jsp" flush="false" />
<body>
	<section class="my-page">
		<div class="df-myshop">
			<div class="row">
				<div class="col-sm-9 col-sm-offset-1">
					<!-- 주문처리현황 -->
					<div class="df-myshop">
						<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓--주문처리 현황--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
						<div
							class="xans-element- xans-myshop xans-myshop-orderstate section orderState ">
							<h3 class="title">
								<span class="df-lang-orderstate">주문처리 현황</span> <span
									class="df-lang-orderstate-period">(최근3개월)</span>
							</h3>
							<div class="content">
								<ul class="order1">
									<li class="step1"><span class="df-lang-order-step1">입금전</span>
										<a href="/myshop/order/list.html?order_status=shipped_before"
										class="count"><span
											id="xans_myshop_orderstate_shppied_before_count">0</span></a></li>
									<li class="step2"><span class="df-lang-order-step2">배송준비중</span>
										<a href="/myshop/order/list.html?order_status=shipped_standby"
										class="count"><span
											id="xans_myshop_orderstate_shppied_standby_count">0</span></a></li>
									<li class="step3"><span class="df-lang-order-step3">배송중</span>
										<a href="/myshop/order/list.html?order_status=shipped_begin"
										class="count"><span
											id="xans_myshop_orderstate_shppied_begin_count">0</span></a></li>
									<li class="step4"><span class="df-lang-order-step4">배송완료</span>
										<a
										href="/myshop/order/list.html?order_status=shipped_complate"
										class="count"><span
											id="xans_myshop_orderstate_shppied_complate_count">0</span></a></li>
								</ul>
								<ul class="css">
									<li class="cancel"><span class="df-lang-order-cancel">취소
											:</span> <a href="/myshop/order/list.html?order_status=order_cancel"
										class="count"><span
											id="xans_myshop_orderstate_order_cancel_count">0</span></a></li>
									<li class="exchange"><span class="df-lang-order-exchange">교환
											:</span> <a
										href="/myshop/order/list.html?order_status=order_exchange"
										class="count"><span
											id="xans_myshop_orderstate_order_exchange_count">0</span></a></li>
									<li class="return"><span class="df-lang-order-return">반품
											:</span> <a href="/myshop/order/list.html?order_status=order_return"
										class="count"><span
											id="xans_myshop_orderstate_order_return_count">0</span></a></li>
								</ul>
							</div>
						</div>
							<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓--주문 상품 정보--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
						<div
							class="xans-element- xans-myshop xans-myshop-orderhistorylistitem section orderlist">
							<h3 class="title">
								주문 상품 정보 <a href="/myshop/order/list.html"
									class="more df-lang-button-more">더보기</a>
							</h3>
							<div class="content">
								<!--
				$login_url = /member/login.html
				$count = 5
			-->
								<table border="1" summary="">
								
									<colgroup>
										<col style="width: 160px;">
										<col style="width: 100px;">
										<col style="width: auto;">
										<col style="width: 70px;">
										<col style="width: 150px;">
										<col style="width: 160px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" class="no df-lang-order-no">주문번호</th>
											<th scope="col" class="image df-lang-order-image">이미지</th>
											<th scope="col" class="product df-lang-order-info">상품정보</th>
											<th scope="col" class="quantity df-lang-order-quantity">수량</th>
											<th scope="col" class="price df-lang-order-price">구매금액</th>
											<th scope="col" class="state df-lang-order-state">주문처리상태</th>
										</tr>
									</thead>
									<tbody class="center displaynone">
										<tr class="">
											<td class="number displaynone">
												<p>
													<a href="/myshop/order/detail.html" class="line">[]</a>
												</p>
											</td>
											<td class="thumb"><a href="/product/detail.html"><img
													src="//img.echosting.cafe24.com/thumb/img_product_small.gif"
													onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
													alt=""></a></td>
											<td class="product left top"><a
												href="/product/detail.html"><strong></strong></a>
												<div class="option displaynone"></div>
												<ul
													class="xans-element- xans-myshop xans-myshop-optionset option">
													<li class=""><strong></strong> ()</li>
												</ul></td>
											<td></td>
											<td class="right"><strong></strong>
												<div class="displaynone"></div></td>
											<td class="state">
												<p class="txtEm"></p>
												<p class="displaynone">
													<a href="" target=""></a>
												</p>
												<p class="displaynone">
													<a href="#none" class="line" onclick="">[]</a>
												</p>
												<div class="btn-wrap">
													<a href="/board/product/write.html"
														class="btnEm df-lang-button-review displaynone">구매후기</a>
												</div>
											</td>
										</tr>
										<tr class="">
											<td class="number displaynone">
												<p>
													<a href="/myshop/order/detail.html" class="line">[]</a>
												</p>
											</td>
											<td class="thumb"><a href="/product/detail.html"><img
													src="//img.echosting.cafe24.com/thumb/img_product_small.gif"
													onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
													alt=""></a></td>
											<td class="product left top"><a
												href="/product/detail.html"><strong></strong></a>
												<div class="option displaynone"></div>
												<ul
													class="xans-element- xans-myshop xans-myshop-optionset option">
													<li class=""><strong></strong> ()</li>
												</ul></td>
											<td></td>
											<td class="right"><strong></strong>
												<div class="displaynone"></div></td>
											<td class="state">
												<p class="txtEm"></p>
												<p class="displaynone">
													<a href="" target=""></a>
												</p>
												<p class="displaynone">
													<a href="#none" class="line" onclick="">[]</a>
												</p>
												<div class="btn-wrap">
													<a href="/board/product/write.html"
														class="btnEm df-lang-button-review displaynone">구매후기</a>
													<button id="reviewShowButton" class = "btn btn-primary"> 리뷰 달아보기</button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<p class="empty  df-lang-order-empty">주문 내역이 없습니다.</p>
							</div>
						</div>
							<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓--최근 본 상품--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
						<div
							class="xans-element- xans-product xans-product-recentlist section recentview xans-record-">
							<h3 class="title">
								<span class="df-lang-title-recentview">최근 본 상품</span> <a
									href="/product/recent_view_product.html"
									class="more df-lang-button-more">더보기</a>
							</h3>
							<div class="content">
								<!--
				$count = 5
			-->
								<table width="100%" border="1" summary="" class="displaynone">
									
									<colgroup>
										<col style="width: 100px">
										<col style="width: auto">
										<col style="width: 220px">
										<col style="width: 140px">
										<col style="width: 220px">
									</colgroup>
									<thead>
										<tr class="txtLittle">
											<th scope="col" class="image df-lang-recentview-image">이미지</th>
											<th scope="col" class="product df-lang-recentview-product">상품명</th>
											<th scope="col" class="option df-lang-recentview-option">옵션정보</th>
											<th scope="col" class="price df-lang-recentview-price">판매가</th>
											<th scope="col" class="order df-lang-recentview-order">주문</th>
										</tr>
									</thead>
								</table>
								<p class="empty  df-lang-recentview-empty"></p>
							</div>
						</div>

							<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓--내 게시글--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
						<div
							class="xans-element- xans-myshop xans-myshop-boardpackage section myboard ">
							<h3 class="title">
								<span class="df-lang-title-mypostings">내 게시글</span> <a
									href="/myshop/board_list.html" class="more df-lang-button-more">더보기</a>
							</h3>
							<!-- cre.ma / 내가 작성한 리뷰 / 스크립트를 수정할 경우 연락주세요 (support@cre.ma) -->
							<div class="crema-reviews" data-type="my-reviews"></div>
							<div
								class="xans-element- xans-myshop xans-myshop-boardlist content crema-hide">
								<!--
				$count = 10
				$relation_post = yes
			-->
								<table width="100%" border="1" summary="">
									
									<colgroup>
										<col style="width: 70px;">
										<col style="width: 140px;">
										<col style="width: auto;">
										<col style="width: 120px;">
										<col style="width: 100px;">
										<col style="width: 90px;">
									</colgroup>
									<thead>
										<tr class="txtLittle">
											<th scope="col"
												class="no df-lang-mypostings-no df-lang-mypostings-no">번호</th>
											<th scope="col" class="category df-lang-mypostings-category">분류</th>
											<th scope="col" class="title df-lang-mypostings-title">제목</th>
											<th scope="col" class="name df-lang-mypostings-name">작성자</th>
											<th scope="col" class="date df-lang-mypostings-date">작성일</th>
											<th scope="col" class="view df-lang-mypostings-view">조회</th>
										</tr>
									</thead>
									<tbody class="displaynone">
										<tr class="">
											<td class="txtLittle"></td>
											<td class="category txtLittle"><a href=""></a></td>
											<td class="subject left"><a href=""></a></td>
											<td class="txtLittle"></td>
											<td class="txtLess"></td>
											<td class="txtLess"></td>
										</tr>
										<tr class="">
											<td class="txtLittle"></td>
											<td class="category txtLittle"><a href=""></a></td>
											<td class="subject left"><a href=""></a></td>
											<td class="txtLittle"></td>
											<td class="txtLess"></td>
											<td class="txtLess"></td>
										</tr>
									</tbody>
								</table>
								<p class="empty  df-lang-myboard-empty">게시물이 없습니다.</p>
							</div>
						</div>
					</div>



				</div>
			</div>
	</section>
	
	<section class="public-footer">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-1">
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
		<footer id="footer">
			<!--Footer-->
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-sm-2">
							<div class="companyinfo">
								<h2>
									<span>e</span>-shopper
								</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing
									elit,sed do eiusmod tempor</p>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="col-sm-3">
								<div class="video-gallery text-center">
									<a href="#">
										<div class="iframe-img">
											<img src="/resources/img/model/9.jpg" alt="" />
										</div>
										<div class="overlay-icon">
											<i class="fa fa-play-circle-o"></i>
										</div>
									</a>
									<p>Circle of Hands</p>
									<h2>24 DEC 2014</h2>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="video-gallery text-center">
									<a href="#">
										<div class="iframe-img">
											<img src="/resources/img/model/8.jpg" alt="" />
										</div>
										<div class="overlay-icon">
											<i class="fa fa-play-circle-o"></i>
										</div>
									</a>
									<p>Circle of Hands</p>
									<h2>24 DEC 2014</h2>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="video-gallery text-center">
									<a href="#">
										<div class="iframe-img">
											<img src="/resources/img/model/7.jpg" alt="" />
										</div>
										<div class="overlay-icon">
											<i class="fa fa-play-circle-o"></i>
										</div>
									</a>
									<p>Circle of Hands</p>
									<h2>24 DEC 2014</h2>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="video-gallery text-center">
									<a href="#">
										<div class="iframe-img">
											<img src="/resources/img/model/6.jpg" alt="" />
										</div>
										<div class="overlay-icon">
											<i class="fa fa-play-circle-o"></i>
										</div>
									</a>
									<p>Circle of Hands</p>
									<h2>24 DEC 2014</h2>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="address">
								<img src="images/home/map.png" alt="" />
								<p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="footer-widget">
				<div class="container">
					<div class="row">
						<div class="col-sm-2">
							<div class="single-widget">
								<h2>Service</h2>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="">Online Help</a></li>
									<li><a href="">Contact Us</a></li>
									<li><a href="">Order Status</a></li>
									<li><a href="">Change Location</a></li>
									<li><a href="">FAQ’s</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="single-widget">
								<h2>Quock Shop</h2>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="">T-Shirt</a></li>
									<li><a href="">Mens</a></li>
									<li><a href="">Womens</a></li>
									<li><a href="">Gift Cards</a></li>
									<li><a href="">Shoes</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="single-widget">
								<h2>Policies</h2>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="">Terms of Use</a></li>
									<li><a href="">Privecy Policy</a></li>
									<li><a href="">Refund Policy</a></li>
									<li><a href="">Billing System</a></li>
									<li><a href="">Ticket System</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="single-widget">
								<h2>About Shopper</h2>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="">Company Information</a></li>
									<li><a href="">Careers</a></li>
									<li><a href="">Store Location</a></li>
									<li><a href="">Affillate Program</a></li>
									<li><a href="">Copyright</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3 col-sm-offset-1">
							<div class="single-widget">
								<h2>About Shopper</h2>
								<form action="#" class="searchform">
									<input type="text" placeholder="Your email address" />
									<button type="submit" class="btn btn-default">
										<i class="fa fa-arrow-circle-o-right"></i>
									</button>
									<p>
										Get the most recent updates from <br />our site and be
										updated your self...
									</p>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="footer-bottom">
				<div class="container">
					<div class="row">
						Shared by <i class="fa fa-love"></i><a
							href="https://bootstrapthemes.co">BootstrapThemes</a></span>
						</p>
					</div>
				</div>
			</div>

		</footer>
		<!--/Footer-->
		<div id="modalReply" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">리뷰 작성</h4>
					</div>
					<!-- End of modal-header -->
					<div class="modal-body">
					
					
					 
					<div class="wrappers">
					    <input type="radio" name="rate" id="star-1">
					    <input type="radio" name="rate" id="star-2">
					    <input type="radio" name="rate" id="star-3">
					    <input type="radio" name="rate" id="star-4">
					    <input type="radio" name="rate" id="star-5">
					    <div class="content">
					      <div class="outers">
					        <div class="emojis">
					          <li class="slideImg"><img src="/resources/images/icon/emoji-1.png" alt=""></li>
					          <li><img src="/resources/images/icon/emoji-0.png" alt=""></li>
					          <li><img src="/resources/images/icon/emoji-3.png" alt=""></li>
					          <li><img src="/resources/images/icon/emoji-5.png" alt=""></li>
					          <li><img src="/resources/images/icon/emoji-6.png" alt=""></li>
					        </div>
					      </div>
					      <div class="stars">
					        <label for="star-1" class="star-1 fas fa-star"></label>
					        <label for="star-2" class="star-2 fas fa-star"></label>
					        <label for="star-3" class="star-3 fas fa-star"></label>
					        <label for="star-4" class="star-4 fas fa-star"></label>
					        <label for="star-5" class="star-5 fas fa-star"></label>
					      </div>
					  </div>
					    <div class="footers">
					      <span class="text"></span>
					      <span class="numb"></span>
					    </div>
					  </div>
					
					
					
						<div class="form-group">
							<label>리뷰 입력</label>
							<input class="form-control"	name='replyContent' placeholder='이곳에 입력하세요' value=''>
						</div>
						<div class="form-group">
							<label>작성자</label>
							<input class="form-control"	name='replyer' value='' readonly="readonly">
						</div>
						<div class="form-group">
							<label>작성 날짜</label>
							<input class="form-control"	name='replyDate' value=''readonly="readonly">
						</div>
					</div>
					<!-- End of modal-body -->
					<div class="modal-footer">
						<!-- <button id='btnModifyReply' type="button" class="btn btn-warning">Modify</button> -->
						<!-- <button id='btnRemoveReply' type="button" class="btn btn-danger">Remove</button> -->
						<button id='btnRegisterReply' type="button" class="btn btn-warning">Register</button>
						<button id='btnCloseModal' type="button" class="btn btn-default" data-dismiss="modal"
							aria-hidden="true">Close</button>
					</div>
					<!-- End of modal-footer -->
				</div>
				<!-- End of modal-content -->
			</div>
	<!-- End of modal-dialog -->
		</div>
<!-- End of 댓글 입력 모달창 -->

		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript" src="\resources\js\util\dateFormat.js"></script>
		<script src="/resources/js/reply/replyFunction.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		<script>
		//컨트롤러로 값을 보낼때 token을 전달해 주어야 합니다.
		var csrfHN = "${_csrf.headerName}";
		var csrfTV = "${_csrf.token}";
		
		$(document).ajaxSend(
			function(e, xhr) {
				xhr.setRequestHeader(csrfHN, csrfTV);
			}
		);
		
		
		var modalReply = $("#modalReply");
		var inputReplyContent = modalReply.find("input[name='replyContent']");
		var inputReplyer = modalReply.find("input[name='replyer']");
		var inputReplyDate = modalReply.find("input[name='replyDate']");
		
		var now = new Date();
		var curUserName = null;
		var curUserId = null;
		var customerId = "<sec:authentication property='principal.username'/>";
		
		var btnRegisterReply = $("#btnRegisterReply");
		var btnModifyReply = $("#btnModifyReply");
		var btnRemoveReply = $("#btnRemoveReply");
		
		$("#reviewShowButton").on("click", function(e) {
            modalReply.data("productId", "1");
            inputReplyer.val(customerId);
            inputReplyDate.val(now);
            modalReply.modal("show");
        });
		
		$("#btnRegisterReply").on("click", function(e) {
            var reply = {
                    content : inputReplyContent.val(),
                };

                replyService.registerReview(
                    modalReply.data("productId"),
                    reply,
                    function(newReviewId) {
                        modalReply.find("input").val("");    //들어 있는 값 청소
                        modalReply.modal("hide");
                    },
                    function(errMsg) {
                        alert("리뷰 등록 오류 : " + reply + errMsg);
                    }
                );
        });
		</script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="/resources/js/jquery.scrollUp.min.js"></script>
		<script src="/resources/js/price-range.js"></script>
		<script src="/resources/js/jquery.prettyPhoto.js"></script>
		<script src="/resources/js/main.js"></script>
</body>
</html>
