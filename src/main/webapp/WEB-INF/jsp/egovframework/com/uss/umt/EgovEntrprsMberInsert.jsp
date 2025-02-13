<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle">거래처 등록</c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.create" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="entrprsManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
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
	$("#egovModal").setEgovModalTitle("거래처관리키 중복 확인"); //아이디 중복 확인
	var content = "";
	content = content + "<div class='modal-alignL' style='margin:5px 0 0 0'>"+"사용할관리키 :"+"</div>"; //사용할아이디
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
					$("#divModalResult").html("<font color='red'><spring:message code="comUssUmt.userManageRegistModal.result" /> : ["+returnData.checkId+"]는 사용할수 없는 관리키입니다.</font>");
				}else{
					//사용가능한 아이디입니다.
					$("#divModalResult").html("<font color='blue'><spring:message code="comUssUmt.userManageRegistModal.result" /> : ["+returnData.checkId+"]는 사용가능한 관리키입니다.</font>");
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
					alert("사용이 불가능한 관리키입니다."); //사용이 불가능한 아이디 입니다.
					return;
				}else{

					$("input[name=entrprsmberId]").val(returnData.checkId);
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
    varParam.checkId = document.entrprsManageVO.entrprsmberId.value;
    var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.entrprsManageVO.entrprsmberId.value = retVal;
    }
}

function showModalDialogCallback(retVal) {
	if(retVal) {
	    document.entrprsManageVO.entrprsmberId.value = retVal;
	}
}

/* ********************************************************
 * 목록조회
 ******************************************************** */
function fnListPage(){
    
	var form = $('#entrprsManageVO');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/umt/EgovEntrprsMberManage.do",
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
		if(validateEntrprsManageVO(form)){
			if(form.entrprsMberPassword.value != form.entrprsMberPassword2.value){
	            alert("<spring:message code="fail.user.passwordUpdate2" />");
	            return false;
	        }
	    	//form.submit();
	    	
	    	var form = $('#entrprsManageVO');   
	    	var string = form.serialize();	
	    	
	    	$.ajax({
	    		type:"POST",
	    		url:"${pageContext.request.contextPath}/uss/umt/EgovEntrprsMberInsert.do",
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
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,'').toUpperCase());
		}		
	});
	
	
	
});
</script>
<style>
.modal-content {width: 400px;}
</style>
</head>
<body onload="fn_egov_init()">

<!-- content start -->
 <form:form commandName="entrprsManageVO" name="entrprsManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovEntrprsMberInsert.do" method="post" onSubmit="fnInsert(document.entrprsManageVO); return false;"> 

<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
<input name="checkedIdForDel" type="hidden" />
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>

