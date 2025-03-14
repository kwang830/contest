<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle">접속로그</c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} 리스트</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
<script type="text/javascript">
/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	// 첫 입력란에 포커스..
	document.LoginLogForm.searchWrd.focus();
}
/* ********************************************************
 * 달력
 ******************************************************** */
function fn_egov_init_date(){

	$("#searchBgnDe").datepicker(
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


	$("#searchEndDe").datepicker(
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
}
/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	document.LoginLogForm.pageIndex.value = pageNo;
	document.LoginLogForm.action = "<c:url value='/sym/log/clg/SelectLoginLogList.do'/>";
   	document.LoginLogForm.submit();
}
/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_loginLog(){
	var vFrom = document.LoginLogForm;

	 if(vFrom.searchEndDe.value != ""){
	     if(vFrom.searchBgnDe.value > vFrom.searchEndDe.value){
	         alert("검색조건의 시작일자가 종료일자보다  늦습니다. 검색조건 날짜를 확인하세요!"); //검색조건의 시작일자가 종료일자보다  늦습니다. 검색조건 날짜를 확인하세요!
	         return;
		  }
	 }else{
		 vFrom.searchEndDe.value = "";
	 }

	vFrom.pageIndex.value = "1";
	vFrom.action = "<c:url value='/sym/log/clg/SelectLoginLogList.do'/>";
	vFrom.submit();
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_loginLog(logId) {
  	var width = 850;
  	var height = 330;
  	var top = 0;
  	var left = 0;
  	var url = "<c:url value='/sym/log/clg/SelectLoginLogDetail.do' />?logId="+logId;
  	var name = "LoginLogDetailPopup"
  	var openWindows = window.open(url,name, "width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");
}
</script>
<style>
.board_list tbody td img{align: middle;}
</style>
</head>

<body onload="fn_egov_init(); fn_egov_init_date();" >

<!-- javascript warning tag  -->
<noscript class="noScriptTitle">javascript warning</noscript>

<form name="LoginLogForm" action="<c:url value='/sym/log/clg/SelectLoginLogList.do'/>" method="post" onSubmit="fn_egov_search_loginLog(); return false;">
<div class="board">
	<h1>${pageTitle} 리스트</h1>
	<!-- 검색영역 -->
	<!-- 발생일자 선택 -->
	<div class="search_box" title="">
		<ul>
			<li>
				발생일자&nbsp;:&nbsp;<!-- 발생일자 -->
				<input type="text" name="searchBgnDe" id="searchBgnDe" size="15" maxlength="10" value="${searchVO.searchBgnDe}" title="검색시작일" > ~ <!-- 검색시작일  -->
				<input type="text" name="searchEndDe" id="searchEndDe" size="15" maxlength="10" value="${searchVO.searchEndDe}" title="검색종료일" >&nbsp;&nbsp;&nbsp;<!-- 검색종료일  -->
			</li>
			<li><div style="line-height:6px;">&nbsp;&nbsp;&nbsp;&nbsp;</div><div>로그유형 :  </div></li><!-- 로그유형-->
			<!-- 검색키워드 및 조회버튼 -->
			<li>
				<input class="s_input" name="searchWrd" type="text"  size="15" title="검색키워드" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="15" >
				<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="조회버튼" />
			</li>
		</ul>
	</div>

	<!-- 목록영역 -->
	<table class="board_list" >
	<caption>${pageTitle} 리스트</caption>
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
	</colgroup>
	<thead>
	<tr>
		<th>번호</th><!-- 번호 -->
		<th>로그ID</th><!-- 로그ID -->
		<th>발생일자</th><!-- 발생일자 -->
		<th>로그유형</th><!-- 로그유형 -->
		<th>사용자</th><!-- 사용자 -->
		<th>접속IP</th><!-- 접속IP -->
		<th>상세보기</th><!-- 상세보기 -->
	</tr>
	</thead>
	<tbody class="ov">
	<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td colspan="7"><spring:message code="common.nodata.msg" /></td>
	</tr>
	</c:if>
	<c:forEach items="${resultList}" var="result" varStatus="status">
	<tr>
		<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		<td><c:out value='${result.logId}'/></td>
		<td><c:out value='${fn:substring(result.creatDt,0,10)}'/></td>
		<td><c:out value='${result.loginMthd}'/></td>
		<td><c:out value='${result.loginNm}'/></td>
		<td><c:out value='${result.loginIp}'/></td>
		<td>
		<img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>"  class="cursor" onclick="fn_egov_detail_loginLog('<c:out value="${result.logId}"/>'); return false;" alt="<spring:message code="title.detail" />"  title="<spring:message code="title.detail" />">
		</td>
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

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

</body>
</html>