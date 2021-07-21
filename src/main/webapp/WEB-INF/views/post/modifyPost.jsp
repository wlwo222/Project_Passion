<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
			<form id="frmPost" action="/post/modifyPost" method="post">
				<%@include file="./includes/postCommon.jsp"%>

				<%@include file="../common/attachFileManagement.jsp"%>

				<sec:authentication property="principal" var="customUser"/>
				<!-- isAuthenticated : 로그인했으면 무조건 줄거야 (admin, user 이런건 신경쓰지않고 로그인한상태인지아닌지만 구분) -->
				<sec:authorize access="isAuthenticated()">
					<!-- 로그인한 사람과 작성자의 아이디 비교해서 같을때만 수정 삭제 기능 넣어줌 -->
					<c:if test="${customUser.curUser.userId eq post.writer.userId}">
						<button type="submit" data-oper='modify' class="btn btn-primary">수정</button>
						<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
					</c:if>
				</sec:authorize>
				<button type="submit" data-oper='list' class="btn btn-secondary">목록</button>
				
				<input id="boardId" type="hidden" name="boardId" value="${boardId}">
				<input type="hidden" name="postId" value="${post.id}">
				<input type="hidden" name="writerId" value="${customUser.curUser.userId}">
				<input type="hidden" name="pageNumber" value="${pagenation.pageNumber}">
				<input type="hidden" name="amount" value="${pagenation.amount}">
				<input type="hidden" name="searching" value='${pagenation.searching}'>
				
				<!-- frmPost일때는 csrf를 이용해서 공격을 막음 (히든처리 해줘야됨) -->
				<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
			</form>

		</div>
	</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	var csrfHN = "${_csrf.headerName}";
	var csrfTV = "${_csrf.token}";
	
	$(document).ajaxSend(
		function(e, xhr) {
			xhr.setRequestHeader(csrfHN, csrfTV);
		}
	);
	
	controlInput('수정');
	adjustCRUDAtAttach('수정');

	<c:forEach var="attachVoInStr" items="${post.attachListInGson}">
		appendUploadUl('<c:out value="${attachVoInStr}" />');
	</c:forEach>
	
	var frmPost = $('#frmPost');

	//처리 우선 순위가 있고 script가 html에 등록되어 있는 것 보다 앞선다
	$("button").on("click", function(eventInfo) {
		//이벤트 처리의 전파를 막아서 어떤 미리 개발되어있는 이벤트 처리를 막는 함수
		eventInfo.preventDefault();
		
		var oper = $(this).data("oper");
		if (oper === 'remove') {
			frmPost.attr("action", "/post/removePost");
		} else if (oper === 'list') {
			var boardIdInput = frmPost.find("#boardId");
			var pageNumber = $('input[name="pageNumber"]');
			var amount = $('input[name="amount"]');

			var searching = $('input[name="searching"]');

			frmPost.attr("method", "get");
			frmPost.attr("action", "/post/listBySearch");
			//empty : form 담겨있는 모든 하위 요소를 없애라
			frmPost.empty();
			frmPost.append(boardIdInput);
			frmPost.append(pageNumber);
			frmPost.append(amount);

			frmPost.append(searching);
		} else if (oper === 'modify') {
			addAttachInfo(frmPost, "listAttachInStringFormat");
		}
		frmPost.submit();
	});
});
</script>
