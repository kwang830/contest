<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comUssOlhQna.qnaVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.detail" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript">
/* ********************************************************
 * 삭제처리
 ******************************************************** */
 function fn_egov_delete_qna(form){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		// Delete하기 위한 키값을 셋팅
		form.submit();	
	}	
}	
 /* ********************************************************
  * 목록조회
  ******************************************************** */
 function fnList(){
 	var form = $('#qnaForm');   
 	var string = form.serialize();	
 	
 	$.ajax({
 		type:"POST",
 		url:"${pageContext.request.contextPath}/uss/olh/qna/selectQnaList.do",
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
 	var form = $('#qnaForm');   
 	var string = form.serialize();	

 	$.ajax({
 		type:"POST",
 		url:"${pageContext.request.contextPath}/uss/olh/qna/updateQnaView.do",
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
 	var form = $('#qnaForm');   
 	var string = form.serialize();	
 	if(confirm("<spring:message code="common.delete.msg" />")){
 	 	$.ajax({
 	 		type:"POST",
 	 		url:"${pageContext.request.contextPath}/uss/olh/qna/deleteQna.do",
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
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>


<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2><img src="/images/bl/bl_circle.gif" class="img_margin1"> ${pageTitle} <spring:message code="title.detail" /></h2>

	<!-- 상세조회 -->
	<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.detail" /></caption>
	<colgroup>
		<col style="width: 15%;">
		<col style="width: ;">
		<col style="width: 15%;">
		<col style="width: ;">
	</colgroup>
	<tbody>
	
	
		<!-- 작성자명 -->
		<tr>
			<th><spring:message code="table.reger" /></th>
			<td class="left" colspan="3"><c:out value="${result.wrterNm}"/></td>
		</tr>
		<!-- 전화 -->
		<tr>
			<th><spring:message code="comUssOlhQna.qnaVO.telNo" /></th>
			<td class="left" colspan="3"><c:out value="${result.areaNo}"/> - <c:out value="${result.middleTelno}"/> - <c:out value="${result.endTelno}"/></td>
		</tr>
		<!-- 이메일 -->
		<tr>
			<th><spring:message code="comUssOlhQna.qnaVO.emailAdres" /></th>
			<td class="left"><c:out value="${result.emailAdres}"/></td>
			<th><spring:message code="comUssOlhQna.qnaVO.emailAnswerAt" /></th>
			<td class="left"><input name="emailAnswerAt" type="checkbox"  disabled <c:if test="${result.emailAnswerAt == 'Y'}">checked</c:if> title="<spring:message code="comUssOlhQna.qnaVO.emailAnswerAt" /> "></td>
		</tr>
		<!-- 작성일자 -->
		<tr>
			<th><spring:message code="table.regdate" /></th>
			<td class="left" colspan="3"><c:out value="${result.frstRegisterPnttm}"/></td>
		</tr>
		<!-- 조회수 -->
		<tr>
			<th><spring:message code="comUssOlhQna.qnaVO.inqireCo" /></th>
			<td class="left" colspan="3"><c:out value="${result.inqireCo}"/></td>
		</tr>
		<!-- 처리상태 -->
		<tr>
			<th><spring:message code="comUssOlhQna.qnaVO.qnaProcessSttusCode" /></th>
			<td class="left" colspan="3"><c:out value="${result.qnaProcessSttusCodeNm}"/></td>
		</tr>
		<!-- 질문제목 -->
		<tr>
			<th><spring:message code="comUssOlhQna.qnaVO.qestnSj" /></th>
			<td class="left" colspan="3"><c:out value="${result.qestnSj}"/></td>
		</tr>
		<!-- 질문 내용 -->
		<tr>
			<th class="vtop"><spring:message code="comUssOlhQna.qnaVO.qestnCn" /></th>
			<td class="cnt" colspan="3">
				<c:out value="${fn:replace(result.qestnCn , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>

		<!-- 답변 내용 -->
		<c:if test="${result.qnaProcessSttusCode ==  '3'}">
		<tr>
			<th class="vtop"><spring:message code="comUssOlhQna.qnaVO.answerCn" /></th>
			<td class="cnt" colspan="3">
				<c:out value="${fn:replace(result.answerCn , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		</c:if>
		
	</tbody>
	</table>
	<!-- 하단 버튼 -->
	<div class="btn">
		<c:if test="${result.frstRegisterId == sessionUniqId || sessionUserSe == 'USR'}">
		<input type="button" class="s_submit" onClick="fnUpdate(); return false;"  value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" />
		<input type="button" class="s_submit" onClick="fnDelete(); return false;"  value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" /> <spring:message code="input.button" />" />
		</c:if>
		<input type="button" class="s_submit" onClick="fnList(); return false;"  value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />
	</div><div style="clear:both;"></div>	
	
		<form name="qnaForm" id="qnaForm" action="<c:url value='/uss/olh/qna/updateQnaView.do'/>" method="post">
			<input name="cmd" type="hidden" value="">
			<input name="qaId" type="hidden" value="${result.qaId}">
		</form>
</div>

</body>
</html>
