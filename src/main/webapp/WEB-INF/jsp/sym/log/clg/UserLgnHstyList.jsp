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

	<!-- Document Title
	============================================= -->
	<title>IBK시스템, AI 아이디어 챌린지 - 로그인 이력 조회</title>

</head>

<body class="stretched">

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
							<input type="submit" class="s_btn" value="조회" title="조회버튼" />
						</li>
					</ul>
				</div>
				<!--// 검색조건 -->

				<div class="row show-grid">
					<div class="col-lg-1">번호</div>
					<div class="col-lg-2">로그ID</div>
					<div class="col-lg-2">발생일자</div>
					<div class="col-lg-1">로그유형</div>
					<div class="col-lg-1">사용자ID</div>
					<div class="col-lg-1">사용자</div>
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
							<ui:pagination paginationInfo="${paginationInfo}" type="renew" jsFunction="fn_egov_select_noticeList" />
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

<!-- Footer Scripts
============================================= -->
<script src="<c:url value='/'/>js/functions.js"></script>

</body>
</html>