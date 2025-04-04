<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
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
    <title>IBK시스템, AI 아이디어 챌린지 - 공지사항</title>

    <script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
    <c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
    <script type="text/javascript">
        function onloading() {
            if ("<c:out value='${msg}'/>" != "") {
                alert("<c:out value='${msg}'/>");
            }
        }

        function fn_egov_select_noticeList(pageNo) {
            document.frm.pageIndex.value = pageNo;
            document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
            document.frm.submit();
        }

        function fn_egov_delete_notice() {
            if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
                alert('등록시 사용한 패스워드를 입력해 주세요.');
                document.frm.password.focus();
                return;
            }

            if (confirm('<spring:message code="common.delete.msg" />')) {
                document.frm.action = "<c:url value='/cop/bbs${prefix}/deleteBoardArticle.do'/>";
                document.frm.submit();
            }
        }

        function fn_egov_moveUpdt_notice() {
            if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
                alert('등록시 사용한 패스워드를 입력해 주세요.');
                document.frm.password.focus();
                return;
            }

            document.frm.action = "<c:url value='/cop/bbs${prefix}/forUpdateBoardArticle.do'/>";
            document.frm.submit();
        }

        function fn_egov_addReply() {
            document.frm.action = "<c:url value='/cop/bbs${prefix}/addReplyBoardArticle.do'/>";
            document.frm.submit();
        }
    </script>
    <c:if test="${useComment == 'true'}">
        <c:import url="/cop/bbs/selectCommentList.do" charEncoding="utf-8">
            <c:param name="type" value="head" />
        </c:import>
    </c:if>
    <c:if test="${useSatisfaction == 'true'}">
        <c:import url="/cop/bbs/selectSatisfactionList.do" charEncoding="utf-8">
            <c:param name="type" value="head" />
        </c:import>
    </c:if>
    <c:if test="${useScrap == 'true'}">
        <script type="text/javascript">
            function fn_egov_addScrap() {
                document.frm.action = "<c:url value='/cop/bbs/addScrap.do'/>";
                document.frm.submit();
            }
        </script>
    </c:if>
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
                <li class="breadcrumb-item active" aria-current="page">공지사항 조회</li>
            </ol>
        </div>

    </section><!-- #page-title end -->

    <!-- Content
    ============================================= -->
    <section id="content">

        <div class="content-wrap">

            <div class="container clearfix">

                <h2><c:out value="${brdMstrVO.bbsNm}" /></h2>

                <form name="frm" method="post" action="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>">
                    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
                    <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
                    <input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
                    <input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
                    <input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
                    <input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
                    <input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >

                    <!-- 게시판 상세보기 -->
                    <div class="board_view">
                        <div class="board_view_top">
                            <div class="tit"><c:out value="${result.nttSj}" escapeXml="false" /></div>
                            <div class="info">
                                <dl>
                                    <dt>작성자##</dt>
                                    <dd><c:out value="${result.frstRegisterNm}" /></dd>
                                </dl>
                                <dl>
                                    <dt>작성일</dt>
                                    <dd><c:out value="${result.frstRegisterPnttm}" escapeXml="false" /></dd>
                                </dl>
                                <dl>
                                    <dt>조회수</dt>
                                    <dd><c:out value="${result.inqireCo}" /></dd>
                                </dl>
                            </div>
                        </div>

                        <div class="board_article">
                            <textarea id="nttCn" name="nttCn" class="textarea" cols="30" rows="10" readonly="readonly" title="글내용"><c:out value="${result.nttCn}" escapeXml="true" /></textarea>
                        </div>


                        <!-- 파일 첨부 시작 -->
                        <div class="board_attach">

                            <c:if test="${not empty result.atchFileId}">

                                <c:if test="${result.bbsAttrbCode == 'BBSA02'}">
                                    <dl>
                                        <dt style="display: inline;">첨부<br>이미지</dt>
                                        <dd>
                                            <c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
                                                <c:param name="atchFileId" value="${egovc:encryptSession(result.atchFileId, pageContext.session.id)}" />
                                            </c:import>
                                        </dd>
                                    </dl>
                                </c:if>

                                <dl>
                                    <dt>첨부파일</dt>
                                    <dd>
                                        <c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
                                            <c:param name="param_atchFileId" value="${egovc:encrypt(result.atchFileId)}" />
                                        </c:import>
                                    </dd>
                                </dl>

                            </c:if>

                        </div>
                        <!-- /파일 첨부 끝 -->

                        <!-- 버튼 시작 -->
                        <div class="board_view_bot">
                            <div class="left_col btn3">
                                <c:if test="${result.frstRegisterId == sessionUniqId}">
                                    <input type="button" class="s_btn" value="수정" title="수정 버튼" onclick="javascript:fn_egov_moveUpdt_notice(); return false;" />
                                    <input type="button" class="s_btn" value="삭제" title="삭제 버튼" onclick="javascript:fn_egov_delete_notice(); return false;" />
                                </c:if>
                                <c:if test="${result.replyPosblAt == 'Y'}">
                                    <input type="button" class="s_btn" value="답글작성" title="답글작성 버튼" onclick="javascript:fn_egov_addReply(); return false;" />
                                </c:if>
                            </div>

                            <div class="right_col btn1">
                                <input type="button" class="s_btn" value="목록" title="목록 버튼" onclick="javascript:fn_egov_select_noticeList('1'); return false;" />
                            </div>
                        </div>
                        <!-- /버튼 끝 -->
                    </div>
                    <!-- 게시판 상세보기 -->
                </form>

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

<script type="text/javascript" src="<c:url value='/'/>js/common.js"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

</body>
</html>