<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <link rel="preload" href="<c:url value='/'/>css/bootstrap.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
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
    <title>IBK시스템, AI 아이디어 챌린지 - 공지사항</title>

    <script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
    <script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
    <script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
    <validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
    <c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
    <script type="text/javascript">

        function fn_egov_validateForm(obj) {
            return true;
        }

        function fn_egov_regist_notice() {
            //document.board.onsubmit();

            if (!validateBoard(document.board)){
                return;
            }

            if (confirm('<spring:message code="common.regist.msg" />')) {
                document.board.action = "<c:url value='/cop/bbs${prefix}/replyBoardArticle.do'/>";
                document.board.submit();
            }
        }

        function fn_egov_select_noticeList() {
            document.board.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
            document.board.submit();
        }

        /* ********************************************************
         * 달력
         ******************************************************** */
        function fn_egov_init_date(){

            $("#searchBgnDe").datepicker(
                {dateFormat:'yy-mm-dd'
                    , showOn: 'button'
                    , buttonImage: '<c:url value='/images/ico_calendar.png'/>'
                    , buttonImageOnly: true

                    , showMonthAfterYear: true
                    , showOtherMonths: true
                    , selectOtherMonths: true
                    , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

                    , changeMonth: true // 월선택 select box 표시 (기본은 false)
                    , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
                    , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
                });

            $("#searchEndDe").datepicker(
                {dateFormat:'yy-mm-dd'
                    , showOn: 'button'
                    , buttonImage: '<c:url value='/images/ico_calendar.png'/>'
                    , buttonImageOnly: true

                    , showMonthAfterYear: true
                    , showOtherMonths: true
                    , selectOtherMonths: true
                    , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

                    , changeMonth: true // 월선택 select box 표시 (기본은 false)
                    , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
                    , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
                });
        }

    </script>
    <style type="text/css">
        .ui-datepicker-trigger {
            margin-left: 10px;
            vertical-align: middle;
        }
    </style>

</head>

<body class="no-transition stretched" onLoad="document.board.nttSj.focus(); fn_egov_init_date();">

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
                <li class="breadcrumb-item active" aria-current="page">공지사항 수정</li>
            </ol>
        </div>

    </section><!-- #page-title end -->

    <!-- Content
    ============================================= -->
    <section id="content">

        <div class="content-wrap">

            <div class="container clearfix">

                <form:form modelAttribute="board" name="board" method="post" enctype="multipart/form-data" >
                    <input type="hidden" name="replyAt" value="Y" />
                    <input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
                    <input type="hidden" name="nttId" value="<c:out value='${searchVO.nttId}'/>" />
                    <input type="hidden" name="parnts" value="<c:out value='${searchVO.parnts}'/>" />
                    <input type="hidden" name="sortOrdr" value="<c:out value='${searchVO.sortOrdr}'/>" />
                    <input type="hidden" name="replyLc" value="<c:out value='${searchVO.replyLc}'/>" />

                    <input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
                    <input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
                    <input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
                    <input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
                    <input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
                    <input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
                    <input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
                    <input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />

                    <input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />

                    <c:if test="${anonymous != 'true'}">
                        <input type="hidden" name="ntcrNm" value="dummy">   <!-- validator 처리를 위해 지정 -->
                        <input type="hidden" name="password" value="dummy"> <!-- validator 처리를 위해 지정 -->
                    </c:if>

                    <c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
                        <input name="ntceBgnde" type="hidden" value="10000101">
                        <input name="ntceEndde" type="hidden" value="99991231">
                    </c:if>

                    <h2><c:out value='${bdMstr.bbsNm}'/></h2>

                    <div class="board_view2">
                        <table>
                            <colgroup>
                                <col style="width: 190px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tr>
                                <td class="lb">
                                    <label for="nttSj"><spring:message code="cop.nttSj" /></label><!-- 제목 -->
                                    <span class="req">필수</span>
                                </td>
                                <td>
                                    <input id="nttSj" class="f_txt w_full" name="nttSj" type="text" size="60" value="RE: <c:out value='${result.nttSj}' escapeXml="false"/>"  maxlength="60" >
                                    <br/><form:errors path="nttSj" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lb">
                                    <label for="nttCn"><spring:message code="cop.nttCn" /></label>
                                    <span class="req">필수</span>
                                </td>
                                <td>
                                    <textarea id="nttCn" name="nttCn" class="f_txtar w_full h_200" cols="30" rows="10"></textarea>
                                    <form:errors path="nttCn" />
                                </td>
                            </tr>

                            <!-- 게시 기간 시작 -->
                            <c:if test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
                                <tr>
                                    <td class="lb">
                                        <label for="noticeTerm"><spring:message code="cop.noticeTerm" /></label>
                                        <span class="req">필수</span>
                                    </td>
                                    <td>
                                        <input name="ntceBgnde" type="hidden" value='<c:out value="${result.ntceBgnde}" />'>
                                        <input type="text" name="searchBgnDe" id="searchBgnDe" class="f_date" maxlength="10" value="<c:out value='${searchVO.searchBgnDe}'/>" title="시작일자입력" />
                                        ~
                                        <input name="ntceEndde" type="hidden"  value='<c:out value="${result.ntceEndde}" />'>
                                        <input type="text" name="searchEndDe" id="searchEndDe" class="f_date" maxlength="10" value="<c:out value='${searchVO.searchEndDe}'/>" title="종료일자입력" >
                                        <br/><form:errors path="ntceBgndeView" />
                                        <br/><form:errors path="ntceEnddeView" />
                                    </td>
                                </tr>
                            </c:if>
                            <!-- /게시 기간 끝 -->

                            <!-- 파일첨부 시작 -->
                            <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
                                <tr>
                                    <td class="lb">
                                        <label for="egovComFileUploader" ><spring:message code="cop.atchFile" /></label>
                                    </td>
                                    <td>
                                        <div class="board_attach2" id="file_upload_posbl">
                                            <input name="file_1" id="egovComFileUploader" type="file" />
                                            <div id="egovComFileList"></div>
                                        </div>
                                        <div class="board_attach2" id="file_upload_imposbl">
                                        </div>
                                        <c:if test="${empty result.atchFileId}">
                                            <input type="hidden" id="fileListCnt" name="fileListCnt" value="0" />
                                        </c:if>
                                    </td>
                                </tr>
                            </c:if>
                            <!-- /파일첨부 끝 -->

                            <!-- 파일첨부 스크립트 시작 -->
                            <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
                                <script type="text/javascript">
                                    var maxFileNum = document.board.posblAtchFileNumber.value;
                                    if(maxFileNum==null || maxFileNum==""){
                                        maxFileNum = 3;
                                    }
                                    var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
                                    multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
                                </script>
                            </c:if>
                            <!-- /파일첨부 스크립트 끝 -->

                        </table>
                    </div>

                    <!-- 목록/저장버튼  시작-->
                    <div class="board_view_bot">
                        <div class="left_col btn3">
                        </div>

                        <div class="right_col btn1">
                            <c:if test="${bdMstr.authFlag == 'Y'}">
                                <input type="button" class="s_btn" value="저장" title="저장 버튼" onclick="javascript:fn_egov_regist_notice(); return false;" />
                            </c:if>
                            <input type="button" class="s_btn" value="목록" title="목록 버튼" onclick="javascript:fn_egov_select_noticeList(); return false;" />
                        </div>
                    </div>
                    <!-- 목록/저장버튼  끝-->

                </form:form>

            </div>

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
<script type="text/javascript" src="<c:url value='/'/>js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/plugins.js"></script>

<script type="text/javascript" src="<c:url value='/'/>js/include.js"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

</body>
</html>