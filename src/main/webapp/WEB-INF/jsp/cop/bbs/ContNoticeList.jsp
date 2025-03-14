<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
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
	<title>IBK시스템, AI 아이디어 챌린지 - 공지사항</title>

	<script type="text/javascript">
		<!--

		function fn_egov_addNotice() {
			document.frm.action = "<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>";
			document.frm.submit();
		}

		function fn_egov_select_noticeList(pageNo) {
			document.frm.pageIndex.value = pageNo;
			document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
			document.frm.submit();
		}

		function fn_egov_inqire_notice(nttId, bbsId) {
			//document.subForm.nttId.value = nttId;
			//document.subForm.bbsId.value = bbsId;
			//document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>";
			//document.subForm.submit();
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

	<!-- Page Title
    ============================================= -->
	<section id="page-title">

		<div class="container clearfix">
			<h1>2025년 AI 아이디어 공모전</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item" aria-current="page">Home</li>
				<li class="breadcrumb-item active" aria-current="page">내정보관리</li>
			</ol>
		</div>

	</section><!-- #page-title end -->

	<!-- Content
    ============================================= -->
	<section id="content">

		<div class="content-wrap">

			<div class="container clearfix">

				<h3><c:out value="${brdMstrVO.bbsNm}" /></h3>

				<!-- 검색조건 -->
				<div class="condition">

					<form name="frm" action="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="post">
						<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
						<input type="hidden" name="nttId" value="0" />
						<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
						<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />

						<label class="item f_select" for="sel1">
							<select name="searchCnd" id="searchCnd" title="검색조건 선택">
								<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>제목</option>
								<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>내용</option>
								<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if>>작성자</option>
							</select>
						</label>
						<span class="item f_search">
											<input class="f_input w_500" type="text" name="searchWrd" value='<c:out value="${searchVO.searchWrd}"/>' title="검색어 입력">
											<button class="btn" type="submit" onclick="fn_egov_select_noticeList('1'); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
										</span>
						<c:if test="${brdMstrVO.authFlag == 'Y'}">
							<a href="<c:url value='/cop/bbs${prefix}/addBoardArticle.do?bbsId=${boardVO.bbsId}'/>" class="item btn btn_blue_46 w_100"><spring:message code="button.create" /></a><!-- 등록 -->
						</c:if>

					</form>

				</div>
				<!--// 검색조건 -->

				<div class="row show-grid">
					<div class="col-lg-1">번호</div>
					<div class="col-lg-5">제목</div>
					<div class="col-lg-2">작성자</div>
					<div class="col-lg-2">작성일</div>
					<div class="col-lg-2">조회수</div>
				</div>

				<c:if test="${empty resultList}">
					<div class="row show-grid">
						<div class="col-lg-1"></div>
						<div class="col-lg-8">등록된 글이 존재하지 않습니다.</div>
						<div class="col-lg-3"></div>
					</div>
				</c:if>

				<c:forEach var="result" items="${resultList}" varStatus="status">
					<div class="row show-grid">
						<div class="col-lg-1"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" /></div>
						<div class="col-lg-5">
							<c:if test="${result.replyLc!=0}">
								<c:forEach begin="0" end="${result.replyLc}" step="1">
									&nbsp;
								</c:forEach>
								<img src="<c:url value='/'/>images/ico_reply.png" alt="reply arrow">
							</c:if>
							<c:out value="${result.nttSj}" /></div>
						<div class="col-lg-2"><c:if test="${anonymous != 'true'}">관리자</c:if></div>
						<div class="col-lg-2">${result.frstRegisterPnttm}</div>
						<div class="col-lg-2">${result.inqireCo}</div>
					</div>
				</c:forEach>

				<div class="board_list_bot">
					<div class="paging" id="paging_div">
						<ul>
							<ui:pagination paginationInfo="${paginationInfo}" type="renew" jsFunction="fn_egov_select_noticeList" />
						</ul>
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
<script src="<c:url value='/'/>js/jquery-3.3.1.js"></script>
<script src="<c:url value='/'/>js/plugins.js"></script>

<!-- Footer Scripts
============================================= -->
<script src="<c:url value='/'/>js/functions.js"></script>

</body>
</html>