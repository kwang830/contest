<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<title>${pageTitle} <spring:message code="title.create" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/modal.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/modal.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){

	//모달 셋팅
	fn_modal_setting();

}
/*********************************************************
 * 모달셋팅
 ******************************************************** */
function fn_modal_setting(){
	//버튼에 모달 연결   
	$("#btnMbrId").egovModal( "egovModal" );
	
	//타이틀 설졍
	$("#egovModal").setEgovModalTitle("<spring:message code="comUssUmt.userManageRegistModal.title" />"); //아이디 중복 확인
	var content = "";
	content = content + "<div class='modal-alignL' style='margin:5px 0 0 0'>"+"<spring:message code="comUssUmt.userManageRegistModal.userIsId" /> :"+"</div>"; //사용할아이디
	content = content + "<div class='modal-alignL'>"+"<input type='text' id='checkIdModal' class='se_input' name='checkIdModal' value='' size='20' maxlength='20' />"+"</div>";	
	content += "<div style='clear:both;'></div>";
	content += "<div id='divModalResult' style='margin:10px 0 0 0'><spring:message code="comUssUmt.userManageRegistModal.initStatus" /></div>"; //결과 : 중복확인을 실행하십시오.
	//모달 body 설정
	$("#egovModal").setEgovModalBody(content);

	var footer = "";
	footer += "<span class='btn_style1 blue' id='btnModalSelect' onclick='fn_id_check()'><a href='#'>조회</a></span>&nbsp;";	
	footer += "<span class='btn_style1 blue' id='btnModalOk' onclick='fn_id_checkOk()'><a href='#'>확인</a></span>&nbsp;";
	//모달 footer 설정
	$("#egovModal").setEgovModalfooter(footer);
	$(".modal-footer #footer").css("float","none");
	$(".modal-footer #footer").css("width","100%");	
	
	//엔터이벤트처리
	$("input[name=checkIdModal]").keydown(function (key) {
		if(key.keyCode == 13){
			fn_id_check();	
		}
	});
	
	footer = null;
	content = null;
}
/*********************************************************
 * 아이디 체크 AJAX
 ******************************************************** */
function fn_id_check(){	
	$.ajax({
		type:"POST",
		url:"<c:url value='/uss/umt/EgovIdDplctCnfirmAjax.do' />",
		data:{
			"checkId": $("#checkIdModal").val()			
		},
		dataType:'json',
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				if(returnData.usedCnt > 0 ){
					//사용할수 없는 아이디입니다.
					$("#divModalResult").html("<font color='red'><spring:message code="comUssUmt.userManageRegistModal.result" /> : ["+returnData.checkId+"]<spring:message code="comUssUmt.userManageRegistModal.useMsg" /></font>");
				}else{
					//사용가능한 아이디입니다.
					$("#divModalResult").html("<font color='blue'><spring:message code="comUssUmt.userManageRegistModal.result" /> : ["+returnData.checkId+"]<spring:message code="comUssUmt.userManageRegistModal.notUseMsg" /></font>");
				}
			}else{ alert("ERROR!");return;} 
		}
	});
}

/*********************************************************
 * 아이디 체크 확인
 ******************************************************** */
function fn_id_checkOk(){
	$.ajax({
		type:"POST",
		url:"<c:url value='/uss/umt/EgovIdDplctCnfirmAjax.do' />",
		data:{
			"checkId": $("#checkIdModal").val()			
		},
		dataType:'json',
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				if(returnData.usedCnt > 0 ){
					alert("<spring:message code="comUssUmt.userManageRegistModal.noIdMsg" />"); //사용이 불가능한 아이디 입니다.
					return;
				}else{
					
					$("input[name=mberId]").val(returnData.checkId);
					$("#egovModal").setEgovModalClose();
				}
			}else{ alert("ERROR!");return;} 
		}
		});
}


function fnIdCheck1(){
    var retVal;
    var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>";
    var varParam = new Object();
    varParam.checkId = document.mberManageVO.mberId.value;
    var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
        
    alert(1);
    return false;
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
    	document.mberManageVO.mberId.value = retVal;
    }
}

function showModalDialogCallback(retVal) {
	if(retVal) {
	    document.mberManageVO.mberId.value = retVal;
	}
}

/* ********************************************************
 * 목록조회
 ******************************************************** */
