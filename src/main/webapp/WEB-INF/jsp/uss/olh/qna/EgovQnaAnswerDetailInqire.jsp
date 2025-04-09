<%@ page contentType="text/html; charset=utf-8"%>
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
    <link rel="preload" href="<c:url value='/'/>css/board.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

    <!-- Document Title
    ============================================= -->
    <title>IBK시스템, AI 아이디어 챌린지 - QnA</title>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_qnaanswerlist() {

	document.QnaManageForm.action = "<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>";
	document.QnaManageForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_qnacnanswer(qaId){

	// Update하기 위한 키값을 셋팅
	document.QnaManageForm.qaId.value = qaId;	

	document.QnaManageForm.action = "<c:url value='/uss/olh/qnm/QnaCnAnswerUpdtView.do'/>";
	document.QnaManageForm.submit();	

		
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
                            QnA 답변관리
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
                            <button class="nav-button">QNA <span class="nav-toggle"><img
                                    src="/images/icon-nav-arrow.png" alt=""></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA">공지사항</a></li>
                                <li><a href="/uss/olh/faq/FaqListInqire.do">FAQ</a></li>
                                <li class="active"><a href="/uss/olh/qna/QnaListInqire.do">QNA</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="content-wrap">
                <div class="container clearfix">
                    <form name="QnaManageForm" action="<c:url value='/uss/olh/qnm/QnaCnAnswerUpdtView.do'/>" method="post">

                        <div class="board_form">
                            <div>
                                <div class="board_form_row">
                                    <div class="title">작성자명</div>
                                    <div class="input">
                                        <c:out value="${result.wrterNm}"/>
                                        <c:out value="${result.passwordConfirmAt}"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">전화번호</div>
                                    <div class="input">
                                        <c:out value="${result.areaNo}"/>-<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">이메일</div>
                                    <div class="input">
                                        <c:out value="${result.emailAdres}"/>
                                        <input type="hidden" name="emailAnswerAt" id="emailAnswerAt" value="N"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">작성일자</div>
                                    <div class="input">
                                        <c:if test="${result.writngDe != null}">
                                            <c:out value='${fn:substring(result.writngDe, 0,4)}'/>-<c:out value='${fn:substring(result.writngDe, 4,6)}'/>-<c:out value='${fn:substring(result.writngDe, 6,8)}'/>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">조회수</div>
                                    <div class="input">
                                        <c:out value="${result.inqireCo}"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">진행처리상태</div>
                                    <div class="input">
                                        <c:out value="${result.qnaProcessSttusCodeNm}"/>
                                    </div>
                                </div>


                                <div class="board_form_row">
                                    <div class="title">질문제목</div>
                                    <div class="input">
                                        <c:out value="${result.qestnSj}"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title">질문내용</div>
                                    <div class="input">
                                        <textarea id="qestnCn" name="qestnCn" class="f_txtar w_full h_200" cols="30" rows="10" readonly title="질문내용"><c:out value="${result.qestnCn}"/></textarea>
                                    </div>
                                </div>
                                <c:if test="${result.qnaProcessSttusCode == '3'}">
                                    <div class="board_form_row">
                                        <div class="title">답변내용</div>
                                        <div class="input">
                                            <textarea name="answerCn" class="f_txtar w_full h_200" cols="30" rows="10" readonly title="답변내용"><c:out value="${result.answerCn}"/></textarea>
                                        </div>
                                    </div>
                                    <div class="board_form_row">
                                        <div class="title">답변일자</div>
                                        <div class="input">
                                            <c:if test="${result.answerDe != null}">
                                                <c:out value='${fn:substring(result.answerDe, 0,4)}'/>-<c:out value='${fn:substring(result.answerDe, 4,6)}'/>-<c:out value='${fn:substring(result.answerDe, 6,8)}'/>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- 목록/저장버튼  시작-->
                        <div class="board_view_bot">
                            <div class="left_col">
                                <a href="#" class="btn btn_gray_46" onclick="javascript:fn_egov_inqire_qnaanswerlist(); return false;">목록</a>
                            </div>
                            <div class="center_col">
                                <a href="#" class="btn btn_white_46" onclick="fn_egov_updt_qnacnanswer('<c:out value="${result.qaId}"/>'); return false;">답변</a>
                            </div>
                            <div class="right_col"></div>
                        </div>
                        <!-- 목록/저장버튼  끝-->

                        <input name="qaId" type="hidden" value="">
                        <input name="writngPassword" 	type="hidden" value="">
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

</body>
</html>