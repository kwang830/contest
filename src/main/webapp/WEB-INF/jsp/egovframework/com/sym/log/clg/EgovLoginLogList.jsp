<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comSymLogClg.loginLog.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<script type="text/javascript">
$(function() {	
	fn_egov_init();
	fn_egov_init_date(); 
});

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	// 첫 입력란에 포커스..
	document.LoginLogForm.searchWrd.focus();
	
	var searchCnd = $("#searchCnd").val();
	if(searchCnd){
		$("#deptNmF").val(searchCnd);
	}
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
	//document.LoginLogForm.pageIndex.value = pageNo;
	//document.LoginLogForm.action = "<c:url value='/sym/log/clg/SelectLoginLogList.do'/>";
   	//document.LoginLogForm.submit();
   	
	$("input[name='pageIndex']").val(pageNo);
	
	var form = $('#LoginLogForm');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/sym/log/clg/SelectLoginLogList.do",
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
function fn_egov_search_loginLog(){

	var vFrom = document.LoginLogForm;

	 if(vFrom.searchEndDe.value != ""){
	     if(vFrom.searchBgnDe.value > vFrom.searchEndDe.value){
	         alert("<spring:message code="comSymLogClg.validate.dateCheck" />"); //검색조건의 시작일자가 종료일자보다  늦습니다. 검색조건 날짜를 확인하세요!
	         return;
		  }
	 }else{
		 vFrom.searchEndDe.value = "";
	 }
	 
	 var tTest = $("#deptNmF").val();
	 $("#searchCnd").val(tTest);	 

	//vFrom.pageIndex.value = "1";
	//vFrom.action = "<c:url value='/sym/log/clg/SelectLoginLogList.do'/>";
	//vFrom.submit();
	
	$("input[name=pageIndex]").val(1);
	
	var form = $('#LoginLogForm');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/sym/log/clg/SelectLoginLogList.do",
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

<body>

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<form name="LoginLogForm" id="LoginLogForm" action="<c:url value='/sym/log/clg/SelectLoginLogList.do'/>" method="post" onSubmit="fn_egov_search_loginLog(); return false;"> 
<div class="board">
	<h1><img src="/images/bl/bl_circle.gif" class="img_margin1"> ${pageTitle} <spring:message code="title.list" /></h1>
	
	<!-- 검색영역 -->
	<!-- 발생일자 선택 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li>
				발생일자&nbsp;:&nbsp;
				<input type="text" name="searchBgnDe" id="searchBgnDe" size="15" maxlength="10" value="${searchVO.searchBgnDe}" title="검색시작일" > ~ 
				<input type="text" name="searchEndDe" id="searchEndDe" size="15" maxlength="10" value="${searchVO.searchEndDe}" title="검색종료일" >&nbsp;&nbsp;&nbsp;				
			</li>
			<li><div style="line-height:6px;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div style="line-height:6px;margin-top: -5px;">
				<label for="deptNmF">본부 :</label>
				<form:select path="deptNmF" id="deptNmF" title="${title} ${inputSelect}">
					<form:option value="" label="- 전체 -"/>
					<form:options items="${deptNmF}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
				<div><form:errors path="deptNmF" cssClass="error"/></div>
				</div>
			</li>
			<li><div style="line-height:6px;">&nbsp;&nbsp;&nbsp;&nbsp;</div><div>사용자명 :  </div></li>
			<li>
				<input class="s_input" name="searchWrd" type="text"  size="15" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="15" >
				<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
			</li>
		</ul>
	</div>
	
	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle}<spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 5%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 8%;">
		<col style="width: 7%;">
		<col style="width: 30%;">
	</colgroup>
	<thead>
	<tr>
		<th>번호</th>
		<th>발생일시</th>
		<th>접속방식</th>
		<th>접속IP</th>
		<th>사용자구분</th>
		<th>사용자ID</th>
		<th>사용자명</th>
		<th>소속</th>
		<th>직급</th>
	</tr>
	</thead>
	<tbody class="ov">
	<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td colspan="9"><spring:message code="common.nodata.msg" /></td>
	</tr>
	</c:if>
	<c:forEach items="${resultList}" var="result" varStatus="status">
	<tr>
		<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		<td><c:out value='${fn:substring(result.creatDt,0,19)}'/></td>
		<td><c:out value='${result.chkMobile}'/></td>
		<td><c:out value='${result.loginIp}'/></td>
		<td>
		<c:choose>
			<c:when test="${result.userSe =='USR'}">
				심사위원
			</c:when>
			<c:otherwise>
				일반참가자
			</c:otherwise>
		</c:choose>	
		</td>
		<td><c:out value='${result.loginId}'/></td>
		<td><c:out value='${result.loginNm}'/></td>
		<td><c:out value='${result.titleNm}'/></td>		
		<td><c:out value='${result.deptNmF}'/></td>
<!-- 
		<td>
			<img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>"  class="cursor" onclick="fn_egov_detail_loginLog('<c:out value="${result.logId}"/>'); return false;" alt="<spring:message code="title.detail" />"  title="<spring:message code="title.detail" />">
		</td>
 -->		
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

<input name="searchCnd" id="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

</body>
</html>