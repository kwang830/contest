<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssUmt.userManage.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.update" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
function fnListPage(){
    document.mberManageVO.action = "<c:url value='/uss/umt/EgovMberManage.do'/>";
    document.mberManageVO.submit();
}
function fnDeleteMber(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg" />")){
	    document.mberManageVO.checkedIdForDel.value=checkedIds;
	    document.mberManageVO.action = "<c:url value='/uss/umt/EgovMberDelete.do'/>";
	    document.mberManageVO.submit();
	}
}
function fnPasswordMove(){
	var form = $('#mberManageVO');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/umt/EgovMberPasswordUpdtView.do",
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
	if(confirm("<spring:message code="common.update.msg" />")){
    	if(validateUserManageVO(form)){
	    	var form = $('#mberManageVO');   
	    	var string = form.serialize();
    	
	    	$.ajax({
	    		type:"POST",
    			url:"${pageContext.request.contextPath}/uss/umt/EgovMberSelectUpdt.do",
    			data: string, 
    			dataType:'html',
    			timeout:(1000*30),
    		
    			beforeSend:function(){
	    			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
    			},
    			success:function(returnData, status){
    				if(status == "success") {
    					if(returnData.resultMsg=='success.common.update'){
	    					alert('변경 되었습니다.');	
    					}else{
	    					alert('처리중 오류가 발생하였습니다.\n'+returnData.resultMsg);	
    					} 
    				}
    			},
    			error: function(m,err){
	    			alert('m:'+m+' /err:'+err);
    			}
    		});
    	}else{
	    	return false;
	    }
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
<!-- content start -->
<form:form id="mberManageVO" commandName="mberManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovMberSelectUpdt.do" name="mberManageVO"  method="post" > 
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
<input type="hidden" name="userTyForPassword" value="<c:out value='${mberManageVO.userTy}'/>" />
<!-- for validation -->
<input type="hidden" name="password" id="password" value="Test#$123)"/>
<div class="wTableFrm">
	<h1><img src="/images/bl/bl_circle.gif" class="img_margin1"> ${pageTitle} <spring:message code="title.update" /></h1>
			
	<!-- 수정폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 22%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력/선택 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<c:set var="inputSelect"><spring:message code="input.cSelect" /></c:set>
		<!-- 일반회원아이디 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.id"/></c:set>
		<tr>
			<th><label for="mberId">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="mberId" id="mberId" title="${title} ${inputTxt}" size="20" readonly="true" maxlength="20" />
                <form:errors path="mberId" cssClass="error" />
                <form:hidden path="uniqId" />
			</td>
		</tr>
		<!-- 일반회원이름 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.name"/></c:set>
		<tr>
			<th><label for="mberNm">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="mberNm" title="${title} ${inputTxt}" size="50" maxlength="60" />
				<div><form:errors path="mberNm" cssClass="error" /></div> 
			</td>
		</tr>
		<!-- 비밀번호힌트 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.passHit"/></c:set>
		<tr>
			<th><label for="passwordHint">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:select path="passwordHint" id="passwordHint" title="${title} ${inputSelect}">
					<form:option value="" label="--선택하세요--"/>
					<form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
				<div><form:errors path="passwordHint" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 비밀번호정답 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.passOk"/></c:set>
		<tr>
			<th><label for="passwordCnsr">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="passwordCnsr" id="passwordCnsr" title="${title} ${inputTxt}" size="50" maxlength="100" />
				<div><form:errors path="passwordCnsr" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 성별구분코드 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.saxTypeCode"/></c:set>
		<tr>
			<th><label for="sexdstnCode">${title}</label></th>
			<td class="left">
				<form:select path="sexdstnCode" id="sexdstnCode" title="${title} ${inputSelect}">
					<form:option value="" label="--선택하세요--"/>
					<form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>
		<!-- 소속구분코드 -->
		<c:set var="title">소속</c:set>
		<tr>
			<th><label for="deptCode">${title}</label></th>
			<td class="left">
				<form:select path="deptCode" id="deptCode" title="${title} ${inputSelect}">
					<form:option value="" label="--선택하세요--"/>
					<form:options items="${deptCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>
		<!-- 호칭구분코드 -->
		<c:set var="title">호칭</c:set>
		<tr>
			<th><label for="titleCode">${title}</label></th>
			<td class="left">
				<form:select path="titleCode" id="titleCode" title="${title} ${inputSelect}">
					<form:option value="" label="--선택하세요--"/>
					<form:options items="${titleCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>
		<!-- 직책구분코드 -->
		<c:set var="title">직책</c:set>
		<tr>
			<th><label for="positionCode">${title}</label></th>
			<td class="left">
				<form:select path="positionCode" id="positionCode" title="${title} ${inputSelect}">
					<form:option value="" label="--선택하세요--"/>
					<form:options items="${positionCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>
		<!-- 직급구분코드 -->
		<c:set var="title">직급</c:set>
		<tr>
			<th><label for="rankCode">${title}</label></th>
			<td class="left">
				<form:select path="rankCode" id="rankCode" title="${title} ${inputSelect}">
					<form:option value="" label="--선택하세요--"/>
					<form:options items="${rankCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>
		<!-- 전화번호 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.tel"/></c:set>
		<tr>
			<th><label for="areaNo">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="areaNo" id="areaNo" title="전화번호" cssClass="txaIpUmt" size="5" maxlength="5" style="width:40px;"/>
                    - <form:input path="middleTelno" id="middleTelno" cssClass="txaIpUmt" size="5" maxlength="5" style="width:40px;"/>
                    - <form:input path="endTelno" id="endTelno" cssClass="txaIpUmt" size="5" maxlength="5" style="width:40px;"/>
                    <div><form:errors path="areaNo" cssClass="error" /></div>
                    <div><form:errors path="middleTelno" cssClass="error" /></div>
                    <div><form:errors path="endTelno" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 팩스번호 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.fax"/></c:set>
		<tr>
			<th><label for="mberFxnum">${title}</label></th>
			<td class="left">
                    <form:input path="mberFxnum" id="mberFxnum" title="${title} ${inputTxt}" size="20"  maxlength="15" />
                    <div><form:errors path="mberFxnum" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 헨드폰번호 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.phone"/></c:set>
		<tr>
			<th><label for="moblphonNo">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="moblphonNo" id="moblphonNo" title="${title} ${inputTxt}" size="20" maxlength="15" />
                    <div><form:errors path="moblphonNo" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 이메일주소 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.email"/></c:set>
		<tr>
			<th><label for="mberEmailAdres">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="mberEmailAdres" id="mberEmailAdres" title="${title} ${inputTxt}" size="30" maxlength="50" />
                    <div><form:errors path="mberEmailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 우번번호 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.post"/></c:set>
		<tr>
			<th><label for="zip">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="zip" id="zip" title="${title} ${inputTxt}" readonly="true" size="70" maxlength="6" style="width:60px;"/>
                    <!-- form:hidden path="zip" id="zip" --> 
                    <!-- <button class="btn_s2" onClick="fn_egov_ZipSearch(document.mberManageVO, document.mberManageVO.zip, document.mberManageVO.zip_view, document.mberManageVO.adres);return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />">우번번호검색</button>  -->
                    <div><form:errors path="zip" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 주소 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.addr"/></c:set>
		<tr>
			<th><label for="adres">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="adres" id="adres" title="${title} ${inputTxt}" readonly="true" size="70" maxlength="100" />
                    <div><form:errors path="adres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 상세주소 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.addrDetail"/></c:set>
		<tr>
			<th><label for="detailAdres">${title}</label> </th>
			<td class="left">
                    <form:input path="detailAdres" id="detailAdres" title="${title} ${inputTxt}"  size="70" maxlength="100" />
                    <div><form:errors path="detailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 그룹아이디 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.groupId"/></c:set>
		<c:set var="inputSelect"><spring:message code="input.select"/></c:set>
		<tr>
			<th><label for="groupId">${title}</label></th>
			<td class="left">
                    <form:select path="groupId" id="groupId" title="${title} ${inputSelect}">
                        <form:option value="" label="${inputSelect}"/>
                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="groupId" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 일반회원상태코드 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.status"/></c:set>
		<tr>
			<th><label for="mberSttus">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:select path="mberSttus" id="mberSttus" title="${title} ${inputSelect}">
                        <form:option value="" label="${inputSelect}"/>
                        <form:options items="${mberSttus_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="mberSttus" cssClass="error"/></div>
			</td>
		</tr>
	</tbody>
	</table>			


	<!-- 하단 버튼 -->
	<div class="btn">
		<button class="btn_s2" onClick="fnUpdate(document.mberManageVO); return false;" title="<spring:message code="button.save" /> <spring:message code="input.button" />"><spring:message code="button.save" /></button>
		<button class="btn_s2" onClick="fnGoList(); return false;" title="<spring:message code="button.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></button>
		<button class="btn_s2" onClick="fnPasswordMove(); return false;" title="<spring:message code="comUssUmt.userManageModifyBtn.passwordChange" /> <spring:message code="input.button" />"><spring:message code="comUssUmt.userManageModifyBtn.passwordChange" /></button>
		<button class="btn_s2" onClick="document.mberManageVO.reset(); return false;" title="<spring:message code="button.reset" /> <spring:message code="input.button" />"><spring:message code="button.reset" /></button>	
	</div><div style="clear:both;"></div>
</div>
</form:form>
<!-- content end -->
</body>
</html>
