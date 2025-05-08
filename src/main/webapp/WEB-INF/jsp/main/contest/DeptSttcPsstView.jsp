<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link rel="stylesheet" href="<c:url value='/'/>css/sub-ios.css" type="text/css" media="all" />
	<link rel="preload" href="<c:url value='/'/>css/board.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css" type="text/css">

	<!-- Document Title
	============================================= -->
	<title>IBK시스템 AI 아이디어 챌린지</title>

	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

	<style>
		#searchInput{
			margin-bottom: 20px;
		}
	</style>

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
						<!-- Left menu -->
						<c:import url="/sym/mms/ContMenuLeft.do" />
						<!--// Left menu -->
					</div>
				</nav>
			</div>
			<div class="content-wrap">
				<div class="container clearfix">

					<h3>본부별 통계 현황</h3>
					<div class="receipt-chart-wrap">
						<div class="receipt-chart-con" id="receiptChartCon">
							<canvas id="receiptChart" height="370"></canvas>
							<div class="receipt-chart-title" style="left: 0;">접속률</div>
						</div>
						<div class="receipt-chart-con">
							<canvas id="receiptPieChart" height="370"></canvas>
							<div class="receipt-chart-title" style="right: 0;">접수건</div>
						</div>
					</div>
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

							<c:set var="loginCntITO" value="0"/>
							<c:set var="loginCntITI" value="0"/>
							<c:set var="loginCntSID" value="0"/>
							<c:set var="loginCntSIO" value="0"/>
							<c:set var="loginCntAUD" value="0"/>
							<c:set var="loginCntSTR" value="0"/>
							<c:set var="loginCntPUR" value="0"/>
							<c:set var="loginCntUNI" value="0"/>
							<c:set var="loginCntBZ1" value="0"/>
							<c:set var="loginCntBZ2" value="0"/>
							<c:set var="loginCntDBZ" value="0"/>
							<c:set var="loginCntINF" value="0"/>

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
									<c:set var="score_A" value="${result.scoreA-13 }"/>
								</c:if>
								<c:if test="${result.scoreS == '소계' && result.deptNmS != '임원' }" >
								<tr>
									<td class="al"><a href="#" title="${result.deptNmS}" onclick="javascript:setSearchByTitle(this); return false;">${result.deptNmS}</a></td>
									<td>${score_A}</td>
									<td>
										<c:if test="${result.deptNmS != '전체' }" >${dept_sum}</c:if>
										<c:if test="${result.deptNmS == '전체' }" >${tot_sum}</c:if>
									</td>
									<td>
										<c:if test="${result.deptNmS != '전체' }" >${fn:substring(dept_sum/score_A*100,0,5)} %
											<c:if test="${result.deptNmS=='ITO사업본부'}"><c:set var="loginCntITO" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='IT혁신사업본부'}"><c:set var="loginCntITI" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='SI개발본부'}"><c:set var="loginCntSID" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='SI영업본부'}"><c:set var="loginCntSIO" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='감사실'}"><c:set var="loginCntAUD" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='경영전략본부'}"><c:set var="loginCntSTR" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='구매지원본부'}"><c:set var="loginCntPUR" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='노동조합'}"><c:set var="loginCntUNI" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='은행사업1본부'}"><c:set var="loginCntBZ1" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='은행사업2본부'}"><c:set var="loginCntBZ2" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='은행사업디지털본부'}"><c:set var="loginCntDBZ" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>
											<c:if test="${result.deptNmS=='인프라사업본부'}"><c:set var="loginCntINF" value="${fn:substring(dept_sum/score_A*100,0,5)}"/></c:if>

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
					* 경영전략본부 - 휴직자(13명) 제외 ('25.04.08 기준)
					<br>
					* 임원(4명) 미포함

					<div class="clear"></div><div class="line bottommargin-lg"></div>

					<h3>상세 현황</h3>
					<input type="text" id="searchInput" placeholder="검색어를 입력하세요" onkeyup="filterTable()">

					<div class="board_list">
						<table id="detailTable">
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

	<c:set var="bbsCntITO" value="0"/>
	<c:set var="bbsCntITI" value="0"/>
	<c:set var="bbsCntSID" value="0"/>
	<c:set var="bbsCntSIO" value="0"/>
	<c:set var="bbsCntAUD" value="0"/>
	<c:set var="bbsCntSTR" value="0"/>
	<c:set var="bbsCntPUR" value="0"/>
	<c:set var="bbsCntUNI" value="0"/>
	<c:set var="bbsCntBZ1" value="0"/>
	<c:set var="bbsCntBZ2" value="0"/>
	<c:set var="bbsCntDBZ" value="0"/>
	<c:set var="bbsCntINF" value="0"/>

	<c:set var="bbs_sum_tot" value="0"/>
	<c:forEach var="result" items="${bbsDeptBbsList}" varStatus="status">

		<c:if test="${result.deptNmS=='ITO사업본부'}"><c:set var="bbsCntITO" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='IT혁신사업본부'}"><c:set var="bbsCntITI" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='SI개발본부'}"><c:set var="bbsCntSID" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='SI영업본부'}"><c:set var="bbsCntSIO" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='감사실'}"><c:set var="bbsCntAUD" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='경영전략본부'}"><c:set var="bbsCntSTR" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='구매지원본부'}"><c:set var="bbsCntPUR" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='노동조합'}"><c:set var="bbsCntUNI" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='은행사업1본부'}"><c:set var="bbsCntBZ1" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='은행사업2본부'}"><c:set var="bbsCntBZ2" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='은행사업디지털본부'}"><c:set var="bbsCntDBZ" value="${result.scoreA}"/></c:if>
		<c:if test="${result.deptNmS=='인프라사업본부'}"><c:set var="bbsCntINF" value="${result.scoreA}"/></c:if>

		<c:set var="bbs_sum_tot" value="${bbs_sum_tot+result.scoreA}"/>
		<script>$(function(){
			var dept = "${result.deptNmS}";
			var cnt = "${result.scoreA}";
			var tot = "${bbs_sum_tot}";
			$(".dept_bbs_sum").each(function(){
				//console.log($(this).attr("title")+','+dept);
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

	<script>
		function filterTable() {
			const input = document.getElementById("searchInput");
			const filter = input.value.toLowerCase();
			const table = document.getElementById("detailTable");
			const trs = table.getElementsByTagName("tr");

			for (let i = 1; i < trs.length; i++) { // 첫 행은 헤더니까 제외
				const tds = trs[i].getElementsByTagName("td");
				let match = false;

				for (let j = 0; j < tds.length; j++) {
					const text = tds[j].textContent || tds[j].innerText;
					if (text.toLowerCase().includes(filter)) {
						match = true;
						break;
					}
				}

				trs[i].style.display = match ? "" : "none";
			}
		}
		function setSearchByTitle(button) {
			let titleValue = button.title;

			if(titleValue=='전체'){
				titleValue = '';
			}
			document.getElementById("searchInput").value = titleValue;
			filterTable(); // 자동으로 필터링도 실행
		}
	</script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script>

		const ctx = document.getElementById('receiptChart');

		let receiptLabels = ['ITO사업본부', 'IT혁신사업본부', 'SI개발본부', 'SI영업본부', '감사실', '경영전략본부', '구매지원본부', '노동조합', '은행사업1본부', '은행사업2본부', '은행사업디지털본부', '인프라사업본부'];
		let receiptData = [${bbsCntITO}, ${bbsCntITI}, ${bbsCntSID}, ${bbsCntSIO}, ${bbsCntAUD}, ${bbsCntSTR}, ${bbsCntPUR}, ${bbsCntUNI}, ${bbsCntBZ1}, ${bbsCntBZ2}, ${bbsCntDBZ}, ${bbsCntINF}];
		let loginData = [${loginCntITO}, ${loginCntITI}, ${loginCntSID}, ${loginCntSIO}, ${loginCntAUD}, ${loginCntSTR}, ${loginCntPUR}, ${loginCntUNI}, ${loginCntBZ1}, ${loginCntBZ2}, ${loginCntDBZ}, ${loginCntINF}];
		let receiptColor = [ '#66aa00', '#dd4477', '#990099', '#0099c6', '#994499', '#316395', '#b82e2e', '#22aa99', '#3366cc', '#dc3912', '#ff9900', '#109618'];

		new Chart(ctx, {
			type: 'bar',
			data: {
				labels: receiptLabels,
				datasets: [{
					label: '접속률',
					data: loginData,
					borderWidth: 1,
					backgroundColor: '#4881DE',
					order: 1,
				}]
			},
			options: {
				responsive: false,
				indexAxis: 'y',
				scales: {
					x: {
						beginAtZero: true,
						ticks: {
							stepSize: 10,
							font: {
								size: 10
							},
						},
						max: 100,
					},
					y: {
						ticks: {
							color: '#000'
						}
					}
				},
				plugins: {
					legend: {
						display: false,
					}
				}
			}
		});

		const ctx2 = document.getElementById('receiptPieChart');
		new Chart(ctx2, {
			type: 'doughnut',
			data: {
				labels: receiptLabels,
				datasets: [{
					label: '접수건',
					data: receiptData,
					backgroundColor: receiptColor,
				}],
			},
			options: {
				responsive: true,
				plugins: {
					legend: {
						position: 'right',
						labels: {
							padding: 10,
							color: '#000'
						}
					}
				}
			},
		});

	</script>
</body>
</html>