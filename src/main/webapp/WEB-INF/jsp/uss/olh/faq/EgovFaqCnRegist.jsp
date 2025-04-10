<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
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
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="faqManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_faqcn(){

	// 첫 입력란에 포커스..
	faqManageVO.qestnSj.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_faqcn(form){

	// 서버사이드 테스트용
	/*	
		form.action = "<c:url value='/uss/olh/faq/FaqCnRegist.do'/>";
		form.submit(); 
		return;
	*/

	
	if (!validateFaqManageVO(form)) {
		
		return;
	} else {
		
		if(confirm('<spring:message code="common.regist.msg" />')) {
			
			form.action = "<c:url value='/uss/olh/faq/FaqCnRegist.do'/>";
			form.submit();
		}
	}
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_faqcnlist() {

	faqManageVO.action = "<c:url value='/uss/olh/faq/FaqListInqire.do'/>";
	faqManageVO.submit();
		
}

function fn_egov_check_file(flag) {
	if(flag=="Y") {
		document.getElementById('file_upload_posbl').style.display = "block";
		document.getElementById('file_upload_imposbl').style.display = "none";			
	} else {
		document.getElementById('file_upload_posbl').style.display = "none";
		document.getElementById('file_upload_imposbl').style.display = "block";
	}
}	

</script>

</head>
<body class="stretched" onLoad="fn_egov_initl_faqcn();">

    <!-- Document Wrapper
    ============================================= -->
    <div id="wrapper" class="clearfix">

        <!-- Header -->
        <c:import url="/sym/mms/ContHeader.do" />
		<!--// Header -->

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
                        <!-- 홈 아이콘 -->
                        <div class="nav-item home">
                            <a href="/"><img src="/images/icon-home.png" alt="홈"/></a>
                        </div>

                        <!-- 1depth 메뉴 항목 -->
                        <div class="nav-item has-dropdown">
                            <button class="nav-button">커뮤니티 <span class="nav-toggle"></span></button>
                        </div>
                        <div class="nav-item has-dropdown">
                            <button class="nav-button">FAQ <span class="nav-toggle"><img
                                    src="/images/icon-nav-arrow.png" alt=""></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA">공지사항</a></li>
                                <li class="active"><a href="/uss/olh/faq/FaqListInqire.do">FAQ</a></li>
                                <li><a href="/uss/olh/qna/QnaListInqire.do">QNA</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="content-wrap">
                <div class="container clearfix">
                    <form:form modelAttribute="faqManageVO" name="faqManageVO" action="${pageContext.request.contextPath}/uss/olh/faq/FaqCnRegist.do" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3">

                        <div class="board_form">
                            <div>
                                <div class="board_form_row">
                                    <div class="title"><label for="qestnSj">질문제목</label></div>
                                    <div class="input">
                                        <form:input id="" class="f_txt w_full" path="qestnSj" maxlength="70" title="질문제목" />
                                        <form:errors path="qestnSj" />
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="qestnCn">질문내용</label>
                                    </div>
                                    <div class="input">
                                        <form:textarea path="qestnCn" cols="30" rows="10" title="질문내용" class="f_txtar w_full h_200" />
                                        <form:errors path="qestnCn" />
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="answerCn">답변내용</label>
                                    </div>
                                    <div class="input">
                                        <form:textarea path="answerCn" cols="30" rows="10" title="답변내용" class="f_txtar w_full h_200" />
                                        <form:errors path="answerCn" />
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="egovComFileUploader">파일첨부</label>
                                    </div>
                                    <div class="input f_file_wrap">
                                        <!-- 파일첨부 시작 -->
                                        <div class="board_attach2" id="file_upload_posbl">
                                            <input name="file_1" id="egovComFileUploader" type="file" />
                                            <div id="egovComFileList"></div>
                                        </div>
                                        <div class="board_attach2" id="file_upload_imposbl">
                                            <spring:message code="common.imposbl.fileupload" />
                                        </div>
                                        <!-- /파일첨부 끝 -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 목록/저장버튼  시작-->
                        <div class="board_view_bot">
                            <div class="left_col">
                                <a href="#" class="btn btn_gray_46" onclick="javascript:fn_egov_inqire_faqcnlist(); return false;">목록</a>
                            </div>
                            <div class="center_col">
                                <c:if test="${authFlag == 'Y'}">
                                    <a href="#" class="btn btn_white_46" onclick="fn_egov_regist_faqcn(document.faqManageVO); return false;">저장</a>
                                </c:if>
                            </div>
                            <div class="right_col"></div>
                        </div>
                        <!-- 목록/저장버튼  끝-->

                    </form:form>

                </div>
            </div>
        </section>

        <!-- Footer -->
        <c:import url="/sym/mms/ContFooter.do" />
		<!--// Footer -->
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

    <script type="text/javascript" src="<c:url value='/'/>js/ui.js"></script>

    <script type="text/javascript">
        <!--
        var existFileNum = null;
        var maxFileNum = null;
        if (document.faqManageVO.fileListCnt != null) {
            existFileNum = document.faqManageVO.fileListCnt.value;
        }
        if (document.getElementById('posblAtchFileNumber') != null) {
            maxFileNum = document.getElementById('posblAtchFileNumber').value;
        }
        if (existFileNum == "undefined" || existFileNum == null) {
            existFileNum = 0;
        }

        if (maxFileNum == "undefined" || maxFileNum == null) {
            maxFileNum = 0;
        }

        var uploadableFileNum = maxFileNum - existFileNum;

        if (uploadableFileNum < 0) {
            uploadableFileNum = 0;
        }
        if (uploadableFileNum != 0) {
            fn_egov_check_file('Y');
            var multi_selector = new MultiSelector(document.getElementById('egovComFileList'), uploadableFileNum);
            multi_selector.addElement(document.getElementById('egovComFileUploader'));
        } else {
            fn_egov_check_file('N');
        }
        //-->
    </script>

</body>
</html>