<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.ctest.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.detail" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<c:if test="${!empty msg}">
<script type="text/javaScript">
alert("<spring:message code="${msg}" />");
</script>
</c:if>
<script type="text/javascript">
/* ********************************************************
 * 삭제처리
 ******************************************************** */
 function fn_egov_delete_article(form){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		// Delete하기 위한 키값을 셋팅
		form.submit();	
	}	
}	

/* ********************************************************
 * 답글작성
 ******************************************************** */
 function fn_egov_reply_article() {
		document.articleForm.action = "<c:url value='/cop/bbs/replyArticleView.do'/>";
		document.articleForm.submit();
	}
 /* ********************************************************
  * 목록조회
  ******************************************************** */
 function fnList(){
 	var form = $('#formList');   
 	var string = form.serialize();	
 	
 	$.ajax({
 		type:"POST",
 		url:"${pageContext.request.contextPath}/cop/bbs/selectArticleList.do",
 		data: string, 
 		dataType:'html',
 		timeout:(1000*30),
 		
 		beforeSend:function(){
 			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
 		},
 		success:function(returnData, status){
 			if(status == "success") {
 				$("#bodywrap").html(returnData);
 			}else{ alert("ERROR!");return;} 
 		},
 		error: function(m,err){
 			alert('m:'+m+' /err:'+err);
 		},
 		complete:function(){}
 	});
 }	
 /* ********************************************************
  * 수정
  ******************************************************** */
 function fnUpdate(){
 	var form = $('#articleForm');   
 	var string = form.serialize();	
 	
 	$.ajax({
 		type:"POST",
 		url:"${pageContext.request.contextPath}/cop/bbs/updateArticleView.do",
 		data: string, 
 		dataType:'html',
 		timeout:(1000*30),
 		
 		beforeSend:function(){
 			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
 		},
 		success:function(returnData, status){
 			if(status == "success") {
 				$("#bodywrap").html(returnData);
 			}else{ alert("ERROR!");return;} 
 		},
 		error: function(m,err){
 			alert('m:'+m+' /err:'+err);
 		},
 		complete:function(){}
 	});
 }	
 /* ********************************************************
  * 답글
  ******************************************************** */
 function fnReply(){
 	var form = $('#formReply');   
 	var string = form.serialize();	
 	
 	$.ajax({
 		type:"POST",
 		url:"${pageContext.request.contextPath}/cop/bbs/replyArticleView.do",
 		data: string, 
 		dataType:'html',
 		timeout:(1000*30),
 		
 		beforeSend:function(){
 			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
 		},
 		success:function(returnData, status){
 			if(status == "success") {
 				$("#bodywrap").html(returnData);
 			}else{ alert("ERROR!");return;} 
 		},
 		error: function(m,err){
 			alert('m:'+m+' /err:'+err);
 		},
 		complete:function(){}
 	});
 }	 
 /* ********************************************************
  * 삭제
  ******************************************************** */
 function fnDelete(){
	<c:if test="${boardMasterVO.bbsId == 'BBSMSTR_000000000001'}">
	alert('공모전 접수 내역은 삭제가 불가능합니다.');
	return;
	</c:if>
	 
	if(confirm("<spring:message code="common.delete.msg" />")){
	 	var form = $('#formDelete');   
	 	var string = form.serialize();	
	 	
	 	$.ajax({
	 		type:"POST",
	 		url:"${pageContext.request.contextPath}/cop/bbs/deleteArticle.do",
	 		data: string, 
	 		dataType:'html',
	 		timeout:(1000*30),
	 		
	 		beforeSend:function(){
	 			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
	 		},
	 		success:function(returnData, status){
	 			if(status == "success") {
	 				$("#bodywrap").html(returnData);
	 			}else{ alert("ERROR!");return;} 
	 		},
	 		error: function(m,err){
	 			alert('m:'+m+' /err:'+err);
	 		},
	 		complete:function(){}
	 	});
	}
 }	 
</script>
<!-- 댓글 작성 스크립트  -->
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="articleComment" staticJavascript="false" xhtml="true" cdata="false"/>

