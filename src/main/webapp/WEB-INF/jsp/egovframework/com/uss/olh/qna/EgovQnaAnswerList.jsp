<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="comUssOlhQna.qnaAnswerVO.title"/></c:set>
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
	document.qnaForm.searchCnd.focus();
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
 function fn_egov_select_linkPage(pageNo){
 	$("input[name='pageIndex']").val(pageNo);

 	var form = $('#qnaForm');   
 	var string = form.serialize();	

 	$.ajax({
 		type:"POST",
 		url:"${pageContext.request.contextPath}/uss/olh/qna/selectQnaAnswerList.do",
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
/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_qna(){
	$("input[name=pageIndex]").val(1);

	var form = $('#qnaForm');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/olh/qna/selectQnaAnswerList.do",
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
function fn_egov_inquire_qnadetail(qaId) {
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/olh/qna/selectQnaAnswerDetail.do",
		data: {
			"qaId": qaId,
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
</script>
</head>
<body onload="fn_egov_init()">
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<form name="qnaForm" id="qnaForm" action="<c:url value='/uss/olh/qna/selectQnaAnswerList.do'/>" method="post" onSubmit="fn_egov_search_qna(); return false;"> 
<div class="board">
	<h1><img src="/images/bl/bl_circle.gif" class="img_margin1"> ${pageTitle} <spring:message code="title.list" /></h1>
	<!-- 하단 버튼 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li>
				<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
					<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="table.reger" /></option><!-- 작성자 -->
					<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comUssOlhQna.qnaVO.qnaProcessSttusCode" /></option><!-- 진행상태 -->
				</select>
			</li>
			<!-- 검색키워드 및 조회버튼 -->
			<li>
				<input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
				<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
			</li>
		</ul>
	</div>
	
	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle}<spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 9%;">
		<col style="width: 40%;">
		<col style="width: 12%;">
		<col style="width: 9%;">
		<col style="width: 9%;">
		<col style="width: 13%;">
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 -->
		<th class="board_th_link"><spring:message code="comUssOlhQna.qnaVO.qestnSj" /></th><!-- 질문제목 -->
		<th><spring:message code="table.reger" /></th><!-- 작성자 -->
		<th><spring:message code="comUssOlhQna.qnaVO.qnaProcessSttusCode" /></th><!-- 진행상태 -->
		<th><spring:message code="comUssOlhQna.qnaVO.inqireCo" /></th><!-- 조회수 -->
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
		<td class="left"><a href="#" onClick="fn_egov_inquire_qnadetail('<c:out value="${resultInfo.qaId}"/>');return false;"><c:out value='${fn:substring(resultInfo.qestnSj, 0, 40)}'/></a></td>
		<td><c:out value='${resultInfo.wrterNm}'/></td>
		<td><c:out value='${resultInfo.qnaProcessSttusCodeNm}'/></td>
		<td><c:out value='${resultInfo.inqireCo}'/></td>
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

<input name="qaId" type="hidden" value="<c:out value='${searchVO.qaId}'/>">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

</body>
</html>