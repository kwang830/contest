<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<c:set var="pageTitle"><spring:message code="comUssOlhFaq.faqVO.title" /></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle }<spring:message code="title.update" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<script src="<c:url value='/js/custom/jquery.form.min.js' />"></script>
<validator:javascript formName="faqVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init() {
	
	//------------------------------------------
	//------------------------- 첨부파일 수정 Start
	//-------------------------------------------
	var maxFileNum = 3
	var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), 3, 'file_label');
	multi_selector.addElement( document.getElementById( 'egovfile_1' ) );
	fn_egov_multi_selector_update_setting(multi_selector);
	//------------------------- 첨부파일 수정 End
	
	// 첫 입력란에 포커스..
	document.getElementById("faqVO").qestnSj.focus();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_faq(form) {
	if (!validateFaqVO(form)) {
		return false;
	} else {
		if(confirm("<spring:message code="common.update.msg" />")){
			//form.submit();
	        $("#faqVO").ajaxForm({
	        	url:"${pageContext.request.contextPath}/uss/olh/faq/updateFaq.do",
	            enctype : "multipart/form-data",
	            dataType : "html",
				error: function(m,err){
					alert('m:'+m+' /err:'+err);
				},
	            success : function(returnData, status){
					if(status == "success") {
						$("#bodywrap").html(returnData);
					}else{ alert("ERROR!");return;}            
	            }
	        });
	 
	        $("#faqVO").submit() ;			
		}
		
		
	}
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fnList(){
	var form = $('#faqVO');   
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
</script>
</head>
<body onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle">	<spring:message code="common.noScriptTitle.msg" />	</noscript>

<!-- 상단타이틀 -->
<form:form commandName="faqVO" name="faqVO" action="${pageContext.request.contextPath}/uss/olh/faq/updateFaq.do" method="post" onSubmit="return false;" enctype="multipart/form-data">
	<div class="wTableFrm">
	<h2><img src="/images/bl/bl_circle.gif" class="img_margin1"> ${pageTitle} <spring:message code="title.update" /></h2>

	<!-- 수정폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.update" arguments="${pageTitle}" />">
		<caption>${pageTitle} <spring:message code="title.update" /></caption>
		<colgroup>
			<col style="width:15%;">
			<col style="width:85%;">
		</colgroup>
		<tbody>
			<!-- 입력 -->
			<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
			<!-- 질문 제목   -->
			<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.qestnSj"/> </c:set>
			<tr>
				<th><label for="qestnSj">${title} <span class="pilsu">*</span></label></th>
				<td class="left">
				    <form:input path="qestnSj" title="${title} ${inputTxt}" size="70" maxlength="70" />
	   				<div><form:errors path="qestnSj" cssClass="error" /></div>     
				</td>
			</tr>
	
			<!-- 질문 내용  -->
			<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.qestnCn"/> </c:set>
			<tr>
				<th><label for="qestnCn">${title } <span class="pilsu">*</span></label></th>
				<td class="nopd" colspan="3">
					<form:textarea path="qestnCn" title="${title} ${inputTxt}" cols="300" rows="20" />   
					<div><form:errors path="qestnCn" cssClass="error" /></div>  
				</td>
			</tr>
	
			<!-- 답변 내용  -->
			<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.answerCn"/> </c:set>
			<tr>
				<th><label for="answerCn">${title } <span class="pilsu">*</span></label></th>
				<td class="nopd" colspan="3">
					<form:textarea path="answerCn" title="${title} ${inputTxt}" cols="300" rows="20" />   
					<div><form:errors path="answerCn" cssClass="error" /></div>  
				</td>
			</tr>
	
			<!-- 첨부파일 -->
			<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.atchFile"/></c:set>
			<tr>
				<th><label for="file_1">${title}</label> </th>
				<td class="nopd">
				<!-- 첨부목록을 보여주기 위한 -->
				<c:if test="${not empty faqVO.atchFileId}">
					<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfsForUpdate.do" >
						<c:param name="param_atchFileId" value="${faqVO.atchFileId}" />
					</c:import>		
				</c:if>
				
			    <!-- attached file Start -->
				<div>
					<div class="egov_file_box">
					<label for="egovfile_1" id="file_label"><spring:message code="title.attachedFileSelect" /></label> 
					<input type="file" name="file_1" id="egovfile_1"> 
					</div>
					<div id="egovComFileList"></div>
				</div>
				<!-- attached file End -->
				
				</td>
			</tr>	
		</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
	<c:if test="${sessionUserSe == 'USR'}">
	<input type="button" class="s_submit" onClick="fn_egov_updt_faq(document.faqVO); return false;" value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" />
	<input type="button" class="s_submit" onClick="fnList(); return false;" value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />
	</c:if>	
	<div style="clear: both;"></div>
	</div>

	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input name="faqId" type="hidden" value="${faqVO.faqId}">
	</div>
</form:form>

</body>
</html>
