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
	<link rel="stylesheet" as="style" crossorigin
		  href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css"/>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
		  rel="stylesheet">

	<!-- preload -->
	<link rel="preload" href="<c:url value='/'/>css/reset.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/responsive.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/main.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

	<!-- 비동기
	============================================= -->
	<link rel="stylesheet" href="<c:url value='/'/>css/font-icons.css" type="text/css" media="print" onload="this.media='all'" />
	<link rel="stylesheet" href="<c:url value='/'/>css/animate.css" type="text/css" media="print" onload="this.media='all'" />
	<link rel="stylesheet" href="<c:url value='/'/>css/magnific-popup.css" type="text/css" media="print" onload="this.media='all'" />
	<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" >
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>

	<noscript>
		<link rel="stylesheet" href="<c:url value='/'/>css/main.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/reset.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/styles.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/font-icons.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/animate.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/magnific-popup.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/responsive.css">
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
						미래를 여는 AI 혁신을 향한 도전!
					</div>
					<div class="date-box">
						<span class="date-tag">접수기간</span>
						<span class="date-text">2025. 04. 28 (월)~06. 05 (금)</span>
					</div>
					<div class="date-counter">
						<svg xmlns="http://www.w3.org/2000/svg" width="51" height="52" viewBox="0 0 51 52" fill="none">
							<path d="M33.0438 36.4613L35.6293 33.8762L27.3769 25.5887V15.2113H23.8356V27.005L33.0438 36.4613ZM25.5 47.5469C22.5841 47.5469 19.8335 46.9891 17.2481 45.8734C14.6627 44.7578 12.4077 43.2379 10.4832 41.3137C8.55897 39.3892 7.03906 37.1342 5.92344 34.5488C4.80781 31.9634 4.25 29.2127 4.25 26.2969C4.25 23.381 4.80781 20.6304 5.92344 18.045C7.03906 15.4596 8.55897 13.2046 10.4832 11.28C12.4077 9.35584 14.6627 7.83594 17.2481 6.72031C19.8335 5.60469 22.5841 5.04688 25.5 5.04688C28.4159 5.04688 31.1665 5.60469 33.7519 6.72031C36.3373 7.83594 38.5923 9.35584 40.5168 11.28C42.441 13.2046 43.9609 15.4596 45.0766 18.045C46.1922 20.6304 46.75 23.381 46.75 26.2969C46.75 29.2127 46.1922 31.9634 45.0766 34.5488C43.9609 37.1342 42.441 39.3892 40.5168 41.3137C38.5923 43.2379 36.3373 44.7578 33.7519 45.8734C31.1665 46.9891 28.4159 47.5469 25.5 47.5469ZM25.5 44.005C30.3758 44.005 34.5461 42.2726 38.0109 38.8078C41.4758 35.343 43.2082 31.1727 43.2082 26.2969C43.2082 21.4211 41.4758 17.2508 38.0109 13.7859C34.5461 10.3211 30.3758 8.58872 25.5 8.58872C20.6242 8.58872 16.4539 10.3211 12.9891 13.7859C9.52425 17.2508 7.79184 21.4211 7.79184 26.2969C7.79184 31.1727 9.52425 35.343 12.9891 38.8078C16.4539 42.2726 20.6242 44.005 25.5 44.005Z"
								  fill="white"/>
						</svg>
						<span id="dDayCounter"></span>
					</div>
					<div class="banner-btn-con">
						<a href="javascript:openPopup('posterPop');" class="banner-btn">공모개요</a>
						<a href="/cmm/contest/apfrRcip.do" class="banner-btn type2">작품접수하기</a>
					</div>
				</div>
				<div class="banner-bg">
					<div class="banner-left-bg">
						<img src="<c:url value='/'/>images/main-banner-left-bg.png" alt="" data-aos="fade-down-right" data-aos-duration="500">
					</div>
					<div class="banner-right-bg">
						<img src="<c:url value='/'/>images/main-banner-right-bg.png" alt="" data-aos="fade-up-left" data-aos-duration="500" data-aos-delay="100">
					</div>
					<div class="banner-ball">
						<img src="<c:url value='/'/>images/main-banner-ball.png" alt="" data-aos="zoom-in" data-aos-duration="700" data-aos-delay="300">
					</div>
				</div>
			</section>
			<section class="schedule-wrap">
				<div class="container">
					<div class="schedule-left-con">
						<div class="schedule-left-title">
							현재 AI 아이디어 챌린지 공모전<br/>
							<span>전체 신청건 수</span> 입니다.
						</div>
						<div class="counter schedule-counter">
							<span data-from="0" data-to="<c:out value="${empty contestBbsTotCnt ? 0 : contestBbsTotCnt}" />" data-refresh-interval="15" data-speed="4000" data-comma="true"><c:out value="${empty contestBbsTotCnt ? 0 : contestBbsTotCnt}" /></span>
							건
						</div>
					</div>
					<div class="schedule-right-con">
						<div class="schedule-right-title">
							공모전 일정
						</div>
						<div class="step-wrap">
							<div class="step-con">
								<!--일정 변경 시 data-start, data-end 속성이랑 step-date 내 텍스트 변경 필요-->
								<div class="step" data-start="2025-04-28" data-end="2025-06-05">
									<div class="step-progress"></div>
									<div class="step-text">
										<div class="step-tag">STEP1</div>
										<div class="step-title">신청서 접수</div>
										<div class="step-date">2025.04.28~06.05</div>
									</div>
								</div>
								<div class="step" data-start="2025-06-09" data-end="2025-06-20">
									<div class="step-progress"></div>
									<div class="step-text">
										<div class="step-tag">STEP2</div>
										<div class="step-title">예선 평가</div>
										<div class="step-date">2025.06.09~06.20</div>
									</div>
								</div>
								<div class="step" data-start="2025-07-14" data-end="2025-08-07">
									<div class="step-progress"></div>
									<div class="step-text">
										<div class="step-tag">STEP3</div>
										<div class="step-title">본선 1/2차 평가</div>
										<div class="step-date">2025.07.14~08.07</div>
									</div>
								</div>
								<div class="step" data-start="2025-08-21" data-end="2025-08-21">
									<div class="step-progress"></div>
									<div class="step-text">
										<div class="step-tag">STEP4</div>
										<div class="step-title">시상식</div>
										<div class="step-date">2025.08.21</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--직원 평가 페이지 작업 후 추가 예정-->
			<section class="work-wrap" style="display: none;">
				<div class="container">
					<div class="work-title">
						본선 1차 직원 평가
					</div>
					<div class="work-desc">
						작품평가만 해도 많은 경품과 상품을 드립니다.<br/>
						작품평가 해보세요.
					</div>
					<a href="javascript:void(0)" class="work-btn">
						평가하러가기
						<svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 21 21" fill="none">
							<path d="M16.5312 11.6746H0.5V9.59149H16.5312L9.03125 2.09149L10.5 0.633057L20.5 10.6331L10.5 20.6331L9.03125 19.1746L16.5312 11.6746Z"
								  fill="white"/>
						</svg>
					</a>
				</div>
				<div class="work-dim"></div>
			</section>
			<section class="history-wrap">
				<div class="history-con">
					<div class="history-title">
						공모전 <span>History</span>
					</div>
					<div class="history-desc">
						AI공모전 History를 확인해보세요!
					</div>
					<div class="swiper-btn-con">
						<div class="swiper-btn swiper-button-prev">
							<svg xmlns="http://www.w3.org/2000/svg" width="12" height="21" viewBox="0 0 12 21" fill="none">
								<path d="M4.06117 10.9721L11.8915 2.91666L9.97453 0.94458L0.226808 10.9721L9.97453 21L11.8915 19.0279L4.06117 10.9721Z"
									  fill="#1F1F1F"/>
							</svg>
						</div>
						<div class="swiper-btn swiper-button-next">
							<svg xmlns="http://www.w3.org/2000/svg" width="12" height="21" viewBox="0 0 12 21" fill="none">
								<path d="M8.01195 10.9721L0.18161 2.91666L2.09859 0.94458L11.8463 10.9721L2.09859 21L0.18161 19.0279L8.01195 10.9721Z"
									  fill="#1F1F1F"/>
							</svg>
						</div>
						<div class="swiper-btn plus-btn" onClick="window.location.href='/cmm/contest/contestOtcm.do';">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
								<path d="M10.591 13.3887H0.60022V10.6112H10.591V0.333252H13.2908V10.6112H23.2816V13.3887H13.2908V23.6666H10.591V13.3887Z"
									  fill="white"/>
							</svg>
						</div>
					</div>
				</div>
				<div class="history-img-con" id="historySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="<c:url value='/'/>images/history-img-000.jpg" alt="">
						</div>
						<div class="swiper-slide">
							<img src="<c:url value='/'/>images/history-img-001.jpg" alt="">
						</div>
						<div class="swiper-slide">
							<img src="<c:url value='/'/>images/history-img-002.jpg" alt="">
						</div>
						<div class="swiper-slide">
							<img src="<c:url value='/'/>images/history-img-003.jpg" alt="">
						</div>
					</div>
				</div>
			</section>
			<section class="notice-wrap">
				<div class="container">
					<div class="info-con">
						<div class="notice-title">
							공모전 문의전화
						</div>
						<div class="notice-desc">
							AI공모전 문의
						</div>
						<div class="info-manager">
							(주)IBK 시스템 ・AI공모전 담당자<br/>
							<span>이진석 대리</span>
						</div>
						<div class="info-tel">
							02-3407-6074
						</div>
						<div class="info-icon">
							<img src="<c:url value='/'/>images/inquiry-icon.png" alt="">
						</div>
					</div>
					<div class="notice-con">
						<div class="notice-title">
							공지사항
						</div>
						<div class="notice-desc">
							AI공모전 <span>공지사항</span>을 확인해보세요!
						</div>
						<div class="swiper-btn-con">
							<div class="swiper-btn swiper-button-prev">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="21" viewBox="0 0 12 21"
									 fill="none">
									<path d="M4.06117 10.9721L11.8915 2.91666L9.97453 0.94458L0.226808 10.9721L9.97453 21L11.8915 19.0279L4.06117 10.9721Z"
										  fill="#1F1F1F"/>
								</svg>
							</div>
							<div class="swiper-btn swiper-button-next">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="21" viewBox="0 0 12 21"
									 fill="none">
									<path d="M8.01195 10.9721L0.18161 2.91666L2.09859 0.94458L11.8463 10.9721L2.09859 21L0.18161 19.0279L8.01195 10.9721Z"
										  fill="#1F1F1F"/>
								</svg>
							</div>
							<div class="swiper-btn plus-btn" onClick="window.location.href='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA';">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
									 fill="none">
									<path d="M10.591 13.3887H0.60022V10.6112H10.591V0.333252H13.2908V10.6112H23.2816V13.3887H13.2908V23.6666H10.591V13.3887Z"
										  fill="white"/>
								</svg>
							</div>
						</div>
						<div class="notice-list-con" id="noticeSwiper">
							<div class="swiper-wrapper">

								<c:forEach var="result" items="${notiList}" begin="0" end="10" step="1" varStatus="status">
									<c:if test="${!(result.isExpired=='Y' || result.useAt == 'N')}">
									<div class="swiper-slide">
										<div class="swiper-slide-inner">
											<div class="notice-list-year"><c:out value="${fn:substring(result.frstRegisterPnttm,0,4)}"/></div>
											<div class="notice-list-date"><c:out value="${fn:substring(result.frstRegisterPnttm,5,7)}.${fn:substring(result.frstRegisterPnttm,8,10)}"/></div>
											<div class="notice-list-title">
												<c:choose>
													<c:when test="${fn:length(result.nttSj) > 51 }">
														<c:out value="${fn:substring(result.nttSj, 0, 50)}" escapeXml="false" />...
													</c:when>
													<c:otherwise>
														<c:out value="${result.nttSj }" escapeXml="false" />
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
									</c:if>
								</c:forEach>

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
					<path fill-rule="evenodd" clip-rule="evenodd"
						  d="M5.29289 5.29289C5.68342 4.90237 6.31658 4.90237 6.70711 5.29289L12 10.5858L17.2929 5.29289C17.6834 4.90237 18.3166 4.90237 18.7071 5.29289C19.0976 5.68342 19.0976 6.31658 18.7071 6.70711L13.4142 12L18.7071 17.2929C19.0976 17.6834 19.0976 18.3166 18.7071 18.7071C18.3166 19.0976 17.6834 19.0976 17.2929 18.7071L12 13.4142L6.70711 18.7071C6.31658 19.0976 5.68342 19.0976 5.29289 18.7071C4.90237 18.3166 4.90237 17.6834 5.29289 17.2929L10.5858 12L5.29289 6.70711C4.90237 6.31658 4.90237 5.68342 5.29289 5.29289Z"
						  fill="#fff"/>
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
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

	<script>
		AOS.init();

		$(function () {
			function diffDay() {
				const endDate = new Date("2025-06-05 23:59:59");
				const nowDate = new Date();

				const diff = endDate - nowDate;

				const diffDay = String(Math.floor(diff / (1000 * 60 * 60 * 24)));
				const diffHour = String(Math.floor(diff / (1000 * 60 * 60) % 24)).padStart(2, '0');
				const diffMin = String(Math.floor(diff / (1000 * 60) % 60)).padStart(2, '0');
				const diffSec = String(Math.floor(diff / 1000 % 60)).padStart(2, '0');
				const diffDayHourMinSec = "D-"+ diffDay+"일 " + diffHour + "시 " + diffMin + "분 " + diffSec + "초";

				$('#dDayCounter').text(diffDayHourMinSec);
			}

			diffDay();
			setInterval(diffDay, 1000);

			// 공모전 일정
			function getActiveStepIndex() {
				const now = new Date();
				const $steps = $('.step-con .step');

				const stepsData = $steps.map(function (index) {
					const start = new Date($(this).data('start'));
					const end = new Date($(this).data('end'));
					return {index, start, end};
				}).get();

				// 1. 현재 포함된 구간 찾기
				for (let step of stepsData) {
					if (now >= step.start && now <= step.end) {
						return step.index;
					}
				}

				// 2. 포함된 구간이 없다면, 지금보다 start가 더 나중인 것 중 가장 빠른 것
				for (let step of stepsData) {
					if (now < step.start) {
						return step.index;
					}
				}

				// 3. 모든 스텝이 지났으면 마지막 걸 active로
				return stepsData.length - 1;
			}


			function animateSteps(activeIndex) {
				const $steps = $('.step-con .step');
				const duration = 700; // duration 수정 시 css - moveProgressBar duration도 수정 필요

				$steps.removeClass('end active'); // 초기화

				$steps.each(function (index) {
					if (index < activeIndex) {
						setTimeout(() => {
							$(this).addClass('end');
						}, index * duration);
					} else if (index === activeIndex) {
						setTimeout(() => {
							$(this).addClass('active');
						}, index * duration);
					}
				});
			}

			const index = getActiveStepIndex();
			animateSteps(index);

			// 공모전 History
			new Swiper('#historySwiper', {
				direction: 'horizontal',
				slidesPerView: 'auto',
				centeredSlides: true,
				loop: true,
				autoplay: {
					delay: 5000,   // 시간 설정
					disableOnInteraction: false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
				},
				navigation: {
					nextEl: '.history-wrap .swiper-button-next',
					prevEl: '.history-wrap .swiper-button-prev',
				},
				breakpoints: {
					// 모바일 (예: 768px 이하)
					0: {
						spaceBetween: 20,
					},
					// PC (예: 769px 이상)
					769: {
						spaceBetween: 40,
					}
				}
			});

			// 공지사항
			new Swiper('#noticeSwiper', {
				direction: 'horizontal',
				slidesPerView: 'auto',
				loop: true,
				autoplay: {
					delay: 8000,
					disableOnInteraction: false,
				},
				navigation: {
					nextEl: '.notice-wrap .swiper-button-next',
					prevEl: '.notice-wrap .swiper-button-prev',
				},
				breakpoints: {
					// 모바일 (예: 768px 이하)
					0: {
						centeredSlides: true,
						spaceBetween: 20,
					},
					// PC (예: 769px 이상)
					769: {
						centeredSlides: false,
						spaceBetween: 20,
					}
				}
			});
		})

		function openPopup(id) {
			if ($('#' + id)) {
				$('body').css('overflow', 'hidden');
				$('#' + id).show();
			}
		}

		$('.popup-close').on('click', function (e) {
			$('body').css('overflow', '');
			if ($(e.target).closest('.popup-wrap')) $(e.target).closest('.popup-wrap').hide();
		})
	</script>
</body>
</html>