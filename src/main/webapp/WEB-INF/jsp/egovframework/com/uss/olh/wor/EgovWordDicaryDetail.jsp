<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comUssOlhWor.wordDicaryVO.title"/></c:set>
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
 function fn_egov_delete_worddicary(wordId){
	if(confirm("<spring:message code="common.delete.msg" />")){	
	 	//var form = $('#form1');   
	 	//var string = form.serialize();	
	 	
	 	$.ajax({
	 		type:"POST",
	 		url:"${pageContext.request.contextPath}/uss/olh/wor/deleteWordDicary.do",
			data: {
				"wordId": wordId			
			},
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
/* ********************************************************
 * 목록조회
 ******************************************************** */
function fnList(){
	var form = $('#form1');   
 	var string = form.serialize();	
 	
 	$.ajax({
 		type:"POST",
 		url:"${pageContext.request.contextPath}/uss/olh/wor/selectWordDicaryList.do",
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
function fnModifyWordView(){
	var form = $('#form1');   
 	var string = form.serialize();	
 	
 	$.ajax({
 		type:"POST",
 		url:"${pageContext.request.contextPath}/uss/olh/wor/updateWordDicaryView.do",
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

<form id="form1" name="wordDicaryForm" action="<c:url value='/uss/olh/wor/updateWordDicaryView.do'/>" method="post">
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>[>] ${pageTitle} <spring:message code="title.detail" /></h2>

	<!-- 상세조회 -->
	<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.detail" /></caption>
	<colgroup>
		<col style="width: 20%;">
		<col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 용어명 -->
		<tr>
			<th><spring:message code="comUssOlhWor.wordDicaryVO.wordNm" /></th>
			<td class="left"><c:out value="${result.wordNm}"/></td>
		</tr>
		<!-- 영문명 -->
		<tr>
			<th><spring:message code="comUssOlhWor.wordDicaryVO.engNm" /></th>
			<td class="left"><c:out value="${result.engNm}"/></td>
		</tr>
		<!-- 용어설명 -->
		<tr>
			<th class="vtop"><spring:message code="comUssOlhWor.wordDicaryVO.wordDc" /></th>
			<td class="cnt">
				<c:out value="${fn:replace(result.wordDc , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 동의어 -->
		<tr>
			<th><spring:message code="comUssOlhWor.wordDicaryVO.synonm" /></th>
			<td class="left"><c:out value="${result.synonm}"/></td>
		</tr>
		
		<!-- 등록일자 -->
		<tr>
			<th class="vtop"><spring:message code="table.regdate" /></th>
			<td class="left"><c:out value="${result.frstRegisterPnttm}"/></td>
			</td>
		</tr>
		
		<!-- 등록자 -->
		<tr>
			<th class="vtop"><spring:message code="table.reger" /></th>
			<td class="left"><c:out value="${result.emplyrNm}"/></td>
			</td>
		</tr>
		
	</tbody>
	</table>
	<!-- 하단 버튼 -->
	<div class="btn">		
		<input type="button" class="s_submit" onClick="fnModifyWordView(); return false;" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" />
		<input type="button" class="s_submit" onClick="fn_egov_delete_worddicary('<c:out value="${result.wordId}"/>'); return false;" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" /> <spring:message code="input.button" />" />
		<input type="button" class="s_submit" onClick="fnList(); return false;" value="<spring:message code="title.list" />" title="<spring:message code="title.list" /> <spring:message code="input.button" />" />
	</div><div style="clear:both;"></div>
	
</div>

<input name="wordId" type="hidden" value="<c:out value="${result.wordId}" />">
<input name="cmd" type="hidden" value="">
</form>

</body>
</html>
