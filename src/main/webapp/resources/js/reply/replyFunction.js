/**	댓글과 대댓글, 리뷰를 작성할 때 처리하는 자바스크립트입니다.
 * 대댓글과 댓글을 작성할 때에는 기존의 방식과 동일하게 처리됩니다.
 * 리뷰를 작성할 때에는 점수도 포함시켜줘야 해서 독립된 함수로 만들었습니다.
 */

var replyService = (function(){
	function registerReply(originalId, reply, successCallBack, errorCallBack){
		//대댓글 혹은 댓글을 작성할 경우
		$.ajax({
			type : 'post',	//methos alias
			url : '/replies/new/' + originalId,
			data : JSON.stringify(reply),	//객체를 json 문자열로 출력
			contentType : 'application/json; charset=UTF-8',
			success : function(resObj, status, xhr) {
				if (successCallBack)   {
					successCallBack(resObj);
				}
			},
			error : function (xhr, status, errMsg) {
				if (errorCallBack) {
					errorCallBack(errMsg);
				}
			}
		});
	}
	
	function registerReview(productId, reply, successCallBack, errorCallBack){
		//리뷰를 작성하는 경우
		$.ajax({
			type : 'post',	//methos alias
			url : '/replies/write/' + productId,
			data : JSON.stringify(reply),	//객체를 json 문자열로 출력
			contentType : 'application/json; charset=UTF-8',
			success : function(resObj, status, xhr) {
				if (successCallBack)   {
					successCallBack(resObj);
				}
			},
			error : function (xhr, status, errMsg) {
				if (errorCallBack) {
					errorCallBack(errMsg);
				}
			}
		});
	}
	return{
		registerReply : registerReply,
		registerReview : registerReview
	};
})();