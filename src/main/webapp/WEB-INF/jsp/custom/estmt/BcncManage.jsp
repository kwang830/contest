<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle">견적서관리</c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javaScript" language="javascript" defer="defer">
/* ********************************************************
 * 목록조회
 ******************************************************** */
function fnSrcUser(){
	$("input[name=pageIndex]").val(1);
	
	var form = $('#form1');   
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


function fncSelectDeptManageList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/umt/dpt/selectDeptManageList.do'/>";
    document.listForm.submit();
}

function fncSelectDeptManage(bannerId) {
    document.listForm.bannerId.value = bannerId;
    document.listForm.action = "<c:url value='/uss/umt/dpt/getDeptManage.do'/>";
    document.listForm.submit();
}

function fncAddDeptManageInsert() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	}
    document.listForm.action = "<c:url value='/uss/umt/dpt/addViewDeptManage.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/umt/dpt/selectDeptManageList.do'/>";
    document.listForm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectDeptManageList('1');
    }
}
</script>

</head>

<body>

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="board">
	<h1>[>] 거래처 관리</h1>
</div>

	<!-- 검색영역 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li><!-- 조건 -->
                <select name="searchCondition" id="searchCondition" title="<spring:message code="comUssUmt.userManageSsearch.searchConditioTitle" />"><!--  -->
                    <option value="0" <c:if test="${mberVO.searchCondition == '0'}">selected="selected"</c:if> >회사명</option>
                    <option value="1" <c:if test="${empty mberVO.searchCondition || mberVO.searchCondition == '1'}">selected="selected"</c:if> >담당자명</option>
                </select>
			</li>
			<!-- 검색키워드 및 조회버튼 -->
			<li>
				<input class="s_input" name="searchKeyword" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${userSearchVO.searchKeyword}"/>'  maxlength="255" >				
				<input type="button" class="s_btn" onClick="fnSrcUser(); return false;"  value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
				<input type="button" class="s_btn" onClick="fnDeleteUser(); return false;" value="<spring:message code="title.delete" />" title="<spring:message code="title.delete" /> <spring:message code="input.button" />" />
				<input type="button" class="s_btn" onClick="fnAddUserView(); return false;" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />				
			</li>
		</ul>
	</div>

	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 5%;">
		<col style="width: 3%;">
		
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 15%;">
		<col style="width: 20%;">
		<col style="width: 13%;">
		<col style="width: 10%;">
		<col style="width: ;">
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 -->
		<th><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="<spring:message code="input.selectAll.title" />"></th><!-- 전체선택 -->
		
		<th>회사명</th>
		<th>담당자명</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>Fax</th>
		<th>사용여부</th>

	</tr>
	</thead>
	<tbody class="ov">
	</tbody>
	</table>
	
	


<form name="listForm" method="post">
<input name="pageIndex" type="hidden" value="<c:out value='${deptManageVO.pageIndex}'/>">
</form>

</body>
</html>
