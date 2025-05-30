<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <link rel="stylesheet" href="<c:url value='/'/>css/sub-ios.css" type="text/css" media="all" />
    <link rel="preload" href="<c:url value='/'/>css/form.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

    <style>
        .form-error-text {
            color: red !important;
            font-size: 1.2em !important;
            margin-top: 4px !important;
            display: none;
        }
    </style>


    <!-- Document Title
    ============================================= -->
    <title>IBK시스템 AI 아이디어 챌린지</title>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

    <script type="text/javascript">
        <!--
        <c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}' />");</c:if>
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
    <section id="content" >
        <div class="sub-layout">
            <div class="sub-banner">
                <div class="container">
                    <div class="sub-banner-title">
                        내정보관리
                    </div>
                </div>
            </div>
            <nav class="nav-menu">
                <div class="container">
                    <!-- 홈 아이콘 -->
                    <div class="nav-item home">
                        <a href="/"><img src="/images/icon-home.png" alt="홈"/></a>
                    </div>

                    <!-- 1depth 메뉴 항목 -->
                    <div class="nav-item has-dropdown">
                        <button class="nav-button">내정보관리 <span class="nav-toggle"></span></button>
                    </div>
                </div>
            </nav>
        </div>
        <div class="content-wrap">
            <div class="form-wrap">
                <div class="container">
                    <form class="form-con" id="form" name="passwordChgVO" method="post" action="<c:url value="${'/uss/umt/edit/MyInfoPasswordUpdt.do'}"/>">
                        <input name="mberId" id="mberId" type="hidden" value="<c:out value='${mberManageVO.mberId}'/>" />
                        <input name="uniqId" id="uniqId" type="hidden" value="<c:out value='${mberManageVO.uniqId}'/>" />
                        <input name="userTy" id="userTy" type="hidden" value="<c:out value='${mberManageVO.userTy}'/>" />

                        <div class="form-list-con">
                            <div class="form-list">
                                <div class="form-title">이름</div>
                                <div class="form-input">
                                    <input name="mberNm" type="text" value="<c:out value='${mberManageVO.mberNm}'/>" readonly />
                                </div>
                                <div class="form-error-text" style="display: none;"></div>
                            </div>
                            <div class="form-list">
                                <div class="form-title">직책</div>
                                <div class="form-input">
                                    <input name="titleNm" type="text" value="<c:out value='${mberManageVO.titleNm}'/>" readonly />
                                </div>
                                <div class="form-error-text" style="display: none;"></div>
                            </div>
                            <div class="form-list">
                                <div class="form-title">소속</div>
                                <div class="form-input">
                                    <input name="deptNmF" type="text" value="<c:out value='${mberManageVO.deptNmF}' escapeXml="false"/>" readonly />
                                </div>
                                <div class="form-error-text" style="display: none;"></div>
                            </div>
                            <div class="form-list">
                                <div class="form-title">이전 비밀번호<span style="color:red;">*</span> (초기 비밀번호 : 주민등록번호 앞 6자리)</div>
                                <div class="form-input">
                                    <input name="oldPassword" id="oldPassword" class="f_txt" type="password" value="" maxlength="100" />
                                </div>
                                <div class="form-error-text" style="display: none;"></div>
                            </div>
                            <div class="form-list">
                                <div class="form-title">신규 비밀번호<span style="color:red;">*</span></div>
                                <div class="form-input">
                                    <input name="newPassword" id="newPassword" class="f_txt" type="password" value="" maxlength="100" />
                                </div>
                                <div class="form-error-text" style="display: none;"></div>
                            </div>
                            <div class="form-list">
                                <div class="form-title">비밀번호 확인<span style="color:red;">*</span></div>
                                <div class="form-input">
                                    <input name="newPassword2" id="newPassword2" class="f_txt" type="password" value="" maxlength="100" />
                                </div>
                                <div class="form-error-text" style="display: none;"></div>
                            </div>
                        </div>
                        <div class="form-btn-con">
                            <button type="submit" class="submit-btn">저장</button>
                        </div>
                        <div>
                            <a href="/cmm/main/mainPage.do" class="form-btn">
                                <img src="<c:url value='/'/>images/icon-back.png" alt="<" style="width: 18px;">
                                <span>홈으로</span>
                            </a>
                        </div>
                    </form>
                </div>
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.getElementById("form");

        form.addEventListener("submit", function (e) {
            // 입력값 가져오기
            const oldPassword = document.getElementById("oldPassword").value.trim();
            const newPassword = document.getElementById("newPassword").value.trim();
            const newPassword2 = document.getElementById("newPassword2").value.trim();

            // 오류 메시 초기화
            const errorTexts = document.querySelectorAll(".form-error-text");
            errorTexts.forEach(el => el.style.display = "none");

            // 유효성 검사
            let isValid = true;

            if (oldPassword === "") {
                showError("oldPassword", "이전 비밀번호를 입력해 주세요.");
                isValid = false;
            }

            if (newPassword === "") {
                showError("newPassword", "신규 비밀번호를 입력해 주세요.");
                isValid = false;
            }

            if (newPassword2 === "") {
                showError("newPassword2", "비밀번호 확인을 입력해 주세요.");
                isValid = false;
            }

            if (newPassword !== "" && newPassword2 !== "" && newPassword !== newPassword2) {
                showError("newPassword2", "비밀번호가 일치하지 않습니다.");
                isValid = false;
            }

            if (!isValid) {
                e.preventDefault(); // 전송 중단
            }
        });

        function showError(inputId, message) {
            const inputEl = document.getElementById(inputId);
            const errorEl = inputEl.closest(".form-list").querySelector(".form-error-text");
            if (errorEl) {
                errorEl.innerText = message;
                errorEl.style.display = "block";
            }
        }
    });
</script>
</body>
</html>