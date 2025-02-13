<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="comCopSmtDsm.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
   	$("#pageIndex").val(pageNo);
	var form = $("#searchVO");  
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
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_DiaryManage(diaryId){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageDetail.do",
		//data: string,
		data:{
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

function fn_src(){
	$("#pageIndex").val("1");
	var form = $("#searchVO");  
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
 * 등록 처리 함수
 ******************************************************** */
function fn_goRegist(){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageRegist.do",
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
$(function(){
	$("#btn_src").click(function(){
		fn_src();
	});
	$("#btn_add").click(function(){
		fn_goRegist();
	});	
});
</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="board">
	<h1>[>] ${pageTitle} <spring:message code="title.list" /></h1>
	<form name="searchVO" id="searchVO" action="<c:url value='/cop/smt/dsm/EgovDiaryManageList.do'/>" method="post"> 
		<!-- 검색영역 -->
		<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
			<ul>
				<li>
					<select name="searchCondition" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
						<option selected value=''>--<spring:message code="input.select" />--</option>
						<option value='DIARY_NM' <c:if test="${searchCondition == 'DIARY_NM'}">selected</c:if>><spring:message code="comCopSmtDsm.searchCondition.diaryNm" /></option><!-- 일지명 -->
			   			<option value='DRCT_MATTER' <c:if test="${searchCondition == 'DRCT_MATTER'}">selected</c:if>><spring:message code="comCopSmtDsm.searchCondition.drctMatter" /></option><!-- 지시사항  -->
			   			<option value='PARTCLR_MATTER' <c:if test="${searchCondition == 'PARTCLR_MATTER'}">selected</c:if>><spring:message code="comCopSmtDsm.searchCondition.partclrMatter" /></option><!-- 특이사항 -->
			   			<option value='SCHDUL_ID' <c:if test="${searchVO.searchCondition == 'SCHDUL_ID'}">selected</c:if>><spring:message code="comCopSmtDsm.searchCondition.schdulId" /></option><!-- 일정ID -->
					</select>
				</li>
				<!-- 검색키워드 및 조회버튼 -->
				<li>
					<input class="s_input" name="searchKeyword" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="155" >
					<input type="button" id="btn_src" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
					<input type="button" id="btn_add" class="s_btn" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
				</li>
			</ul>
		</div>
	<input name="diaryId" type="hidden" value="">
	<input name="pageIndex" id="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	</form>

	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 9%;">
		
		<col style="width: ;">
		<col style="width: 20%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 --> 

		<th class="board_th_link"><spring:message code="comCopSmtDsm.list.diaryNm" /></th><!-- 일지명 -->
		<th><spring:message code="comCopSmtDsm.list.diaryProcsPte" /></th><!-- 진척률 -->
		<th><spring:message code="table.reger" /></th><!-- 등록자 -->
		<th><spring:message code="table.regdate" /></th><!-- 등록일 -->
	</tr>
	</thead>
	<tbody class="ov">
	<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td colspan="5"><spring:message code="common.nodata.msg" /></td>
	</tr>
	</c:if>
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr>
		<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		<td class="left"><a href="javascript:;" onclick="javascript:fn_egov_detail_DiaryManage('<c:out value="${resultInfo.diaryId}"/>'); return false;"><font style="color:cadetblue;"><c:out value="${resultInfo.diaryNm}"/></font></a></td>
		<td><c:out value='${resultInfo.diaryProcsPte}'/>%</td>
		<td><c:out value='${resultInfo.frstRegisterNm}'/></td>	
		<td><c:out value='${fn:substring(resultInfo.frstRegisterPnttm,0,10)}'/></td>	
	</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<!-- paging navigation -->
	<div class="pagination">
		<ul><ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/></ul>
	</div>
	
</div><!-- end div board -->




</body>
</html>