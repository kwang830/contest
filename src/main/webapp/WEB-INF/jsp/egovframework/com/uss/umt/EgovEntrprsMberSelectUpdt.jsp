<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssUmt.entrprsUserManage.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.update" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="entrprsManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
function fnDeleteEntrprs(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg" />")){
		//document.entrprsManageVO.checkedIdForDel.value=checkedIds;
	    //document.entrprsManageVO.action = "<c:url value='/uss/umt/EgovEntrprsMberDelete.do'/>";
	    //document.entrprsManageVO.submit();
	    
		$.ajax({
			type:"POST",
			url:"<c:url value='/uss/umt/EgovEntrprsMberDelete.do' />",
			data:{
				"checkedIdForDel": checkedIds			
			},
			dataType:'json',
			timeout:(1000*30),
			success:function(returnData, status){
				if(status == "success") {
					if( returnData.resultMsg== "success.common.delete"){
						alert('삭제되었습니다.');
						fnGoList();
					}else if( returnData.resultMsg== "fail.common.delete"){
						alert('삭제 중 오류가 발생하였습니다.');
					}
				}else{ alert("ERROR!");return;} 
			}
		});
	}
}
function fnPasswordMove(){
	var form = $('#entrprsManageVO');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/umt/EgovEntrprsPasswordUpdtView.do",
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
function fnUpdate(form){
    if(validateEntrprsManageVO(form)){
    	var form = $('#entrprsManageVO');   
    	var string = form.serialize();
    	
    	$.ajax({
    		type:"POST",
    		url:"${pageContext.request.contextPath}/uss/umt/EgovEntrprsMberSelectUpdt.do",
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
		url:"${pageContext.request.contextPath}/uss/umt/EgovEntrprsMberManage.do",
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
<!-- content start -->
<form:form commandName="entrprsManageVO" name="entrprsManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovEntrprsMberSelectUpdt.do" method="post" onSubmit="fnUpdate(document.entrprsManageVO); return false;">
<div class="wTableFrm">
	<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
	<input name="checkedIdForDel" type="hidden" />
	<!-- 검색조건 유지 -->
	<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
	<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
	<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
	<!-- 우편번호검색 -->
	<input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
	<!-- 사용자유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
	<input type="hidden" name="userTyForPassword" value="<c:out value='${entrprsManageVO.userTy}'/>" />
	<!-- for validation -->
	<input type="hidden" name="entrprsMberPassword" value="Test#$123">
	<input type="hidden" name="selectedId"  value="<c:out value='${entrprsManageVO.entrprsmberId}'/>"/>
	
	<!-- 우편번호검색 -->
	<input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />

	<!-- 타이틀 -->
	<h2>[>] ${pageTitle} <spring:message code="title.update" /></h2>
	
	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 22%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력/선택 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<c:set var="inputSelect"><spring:message code="input.cSelect" /></c:set>
		<!-- 기업회원아이디 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.id"/></c:set>
		<tr>
			<th>${title} <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="entrprsmberId" id="entrprsmberId" title="${title} ${inputTxt}" size="20" readonly="true" maxlength="20" />
				<div><form:errors path="entrprsmberId" cssClass="error" /></div>
				<form:hidden path="uniqId" />
			</td>
		</tr>
		<!-- 회사명 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.name"/></c:set>
		<tr>
			<th>${title} <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="cmpnyNm" title="${title} ${inputTxt}" size="50" maxlength="60" />
				<div><form:errors path="cmpnyNm" cssClass="error" /></div> 
			</td>
		</tr>
		<!-- 비밀번호힌트 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.passHit"/></c:set>
		<tr style="display:none">
			<th>${title} <span class="pilsu">*</span></th>
			<td class="left">
				<form:select path="entrprsMberPasswordHint" id="entrprsMberPasswordHint" title="${title} ${inputSelect}">
					<form:option value="" label="--선택하세요--"/>
					<form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
				<div><form:errors path="entrprsMberPasswordHint" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 비밀번호정답 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.passOk"/></c:set>
		<tr style="display:none">
			<th>${title} <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="entrprsMberPasswordCnsr" id="entrprsMberPasswordCnsr" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="50" maxlength="100" />
				<div><form:errors path="entrprsMberPasswordCnsr" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 업종코드 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.indutyCode"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
				<form:select path="indutyCode" id="indutyCode" title="${title} ${inputSelect}">
					<form:option value="" label="${inputSelect}"/>
					<form:options items="${indutyCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>
		<!-- 기업구분코드 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.entrprsSeCode"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
				<form:select path="entrprsSeCode" id="entrprsSeCode" title="${title} ${inputSelect}">
					<form:option value="" label="${inputSelect}"/>
					<form:options items="${entrprsSeCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>
		
		<!-- 대표이사이름 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.cxfc"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
                    <form:input path="cxfc" id="cxfc" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="cxfc" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 사업자등록번호 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.bizrno"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
                    <form:input path="bizrno" id="bizrno" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="bizrno" cssClass="error" /></div>
			</td>
		</tr>
		
		<!-- 법인등록번호 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.jurirno"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
				<form:select path="jurirno" id="jurirno" title="${title} ${inputSelect}">
					<form:option value="" label="--선택하세요--"/>
					<form:options items="${entrprsSeCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
				<div><form:errors path="jurirno" cssClass="error" /></div>
			</td>
		</tr>
		
		<!-- 회사전화번호 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.tel"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
                    <form:input path="areaNo" id="areaNo" title="전화번호" size="5" maxlength="5" style="width:40px;"/>
                    - <form:input path="entrprsMiddleTelno" id="entrprsMiddleTelno" size="5" maxlength="5" style="width:40px;"/>
                    - <form:input path="entrprsEndTelno" id="entrprsEndTelno" size="5" maxlength="5" style="width:40px;"/>
                    <div><form:errors path="areaNo" cssClass="error" /></div>
                    <div><form:errors path="entrprsMiddleTelno" cssClass="error" /></div>
                    <div><form:errors path="entrprsEndTelno" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 팩스번호 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.fax"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
                    <form:input path="fxnum" id="fxnum" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="fxnum" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 우번번호 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.post"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
                    <input name="zip" id="zip" title="${title} ${inputTxt}" value="<c:out value='${entrprsManageVO.zip}'/>" type="text" size="20" value="" maxlength="8" style="width:60px;" />
                    <!-- form:hidden path="zip" id="zip" --> 
                    <!-- <button class="btn_s2" onClick="fn_egov_ZipSearch(document.mberManageVO, document.mberManageVO.zip, document.mberManageVO.zip_view, document.mberManageVO.adres);return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />">우번번호검색</button>  -->
                    <div><form:errors path="zip" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 주소 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.addr"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
                    <form:input path="adres" id="adres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
                    <div><form:errors path="adres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 상세주소 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.addrDetail"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
                    <form:input path="detailAdres" id="detailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
                    <div><form:errors path="detailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 신청자이름 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageList.regName"/></c:set>
		<tr>
			<th>${title} <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="applcntNm" id="applcntNm" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="20" />
                    <div><form:errors path="applcntNm" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 신청자이메일주소 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageList.regMail"/></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
                    <form:input path="applcntEmailAdres" id="applcntEmailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="30" maxlength="50" />
                    <div><form:errors path="applcntEmailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 그룹아이디 -->
		<c:set var="inputSelect"><spring:message code="input.select"/></c:set>
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.groupId"/></c:set>
		<tr style="display:none">
			<th>${title}</th>
			<td class="left">
                    <form:select path="groupId" id="groupId" title="${title} ${inputSelect}">
                        <form:option value="" label="${inputSelect}"/>
                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="groupId" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 기업회원상태코드 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.status"/></c:set>
		<tr style="display:none">
			<th>${title}</th>
			<td class="left">
                    <form:select path="entrprsMberSttus" id="entrprsMberSttus" title="${title} ${inputSelect}">
                        <form:option value="" label="${inputSelect}"/>
                        <form:options items="${entrprsMberSttus_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="entrprsMberSttus" cssClass="error"/></div>
			</td>
		</tr>
	</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">		
		<button class="btn_s2" onClick="fnUpdate(document.entrprsManageVO); return false;" title="<spring:message code="button.save" /> <spring:message code="input.button" />"><spring:message code="button.save" /></button>
		<button class="btn_s2" onClick="fnDeleteEntrprs('<c:out value='${entrprsManageVO.userTy}'/>:<c:out value='${entrprsManageVO.uniqId}'/>'); return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />"><spring:message code="button.delete" /></button>		
		<button class="btn_s2" onClick="fnGoList(); return false;" title="<spring:message code="button.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></button>
<%-- 		<button class="btn_s2" onClick="fnPasswordMove(); return false;" title="<spring:message code="comUssUmt.userManageModifyBtn.passwordChange" /> <spring:message code="input.button" />"><spring:message code="comUssUmt.userManageModifyBtn.passwordChange" /></button> --%>
		<button class="btn_s2" onClick="document.entrprsManageVO.reset(); return false;" title="<spring:message code="button.reset" /> <spring:message code="input.button" />"><spring:message code="button.reset" /></button>		
	</div><div style="clear:both;"></div>

</div>
</form:form>
<!-- content end -->
</body>
</html>
