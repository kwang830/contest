<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

	<script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>


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
						작품접수
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
				<c:if test="${not empty resultList}">
				<div class="receipt-info-con">
					<div class="receipt-info-text">신청서를 다운로드하여 작성 후 제출해 주세요.</div>
					<div class="receipt-info-btn-con">
						<a href="#" class="receipt-info-btn download" onClick="fn_contest_attach_file_down(); return false;">신청서 다운로드</a>
						<a href="/cmm/contest/apfrRcipUpdt.do" class="receipt-info-btn">작품 접수하기</a>
					</div>
				</div>
				<div class="work-list-con">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<form name="subForm" method="post" action="<c:url value='/cmm/contest/apfrRcipDetail.do'/>" class="work-list">
							<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
							<input type="hidden" name="nttId" value="<c:out value="${result.nttId}"/>" />
							<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
							<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
							<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
							<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
							<div class="work-list-top-con" onclick="parentNode.submit();">
								<div class="mem-info-img">
									<c:if test="${empty result.imgUrl}">
										<img src="" alt=""><!-- 대표 이미지 -->
									</c:if>
									<c:if test="${not empty result.imgUrl}">
										<img src="<c:url value='/cmm/fms/getImage.do?atchFileId=${egovc:encrypt(result.imgUrl)}&fileSn=0'/>" alt=""><!-- 대표 이미지 -->
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
						</form>
					</c:forEach>
				</div>
				</c:if>
				<c:if test="${empty resultList}">
				<div class="nodata-con">
					<div class="nodata-icon">
						<dotlottie-player src="https://lottie.host/7bbd4abc-c087-4ac9-8873-762c79c871d1/2mCoTPS66L.lottie" background="transparent" speed="1" autoplay></dotlottie-player>
					</div>
					<div class="nodata-text">
						아직 접수한 작품이 없습니다.<br/>
						<span>"신청서 다운로드"</span> 하여 작성 후,<br/> 작품을 등록해주세요.
					</div>
					<div class="nodata-btn-con">
						<a href="#" class="nodata-btn download" onClick="fn_contest_attach_file_down(); return false;">신청서 다운로드</a>
						<a href="/cmm/contest/apfrRcipUpdt.do" class="nodata-btn">작품 접수하기</a>
					</div>
				</div>
				</c:if>

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