<c:if test="${boardMasterVO.bbsId == 'BBSMSTR_000000000001'}">
<script type="text/javascript">
function fn_egov_insert_commentList() {
	
	var xmlHttpRequest;
	if(window.XMLHttpRequest){// code for Firefox, Mozilla, IE7, etc.
		xmlHttpRequest = new XMLHttpRequest();
	}else if(window.ActiveXObject){// code for IE5, IE6
		xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}else{
		return;
	}

	xmlHttpRequest.open('HEAD', window.location.href.toString(), false);
	xmlHttpRequest.setRequestHeader("ContentType", "text/html");
	xmlHttpRequest.send('');
	
	var serverDate = xmlHttpRequest.getResponseHeader("Date");
	var date = new Date(serverDate);
	var gDate = date.getDate();
	if(gDate<10){
		gDate = '0'+gDate;
	}	
	var gMonth = date.getMonth()+1;
	if(gMonth<10){
		gMonth = '0'+gMonth;
	}
	var gFullYear = date.getFullYear();
	var fDate = gFullYear+gMonth+gDate;
	//alert('fDate:'+fDate);
	if(fDate>20230623){
		alert('지금은 직원평가 기간이 아닙니다. \n접수기간 : 2023년 5월 8일(월) ~ 2023년 6월 23일(금), 7주')
		return;		
	}
		
	if($("input[name='checker']:checked").length > 0){
		$("input[name='picksAt']").val("Y");
	}else{
		$("input[name='picksAt']").val("N");
	}
	if($("#scoreNum").val()== ''|| $("#scoreNum").val()== '0'){
		alert('평가점수는 필수 값입니다.');
		$("#scoreNum").focus();
		return;
	}	
	if($("#commentCn").val().length > 200){
		alert('댓글내용은 200자 이상 입력할 수 없습니다.');
		$("#commentCn").focus();
		return;
	}	
	
	var form = $('#articleCommentVO');
	var string = form.serialize();

	//if (!validateArticleComment(document.articleCommentVO)){
	//	return;
	//}
	

	if (confirm('<spring:message code="common.regist.msg" />')) {
		//form.submit();
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/cmt/insertArticleComment.do",
			data: string, 
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					$("#bodywrap").html(returnData);
				}else{ alert("ERROR!");return;} 
			},
			error: function(m,err){
				alert('m:'+m+' /err:'+err);
			},
			complete:function(){}
		});
	}
}

function fn_egov_updt_commentList() {
	
	var xmlHttpRequest;
	if(window.XMLHttpRequest){// code for Firefox, Mozilla, IE7, etc.
		xmlHttpRequest = new XMLHttpRequest();
	}else if(window.ActiveXObject){// code for IE5, IE6
		xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}else{
		return;
	}

	xmlHttpRequest.open('HEAD', window.location.href.toString(), false);
	xmlHttpRequest.setRequestHeader("ContentType", "text/html");
	xmlHttpRequest.send('');
	
	var serverDate = xmlHttpRequest.getResponseHeader("Date");
	var date = new Date(serverDate);
	var gDate = date.getDate();
	if(gDate<10){
		gDate = '0'+gDate;
	}	
	var gMonth = date.getMonth()+1;
	if(gMonth<10){
		gMonth = '0'+gMonth;
	}
	var gFullYear = date.getFullYear();
	var fDate = gFullYear+gMonth+gDate;
	//alert('fDate:'+fDate);
	if(fDate>20230623){
		alert('지금은 직원평가 기간이 아닙니다. \n접수기간 : 2023년 5월 8일(월) ~ 2023년 6월 23일(금), 7주')
		return;		
	}
	
	if($("input[name='checker']:checked").length > 0){
		$("input[name='picksAt']").val("Y");
	}else{
		$("input[name='picksAt']").val("N");
	}
	if($("#scoreNum").val()== ''|| $("#scoreNum").val()== '0'){
		alert('평가점수는 필수 값입니다.');
		$("#scoreNum").focus();
		return;
	}	
	if($("#commentCn").val().length > 200){
		alert('댓글내용은 200자 이상 입력할 수 없습니다.');
		$("#commentCn").focus();
		return;
	}	
	
	$("input[name='modified']").val("true");
	var form = $('#articleCommentVO');
	var string = form.serialize();
	
	//if (!validateArticleComment(document.articleCommentVO)){
	//	return;
	//}
	
	if (confirm('<spring:message code="common.update.msg" />')) {
		//form.modified.value = "true";
		//form.action = "<c:url value='/cop/cmt/updateArticleComment.do'/>";
		//form.submit();
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/cmt/updateArticleComment.do",
			data: string, 
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					$("#bodywrap").html(returnData);
				}else{ alert("ERROR!");return;} 
			},
			error: function(m,err){
				alert('m:'+m+' /err:'+err);
			},
			complete:function(){}
		});		
	}
}
</script>
</c:if>
<c:if test="${boardMasterVO.bbsId != 'BBSMSTR_000000000001'}">
<script type="text/javascript">
function fn_egov_insert_commentList() {
	
	if($.trim($("#commentCn").val()) == '' ){
		alert('댓글내용은 필수 입력 입니다.');
		$("#commentCn").focus();
		return;
	}	
	if($("#commentCn").val().length > 200){
		alert('댓글내용은 200자 이상 입력할 수 없습니다.');
		$("#commentCn").focus();
		return;
	}
	
	var form = $('#articleCommentVO');
	var string = form.serialize();

	//if (!validateArticleComment(document.articleCommentVO)){
	//	return;
	//}
	
	if (confirm('<spring:message code="common.regist.msg" />')) {
		//form.submit();
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/cmt/insertArticleComment.do",
			data: string, 
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					$("#bodywrap").html(returnData);
				}else{ alert("ERROR!");return;} 
			},
			error: function(m,err){
				alert('m:'+m+' /err:'+err);
			},
			complete:function(){}
		});
	}
}

