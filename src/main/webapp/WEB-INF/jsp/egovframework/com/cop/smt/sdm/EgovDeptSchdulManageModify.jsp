<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopSmtSdm.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.update" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css"" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<script src="<c:url value='/js/custom/jquery.form.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="deptSchdulManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_DeptSchdulManage(){
	$("#schdulBgndeYYYMMDD").datepicker( 
	        {dateFormat:'yy-mm-dd'
	         , showOn: 'button'
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});

	$("#schdulEnddeYYYMMDD").datepicker(  
	        {dateFormat:'yy-mm-dd'
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'  
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});


	fn_egov_check_file("Y");
	//------------------------------------------
	//------------------------- 첨부파일 수정 Start
	//-------------------------------------------
	var maxFileNum = document.getElementById('posblAtchFileNumber').value;
	if(maxFileNum==null || maxFileNum==""){ maxFileNum = 3;}
	var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum, 'file_label');
	multi_selector.addElement( document.getElementById( 'egovfile_1' ) );
	fn_egov_multi_selector_update_setting(multi_selector);
	//------------------------- 첨부파일 수정 End
	//alert(multi_selector.update_count);
	
}

/* ********************************************************
* 주관 부서 팝업창열기
******************************************************** */
function fn_egov_schdulDept_DeptSchdulManage(){

	var arrParam = new Array(1);
	arrParam[0] = self;
	arrParam[1] = "typeDeptSchdule";

	window.showModalDialog("<c:url value='/cop/smt/sdm/EgovDeptSchdulManageAuthorGroupPopup.do' />", arrParam ,"dialogWidth=780px;dialogHeight=500px;resizable=yes;center=yes");
}

/* ********************************************************
* 아이디  팝업창열기
******************************************************** */
function fn_egov_schdulCharger_DeptSchdulManagee(){
	var arrParam = new Array(1);
	arrParam[0] = window;
	arrParam[1] = "typeDeptSchdule";

 	window.showModalDialog("<c:url value='/cop/smt/sdm/EgovDeptSchdulManageEmpLyrPopup.do' />", arrParam,"dialogWidth=780px;dialogHeight=600px;resizable=yes;center=yes");
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_DeptSchdulManage(){
	window.location.href="<c:url value='${pageContext.request.contextPath}/cmn/main/mainPage.do' />"; // 초기화면으로	
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_DeptSchdulManage(form){

	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateDeptSchdulManageVO(form)){
			return;
		}else{

			var schdulBgndeYYYMMDD = document.getElementById('schdulBgndeYYYMMDD').value;
			var schdulEnddeYYYMMDD = document.getElementById('schdulEnddeYYYMMDD').value;

			form.schdulBgnde.value = schdulBgndeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('schdulBgndeHH') +  fn_egov_SelectBoxValue('schdulBgndeMM');
			form.schdulEndde.value = schdulEnddeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('schdulEnddeHH') +  fn_egov_SelectBoxValue('schdulEnddeMM');

	        $("#deptSchdulManageVO").ajaxForm({
	        	url:"${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageModifyActor.do",
	            enctype : "multipart/form-data",
	            dataType : "html",
				error: function(m,err){
					alert('m:'+m+' /err:'+err);
				},
				beforeSubmit : function(){
					
				},
	            success : function(returnData, status){
					if(status == "success") {
						//$("#bodywrap").html(returnData);
						fn_egov_list_DeptSchdulManage();
					}else{ alert("ERROR!");return;} 	                
	            }
	        });
	 
	        $("#deptSchdulManageVO").submit() ;				
		}
	}
}

function fn_egov_check_file(flag) {
	if(flag=="Y") {
		document.getElementById('file_upload_posbl').style.display = "block";
		document.getElementById('file_upload_imposbl').style.display = "none";
	} else {
		document.getElementById('file_upload_posbl').style.display = "none";
		document.getElementById('file_upload_imposbl').style.display = "block";
	}
}

