
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 현재 페이지 URL 가져오기
	String currentPage = request.getRequestURI();
	//System.out.println("currentPage:"+currentPage);
%>
<script type="text/javascript">
	<!--
	function getLastLink(menuNo){
		const tNode = new Array;
		for (let i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
			tNode[i] = document.menuListForm.tmp_menuNm[i].value;
			const nValue = tNode[i].split("|");
			//선택된 메뉴(menuNo)의 하위 메뉴중 첫번재 메뉴의 링크정보를 리턴한다.
			if (nValue[1].toString()===menuNo) {
				if (nValue[5] && nValue[5] !== "dir" && nValue[5] !== "/") {
					// 링크 정보가 있으면 그대로 반환
					return nValue[5];
				} else {
					// 링크 정보가 없으면 하위 메뉴 중 첫 번째 메뉴의 링크 정보를 반환
					return getLastLink(nValue[0]);
				}

			}else if (nValue[0]===menuNo) {
				if (nValue[5] !== "dir" && nValue[5] !== "" && nValue[5] !== "/"){
					//링크정보가 있으면 링크정보를 리턴한다.
					return nValue[5];
				}
			}
		}
	}
	function goMenuPage(menuNo){
		document.getElementById("menuNo").value=menuNo;
		//document.getElementById("link").value=getLastLink(menuNo);
		document.menuListForm.action = "<c:url value='/'/>"+getLastLink(menuNo).substring(1);
		document.menuListForm.submit();
	}
	//-->
</script>
<!-- Header
		============================================= -->
		<header id="header" class="full-header">

			<div id="header-wrap">

				<div class="container">

					<div id="primary-menu-trigger">
						<!-- 햄버거 아이콘 -->
						<div class="icon-menu">
							<img src="<c:url value='/'/>images/icon-menu.png" alt="">
						</div>

						<!-- X 아이콘 -->
						<div class="icon-close">
							<img src="<c:url value='/'/>images/icon-close.png" alt="">
						</div>
					</div>

					<!-- Logo
					============================================= -->
					<div id="logo">
						<a href="/" class="standard-logo">
							<img src="<c:url value='/'/>images/logo-img.png" alt="AI 아이디어 챌린지 공모전">
						</a>
						<a href="/" class="retina-logo">
							<img src="<c:url value='/'/>images/logo-img@2x.png" alt="AI 아이디어 챌린지 공모전">
						</a>
					</div><!-- #logo end -->

					<div id="primary-menu-con">
						<!-- Primary Navigation
						============================================= -->
						<nav id="primary-menu">

							<ul>
								<c:forEach var="parent" items="${list_headmenu}">
									<c:if test="${parent.upperMenuId == 0}">
									<li>
										<a href="#LINK" onclick="goMenuPage('<c:out value="${parent.menuNo}"/>')">
											<c:out value="${parent.menuNm}"/>
										</a>

										<!-- 자식 개수 확인 -->
										<c:set var="childCount" value="0"/>
										<c:forEach var="childCheck" items="${list_headmenu}">
											<c:if test="${childCheck.upperMenuId == parent.menuNo}">
												<c:set var="childCount" value="${childCount + 1}"/>
											</c:if>
										</c:forEach>

										<!-- 자식이 2개 이상이면 ul 태그 생성 -->
										<c:if test="${childCount > 1}">
											<ul>
												<c:forEach var="child" items="${list_headmenu}">
													<c:if test="${child.upperMenuId == parent.menuNo}">
														<li>
															<a href="#LINK" onclick="goMenuPage('<c:out value="${child.menuNo}"/>')">
																<c:out value="${child.menuNm}"/>
															</a>
														</li>
													</c:if>
												</c:forEach>
											</ul>
										</c:if>

									</li>
									</c:if>
								</c:forEach>
								<li class="login-info-con">
							<%
								LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
								if (loginVO == null){
							%>

								<c:choose>
									<c:when test="${param.v == 'dev'}">
										<a href="/uat/uia/egovLoginUsr.do" class="login-menu">로그인</a>
									</c:when>
									<c:otherwise>
										<%--<a href="/uat/uia/egovLoginUsr.do" class="login-menu">로그인</a>--%>
									</c:otherwise>
								</c:choose>

							<%  }else{ %>
								<c:set var="loginName" value="<%= loginVO.getName()%>"/>
									<div class="mem-info-con">
										<div class="mem-info-img">
											<img src="" alt=""> <!--그룹웨어 이미지-->
										</div>
										<div>
											<div class="mem-info-text">디지털사업운영팀 차장 <c:out value="${loginName}" /></div>
											<a href="/uss/umt/edit/MyInfo.do" class="mem-info-btn">회원정보관리</a>
										</div>
									</div>
									<a href="/uat/uia/actionLogout.do" class="login-menu logout">
										로그아웃
									</a>

							<%  } %>
								</li>
							</ul>

						</nav><!-- #primary-menu end -->

						<% if (loginVO == null){ %>

						<c:choose>
							<c:when test="${param.v == 'dev'}">
								<a href="/uat/uia/egovLoginUsr.do" class="login-menu">로그인</a>
							</c:when>
							<c:otherwise>
								<%--<a href="/uat/uia/egovLoginUsr.do" class="login-menu">로그인</a>--%>
							</c:otherwise>
						</c:choose>

						<%  }else{ %>
						<div class="login-menu-con">
							<div class="mem-info-img">
								<img src="" alt=""> <!--그룹웨어 이미지-->
							</div>
							<ul class="mem-menu">
								<li>
									<a href="/uss/umt/edit/MyInfo.do">내정보관리</a>
								</li>
								<li class="mem-menu-logout">
									<a href="/uat/uia/actionLogout.do">로그아웃</a>
								</li>
							</ul>
						</div>
						<%  } %>
					</div>

				</div>

			</div>

			<form name="menuListForm" action ="" method="post">
				<input type="hidden" id="menuNo" name="menuNo" value="<%=session.getAttribute("menuNo")%>" />
				<input type="hidden" id="link" name="link" value="" />
				<div style="width:0; height:0;">
					<c:forEach var="result" items="${list_menulist}" varStatus="status" >
						<input type="hidden" name="tmp_menuNm" value="<c:out value='${result.menuNo}'/>|<c:out value='${result.upperMenuId}'/>|<c:out value='${result.menuNm}'/>|<c:out value='${result.relateImagePath}'/>|<c:out value='${result.relateImageNm}'/>|<c:out value='${result.chkURL}'/>|" />
					</c:forEach>
				</div>
			</form>

		</header><!-- #header end -->
