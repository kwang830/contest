<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssOlhWor.wordDicaryVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle } <spring:message code="title.update" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="wordDicaryVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	// 첫 입력란에 포커스..
	document.getElementById("wordDicaryVO").wordNm.focus();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_worddicary(form){
	if (!validateWordDicaryVO(form)) {		 			
		return false;		
	} else {
		
		if(confirm("<spring:message code="common.update.msg" />")){	
			//form.submit();
			var form = $('#wordDicaryVO');
		 	var string = form.serialize();	
		 	
		 	$.ajax({
		 		type:"POST",
		 		url:"${pageContext.request.contextPath}/uss/olh/wor/updateWordDicary.do",
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
}
/* ********************************************************
 * 목록조회
 ******************************************************** */
function fnList(){
	var form = $('#wordDicaryVO');
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
</script>
</head>
<body onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<!-- 상단타이틀 -->
<form:form commandName="wordDicaryVO" name="wordDicaryVO" action="${pageContext.request.contextPath}/uss/olh/wor/updateWordDicary.do" method="post" onSubmit="fn_egov_updt_worddicary(document.wordDicaryVO); return false;">  
<div class="wTableFrm">
	<h2>[>] ${pageTitle} <spring:message code="title.update" /></h2>

	<!-- 수정폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.update" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.update" /></caption>
	<colgroup>
		<col style="width: 20%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		
		<!-- 용어명 -->
		<c:set var="title"><spring:message code="comUssOlhWor.wordDicaryVO.wordNm"/> </c:set>
		<tr>
			<th><label for="wordNm">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			    <form:input path="wordNm" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="wordNm" cssClass="error" /></div>     
			</td>
		</tr>

		<!-- 영문명 -->
		<c:set var="title"><spring:message code="comUssOlhWor.wordDicaryVO.engNm"/> </c:set>
		<tr>
			<th><label for="engNm">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			    <form:input path="engNm" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="engNm" cssClass="error" /></div>     
			</td>
		</tr>
		
		<!-- 용어설명 -->
		<c:set var="title"><spring:message code="comUssOlhWor.wordDicaryVO.wordDc"/> </c:set>
		<tr>
			<th><label for="wordDc">${title } <span class="pilsu">*</span></label></th>
			<td class="nopd">
				<form:textarea path="wordDc" title="${title} ${inputTxt}" cols="300" rows="20" />   
				<div><form:errors path="wordDc" cssClass="error" /></div>  
			</td>
		</tr>
		
		<!-- 동의어 -->
		<c:set var="title"><spring:message code="comUssOlhWor.wordDicaryVO.synonm"/> </c:set>
		<tr>
			<th><label for="synonm">${title} </label></th>
			<td class="left">
			    <form:input path="synonm" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="synonm" cssClass="error" /></div>     
			</td>
		</tr>
		
	</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="button" class="s_submit" onClick="fn_egov_updt_worddicary(document.wordDicaryVO); return false;" value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" />
		<input type="button" class="s_submit" onClick="fnList(); return false;" value="<spring:message code="title.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />
	</div><div style="clear:both;"></div>
	
</div>


<input name="wordId" type="hidden" value="<c:out value='${wordDicaryVO.wordId}'/>">
</form:form>

</body>
</html>
