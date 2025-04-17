<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

	<!-- Document Title
	============================================= -->
	<title>IBK시스템 AI 아이디어 챌린지</title>

	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

	<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>

	<script type="text/javascript">
		<!--
		function onloading() {
			if ("<c:out value='${msg}'/>" != "") {
				alert("<c:out value='${msg}'/>");
			}
		}

		function fn_egov_moveUpdt_notice() {
			document.frm.action = "<c:url value='/cmm/contest/apfrRcipUpdt.do'/>";
			document.frm.submit();
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
						작품접수
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
						<button class="nav-button">작품접수 <span class="nav-toggle"></span></button>
					</div>
				</div>
			</nav>
		</div>
		<div class="content-wrap">
			<div class="container clearfix">
				<form name="frm" method="post" action="<c:url value='/cop/bbs/selectBoardList.do'/>">
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
					<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
					<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
					<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
					<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
					<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
					<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
					<div class="board_view">
						<div class="board_view_top_con">
							<!-- 관리자가 작성한 경우 mem-info-img display:none 처리 or src 안넣으면 기본이미지로 노출 -->
							<div class="mem-info-img">
								<img src="" alt=""> <!--작성자 이미지-->
							</div>
							<div>
								<div class="board_view_title">
									<c:out value="${result.nttSj}" escapeXml="false" />
								</div>
								<div class="board_view_info_con">
									<div class="board_view_info">
										<div class="view_info_title">팀명</div>
										<div class="view_info_desc"><c:out value="${result.teamNm}" escapeXml="false" /></div>
									</div>
									<div class="board_view_info">
										<div class="view_info_title">등록일</div>
										<div class="view_info_desc"><c:out value="${fn:replace(result.frstRegisterPnttm, '-', '.')}" escapeXml="false" /></div>
									</div>
								</div>
							</div>
						</div>
						<div class="board_view_file_con">
							<img src="../images/icon-attachment.png" alt="" style="width: 24px;">
							<c:if test="${result.atchFileId != ''}">
								<div class="board_view_file_con">
									<img src="/images/icon-attachment.png" alt="" style="width: 24px;">
									<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${egovc:encrypt(result.atchFileId)}" />
									</c:import>
								</div>
							</c:if>
						</div>
						<div class="board_view_content_con">
							<c:out value="${result.nttCn}" escapeXml="false" />
						</div>
					</div>

					<div class="board_view_bot">
						<div class="left_col">
							<a href="/cmm/contest/apfrRcip.do" class="btn btn_gray_46">목록</a><!-- 목록 -->
						</div>
						<div class="center_col"></div>
						<div class="right_col">
							<a href="#" class="btn btn_white_46" onclick="javascript:fn_egov_moveUpdt_notice(); return false;">수정</a>
							<a href="#" class="btn btn_black_46">삭제</a><!-- 삭제 -->
						</div>
					</div>
					<!--// 게시판 -->
				</form>
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