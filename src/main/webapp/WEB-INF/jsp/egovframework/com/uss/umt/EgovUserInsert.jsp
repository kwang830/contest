<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssUmt.deptUserManage.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.create" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/modal.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/modal.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){


}
/*********************************************************
 * 모달셋팅
 ******************************************************** */
function fn_modal_setting(){

	//버튼에 모달 연결
	$("#btnEmplyrId").egovModal( "egovModal" );

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
					
					$("input[name=emplyrId]").val(returnData.checkId);
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
    varParam.checkId = document.userManageVO.emplyrId.value;
    var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.userManageVO.emplyrId.value = retVal;
    }
}

function showModalDialogCallback(retVal) {
	if(retVal) {
	    document.userManageVO.emplyrId.value = retVal;
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
		url:"${pageContext.request.contextPath}/uss/umt/EgovUserManage.do",
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
	    if(validateUserManageVO(form)){
	    	if(form.password.value != form.password2.value){
	            alert("<spring:message code="fail.user.passwordUpdate2" />");
	            return false;
	        }
	    	//form.submit();
	    	
	    	var form = $('#form1');   
	    	var string = form.serialize();	
	    	
	    	$.ajax({
	    		type:"POST",
	    		url:"${pageContext.request.contextPath}/uss/umt/EgovUserInsert.do",
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

function fn_egov_inqire_cert() {
	var url = "<c:url value='/uat/uia/EgovGpkiRegist.do' />";
	var popupwidth = '500';
	var popupheight = '400';
	var title = '인증서';

	Top = (window.screen.height - popupheight) / 3;
	Left = (window.screen.width - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,	scrollbars=no,resizable=no,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
	PopUpWindow = window.open(url, title, Future)
	PopUpWindow.focus();
}

function fn_egov_dn_info_setting(dn) {
	var frm = document.userManageVO;

	frm.subDn.value = dn;
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
<form:form id="form1" commandName="userManageVO" name="userManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovUserInsert.do" method="post" onSubmit="fnInsert(document.userManageVO); return false;"> 
<div class="wTableFrm">
	<h2>[>] ${pageTitle} <spring:message code="title.create" /></h2>
	
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
		<c:set var="inputSelect"><spring:message code="input.select"/></c:set>
		<!-- 일반회원아이디 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.id"/></c:set>
		<tr>
			<th><label for="emplyrId">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="emplyrId" id="emplyrId" title="${title} ${inputTxt}" size="20" readonly="true" maxlength="20" style="width:80%;" />
				<button id="btnEmplyrId" class="btn_s2" onClick="return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />"><spring:message code="comUssUmt.deptUserManageRegistBtn.idSearch" /></button>
				<div><form:errors path="emplyrId" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 일반회원이름 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.name"/></c:set>
		<tr>
			<th><label for="emplyrNm">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="emplyrNm" title="${title} ${inputTxt}" size="50" maxlength="60" />
				<div><form:errors path="emplyrNm" cssClass="error" /></div> 
			</td>
		</tr>
		<!-- 비밀번호 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.pass"/></c:set>
		<tr>
			<th><label for="password">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:password path="password" title="${title} ${inputTxt}" size="50" maxlength="20" />
				<div><form:errors path="password" cssClass="error" /></div> 
			</td>
		</tr>
		<!-- 비밀번호확인 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.passConfirm"/></c:set>
		<tr>
			<th><label for="password2">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
			<input name="password2" id="password2" title="${title} ${inputTxt}" type="password" size="50" maxlength="20" />
			</td>
		</tr>
		<!-- 비밀번호힌트 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.passHit"/></c:set>
		<tr>
			<th><label for="passwordHint">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:select path="passwordHint" id="passwordHint" title="${title} ${inputSelect}">
					<form:option value="" label="${inputSelect}"/>
					<form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
				<div><form:errors path="passwordHint" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 비밀번호정답 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.passOk"/></c:set>
		<tr>
			<th><label for="passwordCnsr">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="passwordCnsr" id="passwordCnsr" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="50" maxlength="100" />
				<div><form:errors path="passwordCnsr" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 소속기관코드 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.insttCode"/></c:set>
		<tr>
			<th><label for="insttCode">${title}</label></th>
			<td class="left">
                    <form:select path="insttCode" id="insttCode" title="${title} ${inputSelect}">
                       <form:option value="" label="${inputSelect}"/>
                       <form:options items="${insttCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="insttCode" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 조직아이디 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.orgnztId"/></c:set>
		<tr>
			<th><label for="orgnztId">${title}</label></th>
			<td class="left">
                  <form:select path="orgnztId" id="orgnztId" title="${title} ${inputSelect}">
                       <form:option value="" label="${inputSelect}"/>
                       <form:options items="${orgnztId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="orgnztId" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 직위 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.ofcps"/></c:set>
		<tr>
			<th><label for="ofcpsNm">${title}</label></th>
			<td class="left">
                    <form:input path="ofcpsNm" id="ofcpsNm" title="${title} ${inputTxt}" size="20" maxlength="50" />
                    <div><form:errors path="ofcpsNm" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 사번 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.emplNum"/></c:set>
		<tr>
			<th><label for="emplNo">${title}</label></th>
			<td class="left">
                    <form:input path="emplNo" id="emplNo" title="${title} ${inputTxt}" size="20" maxlength="20" />
                    <div><form:errors path="emplNo" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 성별구분코드 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.saxTypeCode"/></c:set>
		<tr>
			<th><label for="sexdstnCode">${title}</label></th>
			<td class="left">
				<form:select path="sexdstnCode" id="sexdstnCode" title="${title} ${inputSelect}">
					<form:option value="" label="${inputSelect}"/>
					<form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
				 <div><form:errors path="sexdstnCode" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 생일 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.brth"/></c:set>
		<tr>
			<th><label for="brth">${title}</label></th>
			<td class="left">
				<form:input path="brth" id="brth"  title="${title} ${inputTxt}" size="20" maxlength="8" />
                <div><form:errors path="brth" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 집전화번호 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.tel"/></c:set>
		<tr>
			<th><label for="areaNo">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="areaNo" id="areaNo" title="${title} ${inputSelect}" size="5" maxlength="5" style="width:40px;"/>
                    - <form:input path="homemiddleTelno" id="homemiddleTelno" size="5" maxlength="5" style="width:40px;"/>
                    - <form:input path="homeendTelno" id="homeendTelno"  size="5" maxlength="5" style="width:40px;"/>
                    <div><form:errors path="areaNo" cssClass="error" /></div>
                    <div><form:errors path="homemiddleTelno" cssClass="error" /></div>
                    <div><form:errors path="homeendTelno" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 사무실전화번호 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.areaNo"/></c:set>
		<tr>
			<th><label for="offmTelno">${title}</label></th>
			<td class="left">
                    <form:input path="offmTelno" id="offmTelno" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="offmTelno" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 팩스번호 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.offmTelno"/></c:set>
		<tr>
			<th><label for="fxnum">${title}</label></th>
			<td class="left">
                    <form:input path="fxnum" id="fxnum" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="fxnum" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 헨드폰번호 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.phone"/></c:set>
		<tr>
			<th><label for="moblphonNo">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="moblphonNo" id="moblphonNo" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20" maxlength="15" />
                    <div><form:errors path="moblphonNo" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 이메일주소 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.email"/></c:set>
		<tr>
			<th><label for="emailAdres">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="emailAdres" id="mberEmailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="30" maxlength="50" />
                    <div><form:errors path="emailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 우번번호 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.post"/></c:set>
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
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.addr"/></c:set>
		<tr>
			<th><label for="homeadres">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="homeadres" id="homeadres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
                    <div><form:errors path="homeadres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 상세주소 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.addrDetail"/></c:set>
		<tr>
			<th><label for="detailAdres">${title}</label></th>
			<td class="left">
                    <form:input path="detailAdres" id="detailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
                    <div><form:errors path="detailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 그룹아이디 -->
		
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.groupId"/></c:set>
		<tr>
			<th><label for="groupId">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:select path="groupId" id="groupId" title="${title} ${inputSelect}">
                        <form:option value="" label="${inputSelect}"/>
                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="groupId" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 일반회원상태코드 -->
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.status"/></c:set>
		<tr>
			<th><label for="emplyrSttusCode">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:select path="emplyrSttusCode" id="emplyrSttusCode" title="${title} ${inputSelect}">
                        <form:option value="" label="${inputSelect}"/>
                        <form:options items="${emplyrSttusCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="emplyrSttusCode" cssClass="error"/></div>
			</td>
		</tr>
		<form:hidden path="subDn" />
	</tbody>
	</table>

	<!-- 하단 버튼 --> 
	<div class="btn">
		<input type="button" class="s_submit" onClick="fnListPage(); return false;" value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />
		<input type="button" class="s_submit" onClick="fnInsert(document.userManageVO); return false;" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
	</div><div style="clear:both;"></div>

</div><!-- div end(wTableFrm)  -->

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
