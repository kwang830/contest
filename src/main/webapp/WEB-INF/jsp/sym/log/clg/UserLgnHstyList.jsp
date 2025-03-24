<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr" lang="en-US">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="<c:url value='/'/>css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/'/>css/style.css" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/'/>css/swiper.css" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/'/>css/dark.css" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/'/>css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/'/>css/animate.css" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/'/>css/magnific-popup.css" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/'/>css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
	<script src="<c:url value='/'/>js/jquery.js"></script>
	<script src="<c:url value='/'/>js/jqueryui.js"></script>
	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

	<!-- Document Title
	============================================= -->
	<title>IBK시스템, AI 아이디어 챌린지 - 로그인 이력 조회</title>

</head>
<script type="text/javascript">

/* ********************************************************
 * 달력
 ******************************************************** */
function fn_contest_init_date(){
	$("#searchBgnDe").datepicker(
		{dateFormat:'yy-mm-dd'
			, showOn: 'button'
			, buttonImage: '<c:url value='/images/ico_calendar.png'/>'
			, buttonImageOnly: true

			, showMonthAfterYear: true
			, showOtherMonths: true
			, selectOtherMonths: true
			, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

			, changeMonth: true // 월선택 select box 표시 (기본은 false)
			, changeYear: true  // 년선택 selectbox 표시 (기본은 false)
			, showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
		});

	$("#searchEndDe").datepicker(
		{dateFormat:'yy-mm-dd'
			, showOn: 'button'
			, buttonImage: '<c:url value='/images/ico_calendar.png'/>'
			, buttonImageOnly: true

			, showMonthAfterYear: true
			, showOtherMonths: true
			, selectOtherMonths: true
			, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

			, changeMonth: true // 월선택 select box 표시 (기본은 false)
			, changeYear: true  // 년선택 selectbox 표시 (기본은 false)
			, showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
		});

	$('#btn_reset').click(function(){
		let form = document.forms["LoginLogForm"];
		if(form){
			//form.reset();
			form.pageIndex.value = 1;
			form.searchBgnDe.value = '';
			form.searchEndDe.value = '';
			form.searchCnd.value = 0;
			form.searchWrd.value = '';
		} else {
			console.log("LoginLogForm을 찾을 수 없습니다.");
		}
	});

}



/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	let form = document.forms["LoginLogForm"];
	if(form){
		// console.log("LoginLogForm 존재함");
		form.pageIndex.value = pageNo;
		form.action = "<c:url value='/sym/log/clg/userLgnHsty.do'/>";
		form.submit();
	} else {
		console.log("LoginLogForm을 찾을 수 없습니다.");
	}
	//document.LoginLogForm.pageIndex.value = pageNo;
	//document.LoginLogForm.action = "<c:url value='/sym/log/clg/userLgnHsty.do'/>";
	//document.LoginLogForm.submit();
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
	vFrom.action = "<c:url value='/sym/log/clg/userLgnHsty.do'/>";
	vFrom.submit();
}
</script>

<body class="stretched" onload="fn_contest_init_date()">

