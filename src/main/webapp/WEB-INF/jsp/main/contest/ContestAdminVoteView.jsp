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
	<link rel="preload" href="<c:url value='/'/>css/board.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

	<style>
		* {
			box-sizing: border-box;
			margin: 0;
			padding: 0;
		}

		body {
			font-family: Arial, sans-serif;
		}

		.layout-wrapper {
			display: flex;
			flex-direction: row;
			height: 100vh;
		}

		.left {
			/*background-color: #0074D9;*/
			color: #999;
			width: 20%;
			padding: 20px;
		}

		.divider {
			width: 1px;
			background-color: #999;
		}

		.right {
			/*background-color: #cce6ff;*/
			width: 80%;
			padding: 20px;
		}

		@media (max-width: 768px) {
			.layout-wrapper {
				flex-direction: column;
			}

			.left,
			.right {
				width: 100%;
				height: auto;
			}

			.divider {
				display: none; /* 모바일에서는 구분선 숨기기 */
			}
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
						공모전 심사
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
						<button class="nav-button">공모전 투표 <span class="nav-toggle"></span></button>
					</div>
					<div class="nav-item has-dropdown">
						<button class="nav-button">공모전 심사 <span class="nav-toggle"><img
								src="/images/icon-nav-arrow.png" alt=""></span></button>
						<ul class="dropdown-menu">
							<li><a href="/cmm/contest/contestVote.do">공모전 투표</a></li>
							<li><a href="/cmm/contest/contestVoteRslt.do">공모전 투표 결과</a></li>
							<li class="active"><a href="/cmm/contest/contestAdminVote.do">공모전 심사</a></li>
							<li><a href="/cmm/contest/contestAdminVoteRslt.do">공모전 심사 결과</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="content-wrap">
			<div class="container clearfix">

				<div class="layout-wrapper">
					<div class="left">평가 대상 목록</div>
					<div class="divider"></div>
					<div class="right">

						<div class="condition">
							<h2>평가기준 및 평가</h2>

							<div class="board_list">
								<table>
									<caption>목록</caption>
									<colgroup>
										<col style="width: 250px;">
										<col style="width: 250px;">
										<col style="width: auto; min-width: 250px;">
										<col style="width: 250px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="3">항목</th>
											<th scope="col">설명</th>
											<th scope="col">비고</th>
											<th scope="col">평가</th>
										</tr>
									</thead>
									<tbody>
									<c:if test="${empty resultList}">
										<tr>
											<td class="al" colspan="4">등록된 정보가 존재하지 않습니다.</td>
										</tr>
									</c:if>

									<tr>
										<td rowspan="4">사업측면<br>40</td>
										<td>시장성</td>
										<td>15</td>
										<td>실용성, 상업화 가능성</td>
										<td>- 아이디어의 시장성<br>
											- 기존 사업과의 연계성</td>
										<td><select id="test01"><option>0</option><option>5</option><option>10</option><option>15</option></select></td>
									</tr>
									<tr>
										<td>수익성</td>
										<td>10</td>
										<td>적정한 수익모델 제시</td>
										<td>- 수익모델 및 수익구조 분석</td>
										<td>[]</td>
									</tr>
									<tr>
										<td>효율성</td>
										<td>10</td>
										<td>당사인력 및 포지션 활용</td>
										<td>- 자사 자원의 효과적 활용과 시너지 효과<br>
											- 자사 경쟁우위요소 활용 여부</td>
										<td>[]</td>
									</tr>

									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
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

</body>
</html>