<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<c:choose>
		<c:when test="${param.v == 'dev'}">
			<!-- 1 -->
			<link rel="preload" href="<c:url value='/'/>css/coming-soon-temp.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
		</c:when>
		<c:otherwise>
			<!-- 2 -->
			<link rel="preload" href="<c:url value='/'/>css/coming-soon.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
		</c:otherwise>
	</c:choose>

	<!-- 비동기
	============================================= -->
	<link rel="stylesheet" href="<c:url value='/'/>css/swiper.css" type="text/css" media="print" onload="this.media='all'" />
	<link rel="stylesheet" href="<c:url value='/'/>css/font-icons.css" type="text/css" media="print" onload="this.media='all'" />
	<link rel="stylesheet" href="<c:url value='/'/>css/animate.css" type="text/css" media="print" onload="this.media='all'" />
	<link rel="stylesheet" href="<c:url value='/'/>css/magnific-popup.css" type="text/css" media="print" onload="this.media='all'" />

	<noscript>
		<link rel="stylesheet" href="<c:url value='/'/>css/reset.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/styles.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/swiper.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/font-icons.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/animate.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/magnific-popup.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/responsive.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/coming-soon.css">
	</noscript>

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
		function fn_contest_history_file_down() {
			// 공모전 역대 수상작
			fn_egov_downFile('lOL6JF8m5ZoPksOpjrNiuaGtkjLqYcjbsZZFEt1UnqxX9dgmJjJ+3mWoSYu1PsdTeEQo1bzVt9EUDFB5K1/5NA==','0');
		}

		//-->
	</script>

</head>

<body class="no-transition stretched">

