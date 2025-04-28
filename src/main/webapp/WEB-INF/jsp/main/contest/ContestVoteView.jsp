<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
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

	<!-- Document Title
    ============================================= -->
	<title>IBK시스템 AI 아이디어 챌린지</title>

	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

	<script type="text/javascript">
		<!--

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
						공모전 투표
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
			<div class="sub-container clearfix">
				<div class="work-list-con">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<form name="subForm" method="post" action="<c:url value='/cmm/contest/contestVoteDetail.do'/>" class="work-list">
							<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
							<input type="hidden" name="nttId" value="<c:out value="${result.nttId}"/>" />
							<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
							<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
							<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
							<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
							<div class="work-list-top-con" onclick="parentNode.submit();">
								<div class="mem-info-img">
									<c:if test="${empty result.selectImg}">
										<img src="" alt=""><!-- 대표 이미지 -->
									</c:if>
									<c:if test="${not empty result.selectImg}">
										<c:choose>
											<c:when test="${result.selectImg == '1'}">
												<img src="<c:url value='/'/>images/profile-img-000.png" alt=""><!-- 대표 이미지 -->
											</c:when>
											<c:when test="${result.selectImg == '2'}">
												<img src="<c:url value='/'/>images/profile-img-001.png" alt=""><!-- 대표 이미지 -->
											</c:when>
											<c:when test="${result.selectImg == '3'}">
												<img src="<c:url value='/'/>images/profile-img-002.png" alt=""><!-- 대표 이미지 -->
											</c:when>
											<c:when test="${result.selectImg == '4'}">
												<img src="<c:url value='/'/>images/profile-img-003.png" alt=""><!-- 대표 이미지 -->
											</c:when>
											<c:otherwise>
												<c:if test="${empty result.imgUrl}">
													<img src="" alt=""><!-- 대표 이미지 -->
												</c:if>
												<c:if test="${not empty result.imgUrl}">
													<img src="<c:url value='/cmm/fms/getImage.do?atchFileId=${egovc:encrypt(result.imgUrl)}&fileSn=0'/>" alt=""><!-- 대표 이미지 -->
												</c:if>
											</c:otherwise>
										</c:choose>

									</c:if>
								</div>
								<div class="work-title-info">
									<div class="work-title"><c:out value="${result.nttSj}" escapeXml="false" /></div>
									<div class="work-date-info">
										<div class="work-mem-name"><c:out value="${result.teamNm}" escapeXml="false" /></div>
										<div class="work-date"><c:out value="${fn:replace(result.frstRegisterPnttm, '-', '.')}" escapeXml="false" /></div>
									</div>
								</div>
							</div>
							<div class="work-desc" onclick="parentNode.submit();">
								<c:out value="${result.nttCn}" escapeXml="false" />
							</div>
							<div class="work-info-con" onclick="parentNode.submit();">
								<div class="work-info-list">
									<svg xmlns="http://www.w3.org/2000/svg" version="1.0" width="30px" height="30px"
										 viewBox="0 0 1280.000000 1222.000000" preserveAspectRatio="xMidYMid meet">
										<g stroke="none" fill="#FFC107"
										   transform="translate(0.000000,1222.000000) scale(0.100000,-0.100000)">
											<path d="M6273 12205 c-115 -32 -205 -96 -266 -187 -19 -29 -304 -602 -635 -1273 -330 -671 -719 -1461 -864 -1755 l-264 -535 -220 -32 c-3672 -539 -3667 -538 -3722 -557 -100 -35 -199 -123 -248 -219 -76 -148 -69 -309 18 -454 23 -37 448 -457 1450 -1430 1270 -1233 1418 -1380 1413 -1403 -2 -14 -39 -223 -80 -465 -42 -242 -111 -645 -155 -895 -43 -250 -124 -718 -180 -1040 -56 -322 -135 -778 -176 -1015 -90 -512 -92 -552 -30 -680 102 -216 358 -320 574 -233 31 13 836 432 1788 931 l1731 906 804 -420 c442 -231 1223 -640 1734 -907 512 -268 953 -495 980 -504 63 -22 202 -23 268 -3 111 33 228 129 277 225 29 57 50 146 50 212 0 32 -41 292 -90 578 -138 795 -261 1506 -371 2145 -56 319 -124 716 -153 882 l-52 303 1422 1392 c965 944 1432 1408 1453 1442 43 71 62 130 68 211 16 208 -126 413 -324 468 -32 9 -379 61 -770 117 -392 55 -1034 145 -1425 200 -392 56 -868 123 -1058 150 -190 26 -419 58 -510 71 -91 12 -170 27 -177 33 -6 6 -399 799 -873 1761 -473 963 -877 1774 -898 1804 -44 65 -131 131 -210 161 -74 29 -207 36 -279 15z"/>
										</g>
									</svg>
									<span><c:out value='${result.scoreA}'/>(<c:out value='${result.scoreCnt}'/>)</span>
								</div>
								<div class="work-info-list">
									<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 35 35"
										 fill="none">
										<path d="M32.0837 32.0827L26.2503 26.2493H5.10449C4.52116 26.2493 4.01074 26.0306 3.57324 25.5931C3.13574 25.1556 2.91699 24.6452 2.91699 24.0618V5.10352C2.91699 4.52018 3.13574 4.00977 3.57324 3.57227C4.01074 3.13477 4.52116 2.91602 5.10449 2.91602H29.8962C30.4795 2.91602 30.9899 3.13477 31.4274 3.57227C31.8649 4.00977 32.0837 4.52018 32.0837 5.10352V32.0827ZM5.10449 24.0618H27.1982L29.8962 26.9785V5.10352H5.10449V24.0618Z"
											  fill="#454545"/>
									</svg>
									<span><c:out value='${result.commentCnt}'/></span>
								</div>
								<div class="work-info-list">
									<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 35 35"
										 fill="none">
										<path d="M17.5041 22.9694C19.2268 22.9694 20.6898 22.3664 21.8929 21.1603C23.096 19.9543 23.6976 18.4899 23.6976 16.7671C23.6976 15.0443 23.0946 13.5814 21.8885 12.3783C20.6825 11.1751 19.2181 10.5736 17.4953 10.5736C15.7725 10.5736 14.3096 11.1766 13.1064 12.3826C11.9033 13.5887 11.3018 15.0531 11.3018 16.7759C11.3018 18.4986 11.9048 19.9616 13.1108 21.1647C14.3169 22.3678 15.7813 22.9694 17.5041 22.9694ZM17.4909 20.8548C16.3544 20.8548 15.3912 20.4569 14.6012 19.6612C13.8113 18.8657 13.4163 17.8995 13.4163 16.7627C13.4163 15.6262 13.8142 14.663 14.61 13.873C15.4055 13.0831 16.3717 12.6882 17.5084 12.6882C18.645 12.6882 19.6082 13.086 20.3981 13.8818C21.188 14.6773 21.583 15.6435 21.583 16.7802C21.583 17.9168 21.1851 18.88 20.3894 19.6699C19.5938 20.4599 18.6277 20.8548 17.4909 20.8548ZM17.4997 27.709C13.9511 27.709 10.7427 26.7003 7.87467 24.6829C5.00662 22.6656 2.86773 20.0284 1.45801 16.7715C2.86773 13.5145 5.00662 10.8774 7.87467 8.86003C10.7427 6.84266 13.9511 5.83398 17.4997 5.83398C21.0483 5.83398 24.2566 6.84266 27.1247 8.86003C29.9927 10.8774 32.1316 13.5145 33.5413 16.7715C32.1316 20.0284 29.9927 22.6656 27.1247 24.6829C24.2566 26.7003 21.0483 27.709 17.4997 27.709ZM17.4935 25.5215C20.4386 25.5215 23.1446 24.7255 25.6117 23.1335C28.0787 21.5414 29.9563 19.4208 31.2445 16.7715C29.9563 14.1222 28.0807 12.0015 25.6179 10.4095C23.155 8.81749 20.451 8.02148 17.5059 8.02148C14.5608 8.02148 11.8547 8.81749 9.3877 10.4095C6.92068 12.0015 5.03092 14.1222 3.71842 16.7715C5.03092 19.4208 6.91862 21.5414 9.3815 23.1335C11.8444 24.7255 14.5484 25.5215 17.4935 25.5215Z"
											  fill="#454545"/>
									</svg>
									<span><c:out value="${result.inqireCo}"/></span>
								</div>
							</div>
							<div class="work-vote-con" onclick="parentNode.submit();">
								<div class="work-vote">
									<div class="work-vote-title">평가하기</div>
									<div>
										<div class="star-rating" data-rating="<c:out value="${result.score}" default="0" />">
											<span class="star" data-value="1">&#9733;</span>
											<span class="star" data-value="2">&#9733;</span>
											<span class="star" data-value="3">&#9733;</span>
											<span class="star" data-value="4">&#9733;</span>
											<span class="star" data-value="5">&#9733;</span>
										</div>
										<span class="work-vote-score">
											<span><c:out value="${result.score}" default="0" /></span>/5
										</span>
									</div>
								</div>
								<div class="work-vote-btn-con">
									<div class="vote-btn">
										평가하기
									</div>
								</div>
							</div>
						</form>
					</c:forEach>
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