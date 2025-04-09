<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

	<!-- preload -->
	<link rel="preload" href="<c:url value='/'/>css/reset.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/responsive.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/font-icons.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/sub.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/board.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css" type="text/css">

	<!-- Document Title
	============================================= -->
	<title>IBK시스템 AI 아이디어 챌린지</title>

	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

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

}

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_select_reset(){
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

	<!-- Content
    ============================================= -->
	<section id="content">
		<div class="sub-layout">
			<div class="sub-banner">
				<div class="container">
					<div class="sub-banner-title">
						로그인 이력 목록
					</div>
				</div>
			</div>
			<nav class="nav-menu">
				<div class="container">
					<!-- 홈 아이콘 -->
					<div class="nav-item home">
						<a href="/"><img src="/images/icon-home.png" alt="홈"/></a>
					</div>

					<!-- 1depth 메뉴 항목 -->
					<div class="nav-item has-dropdown">
						<button class="nav-button">시스템관리 <span class="nav-toggle"></span></button>
					</div>
					<div class="nav-item has-dropdown">
						<button class="nav-button">로그인 이력 <span class="nav-toggle"><img
								src="/images/icon-nav-arrow.png" alt=""></span></button>
						<ul class="dropdown-menu">
							<li class="active"><a href="#">로그인 이력</a></li>
							<li><a href="#">부서 통계 현황</a></li>
							<li><a href="#">사용자 정보 관리</a></li>
							<li><a href="#">사용자 권한 관리</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="content-wrap">
			<div class="container clearfix">
				<!-- 검색조건 -->
				<div class="condition">
					<form name="LoginLogForm" action="<c:url value='/sym/log/clg/userLgnHsty.do'/>" method="post" >

						<input type="hidden" name="pageIndex" id="pageIndex" class="" value="1"  />

						<div class="condition_inner">
							<span class="item condition_title">검색기간</span>
							<span class="item f_search_date">
                                    <input class="f_input" name="searchBgnDe" type="date" value="" maxlength="35" title="검색시작일">
                                </span>
							<span class="item condition_title">-</span>
							<span class="item f_search_date">
                                    <input class="f_input" name="searchEndDe" type="date" value="" maxlength="35" title="검색종료일">
                                </span>
						</div>
						<div class="condition_inner">
							<label class="item f_select" for="searchCnd">
								<select name="searchCnd" id="searchCnd" title="검색조건 선택">
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
							</label>
							<span class="item f_search">
								<input class="f_input" name="searchWrd" type="text" value="<c:out value="${searchVO.searchWrd}"/>" maxlength="35" title="검색어 입력" style="max-width: 285px;">
								<button class="btn" type="submit" onclick="fn_egov_search_loginLog(); return false;">조회</button>
							</span>

							<a href="#" class="item btn btn_black_46 w_100" onclick="javascript:fn_select_reset(); return false;">초기화</a>
						</div>

					</form>

				</div>
				<!--// 검색조건 -->

				<!-- 게시판 -->
				<div class="board_list">
					<table>
						<caption>목록</caption>
						<colgroup>
							<col style="width: 80px;">
							<col style="width: auto; min-width: 120px;">
							<col style="width: 120px;">
							<col style="width: 120px;">
							<col style="width: 120px;">
							<col style="width: 120px;">
							<col style="width: 150px;">
							<col style="width: 120px;">
							<col style="width: 120px;">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">순번</th>
							<th scope="col">로그ID</th>
							<th scope="col">발생일자</th>
							<th scope="col">로그유형</th>
							<th scope="col">사용자</th>
							<th scope="col">사용자ID</th>
							<th scope="col">접속IP</th>
							<th scope="col">PC정보</th>
							<th scope="col">브라우저</th>
						</tr>
						</thead>
						<tbody>

						<c:if test="${fn:length(resultList) == 0}">
							<tr>
								<td class="al" colspan="9">
									등록된 글이 존재하지 않습니다.
								</td>
							</tr>
						</c:if>

						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" /></td>
								<td class="al"><c:out value='${result.logId}'/></td>
								<td><c:out value='${fn:substring(result.creatDt,0,10)}'/></td>
								<td><c:out value='${result.loginMthd}'/></td>
								<td><c:out value='${result.loginNm}'/></td>
								<td><c:out value='${result.loginId}'/></td>
								<td><c:out value='${result.loginIp}'/></td>
								<td><c:out value='${result.pcInfo}'/></td>
								<td><c:out value='${result.browserInfo}'/></td>
							</tr>
						</c:forEach>

						</tbody>
					</table>
				</div>

				<!-- 페이징 -->
				<div class="board_list_bot">
					<div class="paging" id="paging_div">
						<ul>
							<ui:pagination paginationInfo="${paginationInfo}" type="renew" jsFunction="fn_egov_select_linkPage" />
						</ul>
					</div>
				</div>
				<!-- // 페이징 끝 -->

				<!--// 게시판 -->
			</div>
		</div>
	</section>


	<!-- footer 시작 -->
	<c:import url="/sym/mms/ContFooter.do" />
	<!-- //footer 끝 -->

</div><!-- #wrapper end -->

<!-- Go To Top
============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>

<!-- External JavaScripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/plugins.js"></script>

<script type="text/javascript" src="<c:url value='/'/>js/common.js"></script>

<script type="text/javascript" src="<c:url value='/'/>js/jqueryui.js"></script>
<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

</body>
</html>