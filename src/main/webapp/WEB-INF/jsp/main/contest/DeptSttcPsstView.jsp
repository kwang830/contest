<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<body class="stretched">

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
							부서 통계 현황
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
							<button class="nav-button">부서 통계 현황 <span class="nav-toggle"><img
									src="/images/icon-nav-arrow.png" alt=""></span></button>
							<ul class="dropdown-menu">
								<li><a href="#">접수게시판</a></li>
								<li><a href="#">로그인 이력</a></li>
								<li class="active"><a href="#">부서 통계 현황</a></li>
								<li><a href="#">사용자 정보 관리</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			<div class="content-wrap">
				<div class="container clearfix">
					<!-- 검색조건 -->
<%--					<div class="condition">--%>
<%--					</div>--%>
					<!--// 검색조건 -->

					<!-- 게시판 -->
					<h3>본부별 통계 현황</h3>

					<div class="board_list">
						<table>
							<caption>목록</caption>
							<colgroup>
								<col style="width: auto; min-width: 200px;">
								<col style="width: 170px;">
								<col style="width: 170px;">
								<col style="width: 170px;">
								<col style="width: 170px;">
								<col style="width: 170px;">
								<col style="width: 170px;">
							</colgroup>
							<thead>
							<tr>
								<th scope="col">본부명</th>
								<th scope="col">전체인원</th>
								<th scope="col">접속인원</th>
								<th scope="col">접속률</th>
								<th scope="col">접속인원(3회이상)</th>
								<th scope="col">접속률(3회이상)</th>
								<th scope="col">접수건</th>
							</tr>
							</thead>
							<tbody>

							<c:if test="${fn:length(bbsDeptLoginList) == 0}" >
								<tr>
									<td class="al">
										등록된 글이 존재하지 않습니다.
									</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
								</tr>
							</c:if>

							<c:set var="dept_sum" value="0"/>
							<c:set var="tot_sum" value="0"/>
							<c:set var="score_A" value="0"/>
							<c:set var="score_B" value="0"/>
							<c:set var="tot_sum_B" value="0"/>
							<c:forEach var="result" items="${bbsDeptLoginList}" varStatus="status">
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
								<tr>
									<td class="al"><a href="#" title="${result.deptNmS}">${result.deptNmS}</a></td>
									<td>${score_A}</td>
									<td>
										<c:if test="${result.deptNmS != '전체' }" >${dept_sum}</c:if>
										<c:if test="${result.deptNmS == '전체' }" >${tot_sum}</c:if>
									</td>
									<td>
										<c:if test="${result.deptNmS != '전체' }" >${fn:substring(dept_sum/score_A*100,0,5)} %
											<c:set var="dept_sum" value="0"/>
										</c:if>
										<c:if test="${result.deptNmS == '전체' }" >${fn:substring(tot_sum/score_A*100,0,5)} %</c:if>
									</td>
									<td>
										<c:if test="${result.deptNmS != '전체' }" >${score_B}</c:if>
										<c:if test="${result.deptNmS == '전체' }" >${tot_sum_B}</c:if>
									</td>
									<td>
										<c:if test="${result.deptNmS != '전체' }" >${fn:substring(score_B/score_A*100,0,4)} %
											<c:set var="score_B" value="0"/>
										</c:if>
										<c:if test="${result.deptNmS == '전체' }" >${fn:substring(tot_sum_B/score_A*100,0,4)} %</c:if>
									</td>
									<td><span class="dept_bbs_sum" title="${result.deptNmS}">0</span></td>
								</tr>
								</c:if>
							</c:forEach>

							</tbody>
						</table>
					</div>

					<br>
					* 경영전략본부 - 휴직자(17명), 장기휴가자(1명) 제외 ('25.00.00 기준) - 수정필요
					<br>
					* 임원(4명) 미포함

					<div class="clear"></div><div class="line bottommargin-lg"></div>

					<h3>상세 현황</h3>

					<div class="board_list">
						<table>
							<caption>목록</caption>
							<colgroup>
								<col style="width: auto; min-width: 200px;">
								<col style="width: 200px;">
								<col style="width: 200px;">
								<col style="width: 200px;">
								<col style="width: 200px;">
							</colgroup>
							<thead>
							<tr>
								<th scope="col">소속</th>
								<th scope="col">이름</th>
								<th scope="col">직급</th>
								<th scope="col">접속수</th>
								<th scope="col">최종접속일</th>
							</tr>
							</thead>
							<tbody>

							<c:if test="${fn:length(bbsUserLoginList) == 0}" >
								<tr>
									<td class="al">
										등록된 글이 존재하지 않습니다.
									</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
								</tr>
							</c:if>

							<c:set var="login_sum_tot" value="0"/>
							<c:set var="user_sum_tot" value="0"/>
							<c:forEach var="result" items="${bbsUserLoginList}" varStatus="status">
								<c:set var="user_sum_tot" value="${user_sum_tot+1}"/>
								<c:if test="${result.scoreS > 2}" >
									<c:set var="login_sum_tot" value="${login_sum_tot+1}"/>
								</c:if>
								<tr>
									<td class="al">${result.deptNmF}</td>
									<td>${result.frstRegisterNm}</td>
									<td>${result.titleNm}</td>
									<td>${result.scoreS}</td>
									<td>${result.lastUpdusrPnttm}</td>
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

	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

	<c:set var="bbs_sum_tot" value="0"/>
	<c:forEach var="result" items="${bbsDeptBbsList}" varStatus="status">
		<c:set var="bbs_sum_tot" value="${bbs_sum_tot+result.scoreA}"/>
		<script>$(function(){
			var dept = "${result.deptNmS}";
			var cnt = "${result.scoreA}";
			var tot = "${bbs_sum_tot}";
			$(".dept_bbs_sum").each(function(){
				console.log($(this).attr("title")+','+dept);
				if( $(this).attr("title")== dept ){
					$(this).text(cnt);
				}
			});
		});</script>
	</c:forEach>
	<script>$(function(){
		var tot = "${bbs_sum_tot}";
		$(".dept_bbs_sum").each(function(){
			if( $(this).attr("title")== "전체" ){
				$(this).text(tot);
			}
		});
	});</script>

</body>
</html>