function fnListPage(){
    
	var form = $('#form1');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/umt/EgovMberManage.do",
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
function fnInsert(form){
	if(confirm("<spring:message code="common.regist.msg" />")){
	    if(validateMberManageVO(form)){
	    	if(form.password.value != form.password2.value){
	            alert("<spring:message code="fail.user.passwordUpdate2" />");
	            return false;
	        }
	    	//form.submit();
	    	
	    	var form = $('#form1');   
	    	var string = form.serialize();	
	    	
	    	$.ajax({
	    		type:"POST",
	    		url:"${pageContext.request.contextPath}/uss/umt/EgovMberInsert.do",
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
	        return true;
	    }
	}
}

$(function(){
	
	//모달 셋팅
	fn_modal_setting();	
	
	$(document).on("keyup", "input:text[name='checkIdModal']", function() {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		}		
	});		
	
});
</script>
<style>
.modal-content {width: 400px;}
</style>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
<%-- <c:set var="resultMsg">test-msg</c:set> --%>
<c:if test="${!empty resultMsg}">
<script type="text/javaScript">
alert("<spring:message code="${resultMsg}" />");
</script>
</c:if>
<form:form id="form1" commandName="mberManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovMberInsert.do" name="mberManageVO"  method="post" onSubmit="fnInsert(document.mberManageVO); return false;"> 

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle} <spring:message code="title.create" /></h2>

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
		<!-- 일반회원아이디 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.id"/></c:set>
		<tr>
			<th><label for="mberId">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="mberId" id="mberId" title="${title} ${inputTxt}" size="20" readonly="true" maxlength="20" style="width:80%;" />
				<button id="btnMbrId" class="btn_s2" onClick="return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />"><spring:message code="comUssUmt.userManageRegistBtn.idSearch" /></button>
				<div><form:errors path="mberId" cssClass="error" /></div>
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
		<!-- 비밀번호 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.pass"/></c:set>
		<tr>
			<th><label for="password">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:password path="password" title="${title} ${inputTxt}" size="50" maxlength="20" />
				<div><form:errors path="password" cssClass="error" /></div> 
			</td>
		</tr>
		<!-- 비밀번호확인 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.passConfirm"/></c:set>
		<tr>
			<th><label for="password2">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
			<input name="password2" id="password2" title="${title} ${inputTxt}" type="password" size="50" maxlength="20" />
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
				<form:input path="passwordCnsr" id="passwordCnsr" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="50" maxlength="100" />
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
                    <form:input path="mberFxnum" id="mberFxnum" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="mberFxnum" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 헨드폰번호 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.phone"/></c:set>
		<tr>
			<th><label for="moblphonNo">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="moblphonNo" id="moblphonNo" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20" maxlength="15" />
                    <div><form:errors path="moblphonNo" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 이메일주소 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.email"/></c:set>
		<tr>
			<th><label for="mberEmailAdres">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="mberEmailAdres" id="mberEmailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="30" maxlength="50" />
                    <div><form:errors path="mberEmailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 우번번호 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.post"/></c:set>
		<tr>
			<th><label for="zip">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <input name="zip" id="zip" title="${title} ${inputTxt}" type="text" size="20" value="" maxlength="8" style="width:60px;" />
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
                    <form:input path="adres" id="adres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
                    <div><form:errors path="adres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 상세주소 -->
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.addrDetail"/></c:set>
		<tr>
			<th><label for="detailAdres">${title}</label></th>
			<td class="left">
                    <form:input path="detailAdres" id="detailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
                    <div><form:errors path="detailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 그룹아이디 -->
		<c:set var="inputSelect"><spring:message code="input.select"/></c:set>
		<c:set var="title"><spring:message code="comUssUmt.userManageRegist.groupId"/></c:set>
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
		<input type="button" class="s_submit" onClick="fnListPage(); return false;" value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />
		<input type="button" class="s_submit" onClick="fnInsert(document.mberManageVO); return false;" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
	</div><div style="clear:both;"></div>

</div><!-- div end(wTableFrm)  -->

<input name="checkedIdForDel" type="hidden" />
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
 <!-- 우편번호검색 -->
 <input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
</form:form>

<!-- Egov Modal include  -->
<c:import url="/EgovModal.do" charEncoding="utf-8">
	<c:param name="scriptYn" value="N" />
	<c:param name="modalName" value="egovModal" />
</c:import>

</body>
</html>
