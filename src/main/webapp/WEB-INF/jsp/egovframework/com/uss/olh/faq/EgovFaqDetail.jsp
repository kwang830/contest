<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comUssOlhFaq.faqVO.title"/></c:set>
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
 function fn_egov_delete_faq(faqId){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		// Delete하기 위한 키값을 셋팅
		document.faqForm.faqId.value = faqId;	
		document.faqForm.action = "<c:url value='/uss/olh/faq/deleteFaq.do'/>";
		document.faqForm.submit();	
	}	
}	
 /* ********************************************************
  * 목록조회
  ******************************************************** */
 function fnList(){
 	var form = $('#faqForm');   
 	var string = form.serialize();	
 	
 	$.ajax({
 		type:"POST",
 		url:"${pageContext.request.contextPath}/uss/olh/faq/selectFaqList.do",
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
 	var form = $('#faqForm');   
 	var string = form.serialize();	

 	$.ajax({
 		type:"POST",
 		url:"${pageContext.request.contextPath}/uss/olh/faq/updateFaqView.do",
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
 	var form = $('#faqForm');   
 	var string = form.serialize();	
 	if(confirm("<spring:message code="common.delete.msg" />")){
 	 	$.ajax({
 	 		type:"POST",
 	 		url:"${pageContext.request.contextPath}/uss/olh/faq/deleteFaq.do",
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

<form name="faqForm" id="faqForm" action="<c:url value='/uss/olh/faq/updateFaqView.do'/>" method="post">
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2><img src="/images/bl/bl_circle.gif" class="img_margin1"> ${pageTitle} <spring:message code="title.detail" /></h2>

	<!-- 상세조회 -->
	<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.detail" /></caption>
	<colgroup>
		<col style="width:15%;">
		<col style="width:85%;">
	</colgroup>
	<tbody>
		<!-- 질문제목 -->
		<tr>
			<th><spring:message code="comUssOlhFaq.faqVO.qestnSj" /></th>
			<td class="left"><c:out value="${result.qestnSj}"/></td>
		</tr>
		<!-- 조회수 -->
		<tr>
			<th><spring:message code="comUssOlhFaq.faqVO.inqireCo" /></th>
			<td class="left"><c:out value="${result.inqireCo}"/></td>
		</tr>
		<!-- 질문 내용 -->
		<tr>
			<th class="vtop"><spring:message code="comUssOlhFaq.faqVO.qestnCn" /></th>
			<td class="cnt">
				<c:out value="${fn:replace(result.qestnCn , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 답변 내용 -->
		<tr>
			<th class="vtop"><spring:message code="comUssOlhFaq.faqVO.answerCn" /></th>
			<td class="cnt">
				<c:out value="${fn:replace(result.answerCn , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 등록일자 -->
		<tr>
			<th class="vtop"><spring:message code="table.regdate" /></th>
			<td class="left"><c:out value="${result.frstRegisterPnttm}"/></td>
		</tr>
		<!-- 첨부파일  -->
		<c:if test="${not empty result.atchFileId}">
		<tr>
			<th><spring:message code="comUssOlhFaq.faqVO.atchFile" /></th>
			<td>
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
		<c:if test="${sessionUserSe == 'USR'}">
		<input type="button" class="s_submit" onClick="fnUpdate(); return false;"  value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" />
		<input type="button" class="s_submit" onClick="fnDelete(); return false;"  value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" /> <spring:message code="input.button" />" />
		</c:if>
		<input type="button" class="s_submit" onClick="fnList(); return false;"  value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />
	</div><div style="clear:both;"></div>
	
</div>
<input name="faqId" type="hidden" value="<c:out value="${result.faqId}" />">
<input name="cmd" type="hidden" value="">
</form>
</body>
</html>
