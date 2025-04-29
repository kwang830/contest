<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link rel="preload" href="<c:url value='/'/>css/board.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

    <link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

    <!-- Document Title
    ============================================= -->
    <title>IBK시스템, AI 아이디어 챌린지 - QnA</title>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_qnalist() {

	document.QnaManageForm.action = "<c:url value='/uss/olh/qna/QnaListInqire.do'/>";
	document.QnaManageForm.submit();
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_qnacn(qaId){

// 	// Update하기 위한 키값을 셋팅
// 	document.QnaManageForm.qaId.value = qaId;	

// 	var url 	= "<c:url value='/uss/olh/qna/QnaPasswordConfirmView.do'/>";
// 	var	status 	= "dialogWidth=350px;dialogHeight=200px;resizable=no;center=yes";

	
// 	// 작성비밀번호 확인 화면을 호출한다.
// 	var returnValue = window.showModalDialog(url, self, status);

// 	// 결과값을 받아. 결과를 Submit한다.
//  	if	(returnValue)	{

//  		document.QnaManageForm.action = "<c:url value='/uss/olh/qna/QnaPasswordConfirm.do'/>"; 	 	
//  		document.QnaManageForm.submit();
 		
//  	}
	
	// qaId 값 세팅
	document.QnaManageForm.qaId.value = qaId;
	
	var url 	= "<c:url value='/uss/olh/qna/QnaPasswordConfirmView.do'/>";
	
	var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px; " src="' + url + '" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 600,
        height: 350
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}

/**********************************************************
 * 삭제처리화면
 ******************************************************** */
function fn_egov_delete_qnacn(qaId){

	if	(confirm('<spring:message code="common.delete.msg" />')) {

		// Delete하기 위한 키값을 셋팅
		document.QnaManageForm.qaId.value = qaId;	
		document.QnaManageForm.action = "<c:url value='/uss/olh/qna/QnaCnDelete.do'/>";
		document.QnaManageForm.submit();
	}
}

/*********************************************************
 * 작성비밀번호.체크..
 ******************************************************** */
function fn_egov_passwordConfirm(){

	alert("작성 비밀번호를 확인 바랍니다!");
	
}


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
        <section id="content">
            <div class="sub-layout">
                <div class="sub-banner">
                    <div class="container">
                        <div class="sub-banner-title">
                            QnA
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
                    <form name="QnaManageForm" action="<c:url value='/uss/olh/qna/QnaPasswordConfirm.do'/>" method="post">
                        <input name="qaId" type="hidden" value="<c:out value='${result.qaId}'/>">

                        <div class="board_form">
                            <div>
                                <div class="board_form_row">
                                    <div class="title">작성자명</div>
                                    <div class="input">
                                        <c:out value="${result.wrterNm}"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">전화번호</div>
                                    <div class="input">
                                        <c:out value="${result.areaNo}"/>-<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">조회수</div>
                                    <div class="input">
                                        <c:out value="${result.inqireCo}"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">질의응답처리상태</div>
                                    <div class="input">
                                        <c:out value="${result.qnaProcessSttusCodeNm}"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">질문제목</div>
                                    <div class="input">
                                        <c:out value="${result.qestnSj}" escapeXml="false"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">질문내용</div>
                                    <div class="input">
                                        <textarea id="qestnCn" class="f_txtar w_full h_200" name="qestnCn" cols="30" rows="10" readonly title="질문내용"><c:out value="${result.qestnCn}" escapeXml="false"/></textarea>
                                    </div>
                                </div>
                                <c:if test="${result.qnaProcessSttusCode == '3'}">
                                <div class="board_form_row">
                                    <div class="title">답변내용</div>
                                    <div class="input">
                                        <textarea class="f_txtar w_full h_200" name="answerCn" cols="30" rows="10" readonly="readonly" title="답변내용"><c:out value="${result.answerCn}" escapeXml="false"/></textarea>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">답변일자</div>
                                    <div class="input">
                                        <c:if test="${result.answerDe != null}">
                                            <c:out value='${fn:substring(result.answerDe, 0,4)}'/>.<c:out value='${fn:substring(result.answerDe, 4,6)}'/>.<c:out value='${fn:substring(result.answerDe, 6,8)}'/>
                                        </c:if>
                                    </div>
                                </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- 목록/저장버튼  시작-->
                        <div class="board_view_bot">
                            <div class="left_col">
                                <a href="#" class="btn btn_gray_46" onclick="javascript:fn_egov_inqire_qnalist(); return false;">목록</a>
                            </div>
                            <div class="center_col">
                            </div>
                            <div class="right_col">
                                <a href="#" class="btn btn_white_46" onclick="fn_egov_updt_qnacn('<c:out value="${result.qaId}"/>'); return false;">수정</a>
                                <a href="#" class="btn btn_white_46" onclick="fn_egov_delete_qnacn('<c:out value="${result.qaId}"/>'); return false;">삭제</a>
                            </div>
                        </div>
                        <!-- 목록/저장버튼  끝-->

                        <input name="writngPassword" type="hidden" value="">
                        <input name="passwordConfirmAt" type="hidden" value="">

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

    <script type="text/javascript" src="<c:url value='/'/>js/ui.js"></script>
    <script type="text/javascript" src="<c:url value='/'/>js/jqueryui.js"></script>


    <c:if test="${result.passwordConfirmAt == 'N,'}">
        <script type="text/javascript">
            fn_egov_passwordConfirm();
        </script>
    </c:if>

</body>
</html>