<%--
  Class Name : EgovMainView.jsp
  Description : 메인화면
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31
--%>
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
	<title>IBK시스템 AI공모전</title>

</head>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

        <!-- header start -->
	    <c:import url="/sym/mms/ContHeader.do" />
	    <!-- //header end -->

		<section id="slider" class="slider-element slider-parallax swiper_wrapper clearfix">

			<div class="slider-parallax-inner">

				<div class="swiper-container swiper-parent">
					<div class="swiper-wrapper">
						<div class="swiper-slide dark" style="background-image: url('<c:url value='/'/>images/slider/swiper/22.jpg'); background-position: center top;">
							<div class="container clearfix">
								<div class="slider-caption slider-caption-center">
									<h2 data-animate="fadeInUp">미래를 여는 AI<br> 혁신을 향한 도전!</h2>
									<p class="d-none d-sm-block" data-animate="fadeInUp" data-delay="200">AI Opening the Future, Challenges for Innovation!</p>
								</div>
							</div>
						</div>
						<div class="swiper-slide dark" style="background-image: url('<c:url value='/'/>images/slider/swiper/18.jpg'); background-position: center top;">
							<div class="container clearfix">
								<div class="slider-caption slider-caption-right">
									<h2 data-animate="fadeInUp">미래를 여는 AI<br> 혁신을 향한 도전!</h2>
									<p class="d-none d-sm-block" data-animate="fadeInUp" data-delay="200">AI Opening the Future, Challenges for Innovation!</p>
								</div>
							</div>
						</div>
						<div class="swiper-slide dark" style="background-image: url('<c:url value='/'/>images/slider/swiper/17.jpg');">
							<div class="container clearfix">
								<div class="slider-caption slider-caption-left">
									<h2 data-animate="fadeInUp">Welcome to<br> AI공모전</h2>
									<p class="d-none d-sm-block" data-animate="fadeInUp" data-delay="200">AI공모전 홈페이지에 오신것을 환영합니다.</p>
								</div>
							</div>
						</div>
						<div class="swiper-slide dark" style="background-image: url('<c:url value='/'/>images/slider/swiper/16.jpg');">
							<div class="container clearfix">
								<div class="slider-caption slider-caption-center">
									<h2 data-animate="fadeInUp">AI 공모전에 참여하세요!</h2>
									<p class="d-none d-sm-block" data-animate="fadeInUp" data-delay="200">Act as if what you do makes a difference. It does.</p>
									<p class="d-none d-sm-block" data-animate="fadeInUp" data-delay="200">당신이 하는 일이 변화를 가져오는 것처럼 행동하세요. 실제로 그렇게 됩니다.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="slider-arrow-left"><i class="icon-angle-left"></i></div>
					<div class="slider-arrow-right"><i class="icon-angle-right"></i></div>
					<div class="slide-number"><div class="slide-number-current"></div><span>/</span><div class="slide-number-total"></div></div>
				</div>

			</div>

		</section>

		<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="promo promo-light promo-full bottommargin-sm header-stick notopborder">
					<div class="container clearfix">
						<h3><span><i class="icon-robot"></i>&nbsp;AI의 미래</span>, 당신의 손끝에서 시작됩니다!&nbsp;&nbsp;&nbsp;<span>IBK시스템 AI 아이디어 공모전.<i class="icon-line2-trophy"></i></span></h3>
						<a href="#" class="button button-dark button-xlarge button-rounded">신청서 다운로드</a>
					</div>
				</div>

				<div class="container clearfix">

					<div class="col_one_third nobottommargin col_background_etc1">
						<div class="feature-box fbox-center fbox-light fbox-effect nobottomborder">
							<div class="fbox-icon2">
								<i class="i-alt noborder icon-user21"></i>
							</div>
							<h3>공모전 문의
								<span class="subtitle">IT혁신사업본부 이진석 대리</span>
								<span class="t700">문의전화 : 02-3407-6074</span><br>
							</h3>
						</div>
					</div>

					<div class="col_one_third nobottommargin col_background_etc1">
						<div class="feature-box fbox-center fbox-light fbox-effect nobottomborder">
							<div class="fbox-icon2">
								<a href="#"><i class="i-alt noborder icon-megaphone"></i></a>
							</div>
							<h3>공모전 개요<span class="subtitle">2025년 AI 아이디어 공모전</span><span class="t700">↑↑ Click! ↑↑</span></h3>
						</div>
					</div>

					<div class="col_one_third nobottommargin col_last col_background_etc1">
						<div class="feature-box fbox-center fbox-light fbox-effect nobottomborder">
							<div class="fbox-icon2">
								<a href="#"><i class="i-alt noborder icon-hand-right"></i></a>
							</div>
							<h3>접수하기<span class="subtitle">공모전 참가 접수</span><span class="t700">↑↑ Click! ↑↑</span></h3>
						</div>
					</div>

					<div class="clear"></div><div class="line bottommargin-lg"></div>

					<div class="col_two_fifth nobottommargin">
						<a href="https://www.youtube.com/watch?v=LksdLk5Jqak" data-lightbox="iframe">
							<img src="<c:url value='/'/>images/others/1.jpg" alt="Image">
							<span class="i-overlay"><img src="<c:url value='/'/>images/icons/play.png" alt="Play"></span>
						</a>
					</div>

					<div class="col_three_fifth nobottommargin col_last">

						<div class="heading-block">
							<h2>공모전 홍보영상</h2>
						</div>

						<p>2023년 DT공모전부터 2025년 AI 아이디어 공모전까지 !</p>

						<div class="col_half nobottommargin">
							<ul class="iconlist iconlist-color nobottommargin">
								<li><i class="icon-caret-right"></i> Responsive Ready Layout</li>
								<li><i class="icon-caret-right"></i> Retina Display Supported</li>
								<li><i class="icon-caret-right"></i> Powerful &amp; Optimized Code</li>
								<li><i class="icon-caret-right"></i> 380+ Templates Included</li>
							</ul>
						</div>

						<div class="col_half nobottommargin col_last">
							<ul class="iconlist iconlist-color nobottommargin">
								<li><i class="icon-caret-right"></i> 12+ Headers &amp; Menu Designs</li>
								<li><i class="icon-caret-right"></i> Premium Sliders Included</li>
								<li><i class="icon-caret-right"></i> Light &amp; Dark Colors</li>
								<li><i class="icon-caret-right"></i> e-Commerce Design Included</li>
							</ul>
						</div>

					</div>

					<div class="clear"></div>

				</div>

				<div class="section topmargin-lg">
					<div class="container clearfix">

						<div class="heading-block center">
							<h2>AI공모전 소개</h2>
							<span>디지털기술을 활용한 혁신적이고 차별화된 아이디어를 발굴,
