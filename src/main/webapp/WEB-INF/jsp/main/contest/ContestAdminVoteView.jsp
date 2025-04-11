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
			height: auto;
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

		table td, table th {
			text-align: center;       /* 가로 중앙 */
			vertical-align: middle;   /* 세로 중앙 */
			border: 1px solid #ccc;   /* 확인용 */
		}

		table td.left-center-cell {
			text-align: left;        /* 가로 왼쪽 정렬 */
			vertical-align: middle;   /* 세로 중앙 정렬 */
			height: 100px;            /* 높이를 줘야 세로 중앙 정렬이 눈에 보임 */
			border: 1px solid #ccc;   /* 확인용 */
			padding-left: 15px;
		}

		@media screen and (max-width: 768px) {
			td.hid, th.hid {
				width: 0 !important;
				padding: 0 !important;
				border: none !important;
				overflow: hidden;
				display: none; /* 완전히 안 보이게 처리 */
			}
			col.hid {
				width: 0 !important;
				display: none;
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
					<div class="left">
						<div class="condition">
							<h3>평가 대상 목록</h3>

							<div class="board_list">
								<table>
									<caption>목록</caption>
									<colgroup>
										<col style="width: 70px;">
										<col style="width: auto; min-width: 80px;">
									</colgroup>
									<thead>

									<tr>
										<th>순번</th>
										<th>발표자</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td>1</td>
										<td>김대광</td>
									</tr>
									<tr>
										<td>2</td>
										<td>이진석</td>
									</tr>
									<tr>
										<td>3</td>
										<td>김용주</td>
									</tr>
									<tr>
										<td>4</td>
										<td>손영주</td>
									</tr>
									<tr>
										<td>5</td>
										<td>오명진</td>
									</tr>
									<tr>
										<td>6</td>
										<td>백단비</td>
									</tr>
									<tr>
										<td>7</td>
										<td>권승주</td>
									</tr>
									<tr>
										<td>8</td>
										<td>황수정</td>
									</tr>
									<tr>
										<td>9</td>
										<td>정수민</td>
									</tr>
									<tr>
										<td>10</td>
										<td>홍길동</td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>
					<div class="divider"></div>
					<div class="right">

						<div class="condition">
							<h2>평가기준 및 평가</h2>

							<div class="board_list">
								<table>
									<caption>목록</caption>
									<colgroup>
										<col style="width: 120px;">
										<col style="width: 120px;">
										<col style="width: 120px;" class="hid">
										<col style="width: auto; min-width: 250px;" class="hid">
										<col style="width: 300px;" class="hid">
										<col style="width: 120px;">
									</colgroup>
									<thead>
									<tr>
										<th scope="col" colspan="2">항목</th>
										<th scope="col" class="hid">기준<br>점수</th>
										<th scope="col" class="hid">설명</th>
										<th scope="col" class="hid">비고</th>
										<th scope="col">평가<br>점수</th>
									</tr>
									</thead>
									<tbody>
									<%--									<c:if test="${empty resultList}">--%>
									<%--										<tr>--%>
									<%--											<td class="al" colspan="6">등록된 정보가 존재하지 않습니다.</td>--%>
									<%--										</tr>--%>
									<%--									</c:if>--%>

									<!-- 사업측면 -->
									<tr>
										<td rowspan="4" >사업측면<br>40</td>
										<td>시장성</td>
										<td class="hid">15</td>
										<td class="hid">실용성, 상업화 가능성</td>
										<td class="left-center-cell hid">
											- 아이디어의 시장성<br>
											- 기존 사업과의 연계성</td>
										<td>
											<label class="item f_select" for="sel_101">
												<select name="sel_101" id="sel_101" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>
									<tr>
										<td>수익성</td>
										<td class="hid">10</td>
										<td class="hid">적정한 수익모델 제시</td>
										<td class="left-center-cell hid">- 수익모델 및 수익구조 분석</td>
										<td>
											<label class="item f_select" for="sel_102">
												<select name="sel_102" id="sel_102" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="10,9,8,7,6,5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>
									<tr>
										<td>효율성</td>
										<td class="hid">10</td>
										<td class="hid">당사인력 및 포지션 활용</td>
										<td class="left-center-cell hid">
											- 자사 자원의 효과적 활용과 시너지 효과<br>
											- 자사 경쟁우위요소 활용 여부</td>
										<td>
											<label class="item f_select" for="sel_103">
												<select name="sel_103" id="sel_103" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="10,9,8,7,6,5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>
									<tr>
										<td>투자 안전성</td>
										<td class="hid">5</td>
										<td class="hid">투자비용 최적화(최소화)</td>
										<td class="left-center-cell hid">
											- 사업 타당성 분석<br>
											- 투자유치 가능성<br>
											- 비용/리스크 최소화 방법</td>
										<td>
											<label class="item f_select" for="sel_104">
												<select name="sel_104" id="sel_104" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>

									<!-- 창의측면 -->
									<tr>
										<td rowspan="3" class="center-cell">창의측면<br>30</td>
										<td>독창성</td>
										<td class="hid">10</td>
										<td class="hid">타서비스와 차별성/혁신성</td>
										<td class="left-center-cell hid">
											- 독창적인 아이디어 여부<br>
											- 기존 비즈니스와의 차별성</td>
										<td>
											<label class="item f_select" for="sel_201">
												<select name="sel_201" id="sel_201" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="10,9,8,7,6,5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>
									<tr>
										<td>완전성</td>
										<td class="hid">10</td>
										<td class="hid">서비스 완성도</td>
										<td class="left-center-cell hid">- 단순 아이디어가 아닌 구체적 서비스 여부</td>
										<td>
											<label class="item f_select" for="sel_202">
												<select name="sel_202" id="sel_202" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="10,9,8,7,6,5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>
									<tr>
										<td>계속성</td>
										<td class="hid">10</td>
										<td class="hid">추가 서비스로 확장 여부</td>
										<td class="left-center-cell hid">- 추가적인 확장성 및 파급효과<br>
											- 신시장 창출 가능성</td>
										<td>
											<label class="item f_select" for="sel_203">
												<select name="sel_203" id="sel_203" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="10,9,8,7,6,5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>

									<!-- 기술측면 -->
									<tr>
										<td rowspan="3" class="center-cell">기술측면<br>20</td>
										<td>구현 가능성</td>
										<td class="hid">10</td>
										<td class="hid">현재 기술로 가능 여부</td>
										<td class="left-center-cell hid">- 실제 기술 구현 가능성<br>
											- 기술적 솔루션 제시 여부</td>
										<td>
											<label class="item f_select" for="sel_301">
												<select name="sel_301" id="sel_301" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="10,9,8,7,6,5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>
									<tr>
										<td>독자 가능성</td>
										<td class="hid">5</td>
										<td class="hid">독자적 방어요소</td>
										<td class="left-center-cell hid">- 시장 진입 용이성 수준<br>
											- 배타적 권리의 안정성 또는 확보 가능성<br>
											(특허, 프로세스 등)</td>
										<td>
											<label class="item f_select" for="sel_302">
												<select name="sel_302" id="sel_302" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>
									<tr>
										<td>구현 복잡성</td>
										<td class="hid">5</td>
										<td class="hid">구현 단순성 지향</td>
										<td class="left-center-cell hid">- 이해관계자 단순 여부<br>
											- 단순 개발 환경과 적은 유지비용</td>
										<td>
											<label class="item f_select" for="sel_303">
												<select name="sel_303" id="sel_303" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>

									<!-- 기타사항 -->
									<tr>
										<td rowspan="2" class="center-cell">기타사항<br>10</td>
										<td>공익성</td>
										<td class="hid">5</td>
										<td class="hid">그룹 정책 적합성</td>
										<td class="left-center-cell hid">- 중소기업 상생 등<br>
											- 법적(인허가, 지적재산권 등) 적합성<br>
											- 사회적 용인성(도박/사기 금지 등)</td>
										<td>
											<label class="item f_select" for="sel_401">
												<select name="sel_401" id="sel_401" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>
									<tr>
										<td>성실성</td>
										<td class="hid">5</td>
										<td class="hid">참가 규칙 준용 여부<br>
											내용 구성능력, 전달력</td>
										<td class="left-center-cell hid">- 정해진 양식과 주제 준수<br>
											- 적절한 논리성과 체계성<br>
											- 제안 내용의 구성, 참신성, 함축성 등</td>
										<td>
											<label class="item f_select" for="sel_402">
												<select name="sel_402" id="sel_402" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>

									<!-- 가산점 -->
									<tr>
										<td rowspan="1" class="center-cell">가산점<br>(10)</td>
										<td>아이디어 구현</td>
										<td class="hid">10</td>
										<td class="hid">구현 완성도</td>
										<td class="left-center-cell hid">- 구현결과에 대한 아이디어 부합 여부<br>
											- 시스템 정상 작동 여부<br>
											- 디지털기술 적용 여부 등</td>
										<td>
											<label class="item f_select" for="sel_501">
												<select name="sel_501" id="sel_501" title="평가 선택">
													<option value="">-선택-</option>
													<c:forTokens var="count" items="10,9,8,7,6,5,4,3,2,1,0" delims=",">
														<option value="${count}">${count}</option>
													</c:forTokens>
												</select>
											</label>
										</td>
									</tr>
									<tr style="background: #EAEAEA;">
										<td colspan="2" class="center-cell">&nbsp;</td>
										<td colspan="3" class="center-cell hid">합계</td>
										<td>99점</td>
									</tr>
									</tbody>
								</table>
							</div>

							<div class="board_view_bot board_list_bot">
								<div class="left_col">
								</div>
								<div class="center_col">
								</div>
								<div class="right_col">
									<a href="#" class="btn btn_white_46" onclick="javascript:alert('준비중'); return false;">저장</a>
								</div>
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