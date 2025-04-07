<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
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

	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css" type="text/css">

	<!-- preload -->
	<link rel="preload" href="<c:url value='/'/>css/reset.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/responsive.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/font-icons.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/sub.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/board.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

	<!-- Document Title
    ============================================= -->
	<title>IBK시스템, AI 아이디어 챌린지 - 공지사항</title>

	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

	<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
	<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
	<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
	<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
	<script type="text/javascript">
		function fn_egov_validateForm(obj) {
			return true;
		}

		function fn_egov_regist_notice() {
			//document.board.onsubmit();

			if (!validateBoard(document.board)){
				return;
			}
			if (confirm('<spring:message code="common.regist.msg" />')) {
				//document.board.onsubmit();
				document.board.action = "<c:url value='/cop/bbs${prefix}/insertBoardArticle.do'/>";
				document.board.submit();
			}
		}

		function fn_egov_select_noticeList() {
			document.board.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
			document.board.submit();
		}

		/* ********************************************************
         * 달력
         ******************************************************** */
		function fn_egov_init_date(){

			$("#searchBgnDe").datepicker(
					{dateFormat:'yy-mm-dd'
						, showOn: 'button'
						, buttonImage: '<c:url value='/images/ico_calendar.png'/>'
						, buttonImageOnly: true

						, showMonthAfterYear: true
						, showOtherMonths: true
						, selectOtherMonths: true
						, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

						, changeMonth: true // 월선택 select box 표시 (기본은 false)
						, changeYear: true  // 년선택 selectbox 표시 (기본은 false)
						, showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
					});


			$("#searchEndDe").datepicker(
					{dateFormat:'yy-mm-dd'
						, showOn: 'button'
						, buttonImage: '<c:url value='/images/ico_calendar.png'/>'
						, buttonImageOnly: true

						, showMonthAfterYear: true
						, showOtherMonths: true
						, selectOtherMonths: true
						, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

						, changeMonth: true // 월선택 select box 표시 (기본은 false)
						, changeYear: true  // 년선택 selectbox 표시 (기본은 false)
						, showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
					});
		}

	</script>
	<style type="text/css">
		.ui-datepicker-trigger {
			margin-left: 10px;
			vertical-align: middle;
		}
	</style>

</head>

<body class="stretched" onLoad="document.board.nttSj.focus(); fn_egov_init_date();">

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
						<c:out value='${bdMstr.bbsNm}'/>
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
						<button class="nav-button">커뮤니티 <span class="nav-toggle"></span></button>
						<%--						<ul class="dropdown-menu">--%>
						<%--							<li><a href="#">소개</a></li>--%>
						<%--							<li><a href="#">접수</a></li>--%>
						<%--							<li class="active"><a href="#">커뮤니티</a></li>--%>
						<%--							<li><a href="#">성과</a></li>--%>
						<%--						</ul>--%>
					</div>
					<div class="nav-item has-dropdown">
						<button class="nav-button">공지사항 <span class="nav-toggle"><img
								src="/images/icon-nav-arrow.png" alt=""></span></button>
						<ul class="dropdown-menu">
							<li class="active"><a href="#">공지사항</a></li>
							<li><a href="/uss/olh/faq/FaqListInqire.do">FAQ</a></li>
							<li><a href="/uss/olh/qna/QnaListInqire.do">QNA</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="content-wrap">
			<div class="container clearfix">
				<form:form modelAttribute="board" name="board" method="post" enctype="multipart/form-data" >
					<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
					<input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
					<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
					<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
					<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
					<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
					<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
					<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
					<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />

					<input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
					<input type="hidden" name="authFlag" value="<c:out value='${bdMstr.authFlag}'/>" />

					<c:if test="${anonymous != 'true'}">
						<input type="hidden" name="ntcrNm" value="dummy">   <!-- validator 처리를 위해 지정 -->
						<input type="hidden" name="password" value="dummy"> <!-- validator 처리를 위해 지정 -->
					</c:if>

					<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
						<input name="ntceBgnde" type="hidden" value="10000101">
						<input name="ntceEndde" type="hidden" value="99991231">
					</c:if>

					<div class="board_form">
						<div>
							<div class="board_form_row">
								<div class="title"><label for="nttSj">제목</label></div>
								<div class="input">
									<input id="nttSj" name="nttSj" title="제목" class="f_txt" type="text"
										   value="" size="60" maxlength="60">
								</div>
							</div>
							<c:choose>
								<c:when test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
									<!-- 게시 기간 시작 -->
									<div class="board_form_row">
										<div class="title"><label for="searchBgnDe">일자</label></div>
										<div class="input">
											<input name="ntceBgnde" type="hidden" >
											<input id="searchBgnDe" name="searchBgnDe" title="시작일자" class="f_txt" type="text"
												   value="<c:out value='${searchVO.searchBgnDe}'/>" size="10" maxlength="10">~
											<input name="ntceEndde" type="hidden" />
											<input id="searchEndDe" name="searchEndDe" title="종료일자" class="f_txt" type="text"
												   value="<c:out value='${searchVO.searchEndDe}'/>" size="10" maxlength="10">
										</div>
									</div>
									<!-- /게시 기간 끝 -->
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
							<div class="board_form_row">
								<div class="title">
									<label for="nttCn">내용</label>
								</div>
								<div class="input">
                                    <textarea id="nttCn" name="nttCn" title="내용" class="f_txtar w_full h_200"
											  rows="10" cols="30"></textarea>
								</div>
							</div>
							<!-- 파일첨부 시작 -->
							<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
							<div class="board_form_row">
								<div class="title">
									<label for="egovComFileUploader">파일첨부</label>
								</div>
								<div class="input f_file_wrap">
									<div class="board_attach2" id="file_upload_posbl">
										<input name="file_1" id="egovComFileUploader" type="file" />
										<div id="egovComFileList"></div>
									</div>
									<div class="board_attach2" id="file_upload_imposbl">
									</div>
									<c:if test="${empty result.atchFileId}">
										<input type="hidden" id="fileListCnt" name="fileListCnt" value="0" />
									</c:if>
								</div>
							</div>
							</c:if>
						</div>
					</div>

					<!-- 목록/저장버튼  시작-->
					<div class="board_view_bot">
						<div class="left_col">
							<a href="#" class="btn btn_gray_46" onclick="javascript:fn_egov_select_noticeList(); return false;">목록</a>
						</div>
						<div class="center_col">
							<c:if test="${bdMstr.authFlag == 'Y'}">
								<a href="#" class="btn btn_white_46" onclick="javascript:fn_egov_regist_notice(); return false;">저장</a>
							</c:if>
						</div>
						<div class="right_col"></div>
					</div>
					<!-- 목록/저장버튼  끝-->

				</form:form>

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

<script type="text/javascript" src="<c:url value='/'/>js/jqueryui.js"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
	<script type="text/javascript">
		var maxFileNum = document.board.posblAtchFileNumber.value;
		if(maxFileNum==null || maxFileNum==""){
			maxFileNum = 3;
		}
		var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
		multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	</script>
</c:if>

</body>
</html>