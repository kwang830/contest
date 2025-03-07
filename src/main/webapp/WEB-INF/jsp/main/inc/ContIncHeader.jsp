
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Header
		============================================= -->
		<header id="header" class="full-header">

			<div id="header-wrap">

				<div class="container clearfix">

					<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

					<!-- Logo
					============================================= -->
					<div id="logo">
						<a href="/" class="standard-logo" data-dark-logo="images/logo-dark.png"><img src="<c:url value='/'/>images/logo.png" alt="AI공모전"></a>
						<a href="/" class="retina-logo" data-dark-logo="images/logo-dark@2x.png"><img src="<c:url value='/'/>images/logo@2x.png" alt="AI공모전"></a>
					</div><!-- #logo end -->

					<!-- Primary Navigation
					============================================= -->
					<nav id="primary-menu">

						<ul>
							<li class="current"><a href="/"><div class="r_bar">공모전 홈</div></a>
							</li>
							<li class=""><a href="/cmm/main/contIntroPage.do"><div class="r_bar">공모개요</div></a>
							</li>
							<li class=""><a href="/"><div class="r_bar">접수 및 평가</div></a>
							</li>
							<li><a href="#"><div class="r_bar">커뮤니티</div></a>
								<ul>
									<li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA"><div><i class="icon-megaphone"></i>공지사항</div></a>
									<li><a href="#"><div><i class="icon-image1"></i>홍보자료</div></a>
									<li><a href="#"><div><i class="icon-list-alt1"></i>FAQ</div></a>
									<li><a href="#"><div><i class="icon-comments-alt"></i>QNA</div></a>
									<li><a href="#"><div><i class="icon-download1"></i>신청서 다운로드</div></a>
								</ul>
							</li>
							<li class=""><a href="index.html"><div class="r_bar">공모전 성과</div></a></li>
							<li class=""><a href="index.html"><div><i class="icon-line2-login"></i>로그인</div></a></li>
						</ul>


					</nav><!-- #primary-menu end -->

				</div>

			</div>

		</header><!-- #header end -->
