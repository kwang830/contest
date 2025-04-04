<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
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
    <link rel="preload" href="<c:url value='/'/>css/coming-soon.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

    <!-- 비동기
    ============================================= -->
    <link rel="stylesheet" href="<c:url value='/'/>css/swiper.css" type="text/css" media="print" onload="this.media='all'" />
    <link rel="stylesheet" href="<c:url value='/'/>css/font-icons.css" type="text/css" media="print" onload="this.media='all'" />
    <link rel="stylesheet" href="<c:url value='/'/>css/animate.css" type="text/css" media="print" onload="this.media='all'" />
    <link rel="stylesheet" href="<c:url value='/'/>css/magnific-popup.css" type="text/css" media="print" onload="this.media='all'" />

    <link rel="stylesheet" href="<c:url value='/'/>css/coming-soon.css" type="text/css">

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
    <title>IBK시스템 AI 아이디어 챌린지 - 회원관리</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="passwordChgVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.passwordChgVO.action = "<c:url value='/uss/umt/mber/EgovMberManage.do'/>";
    document.passwordChgVO.submit();
}
function fnUpdate(){
    if(validatePasswordChgVO(document.passwordChgVO)){
        if(document.passwordChgVO.newPassword.value != document.passwordChgVO.newPassword2.value){
            alert("<spring:message code='fail.user.passwordUpdate2' />");
            return;
        }
        document.passwordChgVO.submit();
    }
}
function fnPwReset(){
    document.passwordChgVO.action = "<c:url value='/uss/umt/mber/EgovMberPasswordReset.do'/>";
    document.passwordChgVO.submit();
}

<c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}' />");</c:if>
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

        <!-- Page Title
============================================= -->
        <section id="page-title">

            <div class="container clearfix">
                <h1>2025년 AI 아이디어 공모전</h1>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item" aria-current="page">Home</li>
                    <li class="breadcrumb-item active" aria-current="page">사용자관리</li>
                </ol>
            </div>

        </section><!-- #page-title end -->

        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">

								<form name="passwordChgVO" method="post" action="<c:url value="${'/uss/umt/mber/EgovMberPasswordUpdt.do'}"/>" >
						        <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
						        <input name="checkedIdForDel" type="hidden" />
						        <!-- 검색조건 유지 -->
						        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
						        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
						        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
						        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
						        <!-- 우편번호검색 -->
						        <input type="hidden" name="url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />

                                <h2>사용자관리</h2>

                                <div class="board_view2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="">일반회원아이디</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="mberId" id="mberId" class="f_txt" type="text" value="<c:out value='${mberManageVO.mberId}'/>" maxlength="20" readonly />
							                    <input name="uniqId" id="uniqId" type="hidden" value="<c:out value='${mberManageVO.uniqId}'/>" />
							                    <input name="userTy" id="userTy" type="hidden" value="<c:out value='${mberManageVO.userTy}'/>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">기존 비밀번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="oldPassword" id="oldPassword" class="f_txt" type="password" value="" maxlength="100" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">비밀번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="newPassword" id="newPassword" class="f_txt" type="password" value="" maxlength="100" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">비밀번호 확인</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="newPassword2" id="newPassword2" class="f_txt" type="password" value="" maxlength="100" />
                                            </td>
                                        </tr>

                                    </table>
                                </div>

                                <!-- 목록/저장버튼  시작-->
                                <input type="button" name="btn_cancel" id="btn_cancel" class="s_btn" value="취소" title="취소버튼" onclick="javascript:document.passwordChgVO.reset();" />
                                <input type="button" name="btn_save" id="btn_save" class="s_btn" value="저장" title="저장버튼" onclick="fnUpdate(); return false;" />
                                <input type="button" name="btn_save" id="btn_pw_reset" class="s_btn" value="비밀번호 초기화" title="초기화버튼" onclick="fnPwReset(); return false;" />
                                <input type="button" name="btn_list" id="btn_list" class="s_btn" value="목록" title="목록버튼" onclick="fnListPage(); return false;" />
                                <!-- 목록/저장버튼  끝-->

                                </form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer 시작 -->
        <c:import url="/sym/mms/ContFooter.do" />
        <!-- //footer 끝 -->
    </div>

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