function fn_egov_updt_commentList() {
	
	if($.trim($("#commentCn").val()) == '' ){
		alert('댓글내용은 필수 입력 입니다.');
		$("#commentCn").focus();
		return;
	}	
	if($("#commentCn").val().length > 200){
		alert('댓글내용은 200자 이상 입력할 수 없습니다.');
		$("#commentCn").focus();
		return;
	}	
	
	$("input[name='modified']").val("true");
	var form = $('#articleCommentVO');
	var string = form.serialize();
	
	//if (!validateArticleComment(document.articleCommentVO)){
	//	return;
	//}
	
	if (confirm('<spring:message code="common.update.msg" />')) {
		//form.modified.value = "true";
		//form.action = "<c:url value='/cop/cmt/updateArticleComment.do'/>";
		//form.submit();
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/cmt/updateArticleComment.do",
			data: string, 
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					$("#bodywrap").html(returnData);
				}else{ alert("ERROR!");return;} 
			},
			error: function(m,err){
				alert('m:'+m+' /err:'+err);
			},
			complete:function(){}
		});		
	}
}
</script>
</c:if>

<script type="text/javascript">


function fn_egov_selectCommentForupdt(commentNo) {
	$("input[name='commentNo']").val(commentNo);
	//var form = document.getElementById("articleCommentVO");
	var form = $('#articleCommentVO');
	var string = form.serialize();
	//alert(string);	
	//form.commentNo.value = commentNo;
	//form.action = "<c:url value='/cop/bbs/selectArticleDetail.do'/>";
	//form.submit();
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/bbs/selectArticleDetail.do",
		data: string, 
		dataType:'html',
		timeout:(1000*30),
		
		beforeSend:function(){
			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
		},
		success:function(returnData, status){
			if(status == "success") {
				$("#bodywrap").html(returnData);
			}else{ alert("ERROR!");return;} 
		},
		error: function(m,err){
			alert('m:'+m+' /err:'+err);
		},
		complete:function(){}
	});	
}

