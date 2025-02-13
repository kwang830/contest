<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssUmt.userManagePasswordUpdt.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.create" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="passwordChgVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
function fnListPage(){
    document.passwordChgVO.action = "<c:url value='/uss/umt/EgovMberManage.do'/>";
    document.passwordChgVO.submit();
}
function fnUpdate(form){
    if(validatePasswordChgVO(form)){
        if(form.newPassword.value != form.newPassword2.value){
            alert("<spring:message code="fail.user.passwordUpdate2" />");
            return false;
        }
    	var form = $('#form1');   
    	var string = form.serialize();	
    	
    	$.ajax({
    		type:"POST",
    		url:"${pageContext.request.contextPath}/uss/umt/EgovMberPasswordUpdt.do",
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
    }else{
    	return false;
    }
}
/* ********************************************************
 * 목록화면
 ******************************************************** */
function fnGoList(){	
	//var form = $('#' + id);   
	//var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/umt/EgovMberManage.do",
		data: "", 
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
<c:if test="${!empty resultMsg}">
<script type="text/javaScript">
alert("<spring:message code="${resultMsg}" />");
</script>
</c:if>
<form id="form1" name="passwordChgVO" method="post"  action="<c:url value="${'/uss/umt/EgovMberPasswordUpdt.do'}"/>" onsubmit="fnUpdate(document.passwordChgVO); return false;">
<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
<input name="checkedIdForDel" type="hidden" />
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
<!-- 우편번호검색 -->
<input type="hidden" name="url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
        
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h1><img src="/images/bl/bl_circle.gif" class="img_margin1"><spring:message code="comUssUmt.userManage.title" /> ${pageTitle}</h1>

	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 16%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<!-- 일반회원아이디 -->
		<c:set var="title"><spring:message code="comUssUmt.userManagePasswordUpdt.id" /></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
				<input name="mberId" id="mberId" type="text" size="20" value="<c:out value='${mberManageVO.mberId}'/>"  maxlength="20" readonly >
                <input name="uniqId" id="uniqId" type="hidden" size="20" value="<c:out value='${mberManageVO.uniqId}'/>" >
                <input name="userTy" id="userTy" type="hidden" size="20" value="<c:out value='${mberManageVO.userTy}'/>" >
                <input name="returnUrl" id="returnUrl" type="hidden" size="20" value="" >
			</td>
		</tr>
		
		<!-- 기존 비밀번호 -->
		<c:set var="title"><spring:message code="comUssUmt.userManagePasswordUpdt.oldPass" /></c:set>
		<tr style="display:none;">
			<th>${title}<span class="pilsu">*</span></th>
			<td class="left">
				<input name="oldPassword" id="oldPassword" type="password" size="20" value="x"  maxlength="100" >
			</td>
		</tr>
		<!-- 비밀번호 -->
		<c:set var="title"><spring:message code="comUssUmt.userManagePasswordUpdt.pass" /></c:set>
		<tr>
			<th>${title}<span class="pilsu">*</span></th>
			<td class="left">
			    <input name="newPassword" id="newPassword" type="password" size="20" value=""  maxlength="100" >
			</td>
		</tr>
		<!-- 비밀번호확인 -->
		<c:set var="title"><spring:message code="comUssUmt.userManagePasswordUpdt.passConfirm" /></c:set>
		<tr>
			<th>${title}<span class="pilsu">*</span></th>
			<td class="left">
			    <input name="newPassword2" id="newPassword2" type="password" size="20" value=""  maxlength="100" >
			</td>
		</tr>
	</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
	<button class="btn_s2" onClick="fnUpdate(document.passwordChgVO);return false;" title="<spring:message code="button.update" /> <spring:message code="input.button" />"><spring:message code="button.update" /></button>
	<button class="btn_s2" onClick="fnGoList();return false;" title="<spring:message code="button.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></button>
	<button class="btn_s2" onClick="document.passwordChgVO.reset();return false;" title="<spring:message code="button.reset" /> <spring:message code="input.button" />"><spring:message code="button.reset" /></button>
	</div><div style="clear:both;"></div>
	
</div>

</form>


</body>
</html>
