<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>IBK시스템, AI 아이디어 챌린지 - 부서 통계 현황 조회</title>

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
				<h1>2025년 AI 아이디어 공모전</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item" aria-current="page">Home</li>
					<li class="breadcrumb-item active" aria-current="page">부서 통계 현황</li>
				</ol>
			</div>

		</section><!-- #page-title end -->

		<!-- Content
        ============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<h3>본부별 통계 현황</h3>

					<div class="row show-grid">
						<div class="col-lg-2">본부명</div>
						<div class="col-lg-2">전체인원</div>
						<div class="col-lg-2">접속인원</div>
						<div class="col-lg-1">접속률</div>
						<div class="col-lg-2">접속인원(3회이상)</div>
						<div class="col-lg-2">접속률(3회이상)</div>
						<div class="col-lg-1">접수건</div>
					</div>

					<c:set var="dept_sum" value="0"/>
					<c:set var="tot_sum" value="0"/>
					<c:set var="score_A" value="0"/>
					<c:set var="score_B" value="0"/>
					<c:set var="tot_sum_B" value="0"/>
					<c:forEach var="result" items="${bbsDeptLoginList}" varStatus="status">

						<div class="row show-grid">
						<c:if test="${result.scoreS == 'A' || result.scoreS == 'B' }" >
							<c:set var="dept_sum" value="${dept_sum+result.scoreA}"/>
							<c:set var="tot_sum" value="${tot_sum+result.scoreA}"/>
							<c:if test="${result.scoreS == 'B' }" >
								<c:set var="score_B" value="${result.scoreA }"/>
								<c:set var="tot_sum_B" value="${tot_sum_B+result.scoreA}"/>
							</c:if>
						</c:if>

						<c:if test="${result.deptNmS != '경영전략본부' }" >
							<c:set var="score_A" value="${result.scoreA }"/>
						</c:if>
						<c:if test="${result.deptNmS == '경영전략본부' || result.deptNmS == '전체' }" >
							<c:set var="score_A" value="${result.scoreA-18 }"/>
						</c:if>
						<c:if test="${result.scoreS == '소계' && result.deptNmS != '임원' }" >
							<div class="col-lg-2"><a href="#" title="${result.deptNmS}">${result.deptNmS}</a></div>
							<div class="col-lg-2">${score_A}</div>
							<div class="col-lg-2">
								<c:if test="${result.deptNmS != '전체' }" >${dept_sum}</c:if>
								<c:if test="${result.deptNmS == '전체' }" >${tot_sum}</c:if>
							</div>
							<div class="col-lg-1">
								<c:if test="${result.deptNmS != '전체' }" >${fn:substring(dept_sum/score_A*100,0,5)} %
									<c:set var="dept_sum" value="0"/>
								</c:if>
								<c:if test="${result.deptNmS == '전체' }" >${fn:substring(tot_sum/score_A*100,0,5)} %</c:if>
							</div>
							<div class="col-lg-2">
								<c:if test="${result.deptNmS != '전체' }" >${score_B}</c:if>
								<c:if test="${result.deptNmS == '전체' }" >${tot_sum_B}</c:if>
							</div>
							<div class="col-lg-2">
								<c:if test="${result.deptNmS != '전체' }" >${fn:substring(score_B/score_A*100,0,4)} %
									<c:set var="score_B" value="0"/>
								</c:if>
								<c:if test="${result.deptNmS == '전체' }" >${fn:substring(tot_sum_B/score_A*100,0,4)} %</c:if>
							</div>
							<div class="col-lg-1">
								<span class="dept_bbs_sum" title="${result.deptNmS}">0</span>
							</div>
						</c:if>
						</div>
					</c:forEach>
					<c:if test="${fn:length(bbsDeptLoginList) == 0}" >
						<div class="row show-grid">
							<div class="col-lg-1"></div>
							<div class="col-lg-8">데이터가 존재하지 않습니다.</div>
							<div class="col-lg-3"></div>
						</div>
					</c:if>

					<br>
					* 경영전략본부 - 휴직자(17명), 장기휴가자(1명) 제외 ('25.00.00 기준) - 수정필요
					<br>
					* 임원(4명) 미포함

					<div class="clear"></div><div class="line bottommargin-lg"></div>

					<h3>상세 현황</h3>

					<div class="row show-grid">
						<div class="col-lg-7">소속</div>
						<div class="col-lg-1">이름</div>
						<div class="col-lg-1">직급</div>
						<div class="col-lg-1">접속수</div>
						<div class="col-lg-2">최종접속일</div>
					</div>

					<c:set var="login_sum_tot" value="0"/>
					<c:set var="user_sum_tot" value="0"/>
					<c:forEach var="result" items="${bbsUserLoginList}" varStatus="status">
						<c:set var="user_sum_tot" value="${user_sum_tot+1}"/>
						<c:if test="${result.scoreS > 2}" >
							<c:set var="login_sum_tot" value="${login_sum_tot+1}"/>
						</c:if>

					<div class="row show-grid">
						<div class="col-lg-7">${result.deptNmF}</div>
						<div class="col-lg-1">${result.frstRegisterNm}</div>
						<div class="col-lg-1">${result.titleNm}</div>
						<div class="col-lg-1">${result.scoreS}</div>
						<div class="col-lg-2">${result.lastUpdusrPnttm}</div>
					</div>
					</c:forEach>
					<c:if test="${fn:length(bbsUserLoginList) == 0}" >
						<div class="row show-grid">
							<div class="col-lg-1"></div>
							<div class="col-lg-8">데이터가 존재하지 않습니다.</div>
							<div class="col-lg-3"></div>
						</div>
					</c:if>
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