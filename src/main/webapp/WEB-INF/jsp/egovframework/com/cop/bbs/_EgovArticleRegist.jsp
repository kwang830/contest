<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.create" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<script src="<c:url value='/js/custom/jquery.form.min.js' />"></script>
<validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
$(function() {
	fn_egov_init();	
	
	$("#ntceBgnde").datepicker(   
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
	$("#ntceEndde").datepicker(   
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
});

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){	
	<c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
	//------------------------------------------
	//------------------------- 첨부파일 등록 Start
	//-------------------------------------------
	var maxFileNum = document.getElementById("articleVO").atchPosblFileNumber.value;
	if(maxFileNum==null || maxFileNum==""){
		maxFileNum = 3;
	}
	var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum, 'file_label' );
	multi_selector.addElement( document.getElementById( 'egovfile_1' ) );
	//fn_egov_multi_selector_update_setting(multi_selector);

	//------------------------- 첨부파일 등록 End
	</c:if>
	
	// 첫 입력란에 포커스
	//document.getElementById("articleVO").nttSj.focus();

}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_article(){

	if(CKEDITOR.instances.nttCn){
		CKEDITOR.instances.nttCn.updateElement();	
	}
	
	//input item Client-Side validate
	if (!validateArticleVO(document.articleVO)) {	
		return false;
	} else {
		
		var validateForm = document.getElementById("articleVO");
		
		//비밀글은 제목 진하게 할 수 없음.
		//비밀글은 익명게시 불가.
		//비밀글은 공지게시 불가.
		if(validateForm.secretAt.checked) {
			if(validateForm.sjBoldAt.checked) {
				alert("<spring:message code="comCopBbs.articleVO.secretBold" />");
				return;
			}
			if(validateForm.anonymousAt.checked) {
				alert("<spring:message code="comCopBbs.articleVO.secretAnonymous" />");
				return;
			}
			if(validateForm.noticeAt.checked) {
				alert("<spring:message code="comCopBbs.articleVO.secretNotice" />");
				return;
			}
		}
		
		//익명글은 공지게시 불가.
		if(validateForm.anonymousAt.checked) {
			if(validateForm.noticeAt.checked) {
				alert("<spring:message code="comCopBbs.articleVO.anonymousNotice" />");
				return;
			}
		}
		
		//게시기간 
		var ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
		var ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);

		if(ntceBgnde == '' && ntceEndde != '') {
			validateForm.ntceBgnde.value = '1900-01-01';
		}
		if(ntceBgnde != '' && ntceEndde == '') {
			validateForm.ntceEndde.value = '9999-12-31';
		}
		if(ntceBgnde == '' && ntceEndde == '') {
			validateForm.ntceBgnde.value = '1900-01-01';
			validateForm.ntceEndde.value = '9999-12-31';
		}

		ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
		ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);
		
		if(ntceBgnde > ntceEndde){
			alert("<spring:message code="comCopBbs.articleVO.ntceDeError" />");
			return;
		}
		
		
		if(confirm("<spring:message code="common.regist.msg" />")){	
			//form.submit();
	        $("#articleVO").ajaxForm({
	        	url:"${pageContext.request.contextPath}/cop/bbs/insertArticle.do",
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
	 
	        $("#articleVO").submit() ;
		}
	} 
}
/* ********************************************************
 * 파일첨부 
 ******************************************************** */
function makeFileAttachment(){
	<c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
		 var maxFileNum = document.getElementById("articleVO").atchPosblFileNumber.value;
	     if(maxFileNum==null || maxFileNum==""){
	    	 maxFileNum = 3;
	     }
		 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
		 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	</c:if>
}
/* ********************************************************
 * 목록조회
 ******************************************************** */
