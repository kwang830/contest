<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="comUssOlhWor.wordDicaryVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript">
/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	// 첫 입력란에 포커스..
	document.wordDicaryForm.searchCnd.focus();
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
   	
	$("input[name=pageIndex]").val(pageNo);
	
	var form = $('#form1');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/olh/wor/selectWordDicaryList.do",
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
 * 목록조회
 ******************************************************** */
function fn_egov_search_worddicary(){
	$("input[name=pageIndex]").val(1);
	
	var form = $('#form1');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/olh/wor/selectWordDicaryList.do",
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
function fn_egov_inquire_worddicarydetail(wordId) {

	var form = $('#form1');   
	//var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/olh/wor/selectWordDicaryDetail.do",
		data:{
			"wordId": wordId
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
function fnAddWordView() {
	var form = $('#form1');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/olh/wor/insertWordDicaryView.do",
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
<body onload="fn_egov_init()">
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<form id="form1" name="wordDicaryForm" action="<c:url value='/uss/olh/wor/selectWordDicaryList.do'/>" method="post" onSubmit="fn_egov_search_worddicary(); return false;"> 
<div class="board">
	<h1>[>] ${pageTitle} <spring:message code="title.list" /></h1>
	<!-- 하단 버튼 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li>
				<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
					<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comUssOlhWor.wordDicaryVO.wordNm" /></option><!-- 용어명 -->
					<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comUssOlhWor.wordDicaryVO.engNm" /></option><!-- 영문명 -->
				</select>
			</li>
			<!-- 검색키워드 및 조회버튼 -->
			<li>
				<input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
				<input type="button" class="s_btn" onClick="fn_egov_search_worddicary(); return false;" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
				<input type="button" class="s_btn" onClick="fnAddWordView(); return false;" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />				
			</li>
		</ul>
	</div>
	
	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle}<spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 9%;">
		<col style="width: 20%;">
		<col style="width: 20%;">
		<col style="width: 13%;">
		<col style="width: 13%;">
		<col style="width: 13%;">
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 -->
		<th class="board_th_link"><spring:message code="comUssOlhWor.wordDicaryVO.wordNm" /></th><!-- 용어명 -->
		<th><spring:message code="comUssOlhWor.wordDicaryVO.engNm" /></th><!-- 영문명 -->
		<th><spring:message code="comUssOlhWor.wordDicaryVO.synonm" /></th><!-- 동의어 -->
		<th><spring:message code="table.reger" /></th><!-- 등록자 -->
		<th><spring:message code="table.regdate" /></th><!-- 등록일자 -->
	</tr>
	</thead>
	<tbody class="ov">
	<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td colspan="6"><spring:message code="common.nodata.msg" /></td>
	</tr>
	</c:if>
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr>
		<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		<td class="left"><a href="javascript:;" onClick="fn_egov_inquire_worddicarydetail('<c:out value="${resultInfo.wordId}"/>');return false;"><c:out value='${fn:substring(resultInfo.wordNm, 0, 40)}'/></a></td>
		<td class="left"><c:out value='${resultInfo.engNm}'/></td>
		<td class="left"><c:out value='${resultInfo.synonm}'/></td>
		<td><c:out value='${resultInfo.emplyrNm}'/></td>
		<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<!-- paging navigation -->
	<div class="pagination">
		<ul>
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
		</ul>
	</div>
	
	
</div>

<input name="wordId" type="hidden" value="<c:out value='${searchVO.wordId}'/>">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

</body>
</html>