<!-- Document Wrapper
============================================= -->
<div id="wrapper" class="clearfix">

	<!-- header start -->
	<c:import url="/sym/mms/ContHeader.do" />
	<!-- //header end -->

	<!-- Page Title
    ============================================= -->
	<section id="page-title">

		<div class="container clearfix">
			<h1>2025년 AI 아이디어 챌린지</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item" aria-current="page">Home</li>
				<li class="breadcrumb-item active" aria-current="page">로그인 이력 조회</li>
			</ol>
		</div>

	</section><!-- #page-title end -->

	<!-- Content
    ============================================= -->
	<section id="content">

		<div class="content-wrap">

			<div class="container clearfix">

				<h3>로그인 이력 목록</h3>
				<form name="LoginLogForm" action="<c:url value='/sym/log/clg/userLgnHsty.do'/>" method="post" onSubmit="fn_egov_search_loginLog(); return false;">
				<!-- 검색영역 -->
				<!-- 발생일자 선택 -->
				<div class="search_box" title="">
					<ul>
						<li>
							발생일자&nbsp;:&nbsp;<!-- 발생일자 -->
							<input type="text" name="searchBgnDe" id="searchBgnDe" size="15" maxlength="10" value="${searchVO.searchBgnDe}" title="검색시작일" > ~ <!-- 검색시작일  -->
							<input type="text" name="searchEndDe" id="searchEndDe" size="15" maxlength="10" value="${searchVO.searchEndDe}" title="검색종료일" >&nbsp;&nbsp;&nbsp;<!-- 검색종료일  -->
						</li>
						<!-- 검색키워드 및 조회버튼 -->
						<li>
							<select name="searchCnd" class="select" title="선택">
								<c:choose>
									<c:when test="${empty searchVO.searchCnd}">
										<option value="0" selected="selected">사용자ID</option>
										<option value="1">사용자</option>
										<option value="2">PC 정보</option>
										<option value="3">브라우저</option>
									</c:when>
									<c:otherwise>
										<option value="0" ${searchVO.searchCnd eq '0' ? 'selected="selected"' : ''}>사용자ID</option>
										<option value="1" ${searchVO.searchCnd eq '1' ? 'selected="selected"' : ''}>사용자</option>
										<option value="2" ${searchVO.searchCnd eq '2' ? 'selected="selected"' : ''}>PC 정보</option>
										<option value="3" ${searchVO.searchCnd eq '3' ? 'selected="selected"' : ''}>브라우저</option>
									</c:otherwise>
								</c:choose>
							</select>
							<input class="s_input" name="searchWrd" type="text"  size="15" title="검색키워드" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="15" >
						</li>
						<input type="hidden" name="pageIndex" id="pageIndex" class="" value="1"  />
						<input type="submit" class="s_btn" value="조회" title="조회버튼" />
						<input type="button" name="btn_reset" id="btn_reset" class="s_btn" value="초기화" title="초기화버튼" />
					</ul>
				</div>
				</form>
				<!--// 검색조건 -->

				<div class="row show-grid">
					<div class="col-lg-1">번호</div>
					<div class="col-lg-2">로그ID</div>
					<div class="col-lg-2">발생일자</div>
					<div class="col-lg-1">로그유형</div>
					<div class="col-lg-1">사용자</div>
					<div class="col-lg-1">사용자ID</div>
					<div class="col-lg-2">접속IP</div>
					<div class="col-lg-1">PC정보</div>
					<div class="col-lg-1">브라우저</div>
				</div>

				<c:if test="${fn:length(resultList) == 0}">
					<div class="row show-grid">
						<div class="col-lg-1"></div>
						<div class="col-lg-8">데이터가 존재하지 않습니다.</div>
						<div class="col-lg-3"></div>
					</div>
				</c:if>

				<c:forEach var="result" items="${resultList}" varStatus="status">
					<div class="row show-grid">
						<div class="col-lg-1"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" /></div>
						<div class="col-lg-2"><c:out value='${result.logId}'/></div>
						<div class="col-lg-2"><c:out value='${fn:substring(result.creatDt,0,10)}'/></div>
						<div class="col-lg-1"><c:out value='${result.loginMthd}'/></div>
						<div class="col-lg-1"><c:out value='${result.loginNm}'/></div>
						<div class="col-lg-1"><c:out value='${result.loginId}'/></div>
						<div class="col-lg-2"><c:out value='${result.loginIp}'/></div>
						<div class="col-lg-1"><c:out value='${result.pcInfo}'/></div>
						<div class="col-lg-1"><c:out value='${result.browserInfo}'/></div>
					</div>
				</c:forEach>

				<div class="board_list_bot">
					<div class="paging" id="paging_div">
						<ul>
							<ui:pagination paginationInfo="${paginationInfo}" type="renew" jsFunction="fn_egov_select_linkPage" />
						</ul>
					</div>
				</div>

			</div>

		</div>

	</section><!-- #content end -->


	<!-- footer 시작 -->
	<c:import url="/sym/mms/ContFooter.do" />
	<!-- //footer 끝 -->

</div><!-- #wrapper end -->

<!-- Go To Top
============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>

<!-- External JavaScripts
============================================= -->
<script src="<c:url value='/'/>js/jquery-3.3.1.js"></script>
<script src="<c:url value='/'/>js/plugins.js"></script>
<script src="<c:url value='/'/>js/jqueryui.js"></script>
<!-- Footer Scripts
============================================= -->
<script src="<c:url value='/'/>js/functions.js"></script>

</body>
</html>