function fnList(){
	var form = $('#articleVO');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/bbs/selectArticleList.do",
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
<body>

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<form:form commandName="articleVO" name="articleVO" action="${pageContext.request.contextPath}/cop/bbs/insertArticle.do" method="post" onSubmit="return false;" enctype="multipart/form-data"> 
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2><img src="/images/bl/bl_circle.gif" class="img_margin1"> ${pageTitle} <spring:message code="title.create" /></h2>

	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle } <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 13%;">
		<col style="width: ;">
		<col style="width: ;">
		<col style="width: ;">
	</colgroup>
	<tbody>
		<c:if test="${boardMasterVO.bbsId == 'BBSMSTR_000000000001'}">
		<tr>
			<th>※ 제목 입력방법 : </th>
			<td class="left" colspan="3">
				&nbsp;너Do 나Do It! DT 공모전 참가 신청서 제목과 동일하게 기입할 것! 
			</td>
		</tr>	
		</c:if>
		<!-- 입력 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<!-- 글 제목, 제목 Bold여부   -->
		<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.nttSj"/> </c:set>
		<tr>
			<th><label for="nttSj">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			    <form:input path="nttSj" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="nttSj" cssClass="error" /></div>     
			</td>
			<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.sjBoldAt"/> </c:set>
			<th><label for="sjBoldAt">${title}</label></th>
			<td class="left">
			    <form:checkbox path="sjBoldAt" value="Y"/>
   				<div><form:errors path="sjBoldAt" cssClass="error" /></div>     
			</td>
		</tr>
		<!-- 글 내용  -->
		<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.nttCn"/> </c:set>
		<tr>
			<th><label for="nttCn">${title } <span class="pilsu">*</span></label></th>
			<td class="nopd" colspan="3">
				<form:textarea path="nttCn" title="${title} ${inputTxt}" cols="300" rows="20" />   
				<ckeditor:replace replace="nttCn" basePath="${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/ckeditor/" />
				<div><form:errors path="nttCn" cssClass="error" /></div>  
			</td>
		</tr>		
		<c:choose>
			<c:when test="${boardMasterVO.bbsId!='BBSMSTR_000000000001'}">
			
					<!-- 공지신청 여부  -->
		<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.noticeAt"/> </c:set>
		<tr>
			<th><label for="noticeAt">${title}</label></th>
			<td class="left" colspan="3">
				<form:checkbox path="noticeAt" value="Y"/>
				<div><form:errors path="noticeAt" cssClass="error" /></div>       
			</td>
		</tr>
		
		<!-- 비밀글 여부 -->
		<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.secretAt"/> </c:set>
		<tr>
			<th><label for="secretAt">${title}</label></th>
			<td class="left" colspan="3">
				<form:checkbox path="secretAt" value="Y"/>
				<div><form:errors path="secretAt" cssClass="error" /></div>       
			</td>
		</tr>
		
		<!-- 익명등록 여부  -->
		<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.anonymousAt"/> </c:set>
		<tr>
			<th><label for="anonymousAt">${title}</label></th>
			<td class="left" colspan="3">
				<form:checkbox path="anonymousAt" value="Y"/>
				<div><form:errors path="anonymousAt" cssClass="error" /></div>       
			</td>
		</tr>
		
		<!-- 유효기간 설정  -->
		<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.ntceDe"/> </c:set>
		<tr>
			<th><label for="ntceBgnde">${title} </label></th>
			<td class="left" colspan="3">
				<form:input path="ntceBgnde" title="${title} ${inputTxt}" size="70" maxlength="70" style="width:70px;"/>
				&nbsp;~&nbsp;<form:input path="ntceEndde" title="${title} ${inputTxt}" size="70" maxlength="70"  style="width:70px;"/>
				<div><form:errors path="ntceBgnde" cssClass="error" /></div>       
				<div><form:errors path="ntceEndde" cssClass="error" /></div>       
			</td>
		</tr>
			
			</c:when>
			<c:otherwise>
				<input type="hidden" name="noticeAt" value=""/>
				<input type="hidden" name="secretAt" value=""/>
				<input type="hidden" name="anonymousAt" value=""/>
				<input type="hidden" name="ntceBgnde" value=""/>
				<input type="hidden" name="ntceEndde" value=""/>
			</c:otherwise>
		</c:choose>		
		<c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
		<!-- 첨부파일  -->
		<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.atchFile"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
			<td class="nopd" colspan="3">
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
		<c:if test="${boardMasterVO.bbsId == 'BBSMSTR_000000000001'}">
		<tr>
			<th>※ 첨부파일 등록 예시 : </th>
			<td class="left" colspan="3">
				<span class="pilsu">* 첨부파일 용량제한 50MB</span><br>			
				 * 파일명에 문서유형, 이름, 사번 표기<br>
				예 : 신청서_홍길동_50123.hwp<br>
				예 : 설명서_홍길동_50123.hwp<br>
			</td>
		</tr>			
		</c:if>
	  </c:if>
		
		
	</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="button" class="s_submit" onClick="fn_egov_regist_article(); return false;" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
		<input type="button" class="s_submit" onClick="fnList(); return false;" value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" />
	</div><div style="clear:both;"></div>
	
</div>

<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
<input type="hidden" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />


<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>

</body>
</html>