/* ********************************************************
* RADIO BOX VALUE FUNCTION
******************************************************** */
function fn_egov_RadioBoxValue(sbName)
{
	var FLength = document.getElementsByName(sbName).length;
	var FValue = "";
	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName(sbName)[i].checked == true){
			FValue = document.getElementsByName(sbName)[i].value;
		}
	}
	return FValue;
}
/* ********************************************************
* SELECT BOX VALUE FUNCTION
******************************************************** */
function fn_egov_SelectBoxValue(sbName)
{
	var FValue = "";
	for(var i=0; i < document.getElementById(sbName).length; i++)
	{
		if(document.getElementById(sbName).options[i].selected == true){

			FValue=document.getElementById(sbName).options[i].value;
		}
	}

	return  FValue;
}
/* ********************************************************
* PROTOTYPE JS FUNCTION
******************************************************** */
String.prototype.trim = function(){
	return this.replace(/^\s+|\s+$/g, "");
}

String.prototype.replaceAll = function(src, repl){
	 var str = this;
	 if(src == repl){return str;}
	 while(str.indexOf(src) != -1) {
	 	str = str.replace(src, repl);
	 }
	 return str;
}
$(function(){
	fn_egov_init_DeptSchdulManage();
});	
</script>
</head>
<body>

<!--  상단타이틀 -->
<form:form commandName="deptSchdulManageVO" name="deptSchdulManageVO" action="${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageModifyActor.do" method="post" enctype="multipart/form-data" onSubmit="return false;"> 
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>[>] ${pageTitle} <spring:message code="title.update" /></h2>

	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.update" /></caption>
	<colgroup>
		<col style="width: 16%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<!-- 선택 -->
		<c:set var="inputSelect"><spring:message code="input.select"/></c:set>
		<!-- 일정구분 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulSe"/></c:set>
		<tr>
			<th><label for="schdulSe">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:select path="schdulSe">
					<form:option value="" label="${inputSelect}"/>/>
					<form:options items="${schdulSe}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
				<div><form:errors path="schdulSe" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 중요도 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulIpcrCode"/></c:set>
		<tr>
			<th><label for="useStplatCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
		        <form:select path="schdulIpcrCode">
		            <form:option value="" label="선택"/>
		            <form:options items="${schdulIpcrCode}" itemValue="code" itemLabel="codeNm"/>
		        </form:select>
		        <div><form:errors path="schdulIpcrCode" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 부서 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulDeptName"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:input path="schdulDeptName" size="73" cssClass="txaIpt" readonly="true" maxlength="1000" style="width:94%;"/>
				<a href="#" onClick="fn_egov_schdulDept_DeptSchdulManage()"><img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>" align="middle" style="border:0px" alt="${title} <spring:message code="input.button"/>" title="${title} <spring:message code="input.button"/>"></a>
				<form:hidden path="schdulDeptId" />
				<div><form:errors path="schdulDeptName" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 일정명 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulNm"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:input path="schdulNm" size="73" cssClass="txaIpt" maxlength="255" />
				<div><form:errors path="schdulNm" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 일정내용 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulCn"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:textarea path="schdulCn" rows="3" cols="20" cssClass="txaClass"/>
				<div><form:errors path="schdulCn" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 반복구분 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.reptitSeCode"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<div style="float:left;"><form:radiobutton path="reptitSeCode" value="1"/><spring:message code="comCopSmtSdm.regist.schdulSe1"/> </div> <!-- 당일 -->
				<div style="float:left; margin:0 0 0 10px"><form:radiobutton path="reptitSeCode" value="2"/><spring:message code="comCopSmtSdm.regist.schdulSe2"/> </div><!-- 반복 --> 
				<div style="float:left; margin:0 0 0 10px"><form:radiobutton path="reptitSeCode" value="3"/><spring:message code="comCopSmtSdm.regist.schdulSe3"/> </div><!-- 연속 -->
				<div style="clear:both;"><form:errors path="reptitSeCode" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 날짜/시간 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulDatetime"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:input path="schdulBgndeYYYMMDD" size="10" readonly="true" maxlength="10" style="width:70px;"/>
				</a>
				&nbsp;&nbsp;~&nbsp;&nbsp;
				<form:input path="schdulEnddeYYYMMDD" size="10" readonly="true" maxlength="10" style="width:70px;"/>
				&nbsp;
				
        <form:select path="schdulBgndeHH">
            <form:options items="${schdulBgndeHH}" itemValue="code" itemLabel="codeNm"/>
        </form:select><spring:message code="comCopSmtSdm.regist.schdulYYYY"/> <!-- 시 -->
        <form:select path="schdulBgndeMM">
            <form:options items="${schdulBgndeMM}" itemValue="code" itemLabel="codeNm"/>
        </form:select><spring:message code="comCopSmtSdm.regist.schdulMM"/> <!-- 분 -->
		~
        <form:select path="schdulEnddeHH">
            <form:options items="${schdulEnddeHH}" itemValue="code" itemLabel="codeNm"/>
        </form:select><spring:message code="comCopSmtSdm.regist.schdulYYYY"/> <!-- 시 -->
        <form:select path="schdulEnddeMM">
            <form:options items="${schdulEnddeMM}" itemValue="code" itemLabel="codeNm"/>
        </form:select><spring:message code="comCopSmtSdm.regist.schdulMM"/> <!-- 분 -->
			</td>
		</tr>
		<!-- 담당자 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulChargerName"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:input path="schdulChargerName" size="73" cssClass="txaIpt" readonly="true" maxlength="10" style="width:100px;"  />
				<a href="#" onClick="fn_egov_schdulCharger_DeptSchdulManagee()"><img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>" align="middle" style="border:0px" alt="${title} <spring:message code="input.button"/>" title="${title} <spring:message code="input.button"/>"></a>
				<div><form:errors path="schdulChargerName" cssClass="error"/></div>
		       <form:hidden path="schdulChargerId" />
			</td>
		</tr>
		<!-- 첨부파일 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulAtch"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
			
			 <!--첨부목록을 보여주기 위한 -->
			<c:if test="${deptSchdulManageVO.atchFileId ne null && deptSchdulManageVO.atchFileId ne ''}">
			<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfsForUpdate.do" >
			<c:param name="param_atchFileId" value="${deptSchdulManageVO.atchFileId}" />
			</c:import>
			</c:if>
  			
  			 <!-- 첨부화일 업로드를 위한 Start -->
			<c:if test="${deptSchdulManageVO.atchFileId eq null || deptSchdulManageVO.atchFileId eq ''}">
			<input type="hidden" name="fileListCnt" value="0" />
			<input name="atchFileAt" type="hidden" value="N">
			</c:if>
			<c:if test="${deptSchdulManageVO.atchFileId ne null && deptSchdulManageVO.atchFileId ne ''}">
			<input name="atchFileAt" type="hidden" value="Y">
			</c:if>
	  
		    <div id="file_upload_posbl"  style="display:none;" >
		    
			<!-- attached file Start -->
			<div>
				<div class="egov_file_box">
				<label for="egovfile_1" id="file_label"><spring:message code="title.attachedFileSelect" /></label> 
				<input type="file" name="file_1" id="egovfile_1"> 
				</div>
				<div id="egovComFileList"></div>
			</div>
			<!-- attached file End -->
			
			</div>

			<div id="file_upload_imposbl"  style="display:none;" >
	            <table width="100%" cellspacing="0" cellpadding="0" border="0" align="left" class="UseTable">
				    <tr>
				        <td style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;"><spring:message code="common.imposbl.fileupload" /></td>
				    </tr>
	   	        </table>
			</div>
			  
			</td>
		</tr>
	</tbody>
	</table>
	
	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="button" class="s_submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" /> <spring:message code="input.button" />" onclick="fn_egov_save_DeptSchdulManage(document.deptSchdulManageVO); return false;"/>
		<input type="button" class="s_submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" onclick="fn_egov_list_DeptSchdulManage(); return false;"/>
	</div><div style="clear:both;"></div>
	
</div><!-- div end(wTableFrm)  -->

<form:hidden path="schdulId" />
<form:hidden path="schdulKindCode" />
<input type="hidden" name="schdulBgnde" id="schdulBgnde" value="" />
<input type="hidden" name="schdulEndde" id="schdulEndde" value="" />

<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
<input type="hidden" name="cmd" value="<c:out value='save'/>" />
<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
<input type="hidden" name="returnUrl" value="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageModify.do'/>"/>
</form:form>

</body>
</html>
