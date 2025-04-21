<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="preload" href="<c:url value='/'/>css/font-icons.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/sub.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/board.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

    <style>
        .board_article_faq {position: relative; padding-left: 74px; border-bottom: 1px solid #dde2e5;}
        .board_article_faq .a {display: block; position: absolute; left: 30px; top: 30px; width: 32px; height: 32px; font-size: 0; background: url(/images/ico_a.png) no-repeat;}
        .board_article_faq .q {display: block; position: absolute; left: 30px; top: 30px; width: 32px; height: 32px; font-size: 0; background: url(/images/ico_q.png) no-repeat;}
        .board_article_faq textarea {width: 100%; min-height: 350px; padding: 30px 29px 30px 0; border: 0; color: #666; font-size: 16px; font-weight: 300; line-height: 30px; resize: none;}
    </style>

    <!-- Document Title
    ============================================= -->
    <title>IBK시스템, AI 아이디어 챌린지 - FAQ</title>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_faq(){

}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_faqlist() {

	document.FaqManageForm.action = "<c:url value='/uss/olh/faq/FaqListInqire.do'/>";
	document.FaqManageForm.submit();
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_faq(faqId){

	// Update하기 위한 키값(faqId)을 셋팅
	document.FaqManageForm.faqId.value = faqId;	
	document.FaqManageForm.action = "<c:url value='/uss/olh/faq/FaqCnUpdtView.do'/>";
	document.FaqManageForm.submit();	
	
}

function fn_egov_delete_faq(faqId){

	if	(confirm('<spring:message code="common.delete.msg" />')) {
		// Delete하기 위한 키값(faqId)을 셋팅
		document.FaqManageForm.faqId.value = faqId;	
		document.FaqManageForm.action = "<c:url value='/uss/olh/faq/FaqCnDelete.do'/>";
		document.FaqManageForm.submit();
	}
}

</script>
</head>

<body class="stretched" onLoad="fn_egov_initl_faq();">

    <!-- Document Wrapper
    ============================================= -->
    <div id="wrapper" class="clearfix">

        <!-- header start -->
        <c:import url="/sym/mms/ContHeader.do" />
	    <!-- //header end -->

        <!-- Content
    ============================================= -->
        <section id="content">
            <div class="sub-layout">
                <div class="sub-banner">
                    <div class="container">
                        <div class="sub-banner-title">
                            FAQ
                        </div>
                    </div>
                </div>
                <nav class="nav-menu">
                    <div class="container">
                        <!-- Left menu -->
                        <c:import url="/sym/mms/ContMenuLeft.do" />
                        <!--// Left menu -->
                    </div>
                </nav>
            </div>
            <div class="content-wrap">
                <div class="container clearfix">
                    <form name="FaqManageForm" action="${pageContext.request.contextPath}/uss/olh/faq/FaqCnUpdtView.do" method="post">
                        <input name="faqId" type="hidden" value="">

                        <div class="board_view">
                            <div class="board_view_top_con">
                                <!-- 관리자가 작성한 경우 writer_img display:none 처리 -->
                                <div class="board_view_writer_img"></div>
                                <div>
                                    <div class="board_view_title">
                                        <c:out value="${result.qestnSj}" escapeXml="false" />
                                    </div>
                                    <div class="board_view_info_con">
                                        <div class="board_view_info">
                                            <div class="view_info_title">작성자</div>
                                            <div class="view_info_desc">관리자</div>
                                        </div>
                                        <div class="board_view_info">
                                            <div class="view_info_title">등록일</div>
                                            <div class="view_info_desc"><c:out value="${result.lastUpdusrPnttm}" escapeXml="false" /></div>
                                        </div>
                                        <div class="board_view_info">
                                            <div class="view_info_title">조회수</div>
                                            <div class="view_info_desc"><c:out value="${result.inqireCo}" /></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="board_view_content_con board_article_faq">
                                <span class="q">Q</span>
                                <textarea id="qestnCn" name="qestnCn" class="textarea"  cols="30" rows="10" readonly="readonly" title="질문내용"><c:out value="${result.qestnCn}" escapeXml="false" /></textarea>
                            </div>
                            <div class="board_view_content_con board_article_faq">
                                <span class="a">A</span>
                                <textarea id="answerCn" name="answerCn" class="textarea" cols="30" rows="10" readonly="readonly" title="답변내용"><c:out value="${result.answerCn}" escapeXml="false" /></textarea>
                            </div>

                            <c:if test="${not empty result.atchFileId}">
                                <div class="board_view_file_con">
                                    <img src="/images/icon-attachment.png" alt="" style="width: 24px;">
                                    <c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
                                        <c:param name="param_atchFileId" value="${egovc:encrypt(result.atchFileId)}" />
                                    </c:import>
                                </div>
                            </c:if>
                        </div>

                        <div class="board_view_bot">
                            <div class="left_col">
                                <a href="#" class="btn btn_gray_46" onclick="javascript:fn_egov_inqire_faqlist(); return false;">목록</a>
                            </div>
                            <div class="center_col"></div>
                            <div class="right_col">
                                <c:if test="${authFlag == 'Y'}">
                                    <a href="#" class="btn btn_white_46" onclick="fn_egov_updt_faq('<c:out value="${result.faqId}"/>'); return false;">수정</a>
                                    <a href="#" class="btn btn_black_46" onclick="fn_egov_delete_faq('<c:out value="${result.faqId}"/>'); return false;">삭제</a>
                                </c:if>
                            </div>
                        </div>
                        <!--// 게시판 -->
                    </form>
                </div>
            </div>
        </section>

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