function fn_egov_deleteCommentList(commentNo) {
	
	<c:if test="${boardMasterVO.bbsId =='BBSMSTR_000000000001'}">
	
		var xmlHttpRequest;
		if(window.XMLHttpRequest){// code for Firefox, Mozilla, IE7, etc.
			xmlHttpRequest = new XMLHttpRequest();
		}else if(window.ActiveXObject){// code for IE5, IE6
			xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
		}else{
			return;
		}
	
		xmlHttpRequest.open('HEAD', window.location.href.toString(), false);
		xmlHttpRequest.setRequestHeader("ContentType", "text/html");
		xmlHttpRequest.send('');
		
		var serverDate = xmlHttpRequest.getResponseHeader("Date");
		var date = new Date(serverDate);
		var gDate = date.getDate();
		if(gDate<10){
			gDate = '0'+gDate;
		}	
		var gMonth = date.getMonth()+1;
		if(gMonth<10){
			gMonth = '0'+gMonth;
		}
		var gFullYear = date.getFullYear();
		var fDate = gFullYear+gMonth+gDate;
		//alert('fDate:'+fDate);
		if(fDate>20230623){
			alert('지금은 직원평가 기간이 아닙니다. \n접수기간 : 2023년 5월 8일(월) ~ 2023년 6월 23일(금), 7주')
			return;		
		}

	
	</c:if>
	
	$("input[name='commentNo']").val(commentNo);
	$("input[name='modified']").val("true");
	var form = $('#articleCommentVO');
	var string = form.serialize();
	//alert(string);	
	if (confirm('<spring:message code="common.delete.msg" />')) {
		//form.modified.value = "true";
		//form.commentNo.value = commentNo;
		//form.action = "<c:url value='/cop/cmt/deleteArticleComment.do'/>";
		//form.submit();
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/cmt/deleteArticleComment.do",
			data: string, 
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					$("#bodywrap").html(returnData);
				}else{ alert("ERROR!");return;} 
			},
			error: function(m,err){
				alert('m:'+m+' /err:'+err);
			},
			complete:function(){}
		});	
	}
}

