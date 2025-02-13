<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="egovframework.com.cmm.EgovWebUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
String sLinkType = request.getParameter("linkType") == null ? "" : (String)request.getParameter("linkType");
sLinkType = EgovWebUtil.clearXSSMaximum(sLinkType);
%>
<c:set var="pageTitle"><spring:message code="comCopSmtSdm.title"/></c:set>
<c:set var="sLinkType" value="<%=sLinkType %>"/>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.create" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css"" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 일지관리 이동
 ******************************************************** */
function fn_egov_diary_DeptSchdulManage(){
	$("#cmd").val("");
	var form = $('#deptSchdulManageVO',parent.document);   
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
				$("#bodywrap",parent.document).html(returnData);					
			}else{ alert("ERROR!");return;} 
		},
		error: function(m,err){
			alert('m:'+m+' /err:'+err);
		},
		complete:function(){}
	});	
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
function fn_egov_modify_DeptSchdulManage(){
	$("#cmd").val("");
	var form = $('#deptSchdulManageVO');   
	var string = form.serialize();

	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageModify.do",
		data: string, 
		dataType:'html',
		timeout:(1000*30),
		
		beforeSend:function(){
			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
		},
		success:function(returnData, status){
			if(status == "success") {
				$("#bodywrap",parent.document).html(returnData);					
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
function fn_egov_delete_DeptSchdulManage(frm){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		$("#cmd").val("del");
		var form = $('#deptSchdulManageVO');   
		var string = form.serialize();

		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageDetail.do",
			data: string, 
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					//$("#bodywrap",parent.document).html(returnData);
					fn_egov_list_DeptSchdulManage();
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
$(function(){

});	
</script>
</head>
<body>

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>[>] ${pageTitle} <spring:message code="title.detail" /></h2>

	<!-- 상세조회 -->
	<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.detail" /></caption>
	<colgroup>
		<col style="width:16%;">
		<col style="width: ;">
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
			<td class="left">
			    <c:forEach items="${schdulSe}" var="schdulSeInfo" varStatus="status">
			    <c:if test="${schdulSeInfo.code eq resultList[0].schdulSe}">
			     <c:out value="${fn:replace(schdulSeInfo.codeNm , crlf , '<br/>')}" escapeXml="false" />
			    </c:if>
			    </c:forEach>
			</td>
		</tr>
		<!-- 중요도 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulIpcrCode"/></c:set>
		<tr>
			<th><label for="useStplatCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
			    <c:forEach items="${schdulIpcrCode}" var="schdulSeInfo" varStatus="status">
			    <c:if test="${schdulSeInfo.code eq resultList[0].schdulIpcrCode}">
			     <c:out value="${fn:replace(schdulSeInfo.codeNm , crlf , '<br/>')}" escapeXml="false" />
			    </c:if>
			    </c:forEach>
			</td>
		</tr>
		<!-- 부서 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulDeptName"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<c:out value="${fn:replace(resultList[0].schdulDeptName , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 일정명 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulNm"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<c:out value="${fn:replace(resultList[0].schdulNm , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 일정내용 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulCn"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<c:out value="${fn:replace(resultList[0].schdulCn , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 반복구분 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.reptitSeCode"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
			    <c:forEach items="${reptitSeCode}" var="schdulSeInfo" varStatus="status">
			    <c:if test="${schdulSeInfo.code eq resultList[0].reptitSeCode}">
			     <c:out value="${fn:replace(schdulSeInfo.codeNm , crlf , '<br/>')}" escapeXml="false" />
			    </c:if>
			    </c:forEach>
			</td>
		</tr>
		<!-- 날짜/시간 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulDatetime"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				${fn:substring(resultList[0].schdulBgnde, 0, 4)}-${fn:substring(resultList[0].schdulBgnde, 4, 6)}-${fn:substring(resultList[0].schdulBgnde, 6, 8)} ${fn:substring(resultList[0].schdulBgnde, 8, 10)}시  ${fn:substring(resultList[0].schdulBgnde, 10, 12)}분 ~
    			${fn:substring(resultList[0].schdulEndde, 0, 4)}-${fn:substring(resultList[0].schdulEndde, 4, 6)}-${fn:substring(resultList[0].schdulEndde, 6, 8)} ${fn:substring(resultList[0].schdulEndde, 8, 10)}시  ${fn:substring(resultList[0].schdulEndde, 10, 12)}분
			</td>
		</tr>
		<!-- 담당자 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulChargerName"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<c:out value="${fn:replace(resultList[0].schdulChargerName , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		<!-- 첨부파일 -->
		<c:set var="title"><spring:message code="comCopSmtSdm.regist.schdulAtch"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> </th>
			<td class="nopd">
				<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
				<c:param name="param_atchFileId" value="${resultList[0].atchFileId}" />
				</c:import>
			</td>
		</tr>
	</tbody>
	</table>
	<!-- 하단 버튼 -->
	<div class="btn">
	<form name="deptSchdulManageVO" id="deptSchdulManageVO" action="" method="post">
	
	<input name="schdulId" id="schdulId" type="hidden" value="${resultList[0].schdulId}">
	<input name="linkType" id="linkType" type="hidden" value="${sLinkType}">
	<input name="cmd" id="cmd" type="hidden" value=""/>		
	
	<input type="button" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" onclick="fn_egov_modify_DeptSchdulManage(); return false;">	
	<input type="button" class="s_submit" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" /> <spring:message code="input.button" />" onclick="fn_egov_delete_DeptSchdulManage(); return false;">	
	<input type="button" class="s_submit" value="<spring:message code="comCopSmtSdm.btn.diaryManage" />" title="<spring:message code="comCopSmtSdm.btn.diaryManage" /> <spring:message code="input.button" />" onclick="fn_egov_diary_DeptSchdulManage(); return false;">
	<input type="button" class="s_submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" /> <spring:message code="input.button" />" onClick="fn_egov_list_DeptSchdulManage(); return false;">
	</form>
	</div><div style="clear:both;"></div>
	
</div>




</body>
</html>
