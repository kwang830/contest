<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

		table tr.selected td {
			background-color: #d0ebff; /* 모든 td에 하늘색 배경 */
			font-weight: bold;         /* 글씨 굵게 */
		}

		/* 첫 번째 td는 배경 제거 */
		table tr.selected td:first-child {
			background-color: transparent !important;
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

		.groupList {
			display: flex;
			align-items: center;     /* 세로 중앙 정렬 */
			justify-content: center; /* 가로 중앙 정렬 (필요 시) */
			height: 70px;            /* 원하는 높이 */
			border: 1px solid #ccc;   /* 영역 확인용 */
		}
		.groupList span {
			font-size: 19px;
			color: #000;
			padding-right: 10px;
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

		function submitGroupForm() {
			document.getElementById("groupForm").submit();
		}

		<c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}' />");</c:if>
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
					<!-- Left menu -->
					<c:import url="/sym/mms/ContMenuLeft.do" />
					<!--// Left menu -->
				</div>
			</nav>
		</div>
		<div class="content-wrap">
			<div class="container clearfix">

				<div class="layout-wrapper">
					<div class="left">
						<div class="condition">
							<h3>평가 대상 목록</h3>

							<form name="bbsSearchVo">
								<input type="hidden" name="bbsId" >
								<input type="hidden" name="userId" >
							</form>

							<div class="board_list selectable-table">
								<div class="groupList">
									<form id="groupForm" action="<c:url value='/cmm/contest/contestAdminVote.do'/>" method="post">
									<label class="item f_select" for="cmb_group">
										<select name="cmb_group" id="cmb_group" title="평가 선택" onchange="submitGroupForm()">
											<c:forEach var="result" items="${contVoteAdminGroupList}" begin="0" end="10" step="1" varStatus="status">
												<option value="${result.valtMngmNo}"
														<c:if test="${result.valtMngmNo == valtMngmNo}">selected</c:if>>
														${result.valtMngmTtl}
												</option>
											</c:forEach>
										</select>
									</label>
									</form>
								</div>

								<table id="userList">
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

									<c:forEach var="result" items="${contVoteAdminBBSList}" begin="0" end="20" step="1" varStatus="status">
										<tr data-bbsid="${result.bbsId}" data-nttid="${result.nttId}" data-valtmngmno="${result.valtMngmNo}" data-valtqsitmnno="${result.valtQsitMnno}" data-ntcrnm="${result.ntcrNm}">
											<td>${status.count} </td>
											<td>${result.ntcrNm}</td>
										</tr>
									</c:forEach>

									</tbody>
								</table>
							</div>
						</div>

					</div>
					<div class="divider"></div>
					<div class="right">

						<div class="condition">
							<h2>평가기준 및 평가</h2>
							<%
								LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
								if(loginVO == null){
							%>
							<c:set var="exmnNm" value=""/>
							<%
								}else{
							%>
							<c:set var="exmnNm" value="<%= loginVO.getName()%>"/>
							<%
								}
							%>

							<form:form modelAttribute="vote" name="vote" method="post" enctype="multipart/form-data" >
								<input type="hidden" name="valtMngmNo" value="" />
								<input type="hidden" name="valtQsitMnno" value="" />
								<input type="hidden" name="bbsId" value="" />
								<input type="hidden" name="nttId" value="" />
								<input type="hidden" name="ntcrNm" value="" />
								<input type="hidden" name="exmnId" value="" />
								<input type="hidden" name="exmnNm" value="<c:out value="${exmnNm}" />" />
								<input type="hidden" name="valtQsitSendStr" value="" />
								<input type="hidden" name="valtOpnn" value="" />

								<div class="board_list">
									<table class="selectable-table">
										<caption>목록</caption>
										<colgroup>
											<col style="width: 110px;">
											<col style="width: 110px;">
											<col style="width: 90px;" class="hid">
											<col style="width: auto; min-width: 220px;" class="hid">
											<col style="width: 310px;" class="hid">
											<col style="width: 170px;">
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
														<c:forTokens var="item" items="매우우수(15점)|15,우수(12점)|12,보통(9점)|9,미흡(6점)|6,매우미흡(3점)|3" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(5점)|5,우수(4점)|4,보통(3점)|3,미흡(2점)|2,매우미흡(1점)|1" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(5점)|5,우수(4점)|4,보통(3점)|3,미흡(2점)|2,매우미흡(1점)|1" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(5점)|5,우수(4점)|4,보통(3점)|3,미흡(2점)|2,매우미흡(1점)|1" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(5점)|5,우수(4점)|4,보통(3점)|3,미흡(2점)|2,매우미흡(1점)|1" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(5점)|5,우수(4점)|4,보통(3점)|3,미흡(2점)|2,매우미흡(1점)|1" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
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
														<c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2,해당없음(0점)|0" delims=",">
															<c:set var="label" value="${fn:split(item, '|')[0]}" />
															<c:set var="value" value="${fn:split(item, '|')[1]}" />
															<option value="${value}">${label}</option>
														</c:forTokens>
													</select>
												</label>
											</td>
										</tr>
										<tr style="background: #EAEAEA;">
											<td colspan="2" class="center-cell">&nbsp;</td>
											<td colspan="3" class="center-cell hid">합계</td>
											<td>
												<input class="f_input" style="width:30px;" name="tot_sel_point" type="text" value="0" maxlength="3" title="검색어 입력" readonly="readonly">점
											</td>
										</tr>
										</tbody>
									</table>
								</div>

							</form:form>

							<div class="board_form_row">
								<div class="title">
									<label for="valtOpnn2">평가 의견</label>
								</div>
								<div class="input">
                                    <textarea id="valtOpnn2" name="valtOpnn2" title="평가 의견" class="f_txtar w_full h_200"
											  rows="10" cols="30"></textarea>
								</div>
							</div>

							<div class="board_view_bot topmargin-sm">
								<div class="left_col">
								</div>
								<div class="center_col">
									<span style="font-size: 17px; color: #747474;" id="outputMsg">-</span>
								</div>
								<div class="right_col">
									<a href="#" class="btn btn_white_46" id="btnCheck" style="display: none;">저장</a>
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

<script>
	$(function () {
		$('.selectable-table').each(function () {
			$(this).find('tr').click(function () {
				$(this).siblings().removeClass('selected');
				$(this).addClass('selected');
			});
		});
	});
</script>
<script>
	function handleRowClick(bbsId, nttId, valtMngmNo, valtQsitMnno) {
		$('[id^="sel_"]').each(function () {
			$(this).val('');
		});

		fn_select_votes(bbsId, nttId, valtMngmNo, valtQsitMnno);
	}

	$(function () {
		$('#userList tr').on('click', function () {
			const bbsId = $(this).data('bbsid');
			const nttId = $(this).data('nttid');
			const valtMngmNo = $(this).data('valtmngmno');
			const valtQsitMnno = $(this).data('valtqsitmnno');
			const ntcrNm = $(this).data('ntcrnm');

			$('input[name="bbsId"]').val(bbsId);
			$('input[name="nttId"]').val(nttId);
			$('input[name="valtMngmNo"]').val(valtMngmNo);
			$('input[name="valtQsitMnno"]').val(valtQsitMnno);
			$('input[name="ntcrNm"]').val(ntcrNm);

			const displayText = '발표자 : ' + $('input[name="ntcrNm"]').val() + ',    평가자 : ' + $('input[name="exmnNm"]').val();
			$('#outputMsg').html(displayText);
			$('#btnCheck').css('display', 'block');

			handleRowClick(bbsId, nttId, valtMngmNo, valtQsitMnno);
		});
	});

	function decodeHtmlEntities(str) {
		if (!str) return '';
		const txt = document.createElement('textarea');
		txt.innerHTML = str;
		return txt.value;
	}

	function fn_select_votes(bbsId, nttId, valtMngmNo, valtQsitMnno){

		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/api/cont/vote/selectAdminVotesAjax.do",
			data: JSON.stringify({
				bbsId: bbsId,
				nttId: nttId,
				valtMngmNo: valtMngmNo,
				valtQsitMnno: valtQsitMnno
			}),
			contentType: "application/json; charset=UTF-8",
			dataType: 'json',
			success: function(returnData) {
				//console.log(returnData);

				// returnData에서 contVoteAdminGroupList 추출
				const dataList = returnData.contVoteAdminGroupList;
				const valtOpnn = returnData.valtOpnn;

				dataList.forEach(item => {
					const qsitNo = item.qsitNo;
					const valtScr = item.valtScr;
					//console.log('qsitNo:' + qsitNo + ', valtScr:' + valtScr);

					const $select = $('#sel_' + qsitNo);  // 문자열 연결로 변경
					if ($select.length) {
						$select.val(valtScr);
						//console.log('#sel_' + qsitNo + ' 값을 ' + valtScr + '로 설정');
					} else {
						console.warn('#sel_' + qsitNo + ' 셀렉터를 찾을 수 없습니다');
					}

				});

				const decodedValtOpnn = decodeHtmlEntities(valtOpnn);
				$('#valtOpnn2').val(decodedValtOpnn);
				//$('#valtOpnn2').val(valtOpnn);

				calculateTotalPoints();
			},
			error: function(xhr) {
				console.error("에러:", xhr.status, xhr.responseText);
			}
		});

	}

	function calculateTotalPoints() {
		let total = 0;

		// name이 sel_로 시작하는 select 요소들을 순회
		$('select[name^="sel_"]').each(function () {
			let val = parseFloat($(this).val());
			if (!isNaN(val)) {
				total += val;
			}
		});

		// name이 tot_sel_point인 요소에 합계 설정
		$('[name="tot_sel_point"]').val(total);
	}

	$(function() {
		$('#btnCheck').on('click', function(e) {
			e.preventDefault();

			// 값이 없을 경우 안내 메시지 출력
			if ($('input[name="nttId"]').val() === '') {
				$('#outputMsg').html('평가 목록을 선택하세요');
				alert('평가 목록을 선택하세요');
				return false;
			}

			// sel_ 로 시작하는 select 중 value가 ''인 첫 번째 요소 찾기
			var $empty = $('select[name^="sel_"]').filter(function() {
				return $(this).val() === '';
			}).first();

			// 값이 ''인 select가 있으면 포커스 이동
			if ($empty.length) {
				$empty.focus();
				$empty.closest('td').click(); // 상위 td 클릭 트리거
				alert('평가 하지 않은 항목이 존재합니다');
				return false;
			}

			fn_vote_admin_update();
		});
	});

	function fn_vote_admin_update() {
		let sNtcrNm = $('[name="ntcrNm"]').val();
		let sMsg = "발표자("+sNtcrNm+")에 대한 평가를 저장하시겠습니까?"
		let valtOpnn = $('textarea[name="valtOpnn2"]').val();

		console.log("valtOpnn:"+valtOpnn);

		let result = [];

		$('select[name^="sel_"]').each(function () {
			const id = $(this).attr('id');
			const value = $(this).val();
			result.push(id + '|' + value);
		});

		$('input[name="valtQsitSendStr"]').val(result.join('@'));
		$('input[name="valtOpnn"]').val(valtOpnn);

		if (confirm(sMsg)) {
			document.vote.action = "<c:url value='/cmm/contest/updateContestAdminVote.do'/>";
			document.vote.submit();
		}
	}

	$(document).ready(function () {
		$('select[name^="sel_"]').on('change', calculateTotalPoints);
	});



</script>
</body>
</html>