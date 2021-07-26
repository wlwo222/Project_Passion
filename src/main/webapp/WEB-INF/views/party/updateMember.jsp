<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
			<form id="frmMember" method="post" action="/party/updateMember">
				
				<label>UserId :</label>
				<input name="userId" type="hidden" value= <sec:authentication property="principal.username"/> class="form-control">
				<sec:authentication property="principal.username"/>
			
				<div class="form-group">
					<label>암호는 '1234'로 고정입니다.</label> <input name="userPwd" type="hidden" value="1234" class="form-control">
				</div>
				
				<div class="form-group">
					<label>회원 닉네임</label> <input name="name" placeholder="재미있는 자기이름" class="form-control">
				</div>
				
				<div class="form-group">
					<label>생년월일</label> <input type="date" name= "birthDate" value= <sec:authentication property="principal.curUser.birthDate"/> class="form-control" readonly>
				</div>
				
				<!-- 성별의 정보 -->			
				<input name="male" value= <sec:authentication property="principal.curUser.male"/>>
				
				<c:forEach items="${listCpType}" var="contactPointType" varStatus="status">
					<div class="form-group">
						<label>"${contactPointType.description}"</label> 
						<input type="hidden" name="listContactPoint[${status.index}].contactPointType" value="${contactPointType.cpType}" class="form-control" readonly>
						<input name="listContactPoint[${status.index}].info" class="form-control" >
					</div>
				</c:forEach>
											
				<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
				<button id="btnJoin" type="submit" class="btn btn-primary">정보수정</button>
				<button type="reset" class="btn btn-secondary">초기화</button>
			</form>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<!-- 자기소개 사진이나 동영상같은거 넣을때 활용하기 -->
<!--  %@include file="../common/attachFileManagement.jsp"% -->
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
	
		
	$("#userId").on("focusout", function(e) {
		//회원 ID가 유일한가를 Ajax로 검사하고 그렇지 못할 때는 Focus를 다시 받아야합니다. (우리가 개발해야되는거) -> 중복성 체크를 ajax로 해야됨
		//처음에 alert 넣어서 확인하기
	});
	
	/*
	var frmPost = $("#frmPost");
	
	$("#btnRegisterPost").on("click", function(e) {
		e.preventDefault();
		addAttachInfo(frmPost, "listAttachInStringFormat");
		frmPost.submit();
	});
	*/
	});
</script>