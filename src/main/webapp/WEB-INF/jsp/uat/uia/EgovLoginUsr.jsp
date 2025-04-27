<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
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

    <!-- Stylesheets
    ============================================= -->
    <link rel="stylesheet" href="<c:url value='/'/>css/reset.css" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/'/>css/styles.css" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/'/>css/font-icons.css" type="text/css"/>

    <link rel="stylesheet" href="<c:url value='/'/>css/responsive.css" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/'/>css/form.css" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/'/>css/login.css" type="text/css"/>

    <!-- Document Title
    ============================================= -->
    <title>IBK시스템 AI 아이디어 챌린지 - 로그인</title>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

    <script type="text/javascript">
        <!--
        function getPcInfo() {
            var os;
            var mobile = (/iphone|ipad|ipod|android/i.test(navigator.userAgent.toLowerCase()));
            if (mobile) {
                var userAgent = navigator.userAgent.toLowerCase();
                if (userAgent.search("android") > -1){
                    return os = "ANDROID";
                }
                else if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1) || (userAgent.search("ipad") > -1)){
                    return os = "IOS";
                }
                else {
                    return os = "OTHER";
                }
            }
            else {
                return os = "PC";
            }
        };

        function getBrowserInfo() {
            var agent = navigator.userAgent.toUpperCase();
            //console.log('User Agent:', agent);

            if (agent.indexOf('EDG') >= 0) {
                return 'EDGE';
            } else if (agent.indexOf('TRIDENT') >= 0 || agent.indexOf('MSIE') >= 0) {
                return 'IE';
            } else if (agent.indexOf('FIREFOX') >= 0) {
                return 'FIREFOX';
            } else if (agent.indexOf('SAFARI') >= 0 && agent.indexOf('CHROME') === -1) {
                return 'SAFARI';
            } else if (agent.indexOf('CHROME') >= 0) {
                return 'CHROME';
            } else {
                return 'UNKNOWN';
            }
        }

        function fnInit() {
            var message = document.loginForm.message.value;
            if (message != "") {
                alert(message);
            }

            var pcInfo = getPcInfo();
            var browserInfo = getBrowserInfo();
            $("input[name='pcInfo']").val(pcInfo);
            $("input[name='browserInfo']").val(browserInfo);
        }
        //-->
    </script>
</head>
<body class="no-transition stretched" onLoad="fnInit();">

<div id="wrapper" class="clearfix">

    <!-- header start -->
    <c:import url="/sym/mms/ContHeader.do" />
    <!-- //header end -->

    <!-- Content
    ============================================= -->
    <div id="content">
        <div class="login-layout">
            <div class="container">
                <div class="login-title">
                    로그인
                </div>
                <div class="login-desc">
                    AI 아이디어 챌린지 공모전에 오신것을 환영합니다.
                </div>
            </div>
        </div>
        <div class="form-wrap login-form-wrap">
            <div class="container">
                <form action="<c:url value='/uat/uia/actionSecurityLogin.do'/>" class="form-con login-form-con" name="loginForm" id="loginForm" method="post">

                    <input type="hidden" name="message" value="<c:out value='${message}'/>" />
                    <input type="hidden" name="pcInfo" value=""/>
                    <input type="hidden" name="browserInfo" value=""/>
                    <input type="hidden" name="userSe" value="GNR"/>

                    <div class="form-list-con">
                        <div class="form-list">
                            <div class="form-title">아이디</div>
                            <div class="form-input">
                                <input name="id" id="id" type="text" placeholder="아이디(사번)를 입력해주세요." maxlength="20" />
                            </div>
                            <div class="form-error-text" style="display: none;"></div>
                        </div>
                        <div class="form-list">
                            <div class="form-title">비밀번호 <span style="font-size: 16px;">(초기 비밀번호 : 주민등록번호 앞 6자리)</span></div>
                            <div class="form-input">
                                <input name="password" id="password" type="password" placeholder="비밀번호를 입력해주세요." autocomplete="current-password" maxlength="100" />
                            </div>
                            <div class="form-error-text" style="display: none;"></div>
                        </div>
                    </div>
                    <div class="login-checkbox-con">
                        <label class="checkbox-wrapper">
                            <input type="checkbox" id="saveIdCheckbox" />
                            <span class="custom-checkbox"></span>
                            <span class="checkbox-label">아이디 저장</span>
                        </label>
                    </div>
                    <div class="form-btn-con">
                        <button type="submit" class="submit-btn">로그인</button>
                    </div>
                    <div class="login-form-desc">
                        변경한 비밀번호를 잊으신 경우,<br/>
                        AI공모전 담당자 (☎ 02-3407-6074)에게 문의해주시기 바랍니다.<br/>
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

<script type="text/javascript" src="<c:url value='/'/>js/common.js"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

<script>
    $(document).ready(function() {
        const $idInput =$('.form-list input[name="id"]');
        const $pwInput =$('.form-list input[name="password"]');
        const $saveCheckbox = $('#saveIdCheckbox');

        const savedId = localStorage.getItem('savedId');
        if (savedId) {
            $idInput.val(savedId);
            $saveCheckbox.prop('checked', true);
        }

        // 1. input 포커스 시 스타일 변경
        $('.form-input input:not([type="file"])').on('focus', function() {
            const $input = $(this);
            const $parent = $input.closest('.form-list');

            // 에러 초기화
            $parent.removeClass('input-error');
            $parent.find('.form-error-text').hide();

            $parent.addClass('focused');
        });

        // focus 해제 시 초기화
        $('.form-input input:not([type="file"])').on('blur', function() {
            const $input = $(this);
            const $parent = $input.closest('.form-list');

            $parent.removeClass('focused');
        });

        // 2. submit 시 유효성 검사
        $('#loginForm').on('submit', function(e) {
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
            const $idWrapper = $idInput.closest('.form-list');
            const idVal = $idInput.val().trim();
            resetField($idWrapper);
            if (idVal === '') {
                setError($idWrapper, '아이디를 입력해주세요.');
            //} else if (!/^\d+$/.test(idVal)) {
            //    setError($idWrapper, '숫자만 입력 가능합니다.');
            }

            // password
            const $pwWrapper = $pwInput.closest('.form-list');
            const pwVal = $pwInput.val().trim();
            resetField($pwWrapper);
            if (pwVal === '') {
                setError($pwWrapper, '비밀번호를 입력해주세요.');
            //} else if (pwVal.length < 6) {
            //    setError($pwWrapper, '6자 이상 입력해주세요.');
            }

            if (isValid) {
                // 아이디 저장
                if ($saveCheckbox.is(':checked')) {
                    localStorage.setItem('savedId', idVal);
                } else {
                    localStorage.removeItem('savedId');
                }

                this.submit();
            }
        });
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 이전 히스토리 제거
        history.replaceState(null, '', location.href);
        // 현재 페이지 히스토리를 두 번 push
        history.pushState(null, '', location.href);
        history.pushState(null, '', location.href);

        window.addEventListener('popstate', function () {
            // 뒤로가기를 눌러도 다시 앞으로 push해서 원위치
            history.pushState(null, '', location.href);
        });
    });
</script>
</body>
</html>


