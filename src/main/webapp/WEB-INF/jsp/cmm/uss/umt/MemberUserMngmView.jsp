<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>IBK시스템, AI 아이디어 챌린지 - 사용자관리</title>

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

</body>
</html>