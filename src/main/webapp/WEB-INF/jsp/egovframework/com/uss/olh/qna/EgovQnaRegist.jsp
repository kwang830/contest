<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssOlhQna.qnaVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.create" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<script src="<c:url value='/js/custom/jquery.form.min.js' />"></script>
<validator:javascript formName="qnaVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){

	// 첫 입력란에 포커스
	document.getElementById("qnaVO").qestnSj.focus();

}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_qna(){
	//input item Client-Side validate
	if (!validateQnaVO(document.qnaVO)) {	
		return false;
	} else {
		if(confirm("<spring:message code="common.regist.msg" />")){	
			//form.submit();
	        $("#qnaVO").ajaxForm({
	        	url:"${pageContext.request.contextPath}/uss/olh/qna/insertQna.do",
	            enctype : "multipart/form-data",
	            dataType : "html",
				error: function(m,err){
					alert('m:'+m+' /err:'+err);
				},
				beforeSubmit : function(){
					
				},
	            success : function(returnData, status){
					if(status == "success") {
						$("#bodywrap").html(returnData);
					}else{ alert("ERROR!");return;} 	                
	            }
	        });
	 
	        $("#qnaVO").submit() ;
		}
	} 
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fnList(){
	var form = $('#qnaVO');   
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
</script>

</head>
<body onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<form:form commandName="qnaVO" name="qnaVO" action="${pageContext.request.contextPath}/uss/olh/qna/insertQna.do" method="post" onSubmit="return false;"> 
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2><img src="/images/bl/bl_circle.gif" class="img_margin1"> ${pageTitle} <spring:message code="title.create" /></h2>

	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle } <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 20%;">
		<col style="width: ;">
		<col style="width: 20%;">
		<col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		
		<!-- 작성자명 -->
		<c:set var="title"><spring:message code="table.reger"/> </c:set>
		<tr>
			<th><label for="wrterNm">${title} <span class="pilsu">*</span></label></th>
			<td class="left" colspan="3">
			    <form:input path="wrterNm" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="wrterNm" cssClass="error" /></div>     
			</td>
		</tr>
		
		<!-- 전화번호 -->
		<c:set var="title"><spring:message code="comUssOlhQna.qnaVO.telNo"/> </c:set>
		<tr>
			<th><label for="areaNo">${title} <span class="pilsu">*</span></label></th>
			<td class="left" colspan="3">
			    <form:input path="areaNo" title="${title} ${inputTxt}" size="70" maxlength="70" style="width:30px;"/>&nbsp;-&nbsp;
			    <form:input path="middleTelno" title="${title} ${inputTxt}" size="70" maxlength="70" style="width:30px;"/>&nbsp;-&nbsp;
			    <form:input path="endTelno" title="${title} ${inputTxt}" size="70" maxlength="70" style="width:30px;"/>
   				<div><form:errors path="areaNo" cssClass="error" /></div>     
			</td>
		</tr>
		
		<!-- 이메일주소 -->
		<c:set var="title"><spring:message code="comUssOlhQna.qnaVO.emailAdres"/> </c:set>
		<tr>
			<th><label for="emailAdres">${title}</label></th>
			<td class="left">
			    <form:input path="emailAdres" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="emailAdres" cssClass="error" /></div>     
			</td>
			<c:set var="title"><spring:message code="comUssOlhQna.qnaVO.emailAnswerAt"/> </c:set>
			<th><label for="emailAnswerAt">${title}</label></th>
			<td class="left"><form:checkbox path="emailAnswerAt" value="Y"/>
			<div><form:errors path="emailAdres" cssClass="error" /></div></td>
		</tr>
		
		<!-- 질문제목 -->
		<c:set var="title"><spring:message code="comUssOlhQna.qnaVO.qestnSj"/> </c:set>
		<tr>
			<th><label for="qestnSj">${title} <span class="pilsu">*</span></label></th>
			<td class="left" colspan="3">
			    <form:input path="qestnSj" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="qestnSj" cssClass="error" /></div>     
			</td>
		</tr>
		<!-- 질문내용 -->
		<c:set var="title"><spring:message code="comUssOlhQna.qnaVO.qestnCn"/> </c:set>
		<tr>
			<th><label for="qestnCn">${title } <span class="pilsu">*</span></label></th>
			<td class="nopd" colspan="3">
				<form:textarea path="qestnCn" title="${title} ${inputTxt}" cols="300" rows="20" />   
				<div><form:errors path="qestnCn" cssClass="error" /></div>  
			</td>
		</tr>
		
	</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="button" class="s_submit" onClick="fn_egov_regist_qna(); return false;" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
		<input type="button" class="s_submit" onClick="fnList(); return false;" value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />		
	</div><div style="clear:both;"></div>
	
</div>

<input name="answerCn" type="hidden" value="<c:out value='answer'/>">
<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>

</body>
</html>
