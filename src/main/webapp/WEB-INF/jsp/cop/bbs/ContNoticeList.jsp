<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

	<!-- Content
    ============================================= -->
	<section id="content">
		<div class="sub-layout">
			<div class="sub-banner">
				<div class="container">
					<div class="sub-banner-title">
						<c:out value="${brdMstrVO.bbsNm}" />
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
				<!-- 검색조건 -->
				<div class="condition">
					<form name="frm" action="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="post">

						<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
						<input type="hidden" name="nttId" value="0" />
						<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
						<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />

						<label class="item f_select" for="searchCnd">
							<select name="searchCnd" id="searchCnd" title="검색조건 선택">
								<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>제목</option>
								<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>내용</option>
								<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if>>작성자</option>
							</select>
						</label>

						<span class="item f_search">
                            <input class="f_input w_500" name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>'
								   maxlength="35" title="검색어 입력">
                            <button class="btn" type="submit"
									onclick="fn_egov_select_noticeList('1'); return false;">조회</button>
                        </span>

						<c:if test="${brdMstrVO.authFlag == 'Y'}">
							<a href="<c:url value='/cop/bbs${prefix}/addBoardArticle.do?bbsId=${boardVO.bbsId}'/>" class="item btn btn_black_46 w_100">등록</a>
						</c:if>

					</form>

				</div>
				<!--// 검색조건 -->

				<!-- 게시판 -->
				<div class="board_list">
					<table>
						<caption>목록</caption>
						<colgroup>
							<col style="width: 80px;">
							<col style="width: auto; min-width: 220px;">
							<col style="width: 180px;">
							<c:if test='${boardVO.bbsId == "BBSMSTR_BBBBBBBBBBBB"}'>
							<col style="width: 180px;">
							</c:if>
							<col style="width: 100px;">
							<col style="width: 180px;">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">순번</th>
							<th scope="col">제목</th>
							<c:if test='${boardVO.bbsId == "BBSMSTR_BBBBBBBBBBBB"}'>
								<th scope="col">팀명</th>
							</c:if>
							<th scope="col">작성자</th>
							<th scope="col">조회수</th>
							<th scope="col">등록일자</th>
						</tr>
						</thead>
						<tbody>

						<c:if test="${empty resultList}">
							<tr>
								<c:if test='${boardVO.bbsId == "BBSMSTR_BBBBBBBBBBBB"}'>
								<td colspan="6">등록된 글이 존재하지 않습니다.</td>
								</c:if>
								<c:if test='${boardVO.bbsId != "BBSMSTR_BBBBBBBBBBBB"}'>
								<td colspan="5">등록된 글이 존재하지 않습니다.</td>
								</c:if>
							</tr>
						</c:if>

						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" /></td>
								<td class="al">
									<form name="subForm" method="post" action="<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>">
										<c:if test="${result.replyLc!=0}">
											<c:forEach begin="0" end="${result.replyLc}" step="1">
												&nbsp;
											</c:forEach>
											<img src="<c:url value='/'/>images/ico_reply.png" alt="reply arrow">
										</c:if>
										<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
										<input type="hidden" name="nttId" value="<c:out value="${result.nttId}"/>" />
										<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
										<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
										<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
										<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
										<a href="javascript:;" onclick="parentNode.submit();" class="lnk">
											<c:out value="${result.nttSj}" escapeXml="false" />
										</a>

									</form>
								</td>
								<c:if test='${boardVO.bbsId == "BBSMSTR_BBBBBBBBBBBB"}'>
									<td>${result.teamNm}</td>
								</c:if>
								<td>${result.frstRegisterNm}</td>
								<td>${result.inqireCo}</td>
								<td>${result.frstRegisterPnttm}</td>
							</tr>
						</c:forEach>

						</tbody>
					</table>
				</div>

				<!-- 페이징 -->
				<div class="board_list_bot">
					<div class="paging" id="paging_div">
						<ul>
							<ui:pagination paginationInfo="${paginationInfo}" type="renew" jsFunction="fn_egov_select_noticeList" />
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

</body>
</html>