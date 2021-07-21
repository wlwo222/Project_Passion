<!-- 분할 정복으로 첨부 파일 관리를 복잡도 관리합니다. 유지보수성 향상 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
#uploadResult {	width: 100%; background-color: gray}
#uploadResult ul{ display:flex; flex-flow: row; justify-content: center; align-items: center;}
#uploadResult ul li {list-style:none; padding: 10px; align-content: center; text-align: center;}
#uploadResult ul li img{ width: 60px;}
#uploadResult ul li span{color: white;}
.bigWrapper { position: absolute; display: none; justify-content: center;
			align-items: center; top: 0%; width: 100%; height: 100%; background-color: gray;
			z-index: 100; background:rgba(255,255,255,0.5);}
.bigNested { position: relative; display:flex; justify-content: center; align-items:center;}
.bigNested img {width: 600px;}
.bigNested video {width: 600px;}
</style>

<!-- 첨부 파일 목록 출력 부분 -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="card-header">첨부파일</div>

			<div class="card-body" id="uploadDiv">
				<input id="inFiles" type="file" name="uploadFile" multiple> 
			</div>
			
			<div class="card-body" id="uploadResult">
				<ul></ul>
			</div>
			
			<div class="bigWrapper">
				<div class="bigNested">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End of 첨부 파일 목록 -->
<script type="text/javascript" src="\resources\js\util\utf8.js"></script>

<script type="text/javascript">
var updateMode;
function adjustCRUDAtAttach(includer) {
	if (includer === '수정' || includer === '신규') {
		updateMode = true;
		$('#uploadDiv').show();
	} else if (includer === '조회') {
		updateMode = false;
		$('#uploadDiv').hide();
	}

}


function appendUploadUl(attachVoInJson) {
	var liTags = "";
	var attachVo = JSON.parse(decodeURL(attachVoInJson));
		
	if (attachVo.multimediaType === "others") {
		liTags += "<li data-attach_info=" + attachVoInJson + "><a href='/uploadFiles/download?fileName=" 
			+ encodeURIComponent(attachVo.originalFileCallPath) + "'><img src='/resources/img/attachFileIcon.png'>" 
			+ attachVo.pureFileName + "</a>";
			if (updateMode) {
				liTags += "<span>X</span>";
			}
			liTags += "</li>";
	} else {
		if (attachVo.multimediaType === "audio") {
			liTags += "<li data-attach_info=" + attachVoInJson + ">"
					+ "<a>"
					+ "<img src='/resources/img/audioThumbnail.png'>" 
					+ attachVo.pureFileName + "</a>";
					if (updateMode) {
						liTags += "<span>X</span>";
					}
					liTags += "</li>";
		} else if (attachVo.multimediaType === "image" || attachVo.multimediaType === "video") {
			liTags += "<li data-attach_info=" + attachVoInJson + ">"
					+ "<a>"
					+ "<img src='/uploadFiles/display?fileName=" 
					+ encodeURIComponent(attachVo.fileCallPath) + "'>" + attachVo.pureFileName + "</a>";
					if (updateMode) {
						liTags += "<span>X</span>";
					}
					liTags += "</li>";
		}
	}
	$("#uploadResult ul").append(liTags);
}

$(document).ready(function() {
	//업로드 파일에 대한 확장자 제한하는 정규식
	var uploadConstraintByExt = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	//업로드 파일에 대한 최대 크기 제한
	var uploadMaxSize = 1036870912;
	
	//화면이 맨 처음 로드 시 들어 있는 깨끗한 상태 기억
	var initClearStatus = $("#uploadDiv").html();
	
	$("#uploadDiv").on("change", "input", function() {
		alert("잘되는군");
		var formData = new FormData();
		var files = $("#inFiles")[0].files;
		
		for (var i = 0; i < files.length; i++) {
			if (! checkFileConstraints(files[i].name, files[i].size))
				return false;
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : "/uploadFiles/upload",
			processData : false,
			contentType : false,
			data : formData,
			type : 'post',
			success : function (result) {
				showUploadedFile(result);
				//동적인 청소는 연동되어 있는 Event Listener까지 날아가버림. 이에 위임임방식 채용
				$("#uploadDiv").html(initClearStatus);
			}
		});
	});
	

	//IE11까지 고려한 보여 준 이후에 클릭하면 사라지게 합니다.
	$(".bigWrapper").on("click", function() {
		$(".bigNested").animate({width:'0%', height:'0%'}, 1000);
		setTimeout(function () {
			$(".bigWrapper").hide();
		}, 1000);
	});
	
	//업로드 파일에 대한 제약 사항을 미리 검사해 ㅂ\줍니다.
	function checkFileConstraints(fileName, fileSize) {
		//크기 검사
		if (fileSize > uploadMaxSize) {
			return false;
		}
		//종류 검사
		if (uploadConstraintByExt.test(fileName)) {
			return false;
		}
		
		return true;
	}
	
	$("#uploadResult").on("click", "a", function(){
		var attachVo = $(this).closest("li").data("attach_info");
		attachVo = JSON.parse(decodeURL(attachVo))

		$(".bigWrapper").css("display", "flex").show();
		if (attachVo.multimediaType === "audio") {
			$(".bigNested").html("<audio src='/uploadFiles/display?fileName=" + encodeURI(attachVo.originalFileCallPath) + "' autoplay>")
					.animate({width:'100%', height:'100%'}, 1000);
		} else if (attachVo.multimediaType === "image") {
			$(".bigNested").html("<img src='/uploadFiles/display?fileName=" + encodeURI(attachVo.originalFileCallPath) + "'>")
					.animate({width:'100%', height:'100%'}, 1000);
		} else if (attachVo.multimediaType === "video") {
			$(".bigNested").html("<video src='/uploadFiles/display?fileName=" + encodeURI(attachVo.originalFileCallPath) + "' autoplay>")
					.animate({width:'100%', height:'100%'}, 1000);
		}
	});
	
	//첨부 취소하기
	$("#uploadResult").on("click", "span", function(){
		var targetLi = $(this).closest("li");
		var attachVo = targetLi.data("attach_info");
		attachVo = JSON.parse(decodeURL(attachVo))

		$.ajax({
			url : "/uploadFiles/deleteFile",
			data : attachVo,
			type : 'post',
			dataType : 'text',
			success : function (result) {
				targetLi.remove();
			}
		});
	});
});

function showUploadedFile(result) {
	$(result).each(function (i, attachVoInJson) {
		appendUploadUl(attachVoInJson);
	});
}

/**
 * 첨부 파일 기능은 여러 화면에서 재사용될 가능성이 높아요
 이를 각 화면에서 중복 개발하기 보다는 이곳에서 통합적으로 서비스 할 수 있도록 모듈화함
 */
function addAttachInfo(frmContainer, varName) {
	var inputAttaches = "";
	$("#uploadResult ul li").each(function(i, attchLi){
		var jobObj = $(attchLi);
		
		var attachVo = jobObj.data("attach_info");
		
		inputAttaches += "<input type='hidden' name='" + varName + "[" + i + "]' value=" + attachVo + ">";
	});
	
	frmContainer.append(inputAttaches);
}
</script>

