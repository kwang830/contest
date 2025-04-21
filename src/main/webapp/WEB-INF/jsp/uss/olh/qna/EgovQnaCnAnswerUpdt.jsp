<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Document Title
    ============================================= -->
    <title>IBK시스템, AI 아이디어 챌린지 - QnA</title>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qnaManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_qnacnanswer(){

	// 첫 입력란에 포커스..
	qnaManageVO.answerCn.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_qnacnanswer(form, qaId){

	// 서버사이드 테스트용
	/*	
		form.action = "<c:url value='/uss/olh/qnm/QnaCnAnswerUpdt.do'/>";
		form.submit(); 
		return;
	*/

	if (!validateQnaManageVO(form)) {
			
		return;
		
	} else {

	
		form.qaId.value = qaId;
		form.action = "<c:url value='/uss/olh/qnm/QnaCnAnswerUpdt.do'/>";
		form.submit();	
				
	}
		
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_qnaanswerlist() {

	qnaManageVO.action = "<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>";
	qnaManageVO.submit();
		
}

/* ********************************************************
 * 메일발송을 위한 화면을 호출
 ******************************************************** */
function fn_egov_pop_mailform() {
/*	
	var url 	= "<c:url value='/ems/insertSndngMailView.do'/>";	
	var	status 	= "width=640,height=480,top=200,left=200";

			
	window.open(url,'popup', status);
*/	 
}


</script>
</head>
<body class="stretched" onLoad="fn_egov_initl_qnacnanswer();">

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
                        <!-- Left menu -->
                        <c:import url="/sym/mms/ContMenuLeft.do" />
                        <!--// Left menu -->
                    </div>
                </nav>
            </div>
            <div class="content-wrap">
                <div class="container clearfix">
                    <form:form modelAttribute="qnaManageVO" name="qnaManageVO" action="${pageContext.request.contextPath}/uss/olh/qnm/QnaCnAnswerUpdt.do" method="post">
                        <input name="qaId" type="hidden" value="<c:out value='${result.qaId}'/>">
                        <input name="writngPassword" type="hidden" value="<c:out value='${result.writngPassword}'/>">

                        <div class="board_form">
                            <div>
                                <div class="board_form_row">
                                    <div class="title"><label for="wrterNm">작성자명</label><span style="color:red;">*</span></div>
                                    <div class="input">
                                        <form:input id="wrterNm" class="f_txt" path="wrterNm" size="20" maxlength="20" title="작성자명" readonly="true" />
                                        <form:errors path="wrterNm"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title"><label for="areaNo">전화번호</label></div>
                                    <div class="input">
                                        <form:input id="areaNo" class="f_txt w_80" path="areaNo" size="4" maxlength="4" title="전화번호(지역)" readonly="true" />
                                        <span class="f_txt_inner mr5 ml5">-</span>
                                        <form:input class="f_txt w_80" path="middleTelno" size="4" maxlength="4"  title="전화번호(국번)" readonly="true" />
                                        <span class="f_txt_inner mr5 ml5">-</span>
                                        <form:input class="f_txt w_80" path="endTelno" size="4" maxlength="4"  title="전화번호(지번)" readonly="true" />
                                        <form:errors path="areaNo"/>
                                        <form:errors path="middleTelno"/>
                                        <form:errors path="endTelno"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title"><label for="emailAdres">이메일</label></div>
                                    <div class="input">
                                        <form:input id="emailAdres" class="f_txt w_half" path="emailAdres" size="30" maxlength="30" title="이메일" readonly="true"/>
                                        <form:errors path="emailAdres"/>
                                        <input type="hidden" name="emailAnswerAt" id="emailAnswerAt" value="N"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title"><label for="qestnSj">질문제목</label><span style="color:red;">*</span></div>
                                    <div class="input">
                                        <form:input id="qestnSj" class="f_txt w_full" path="qestnSj" size="70" maxlength="70" title="질문제목" readonly="true" />
                                        <form:errors path="qestnSj"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title"><label for="qestnCn">질문내용</label><span style="color:red;">*</span></div>
                                    <div class="input">
                                        <form:textarea id="qestnCn" class="f_txtar w_full h_200" path="qestnCn" cols="30" rows="10" title="질문내용" readonly="true" />
                                        <form:errors path="qestnCn"/>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title"><label for="qnaProcessSttusCode">진행처리상태</label><span style="color:red;">*</span></div>
                                    <div class="input">
                                        <label class="f_select w_350" for="qnaProcessSttusCode">
                                            <form:select path="qnaProcessSttusCode" id="qnaProcessSttusCode" name="qnaProcessSttusCode">
                                                <form:option value="" label="--선택하세요--"/>
                                                <form:options items="${resultList}" itemValue="code" itemLabel="codeNm"/>
                                            </form:select>
                                            <form:errors path="qnaProcessSttusCode" cssClass="error"/>
                                        </label>
                                    </div>
                                </div>
                                <div class="board_form_row">
                                    <div class="title"><label for="answerCn">답변내용</label><span style="color:red;">*</span></div>
                                    <div class="input">
                                        <form:textarea path="answerCn" class="f_txtar w_full h_200" cols="30" rows="10" title="답변내용"/>
                                        <form:errors path="answerCn"/>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 목록/저장버튼  시작-->
                        <div class="board_view_bot">
                            <div class="left_col">
                                <a href="#" class="btn btn_gray_46" onclick="fn_egov_inqire_qnaanswerlist(); return false;">목록</a>
                            </div>
                            <div class="center_col">
                                <a href="#" class="btn btn_white_46" onclick="fn_egov_updt_qnacnanswer(document.qnaManageVO,'<c:out value="${result.qaId}"/>'); return false;">저장</a>
                            </div>
                            <div class="right_col"></div>
                        </div>
                        <!-- 목록/저장버튼  끝-->

                    </form:form>
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