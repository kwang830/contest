<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>IBK시스템, AI 아이디어 챌린지 - 공모전 성과</title>

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

	<h3>공모전 준비중</h3>

	<input type="button" class="s_btn" value="신청서 다운로드" title="다운로드 버튼" onclick="fn_contest_attach_file_down(); return false;" />

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