<!-- Document Wrapper
============================================= -->
<div id="wrapper" class="clearfix">

	<!-- header start -->
	<c:import url="/sym/mms/ContHeader.do" />
	<!-- //header end -->

	<!-- Content
            ============================================= -->
	<div id="content">
		<section class="banner-wrap">
			<div class="container">
				<div class="small-title">
					2025 AI 아이디어
				</div>
				<div class="big-title">
					챌린지 공모전
				</div>
				<div class="banner-desc">
					우수작에게는 소중한 상금과 다양한 혜택이 주어집니다.<br/>
					여러분의 아이디어를 세상에 펼쳐보세요!
				</div>
				<div class="date-box">
					<span class="date-tag">접수시작</span>
					<span class="date-text">2025.04.28 (월) 09:00 </span>
				</div>
				<div class="date-counter">
					<svg xmlns="http://www.w3.org/2000/svg" width="51" height="52" viewBox="0 0 51 52" fill="none">
						<path d="M33.0438 36.4613L35.6293 33.8762L27.3769 25.5887V15.2113H23.8356V27.005L33.0438 36.4613ZM25.5 47.5469C22.5841 47.5469 19.8335 46.9891 17.2481 45.8734C14.6627 44.7578 12.4077 43.2379 10.4832 41.3137C8.55897 39.3892 7.03906 37.1342 5.92344 34.5488C4.80781 31.9634 4.25 29.2127 4.25 26.2969C4.25 23.381 4.80781 20.6304 5.92344 18.045C7.03906 15.4596 8.55897 13.2046 10.4832 11.28C12.4077 9.35584 14.6627 7.83594 17.2481 6.72031C19.8335 5.60469 22.5841 5.04688 25.5 5.04688C28.4159 5.04688 31.1665 5.60469 33.7519 6.72031C36.3373 7.83594 38.5923 9.35584 40.5168 11.28C42.441 13.2046 43.9609 15.4596 45.0766 18.045C46.1922 20.6304 46.75 23.381 46.75 26.2969C46.75 29.2127 46.1922 31.9634 45.0766 34.5488C43.9609 37.1342 42.441 39.3892 40.5168 41.3137C38.5923 43.2379 36.3373 44.7578 33.7519 45.8734C31.1665 46.9891 28.4159 47.5469 25.5 47.5469ZM25.5 44.005C30.3758 44.005 34.5461 42.2726 38.0109 38.8078C41.4758 35.343 43.2082 31.1727 43.2082 26.2969C43.2082 21.4211 41.4758 17.2508 38.0109 13.7859C34.5461 10.3211 30.3758 8.58872 25.5 8.58872C20.6242 8.58872 16.4539 10.3211 12.9891 13.7859C9.52425 17.2508 7.79184 21.4211 7.79184 26.2969C7.79184 31.1727 9.52425 35.343 12.9891 38.8078C16.4539 42.2726 20.6242 44.005 25.5 44.005Z" fill="white"/>
					</svg>
					<span id="dDayCounter"></span>
				</div>
			</div>
		</section>
		<section class="info-wrap">
			<div class="container">
				<div class="info-box" onClick="openPopup('posterPop')">
					<div class="info-img">
						<dotlottie-player src="https://lottie.host/df93cec7-8ffa-4cbc-bd77-e4aa3732f340/gYudwl74Ca.lottie" background="transparent" speed="1" autoplay></dotlottie-player>
					</div>
					<div class="info-text">
						<div class="info-title">공모전 포스터</div>
						<div class="info-desc">
							공모전의 자세한 정보를
							확인하려면 여기를 클릭하세요.
						</div>
					</div>
				</div>
				<div class="info-box" onClick="fn_contest_attach_file_down()">
					<div class="info-img">
						<dotlottie-player src="https://lottie.host/143df90d-ce22-4a46-829c-6af03e8a6209/GlKeFId9yw.lottie" background="transparent" speed="1" autoplay></dotlottie-player>
					</div>
					<div class="info-text">
						<div class="info-title">신청서 다운로드</div>
						<div class="info-desc">
							신청서를 다운로드하여 작성
							후 제출해 주세요.
						</div>
					</div>
				</div>
				<div class="info-box" onClick="fn_contest_history_file_down()">
					<div class="info-img">
						<dotlottie-player src="https://lottie.host/20f4c33b-f835-49bb-a346-f49d4dc70d75/9OkpJWJkyl.lottie" background="transparent" speed="1" autoplay></dotlottie-player>
					</div>
					<div class="info-text">
						<div class="info-title">
							역대수상작
						</div>
						<div class="info-desc">
							역대 수상작을 확인하려면
							여기를 클릭하세요
						</div>
					</div>
				</div>
				<div class="info-box" style="background-color: #EDF3FF">
					<div class="info-img">
						<dotlottie-player src="https://lottie.host/9082124a-6e07-4b75-a607-776f501789fa/CSnjSWTPhY.lottie" background="transparent" speed="1" autoplay></dotlottie-player>
					</div>
					<div class="info-text">
						<div class="info-title">
							공모전 신청서 접수
						</div>
						<div class="info-desc">
							<strong>4월 28일</strong>부터 <strong>6월 5일</strong>까지 가능합니다.
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- #content end -->

	<div class="popup-wrap" id="posterPop">
		<div class="popup-content">
			<img src="<c:url value='/'/>images/poster-img.jpg" alt="" style="max-height: 100%;">
		</div>
		<div class="popup-close">
			<svg xmlns="http://www.w3.org/2000/svg" width="40px" height="40px" viewBox="0 0 24 24" fill="none">
				<path fill-rule="evenodd" clip-rule="evenodd" d="M5.29289 5.29289C5.68342 4.90237 6.31658 4.90237 6.70711 5.29289L12 10.5858L17.2929 5.29289C17.6834 4.90237 18.3166 4.90237 18.7071 5.29289C19.0976 5.68342 19.0976 6.31658 18.7071 6.70711L13.4142 12L18.7071 17.2929C19.0976 17.6834 19.0976 18.3166 18.7071 18.7071C18.3166 19.0976 17.6834 19.0976 17.2929 18.7071L12 13.4142L6.70711 18.7071C6.31658 19.0976 5.68342 19.0976 5.29289 18.7071C4.90237 18.3166 4.90237 17.6834 5.29289 17.2929L10.5858 12L5.29289 6.70711C4.90237 6.31658 4.90237 5.68342 5.29289 5.29289Z" fill="#fff"/>
			</svg>
		</div>
	</div>


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
	function diffDay(){
		const endDate = new Date("2025-04-28 09:00:00");
		const nowDate = new Date();

		const diff = endDate - nowDate;

		const diffDay = String(Math.floor(diff / (1000 * 60 * 60 * 24)));
		const diffHour = String(Math.floor(diff / (1000 * 60 * 60) % 24)).padStart(2, '0');
		const diffMin = String(Math.floor(diff / (1000 * 60) % 60)).padStart(2, '0');
		const diffSec = String(Math.floor(diff / 1000 % 60)).padStart(2, '0');
		const diffDayHourMinSec = "D-"+ diffDay+"일 " + diffHour + "시 " + diffMin + "분 " + diffSec + "초";

		$('#dDayCounter').text(diffDayHourMinSec);
	}

	$(document).ready(function(){
		diffDay();
		setInterval(diffDay, 1000);
	});

	function openPopup(id){
		if($('#'+id)){
			$('body').css('overflow', 'hidden');
			$('#'+id).show();
		}
	}

	$('.popup-close').on('click', function(e) {
		$('body').css('overflow', '');
		if($(e.target).closest('.popup-wrap')) $(e.target).closest('.popup-wrap').hide();
	});

</script>
</body>
</html>