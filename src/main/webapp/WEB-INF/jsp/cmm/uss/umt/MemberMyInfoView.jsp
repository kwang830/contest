<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="preload" href="<c:url value='/'/>css/bootstrap.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/responsive.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/form.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

    <!-- 비동기
    ============================================= -->
    <link rel="stylesheet" href="<c:url value='/'/>css/swiper.css" type="text/css" media="print" onload="this.media='all'" />
    <link rel="stylesheet" href="<c:url value='/'/>css/font-icons.css" type="text/css" media="print" onload="this.media='all'" />
    <link rel="stylesheet" href="<c:url value='/'/>css/animate.css" type="text/css" media="print" onload="this.media='all'" />
    <link rel="stylesheet" href="<c:url value='/'/>css/magnific-popup.css" type="text/css" media="print" onload="this.media='all'" />

    <link rel="stylesheet" href="<c:url value='/'/>css/coming-soon.css" type="text/css">

    <noscript>
        <link rel="stylesheet" href="<c:url value='/'/>css/bootstrap.css">
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
    <div id="content" style="padding-top:100px;">
        <div class="form-wrap">
            <div class="container">

                <h2>내정보</h2>

                <form action="" class="form-con" id="form">
                    <div class="form-list-con">
                        <div class="form-list">
                            <div class="form-title">이름</div>
                            <div class="form-input">
                                <input name="name" type="text">
                            </div>
                        </div>
                        <div class="form-list">
                            <div class="form-title">소속</div>
                            <div class="form-input">
                                <input name="title" type="text">
                            </div>
                        </div>
                    </div>

                    <div class="form-list-con">
                        <div class="form-list">
                            <div class="form-title">이전 비밀번호</div>
                            <div class="form-input">
                                <input name="name" type="text">
                            </div>
                        </div>
                        <div class="form-list">
                            <div class="form-title">신규 비밀번호</div>
                            <div class="form-input">
                                <input name="title" type="text">
                            </div>
                        </div>
                        <div class="form-list">
                            <div class="form-title">신규 비밀번호 확인</div>
                            <div class="form-input">
                                <input name="title" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="form-btn-con">
                        <button type="submit" class="submit-btn">저장</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- #content end -->



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

<script type="text/javascript" src="<c:url value='/'/>js/include.js"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

<script>
    $(document).ready(function() {
        const $nameInput =$('.form-list input[name="name"]');
        const $titleInput =$('.form-list input[name="title"]');

        // 1. input 포커스 시 스타일 변경
        $('.form-input input').on('focus', function() {
            const $parent = $(this).closest('.form-list');

            // 에러 초기화
            $parent.removeClass('input-error');
            $parent.find('.form-error-text').hide();

            $parent.addClass('focused');
        });

        // focus 해제 시 초기화
        $('.form-input input').on('blur', function() {
            const $input = $(this);
            const $parent = $input.closest('.form-list');

            $parent.removeClass('focused');
        });

        // 2. submit 시 유효성 검사
        $('#form').on('submit', function(e) {
            e.preventDefault();

            let isValid = true;

            // 초기화
            function resetField($wrapper){
                $wrapper.removeClass('input-error');
                $wrapper.find('.form-error-text').hide();
            }

            // 오류 처리
            function setError($wrapper, message) {
                $wrapper.addClass('input-error');
                $wrapper.find('.form-error-text').text(message).show();
                isValid = false;
            }


            // id
            const $nameWrapper = $nameInput.closest('.form-list');
            const nameVal = $nameInput.val().trim();
            resetField($nameWrapper);
            if (nameVal === '') {
                setError($nameWrapper, '이름을 입력해주세요.');
            } else if (nameVal.length < 6) {
                setError($nameWrapper, '6자 이상 입력해주세요.');
            }

            // password
            const $titleWrapper = $titleInput.closest('.form-list');
            const titleVal = $titleInput.val().trim();
            resetField($titleWrapper);
            if (titleVal === '') {
                setError($titleWrapper, '제목을 입력해주세요.');
            } else if (titleVal.length < 6) {
                setError($titleWrapper, '6자 이상 입력해주세요.');
            }

            if (isValid) {
                // 이곳에서 실제 로그인 요청 등 진행
                alert('로그인!!');
                // this.submit(); // 실제 전송 시 주석 해제
            }
        });
    });
</script>

</body>
</html>