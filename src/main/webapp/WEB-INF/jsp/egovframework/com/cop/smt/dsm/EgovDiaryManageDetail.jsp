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
<title>${pageTitle} <spring:message code="title.detail" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />"> 
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_list(){
	$("#pageIndex").val("1");
	var form = $("#StplatListForm");  
	var string = form.serialize();	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageList.do",
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
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_DiaryManage(diaryId){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageModify.do",
		data:{
			"cmd": "",
			"diaryId": diaryId
		},
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
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_DiaryManage(diaryId){
	if(confirm("<spring:message code="common.delete.msg" />")){		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageDetail.do",
			data:{
				"cmd": "del",
				"diaryId": diaryId
			},
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
</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>[>] ${pageTitle} <spring:message code="title.detail" /></h2>

	<!-- 상세조회 -->
	<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.detail" /></caption>
	<colgroup>
		<col style="width: 16%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<!-- 일지정보 -->
		<c:set var="title"><spring:message code="comCopSmtSam.regist.schdulCn"/></c:set>
		<tr>
			<th><label for="schdulCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
			   <c:out value="${fn:replace(diaryManageVO.schdulCn , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 일지명 -->
		<c:set var="title"><spring:message code="comCopSmtSam.regist.diaryNm"/></c:set>
		<tr>
			<th><label for="diaryNm">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<c:out value="${fn:replace(diaryManageVO.diaryNm , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 지시사항 -->
		<c:set var="title"><spring:message code="comCopSmtSam.regist.drctMatter"/></c:set>
		<tr>
			<th><label for="drctMatter">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<c:out value="${fn:replace(diaryManageVO.drctMatter , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 특이사항 -->
		<c:set var="title"><spring:message code="comCopSmtSam.regist.partclrMatter"/></c:set>
		<tr>
			<th><label for="partclrMatter">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<c:out value="${fn:replace(diaryManageVO.partclrMatter , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 진척율 -->
		<c:set var="title"><spring:message code="comCopSmtSam.regist.diaryProcsPte"/></c:set>
		<tr>
			<th><label for="diaryProcsPte">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
  				<c:out value="${fn:replace(diaryManageVO.diaryProcsPte , crlf , '<br/>')}" escapeXml="false" />%
			</td>
		</tr>
		<!-- 첨부파일 -->
		<c:set var="title"><spring:message code="comCopSmtSam.regist.Atch"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> </th>
			<td class="nopd">

				<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
				<c:param name="param_atchFileId" value="${diaryManageVO.atchFileId}" />
				</c:import>
   	    
			</td>
		</tr>
	</tbody>
	</table>
	<!-- 하단 버튼 -->
	<div class="btn">		
		<input type="button" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" onclick="fn_egov_modify_DiaryManage('${diaryManageVO.diaryId}'); return false;"/> 
		<input type="button" class="s_submit" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" /> <spring:message code="input.button" />" onclick="fn_egov_delete_DiaryManage('${diaryManageVO.diaryId}'); return false;">
		<input type="button" class="s_submit" value="<spring:message code="button.list" />" onClick="javascript:fn_list();return false;">
	</div><div style="clear:both;"></div>
	
</div>




</body>
</html>
