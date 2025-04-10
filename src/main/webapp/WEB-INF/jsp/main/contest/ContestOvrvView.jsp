<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

	<style>
		#primary-menu{display: flex !important; margin-right: 0 !important;}
		#primary-menu > ul{display: block !important; padding-right: 0 !important; margin-right: 0 !important;}
		#primary-menu > ul > li {display: none; border: none !important;}
		#primary-menu > ul > li:first-child {display: block !important;}
		#primary-menu > ul > li > a{font-size: 20px; padding-left: 0 !important; padding-right: 0 !important;}
		#primary-menu-trigger{display: none !important}

		/*#header .login-menu{display: none !important;}*/

		@media all and (min-width: 992px){
			#primary-menu > ul > li > a{font-size: 24px;}
		}
	</style>

	<!-- Document Title
	============================================= -->
	<title>IBK시스템 AI 아이디어 챌린지</title>

	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

	<script type="text/javascript">
		<!--
		function fn_egov_downFile(atchFileId, fileSn) {
			window.open("/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"&authPass=yes");
		}

		function fn_contest_attach_file_down() {
			// 공모전 참가 신청서
			fn_egov_downFile('EcqfhYxRcnWG52hkOGYp/F3suq/5SFOvAnxJUaQhI01X9dgmJjJ+3mWoSYu1PsdTs4dfuDM2VdFX2fN3C0X4iQ==','0');
		}
		//-->
	</script>

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
						공모개요
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
						<button class="nav-button">공모개요</button>
					</div>
				</div>
			</nav>
		</div>
		<div class="content-wrap" style="padding-top: 25px;">
			<div class="container clearfix">
				<img src="/images/overview-img.png" alt="">
			</div>
			<div class="sub-container">
				<div class="intro-con type2">
					<div class="intro-title">공모분야</div>
					<div class="intro-desc">AI를 활용한 새롭고 편리한 혁신적인 디지털 서비스 발굴</div>
				</div>
				<div class="intro-con type2">
					<div class="intro-title">참가대상</div>
					<div class="intro-desc">
						IBK시스템 모든 임직원 누구나 참여가능 (개인 또는 팀 참가)<br/>
						<span class="intro-small-desc">※ 개인 多건 참여, 팀당(2인~5인 이하) 한 개의 아이디어만 제출 가능</span>
					</div>
				</div>
				<div class="intro-con type2">
					<div class="intro-title">공모방법</div>
					<div class="intro-desc">
						아이디어 기획서 양식을 작성 후 공모전 홈페이지에서 접수 기간에 제출<br/>
						<span class="intro-link">※ <a href="#" onClick="fn_contest_attach_file_down(); return false;">기획서양식 다운로드 바로가기 ></a></span>
					</div>
				</div>
				<div class="intro-con">
					<div class="intro-title">주요일정</div>
					<table class="intro-table" id="scheduleTable">
						<colgroup>
							<col style="width:20%; min-width: 110px;"/>
							<col style="width:auto"/>
							<col style="width:25%; min-width: 135px;"/>
						</colgroup>
						<thead>
						<tr>
							<th>일정</th>
							<th>기간</th>
							<th>발표일</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<th>신청서접수</th>
							<td>2025.04.28~06.05</td>
							<td>-</td>
						</tr>
						<tr>
							<th>예선 평가</th>
							<td>2025.06.09~06.20</td>
							<td>2025.06.23(월)</td>
						</tr>
						<tr>
							<th>본선 1차 평가</th>
							<td>2025.07.14~07.25</td>
							<td>2025.07.28(월)</td>
						</tr>
						<tr>
							<th>본선 2차 평가</th>
							<td>2025.08.04~08.07</td>
							<td>2025.08.11(월)</td>
						</tr>
						<tr>
							<th>시상식</th>
							<td colspan="2">2025.08.21(목)</td>
						</tr>
						</tbody>
					</table>
					<div class="intro-table-desc">
						※ 진행 사항에 따라 일정은 일부 변경될 수 있음
					</div>
				</div>
				<div class="intro-con">
					<div class="intro-title">심사안내 및 평가기준</div>
					<div class="intro-sub-title">
						심사절차
					</div>
					<table class="intro-table">
						<colgroup>
							<col style="width: 7%; min-width: 55px;">
							<col style="width: 7%; min-width: 55px;">
							<col style="width: 15%; min-width: 82px;">
							<col style="width: auto;">
							<col style="width: 30%;">
						</colgroup>
						<thead>
						<tr>
							<th colspan="2">구분</th>
							<th>평가방법</th>
							<th>심사위원</th>
							<th>주요내용</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<th colspan="2">예선</th>
							<td>서류평가</td>
							<td>내부전문가(50%), 추진실무자(50%)</td>
							<td>10개 작품 선정</td>
						</tr>
						<tr>
							<th rowspan="3">본선</th>
							<th rowspan="2">1차</th>
							<td>홈페이지</td>
							<td>직원평가(50%)</td>
							<td rowspan="2">4개 작품 선정</td>
						</tr>
						<tr>
							<td>PT</td>
							<td>내부전문가/추진실무자(50%)</td>
						</tr>
						<tr>
							<th>2차</th>
							<td>PT및시연</td>
							<td>임원/사업본부장</td>
							<td>수상작 순위 결정</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="intro-con">
					<div class="intro-sub-title">
						심사기준
					</div>
					<table class="intro-table">
						<colgroup>
							<col style="width: 10%; min-width: 50px">
							<col style="width: 22%;">
							<col style="width: auto;">
							<col style="width: 30%;">
						</colgroup>
						<thead>
						<tr>
							<th>구분</th>
							<th>최종점수</th>
							<th>심사기준</th>
							<th>주요내용</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<th rowspan="3">본선</th>
							<td>90점 이상</td>
							<td>대상 수여 가능</td>
							<td rowspan="3">최상위 4개 작품 순위 결정</td>
						</tr>
						<tr>
							<td>85점 이상</td>
							<td>최우수상 수여 가능</td>
						</tr>
						<tr>
							<td>80점 이상</td>
							<td>우수상 수여 가능</td>
						</tr>
						<tr>
							<th rowspan="3">예선</th>
							<td>60점 이상</td>
							<td>본선 1차 진출 대상</td>
							<td>최상위 10개 작품 선정 본선 진출</td>
						</tr>
						<tr>
							<td>60점 미만~40점 이상</td>
							<td>예선 탈락</td>
							<td>지식자산화 대상 작품</td>
						</tr>
						<tr>
							<td>40점 미만</td>
							<td>평가 기준 미달</td>
							<td>요건 미충족</td>
						</tr>
						</tbody>
					</table>
					<div class="intro-table-desc">
						※ 심사결과 최종점수에 따라 시상 대상이 없을 수도 있음.
					</div>
				</div>
				<div class="intro-con">
					<div class="intro-sub-title">평가항목 및 배점</div>
					<table class="intro-table" id="scoreTable">
						<colgroup>
							<col style="width: 18%;">
							<col style="width: auto;">
							<col style="width: 17%;">
						</colgroup>
						<thead>
						<tr>
							<th>평가항목</th>
							<th>세부항목</th>
							<th>배점</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<th>사업측면</th>
							<td>시장성, 수익성, 효율성, 투자안정성</td>
							<td>40</td>
						</tr>
						<tr>
							<th>창의측면</th>
							<td>독창성, 완전성, 계속성</td>
							<td>30</td>
						</tr>
						<tr>
							<th>기술측면</th>
							<td>구현가능성, 독자가능성, 구현복잡성</td>
							<td>20</td>
						</tr>
						<tr>
							<th>기타사항</th>
							<td>규칙성, 공익성, 성실성</td>
							<td>10</td>
						</tr>
						</tbody>
						<tfoot>
						<tr id="totalRow">
							<th colspan="2" style="text-align:right; padding-right: 40px;">합계</th>
							<td>100</td>
						</tr>
						</tfoot>
					</table>
				</div>
				<div class="intro-con type3">
					<div class="intro-title">상금 및 부상</div>
					<table class="intro-table">
						<colgroup>
							<col style="width: 33.33%;">
							<col style="width: 30%;">
							<col style="width: auto;">
						</colgroup>
						<thead>
						<tr>
							<th>구분</th>
							<th>팀</th>
							<th>경품내역</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<th>대상</th>
							<td>1팀</td>
							<td>상금 200만원</td>
						</tr>
						<tr>
							<th>최우수상</th>
							<td>1팀</td>
							<td>상금 150만원</td>
						</tr>
						<tr>
							<th>우수상</th>
							<td>2팀</td>
							<td>상금 100만원</td>
						</tr>
						<tr>
							<th>장려상</th>
							<td>6팀</td>
							<td>상금 10만원</td>
						</tr>
						</tbody>
					</table>
					<div class="intro-table-desc">
						• 유명 IT 박람회 참가 자격(평가 최종점수 95점 이상)<br/>
						&nbsp; - 아이디어 사업화 우수사례: 사업성, 창의성 평가 점수 65점 이상인 경우
					</div>
				</div>
				<div class="intro-con type3">
					<div class="intro-title">참여 독려를 위한 지원 사항</div>
					<table class="intro-table">
						<colgroup>
							<col style="width: auto;">
							<col style="width: 16%;">
							<col style="width: 38%;">
						</colgroup>
						<thead>
						<tr>
							<th>구분</th>
							<th>명</th>
							<th>경품내역</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<th>평점 40점 이상 예선 탈락자(응모자)</th>
							<td>OO명</td>
							<td>제안 포상 5만원 지급</td>
						</tr>
						<tr>
							<th>작품평가 건수 상위(평가자)</th>
							<td>20명</td>
							<td>참여상 2만원 상당 지급</td>
						</tr>
						<tr>
							<th>랜덤추첨(평가자)</th>
							<td>3명</td>
							<td>경품지급</td>
						</tr>
						</tbody>
					</table>
					<div class="intro-table-desc">
						• 상위 20명 : 별점 등록 및 댓글 참여 기준<br/>
						• 랜덤추첨 : 참여자 대상 추첨 진행
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
<script type="text/javascript" src="<c:url value='/'/>js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/plugins.js"></script>

<script type="text/javascript" src="<c:url value='/'/>js/common.js"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

</body>
</html>