이를 실현하기 위한 도약점을 마련하고자 응모부터 평가까지 전 직원이 함께 참여하는
「너DO 나DO IT! DT 공모전」을 다음과 같이 추친합니다.</span>
						</div>

						<div class="clear bottommargin-sm"></div>

						<div class="col_one_third">
							<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-phone2"></i></a>
								</div>
								<h3>공모주제</h3>
								<p>우리가(너Do 나Do) 혁신(Just Do It!)하는 디지털 아이디어 공모전</p>
							</div>
						</div>

						<div class="col_one_third">
							<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-eye"></i></a>
								</div>
								<h3>행사 주관</h3>
								<p>IBK시스템 IT혁신사업본부</p>
							</div>
						</div>

						<div class="col_one_third col_last">
							<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="400">
								<div class="fbox-icon">
									<a href="#"><i class="icon-star2"></i></a>
								</div>
								<h3>응모 자격</h3>
								<p>당사직원 - 개인 또는 팀 (최대 3명)참가 , 多건 응모가능</p>
							</div>
						</div>
						
						<div class="clear bottommargin-sm"></div>

						<div class="col_one_third">
							<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-phone2"></i></a>
								</div>
								<h3>공모분야</h3>
								<p>AI를 활용한 아이디어(금융,기타)</p>
							</div>
						</div>

						<div class="col_one_third">
							<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-eye"></i></a>
								</div>
								<h3>접수 및 평가 일정</h3>
								<p>2025년 3월 0일~ 5월 0일</p>
							</div>
						</div>

						<div class="col_one_third col_last">
							<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="400">
								<div class="fbox-icon">
									<a href="#"><i class="icon-star2"></i></a>
								</div>
								<h3>시상 내역</h3>
								<p>대상 1건, 가족여행 상품권 (2백만원 상당)</p>
							</div>
						</div>

						<div class="clear"></div>

					</div>
				</div>

				<div class="container clearfix">

					<div class="heading-block center">
						<h3>공모전 <span>홍보 포스터</span></h3>
						<span>소개 자료 설명............</span>
					</div>

					<div id="oc-portfolio" class="owl-carousel portfolio-carousel portfolio-nomargin carousel-widget" data-margin="1" data-pagi="false" data-autoplay="5000" data-items-xs="1" data-items-sm="2" data-items-md="3" data-items-xl="4">

						<div class="oc-item">
							<div class="iportfolio">
								<div class="portfolio-image">
									<a href="portfolio-single.html">
										<img src="<c:url value='/'/>images/portfolio/contest/001.png" alt="Open Imagination">
									</a>
									<div class="portfolio-overlay">
										<a href="<c:url value='/'/>images/portfolio/contest/001.png" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
										<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
									</div>
								</div>
								<div class="portfolio-desc">
									<h3><a href="portfolio-single.html">DT공모전</a></h3>
									<span><a href="#">2023</a></span>
								</div>
							</div>
						</div>

						<div class="oc-item">
							<div class="iportfolio">
								<div class="portfolio-image">
									<a href="portfolio-single.html">
										<img src="<c:url value='/'/>images/portfolio/contest/002.png" alt="Locked Steel Gate">
									</a>
									<div class="portfolio-overlay">
										<a href="<c:url value='/'/>images/portfolio/contest/002.png" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
										<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
									</div>
								</div>
								<div class="portfolio-desc">
									<h3><a href="portfolio-single.html">DT공모전</a></h3>
									<span><a href="#">2023</a></span>
								</div>
							</div>
						</div>

						<div class="oc-item">
							<div class="iportfolio">
								<div class="portfolio-image">
									<a href="#">
										<img src="<c:url value='/'/>images/portfolio/contest/004.png" alt="Mac Sunglasses">
									</a>
									<div class="portfolio-overlay">
										<a href="<c:url value='/'/>images/portfolio/contest/004.png" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
										<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
									</div>
								</div>
								<div class="portfolio-desc">
									<h3><a href="portfolio-single.html">DT공모전</a></h3>
									<span><a href="#">2023</a></span>
								</div>
							</div>
						</div>

						<div class="oc-item">
							<div class="iportfolio">
								<div class="portfolio-image">
									<a href="#">
										<img src="<c:url value='/'/>images/portfolio/contest/005.png" alt="Mac Sunglasses">
									</a>
									<div class="portfolio-overlay">
										<a href="<c:url value='/'/>images/portfolio/contest/005.png" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
										<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
									</div>
								</div>
								<div class="portfolio-desc">
									<h3><a href="portfolio-single.html">DT공모전</a></h3>
									<span><a href="#">2023</a></span>
								</div>
							</div>
						</div>
						
						<div class="oc-item">
							<div class="iportfolio">
								<div class="portfolio-image">
									<a href="#">
										<img src="<c:url value='/'/>images/portfolio/contest/006.png" alt="Mac Sunglasses">
									</a>
									<div class="portfolio-overlay">
										<a href="<c:url value='/'/>images/portfolio/contest/006.png" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
										<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
									</div>
								</div>
								<div class="portfolio-desc">
									<h3><a href="portfolio-single.html">DT공모전</a></h3>
									<span><a href="#">2023</a></span>
								</div>
							</div>
						</div>
						
						<div class="oc-item">
							<div class="iportfolio">
								<div class="portfolio-image">
									<a href="#">
										<img src="<c:url value='/'/>images/portfolio/contest/007.png" alt="Mac Sunglasses">
									</a>
									<div class="portfolio-overlay">
										<a href="<c:url value='/'/>images/portfolio/contest/007.png" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
										<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
									</div>
								</div>
								<div class="portfolio-desc">
									<h3><a href="portfolio-single.html">DT공모전</a></h3>
									<span><a href="#">2023</a></span>
								</div>
							</div>
						</div>
						

					</div>

				</div>


				<a href="#" class="button button-full center tright footer-stick">
					<div class="container clearfix">
						당신의 창의적인 아이디어로 도전하세요!  <strong>참여하기</strong> <i class="icon-caret-right" style="top:4px;"></i>
					</div>
				</a>

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