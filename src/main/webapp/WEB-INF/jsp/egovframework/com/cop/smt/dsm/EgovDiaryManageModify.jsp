<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopSmtDsm.title"/></c:set>
<%pageContext.setAttribute("crlf", "\r\n"); %>
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
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<validator:javascript formName="diaryManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_DiaryManage(){
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
 * 목록 으로 가기
 ******************************************************** */
function fn_list(){	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageList.do",
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
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_DiaryManage(form){
	if(confirm("<spring:message code="common.save.msg" />")){

		if(!validateDiaryManageVO(form)){
			return false;
		}else{
	        $("#diaryManageVO").ajaxForm({
	        	url:"${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageModifyActor.do",
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
						fn_list();
					}else{ alert("ERROR!");return;} 	                
	            }
	        });
	 
	        $("#diaryManageVO").submit() ;	
		}
	}
}
$(function(){
	fn_egov_init_DiaryManage();	
});
</script>
</head>
<body>

<form:form commandName="diaryManageVO"  action="${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageModifyActor.do" name="diaryManageVO" method="post" enctype="multipart/form-data" onSubmit="return false;"> 
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
		<!-- 일지정보 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.schdulCn"/></c:set>
		<tr>
			<th><label for="schdulCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
			
				<c:out value="${fn:replace(diaryManageVO.schdulCn , crlf , '<br/>')}" escapeXml="false" />
				<div style="display:none"><form:input path="schdulCn" /></div>
				<div style="display:none"><form:input path="schdulId" /></div>
				<div><form:errors path="schdulId" cssClass="error"/></div>
				<div><form:errors path="schdulCn" cssClass="error"/></div>

			</td>
		</tr>
		<!-- 일지명 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.diaryNm"/></c:set>
		<tr>
			<th><label for="diaryNm">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:input path="diaryNm" size="73" cssClass="txaIpt" maxlength="255"/>
				<div><form:errors path="diaryNm" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 지시사항 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.drctMatter"/></c:set>
		<tr>
			<th><label for="drctMatter">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:textarea path="drctMatter" rows="3" cols="20" cssClass="txaClass"/>
				<div><form:errors path="drctMatter" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 특이사항 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.partclrMatter"/></c:set>
		<tr>
			<th><label for="partclrMatter">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:textarea path="partclrMatter" rows="3" cols="20" cssClass="txaClass"/>
				<div><form:errors path="partclrMatter" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 진척율 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.diaryProcsPte"/></c:set>
		<tr>
			<th><label for="diaryProcsPte">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
  				<form:input path="diaryProcsPte" size="3" cssClass="txaIpt" maxlength="3" style="width:10%;" /> %
  				<div><form:errors path="diaryProcsPte" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 첨부파일 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulAtch"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
			
			 <!--첨부목록을 보여주기 위한 -->
			<c:if test="${diaryManageVO.atchFileId ne null && diaryManageVO.atchFileId ne ''}">
			<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfsForUpdate.do" >
			<c:param name="param_atchFileId" value="${diaryManageVO.atchFileId}" />
			</c:import>
			</c:if>
  			
  			 <!-- 첨부화일 업로드를 위한 Start -->
			<c:if test="${diaryManageVO.atchFileId eq null || diaryManageVO.atchFileId eq ''}">
			<input type="hidden" name="fileListCnt" value="0" />
			<input name="atchFileAt" type="hidden" value="N">
			</c:if>
			<c:if test="${diaryManageVO.atchFileId ne null && diaryManageVO.atchFileId ne ''}">
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
		<input type="button" onclick="fn_egov_save_DiaryManage(document.diaryManageVO);" class="s_submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" /> <spring:message code="input.button" />" />
		<input type="button" onclick="javascript:fn_list();" class="s_submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />
	</div><div style="clear:both;"></div>
	
</div><!-- div end(wTableFrm)  -->

<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
<input name="diaryId" id="diaryId" type="hidden" value="${diaryManageVO.diaryId}">
<input name="cmd" id="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>

</body>
</html>
