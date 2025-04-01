<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>IBK시스템 AI 아이디어 챌린지 - 회원가입</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnIdCheck(){
    var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>?";
    
    var varParam = new Object();
    var checkId = document.mberManageVO.mberId.value;
    var varParam = "checkId="+checkId;
    
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px; " src="' + "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>?" + varParam +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 600,
        height: 450
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

function fn_egov_ZipSearch(){
    
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px; " src="' + "<c:url value='/sym/cmm/EgovCcmZipSearchList.do'/>" +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 1100,
        height: 600
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

function fn_egov_returnValue(retVal){
	if (retVal) {
		document.getElementById("zip_view").value  = retVal.vZip;
		document.getElementById("adres").value  = retVal.sAddr;
	}
	
	fn_egov_modal_remove();
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}

function showModalDialogCallback(retVal) {
	if(retVal) {
        document.mberManageVO.mberId.value = retVal;
        document.mberManageVO.id_view.value = retVal;
    }
	fn_egov_modal_remove();
}

function fnSbscrb(){
	if(validateMberManageVO(document.mberManageVO)){
		if(document.mberManageVO.password.value != document.mberManageVO.password2.value){
            alert("<spring:message code='fail.user.passwordUpdate2' />");
            return;
        }
		
        document.mberManageVO.submit();
    }	
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

        <!-- Page Title
============================================= -->
        <section id="page-title">

            <div class="container clearfix">
                <h1>2025년 AI 아이디어 공모전</h1>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item" aria-current="page">Home</li>
                    <li class="breadcrumb-item active" aria-current="page">회원가입</li>
                </ol>
            </div>

        </section><!-- #page-title end -->

        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">

                        <div class="content_wrap">
                            <div id="contents" class="content">

								<form:form modelAttribute="mberManageVO" action="${pageContext.request.contextPath}/uss/umt/cmm/EgovMberSbscrb.do" name="mberManageVO"  method="post" >
								
								<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
								<input name="checkedIdForDel" type="hidden" />
								<!-- 검색조건 유지 -->
								<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
								<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
								<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
								<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
								<!-- 우편번호검색 -->
								<input type="hidden" name="zip_url" value="<c:url value='/sym/cmm/EgovCcmZipSearchPopup.do'/>" />

                                <h2>사용자관리</h2>

                                <div class="board_view2">
                                    <table >
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberId">일반회원아이디</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_350">
                                                    <input id="id_view" type="text" maxlength="20" disabled="disabled" name="id_view" readonly >
                                                    <form:input path="mberId" type="hidden" readonly="true" maxlength="20" />
                                                    <button type="button" class="btn" onclick="javascript:fnIdCheck(); return false;"></button>
                                                </span>
                                                <span class="f_txt_inner ml15">(중복 아이디 검색)</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberNm">일반회원이름</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input id="mberNm" class="f_txt w_350" name="mberNm" type="text" title="일반회원 이름" value=<c:if test="${not empty mberNm}">"<c:out value="${mberNm}"/>" readonly</c:if> <c:if test="${empty mberNm}">""</c:if> maxlength="60" >
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="password">비밀번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:password id="password" class="f_txt w_350" path="password" maxlength="20" />
                                                <form:errors path="password" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="password2">비밀번호확인</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input id="password2" class="f_txt w_350" name="password2" type="password" maxlength="20" title="비밀번호 확인">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="passwordHint">비밀번호힌트</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_350" for="passwordHint">
                                                    <form:select path="passwordHint" id="passwordHint" name="passwordHint" title="비밀번호힌트">
                                                        <form:option value="" label="선택하세요"/>
                                                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="passwordCnsr">비밀번호정답</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input id="passwordCnsr" class="f_txt w_350" path="passwordCnsr" maxlength="100" />
                                                <form:errors path="passwordCnsr" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="sexdstnCode">성별구분코드</label>
                                            </td>
                                            <td>
                                                <label class="f_select w_150" for="sexdstnCode">
                                                    <form:select path="sexdstnCode" id="sexdstnCode" name="sexdstnCode" title="성별구분코드">
                                                        <form:option value="" label="선택하세요"/>
                                                        <form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="areaNo">전화번호</label>
                                            </td>
                                            <td>
                                                <form:input id="areaNo" class="f_txt w_80" path="areaNo" maxlength="5" />
                                                <span class="f_txt_inner mr5 ml5" title="전화번호 첫번째">-</span>
                                                <form:input class="f_txt w_80" path="middleTelno" maxlength="5" />
                                                <span class="f_txt_inner mr5 ml5">-</span>
                                                <form:input class="f_txt w_80" path="endTelno" maxlength="5" />
                                                
                                                <form:errors path="areaNo" />
                                                <form:errors path="middleTelno" />
                                                <form:errors path="endTelno" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberFxnum">팩스번호</label>
                                            </td>
                                            <td>
                                                <form:input id="" class="f_txt w_350" path="mberFxnum" maxlength="15" />
                                                <form:errors path="mberFxnum" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="moblphonNo">핸드폰번호</label>
                                            </td>
                                            <td>
                                                <form:input id="moblphonNo" class="f_txt w_350" path="moblphonNo" maxlength="15" />
                                                <form:errors path="moblphonNo" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberEmailAdres">이메일주소</label>
                                            </td>
                                            <td>
                                                <form:input id="mberEmailAdres" class="f_txt w_350" path="mberEmailAdres" maxlength="50" />
                                                <form:errors path="mberEmailAdres" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="zip_view">우편번호</label>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_350">
                                                    <input id="zip_view" name="zip_view" title="우편번호" type="text" value="<c:out value='${mberManageVO.zip}'/>" maxlength="8" readonly="readonly">
                                                    <form:hidden path="zip" />
                                                    <button type="button" class="btn" onclick="fn_egov_ZipSearch();"></button>
                                                </span>
                                                <span class="f_txt_inner ml15">(우편번호 검색)</span>
                                                <form:errors path="zip" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="adres">주소</label>
                                            </td>
                                            <td>
                                                <form:input id="adres" class="f_txt w_full" path="adres" maxlength="100" readonly="true" />
                                                <form:errors path="adres" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="detailAdres">상세주소</label>
                                            </td>
                                            <td>
                                                <form:input id="detailAdres" class="f_txt w_full" path="detailAdres" maxlength="100" />
                                                <form:errors path="detailAdres" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  시작-->
                                <input type="button" name="btn_save" id="btn_save" class="s_btn" value="가입신청" title="가입신청버튼" onclick="javascript:fnSbscrb(); return false;"/>
                                <input type="button" name="btn_reset" id="btn_reset" class="s_btn" value="초기화" title="초기화버튼" onclick="javascript:document.mberManageVO.reset(); return false;" />

                                <!-- // 목록/저장버튼  끝-->
                                
                                <!--// 게시판 -->
                                
                                <form:hidden path="groupId" />
                                <form:hidden path="mberSttus" />
                                
                                </form:form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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

    <script type="text/javascript" src="<c:url value='/'/>js/include.js"></script>

    <script src="<c:url value='/'/>js/ui.js"></script>
    <script src="<c:url value='/'/>js/jquery.js"></script>
    <script src="<c:url value='/'/>js/jqueryui.js"></script>
    <link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

    <!-- Footer Scripts
    ============================================= -->
    <script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

</body>
</html>