/* 댓글페이징 */
function fn_egov_select_commentList(pageNo) {
	$("input[name='subPageIndex']").val(pageNo);
	$("input[name='commentNo']").val("");
	var form = $('#articleCommentVO');
	var string = form.serialize();
	//alert(string);
	//form.subPageIndex.value = pageNo;
	//form.commentNo.value = '';
	//form.action = "<c:url value='/cop/bbs/selectArticleDetail.do'/>";
	//form.submit();
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/bbs/selectArticleDetail.do",
		data: string, 
		dataType:'html',
		timeout:(1000*30),
		
		beforeSend:function(){
			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
		},
		success:function(returnData, status){
			if(status == "success") {
				$("#bodywrap").html(returnData);
			}else{ alert("ERROR!");return;} 
		},
		error: function(m,err){
			alert('m:'+m+' /err:'+err);
		},
		complete:function(){}
	});	
}
</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2><img src="/images/bl/bl_circle.gif" class="img_margin1"> ${boardMasterVO.bbsNm} <spring:message code="title.detail" /></h2>

	<!-- 상세조회 -->
	<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.detail" /></caption>
	<colgroup>
		<col style="width: 15%;">
		<col style="width: 20%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 20%;">
	</colgroup>
	<tbody>
		<!-- 글 제목 -->
		<tr>
			<th><spring:message code="comCopBbs.articleVO.detail.nttSj" /></th>			
			<c:if test="${boardMasterVO.bbsId == 'BBSMSTR_000000000001'}">
			<td colspan="3" class="left"><c:out value="${result.nttSj}"/></td>
			<th class="left">추천, 평점(50점 기준)</th>
			<td class="left">
			<c:if test="${result.commentCo >= 5 || sessionUserSe == 'USR'}">
				<c:if test="${result.picksCo != ''}">
				<img src="<c:url value='/images/btn/btn_reply_class_1.png'/>" alt="bbs good" class="reply_good"><c:out value="${result.picksCo}"/>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				
					<c:if test="${result.picksCo == '' || result.picksCo == '0' }">
					<img src="<c:url value='/images/btn/btn_reply_class_1.png'/>" alt="bbs good" class="reply_good">0&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${result.scoreA != ''}">
					 <c:out value="${result.scoreA}"/>/50
					</c:if>&nbsp;
					<c:if test="${result.scoreA == '' || result.scoreA == '0'}">
					 <c:out value="${result.scoreA}"/>0/50
					</c:if>&nbsp;
			</c:if>
			</td>			
			</c:if>
			<c:if test="${boardMasterVO.bbsId != 'BBSMSTR_000000000001'}">
			<td colspan="5" class="left"><c:out value="${result.nttSj}"/></td>
			</c:if>
		</tr>
		<!-- 작성자, 작성시각, 조회수 -->
		<tr>
			<th><spring:message code="table.reger" /></th>
			<td class="left"><c:out value="${result.frstRegisterNm}"/>&nbsp;<c:out value='${result.titleNm}'/>&nbsp;(<c:out value='${result.deptNmS}'/>)</td>
			<th><spring:message code="table.regdate" /></th>
			<td class="left"><c:out value="${result.frstRegisterPnttm}"/></td>
			<th><spring:message code="comCopBbs.articleVO.detail.inqireCo" /></th>
			<td class="left">
			<a href="#" onClick="fn_readList_pop('<c:out value="${result.bbsId}" />','<c:out value="${result.nttId}" />');"></a>
			<c:out value="${result.inqireCo}"/>
			</td>
		</tr>
		<!-- 글 내용 -->
		<tr>
			<th class="vtop"><spring:message code="comCopBbs.articleVO.detail.nttCn" /></th>
			<td colspan="5" class="cnt">
				<c:out value="${fn:replace(result.nttCn , crlf , '')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 게시일자 -->
		<c:if test="${boardMasterVO.bbsId != 'BBSMSTR_000000000001'}">
		<tr style="display:none;">
			<th class="vtop"><spring:message code="comCopBbs.articleVO.detail.ntceDe" /></th>
			<td colspan="5" class="left">
				<c:out value="${result.ntceBgnde} ~ ${result.ntceEndde}" escapeXml="false" />
			</td>
		</tr>
		</c:if>
		<!-- 첨부파일  -->
		<c:if test="${not empty result.atchFileId}">
		<tr>
			<th><spring:message code="comCopBbs.articleVO.detail.atchFile" /></th>
			<td colspan="5">
				<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
				<c:param name="param_atchFileId" value="${result.atchFileId}" />
			</c:import>
			</td>
		</tr>
	  	</c:if>
		
	</tbody>
	</table>
	<!-- 하단 버튼 -->
	<div class="btn">
		<c:if test="${result.ntcrId != 'anonymous'}">
		<!-- 익명글 수정/삭제 불가  -->
		<c:if test="${result.frstRegisterId == sessionUniqId}">
		<form id="articleForm" name="articleForm" action="<c:url value='/cop/bbs/updateArticleView.do'/>" method="post" style="float:left;">
			<input type="button" class="s_submit" onClick="fnUpdate(); return false;"  value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" />
			<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
			<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
			<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
			<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
			<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
			<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
		</form>
		</c:if>	
		<c:if test="${result.frstRegisterId == sessionUniqId}">
		<form id="formDelete" name="formDelete" action="<c:url value='/cop/bbs/deleteArticle.do'/>" method="post" style="float:left; margin:0 0 0 3px;">						
			<input type="button" class="s_submit" onClick="fnDelete(); return false;"  value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" /> <spring:message code="input.button" />" />
			<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
			<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">						
		</form>
		</c:if>
		</c:if>
		<c:if test="${boardMasterVO.replyPosblAt == 'Y'}">
		<form id="formReply" name="formReply" action="<c:url value='/cop/bbs/replyArticleView.do'/>" method="post" style="float:left; margin:0 0 0 3px;">			
			<input type="button" class="s_submit" onClick="fnReply(); return false;"  value="<spring:message code="button.reply" />" title="<spring:message code="button.reply" /> <spring:message code="input.button" />" />
			<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
			<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
		</form>
		</c:if>
		<form id="formList" name="formList" action="<c:url value='/cop/bbs/selectArticleList.do'/>" method="post" style="float:left; margin:0 0 0 3px;">
			<input type="button" class="s_submit" onClick="fnList(); return false;"  value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />
			<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
		</form>
		
<%-- 	<form name="formScrap" action="<c:url value='/cop/scp/insertArticleScrapView.do'/>" method="post" style="float:left; margin:0 0 0 3px;">
			<input type="submit" class="s_submit" value="<spring:message code="button.scrap" />">
			<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
			<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
		</form> --%>
		
	</div><div style="clear:both;"></div>
	
</div>

<!-- 댓글 -->
<c:import url="/cop/cmt/selectArticleCommentList.do" charEncoding="utf-8">
</c:import>

</body>
</html>
