
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 현재 페이지 URL 가져오기
	String currentPage = request.getRequestURI();
	System.out.println("currentPage:"+currentPage);
%>
<script type="text/javascript">
	<!--
	function getLastLink(menuNo){
		var tNode = new Array;
		for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
			tNode[i] = document.menuListForm.tmp_menuNm[i].value;
			var nValue = tNode[i].split("|");
			//선택된 메뉴(menuNo)의 하위 메뉴중 첫번재 메뉴의 링크정보를 리턴한다.
			if (nValue[1]==menuNo) {
				if(nValue[5]!="dir" && nValue[5]!="" && nValue[5]!="/"){
					//링크정보가 있으면 링크정보를 리턴한다.
					return nValue[5];
				}else{
					//링크정보가 없으면 하위 메뉴중 첫번째 메뉴의 링크정보를 리턴한다.
					return getLastLink(nValue[0]);
				}
			}else if (nValue[0]==menuNo) {
				if(nValue[5]!="dir" && nValue[5]!="" && nValue[5]!="/"){
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

				<div class="container clearfix">

					<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

					<!-- Logo
					============================================= -->
					<div id="logo">
						<a href="/" class="standard-logo"><img src="<c:url value='/'/>images/logo-img.png" alt="AI공모전"></a>
						<a href="/" class="retina-logo"><img src="<c:url value='/'/>images/logo-img@2x.png" alt="AI공모전"></a>
					</div><!-- #logo end -->

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

							<%
								LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
								if(loginVO == null){
							%>
							<li class=""><a href="/uat/uia/egovLoginUsr.do"><div><i class="icon-line2-login"></i>로그인</div></a></li>
							<% }else{ %>
							<li class=""><a href="/uss/umt/mber/MyInfo.do"><div class="">내정보관리</div></a></li>
							<li class=""><c:out value="${loginName}" /> <a href="/uat/uia/actionLogout.do"><div><i class="icon-line2-logout"></i>로그아웃</div></a></li>
							<% } %>
						</ul>


					</nav><!-- #primary-menu end -->

				</div>

			</div>

			<form name="menuListForm" action ="" method="post">
				<input type="hidden" id="menuNo" name="menuNo" value="<%=session.getAttribute("menuNo")%>" />
				<input type="hidden" id="link" name="link" value="" />
				<div style="width:0px; height:0px;">
					<c:forEach var="result" items="${list_menulist}" varStatus="status" >
						<input type="hidden" name="tmp_menuNm" value="<c:out value='${result.menuNo}'/>|<c:out value='${result.upperMenuId}'/>|<c:out value='${result.menuNm}'/>|<c:out value='${result.relateImagePath}'/>|<c:out value='${result.relateImageNm}'/>|<c:out value='${result.chkURL}'/>|" />
					</c:forEach>
				</div>
			</form>

		</header><!-- #header end -->
