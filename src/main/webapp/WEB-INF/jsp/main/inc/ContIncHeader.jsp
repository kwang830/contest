
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 현재 페이지 URL 가져오기
	String currentPage = request.getRequestURI();
	System.out.println("currentPage:"+currentPage);
	System.out.println("currentPage:"+currentPage);
	System.out.println("currentPage:"+currentPage);
%>
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
							<li class="<%= currentPage.contains("ContestOvrvView.jsp") ? "current" : "" %>"><a href="/cmm/contest/contestOvrv.do"><div class="r_bar">공모개요</div></a></li>
							<li class="<%= currentPage.contains("ApfrRcipView.jsp") ? "current" : "" %>"><a href="/cmm/contest/apfrRcip.do"><div class="r_bar">신청서접수</div></a></li>
							<li class="<%= currentPage.contains("ContestVoteView.jsp") ? "current" : "" %>"><a href="/cmm/contest/contestVote.do"><div class="r_bar">공모전 투표</div></a></li>
							<li class="<%= currentPage.contains("ContestOtcmView.jsp") ? "current" : "" %>"><a href="/cmm/contest/contestOtcm.do"><div class="r_bar">공모전 성과</div></a></li>
							<li class=""><a href="#"><div class="r_bar">공통게시판</div></a>
								<ul>
									<li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA"><div><i class="icon-megaphone"></i>공지사항</div></a>
									<li><a href="/uss/olh/faq/FaqListInqire.do"><div><i class="icon-list-alt1"></i>FAQ</div></a>
									<li><a href="/uss/olh/qna/QnaListInqire.do"><div><i class="icon-comments-alt"></i>QNA</div></a>
								</ul>
							</li>
							<%
								// 관리자 권한의 경우 게시판 표시
								LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
								if(loginVO != null && loginVO.getUniqId().equals("USRCNFRM_00000000000")){
							%>
							<li class=""><a href="#"><div class="r_bar">시스템관리</div></a>
								<ul>
									<li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB"><div><i class="icon-comments-alt"></i>접수 내역</div></a>
									<li><a href="/sym/log/clg/userLgnHsty.do"><div><i class="icon-comments-alt"></i>로그인 이력</div></a>
									<li><a href="/cmm/contest/deptSttcPsst.do"><div><i class="icon-comments-alt"></i>부서 통계 현황</div></a>
									<li><a href="/uss/umt/mber/userMngm.do"><div><i class="icon-comments-alt"></i>사용자 정보 관리</div></a>
								</ul>
							</li>
							<% } %>
							<%
								if(loginVO == null){
							%>
							<li class=""><a href="/uat/uia/egovLoginUsr.do"><div><i class="icon-line2-login"></i>로그인</div></a></li>
							<% }else{ %>
							<li class=""><a href="/uss/umt/mber/MyInfo.do"><div class="r_bar">내정보관리</div></a></li>
							<li class=""><c:out value="${loginName}" /> <a href="/uat/uia/actionLogout.do"><div><i class="icon-line2-logout"></i>로그아웃</div></a></li>
							<% } %>
						</ul>


					</nav><!-- #primary-menu end -->

				</div>

			</div>

		</header><!-- #header end -->
