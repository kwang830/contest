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

	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

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
		function submitGroupForm() {
			document.getElementById("groupForm").submit();
		}

		/**********************************************************
		 * 모달 종료 버튼
		 ******************************************************** */
		function fn_egov_modal_remove() {
			$('#modalPan').remove();
			// location.reload();
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
						공모전 심사 순위
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
									<form id="groupForm" action="<c:url value='/cmm/contest/contestAdminVoteRank.do'/>" method="post">
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
							</div>
						</div>

					</div>
					<div class="divider"></div>
					<div class="right">

						<div class="condition">
							<h2>순위</h2>
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

								<div class="board_list selectable-table">
									<table class="" id="voteRslt">
										<caption>목록</caption>
										<colgroup>
											<col style="width: 80px;">
											<col style="width: 80px;">
											<col style="width: 80px;">
											<col style="width: 80px;">
											<col style="width: 80px;">
											<col style="width: auto; min-width: 220px;" class="hid">
											<col style="width: 120px;">
											<col style="width: 100px;" class="hid">
										</colgroup>
										<thead>
										<tr>
											<th scope="col" >총점 순위</th>
											<th scope="col" >총점</th>
											<th scope="col" >평균 순위</th>
											<th scope="col" >평균</th>
											<th scope="col" >평가자수</th>
											<th scope="col" class="hid">제목</th>
											<th scope="col" >팀명</th>
											<th scope="col" class="hid">작성자</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach var="result" items="${resultList}" varStatus="status">
											<tr>
												<td><c:out value='${result.totScrRank}'/></td>
												<td><c:out value='${result.sumScr}'/></td>
												<td><c:out value='${result.avgScrRank}'/></td>
												<td><c:out value='${result.avgScr}'/></td>
												<td><c:out value='${result.valtCnt}'/></td>
												<td class="hid"><c:out value='${result.nttSj}' escapeXml="false"/></td>
												<td><c:out value='${result.teamNm}' escapeXml="false"/></td>
												<td class="hid"><c:out value='${result.ntcrNm}'/></td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>

							</form:form>

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

<script src="<c:url value='/'/>js/ui.js"></script>
<script src="<c:url value='/'/>js/jqueryui.js"></script>

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
</body>
</html>