<!-- 우편번호검색 -->
<input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>[>] 거래처 등록</h2>
	
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
		<c:set var="title">거래처관리키</c:set>
		<tr>
			<th><label for="entrprsmberId">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="entrprsmberId" id="entrprsmberId" title="${title} ${inputTxt}" size="20" readonly="true" maxlength="20" style="width:20%;" />
				<button id="btnMbrId" class="btn_s2" onClick="return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />">관리키 생성</button>
				<div><form:errors path="entrprsmberId" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 회사명 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.name"/></c:set>
		<tr>
			<th><label for="cmpnyNm">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="cmpnyNm" title="${title} ${inputTxt}" size="50" maxlength="60" />
				<div><form:errors path="cmpnyNm" cssClass="error" /></div> 
			</td>
		</tr>
		<!-- 업종코드 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.indutyCode"/></c:set>
		<tr>
			<th><label for="indutyCode">${title}</label></th>
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
			<th><label for="entrprsSeCode">${title}</label></th>
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
			<th><label for="cxfc">${title}</label></th>
			<td class="left">
                    <form:input path="cxfc" id="cxfc" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="cxfc" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 사업자등록번호 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.bizrno"/></c:set>
		<tr>
			<th><label for="bizrno">${title}</label></th>
			<td class="left">
                    <form:input path="bizrno" id="bizrno" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="bizrno" cssClass="error" /></div>
			</td>
		</tr>
		
		<!-- 법인등록번호 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.jurirno"/></c:set>
		<tr>
			<th><label for="jurirno">${title}</label> </th>
			<td class="left">
                    <form:input path="jurirno" id="jurirno" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="jurirno" cssClass="error" /></div>
			</td>
		</tr>
		
		<!-- 회사전화번호 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.tel"/></c:set>
		<tr>
			<th><label for="areaNo">${title}</label></th>
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
			<th><label for="">${title}</label></th>
			<td class="left">
                    <form:input path="fxnum" id="fxnum" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="fxnum" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 우번번호 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.post"/></c:set>
		<tr>
			<th><label for="zip">${title}</label></th>
			<td class="left">
                    <input name="zip" id="zip" title="${title} ${inputTxt}" type="text" size="20" value="" maxlength="8" style="width:60px;" />
                    <!-- form:hidden path="zip" id="zip" --> 
                    <!-- <button class="btn_s2" onClick="fn_egov_ZipSearch(document.mberManageVO, document.mberManageVO.zip, document.mberManageVO.zip_view, document.mberManageVO.adres);return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />">우번번호검색</button>  -->
                    <div><form:errors path="zip" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 주소 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.addr"/></c:set>
		<tr>
			<th><label for="adres">${title}</label></th>
			<td class="left">
                    <form:input path="adres" id="adres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
                    <div><form:errors path="adres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 상세주소 -->
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.addrDetail"/></c:set>
		<tr>
			<th><label for="applcntNm">${title}</label></th>
			<td class="left">
                    <form:input path="detailAdres" id="detailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
                    <div><form:errors path="detailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 신청자이름 -->
		<c:set var="title">담당자명</c:set>
		<tr>
			<th><label for="">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="applcntNm" id="applcntNm" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="20" />
                    <div><form:errors path="applcntNm" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 신청자이메일주소 -->
		<c:set var="title">담당자이메일</c:set>
		<tr>
			<th><label for="applcntEmailAdres">${title}</label></th>
			<td class="left">
                    <form:input path="applcntEmailAdres" id="applcntEmailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="30" maxlength="50" />
                    <div><form:errors path="applcntEmailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 그룹아이디 -->
		<c:set var="inputSelect"><spring:message code="input.select"/></c:set>
		<c:set var="title"><spring:message code="comUssUmt.entrprsUserManageRegist.groupId"/></c:set>
		<tr style="display:none;">
			<th><label for="groupId">${title}</label></th>
			<td class="left">
                    <form:select path="groupId" id="groupId" title="${title} ${inputSelect}">
                        <form:option value="" label="${inputSelect}"/>
                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="groupId" cssClass="error"/></div>
			</td>
		</tr>
	</tbody>
	</table>

	<!-- 하단 버튼 --> 
	<div class="btn">
		<input type="button" class="s_submit" onClick="fnListPage(); return false;" value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />
		<input type="button" class="s_submit" onClick="fnInsert(document.entrprsManageVO); return false;" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
	</div><div style="clear:both;"></div>	
	
</div>

		<!-- 비밀번호 -->
		<input name="entrprsMberPassword" type="hidden" value="rhdxhd12" />
		<!-- 비밀번호확인 -->
		<input name="entrprsMberPassword2" type="hidden" value="rhdxhd12" />
		<!-- 비밀번호힌트 -->
		<input name="entrprsMberPasswordHint" type="hidden" value="P03" />
		<!-- 비밀번호정답 -->
		<input name="entrprsMberPasswordCnsr" type="hidden" value="1234" />		
		<!-- 기업회원상태코드 -->
		<input name="entrprsMberSttus" type="hidden" value="A" />

</form:form>

<!-- Egov Modal include  -->
<c:import url="/EgovModal.do" charEncoding="utf-8">
	<c:param name="scriptYn" value="N" />
	<c:param name="modalName" value="egovModal" />
</c:import>

</body>
</html>
