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
<title>${pageTitle} - 거래처별 조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">

<script type="text/javaScript" language="javascript" defer="defer">
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
	<h1>년도별 조회</h1>
</div>

<div class="search_box">
	<ul>
		<li style="border: 0px solid rgb(210, 210, 210); border-image: none;">
			<input title="조회 버튼" class="s_btn" type="submit" value="조회">
			<input title="조회(팝업) 버튼" class="s_btn" type="submit" value="조회팝업">
		</li>
	</ul>
</div>	
	<table class="board_list" summary="">
	<caption>품목 조회</caption>
	<colgroup>
		<col style="width: 12%;">
		<col style="width: 12%;">
		<col style="width: 12%;">
		<col style="width: 12%;">
		<col style="width: 12%;">
		<col style="width: 12%;">
		<col style="width: 12%;">
		<col style="width: 12%;">
	</colgroup>
	<thead>
	<tr>
		<th>거래처명</th> 
		<th>
			<input class="s_input" name="searchKeyword" type="text"  size="25" title="" value=''  maxlength="20" >&nbsp;
		</th>
		<th>거래처담당자</th>
		<th>
			<input class="s_input" name="searchKeyword" type="text"  size="25" title="" value=''  maxlength="20" >&nbsp;
		</th>
		<th>관리번호</th>
		<th>
			<input class="s_input" name="searchKeyword" type="text"  size="25" title="" value=''  maxlength="20" >&nbsp;
		</th>
		<th>담당자</th>
		<th>
			<input class="s_input" name="searchKeyword" type="text"  size="25" title="" value=''  maxlength="20" >&nbsp;
		</th>
	</tr>
	<tr>
		<th>계약년도</th>
		<th>
			<select><option>2015년</option><option>2016년</option><option>2017년</option></select>
		</th>	
		<th>국가</th> 
		<th>
			<input class="s_input" name="searchKeyword" type="text"  size="25" title="" value=''  maxlength="20" >&nbsp;
		</th>
		<th>진행상태</th>
		<th>
			<input class="s_input" name="searchKeyword" type="text"  size="25" title="" value=''  maxlength="20" >&nbsp;
		</th>
		<th></th>
		<th></th>		
	</tr>
	</thead>
	<tbody class="ov">

	</tbody>
	</table>

<div class="board" style="padding-top:20px;">
	<h1>견적 리스트</h1>
</div>	

	<table class="board_list" summary="">
	<caption>견적 리스트</caption>
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">		
	</colgroup>
	<thead>
	<tr>
		<th>순번</th>
		<th>거래처명</th>
		<th>거래처담당자</th>
		<th>국가</th>
		<th>관리번호</th>
		<th>담당자</th>
		<th>등록일자</th>
		<th>계약일자</th>
		<th>견적금액</th>
		<th>진행상태</th>
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
