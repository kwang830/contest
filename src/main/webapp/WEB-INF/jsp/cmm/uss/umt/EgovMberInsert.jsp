<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <title>IBK시스템 AI 아이디어 챌린지 - 회원관리</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fnIdCheck(){
    var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>?";
    
    var varParam = new Object();
    var checkId = document.mberManageVO.mberId.value;
    var varParam = "checkId="+checkId;

    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px;" src="' + "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>?" + varParam +'" width="100%" height="100%"></iframe>')
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

function fnListPage(){
    document.mberManageVO.action = "<c:url value='/uss/umt/mber/EgovMberManage.do'/>";
    document.mberManageVO.submit();
}
function fnInsert(){
	if(validateMberManageVO(document.mberManageVO)){
		if(document.mberManageVO.password.value != document.mberManageVO.password2.value){
            alert("<spring:message code="fail.user.passwordUpdate2" />");
            return;
        }
        document.mberManageVO.submit();
    }
}

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
                    <li class="breadcrumb-item active" aria-current="page">사용자관리</li>
                </ol>
            </div>

        </section><!-- #page-title end -->

        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
        
                        <div class="content_wrap">
                            <div id="contents" class="content">


								<form:form modelAttribute="mberManageVO" name="mberManageVO" action="${pageContext.request.contextPath}/uss/umt/mber/EgovMberInsert.do" method="post" >

                                <h2>사용자관리</h2>

                                <div class="board_view2">
                                    <table>
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
                                                    <input type="button" name="btn_src" id="btn_src" class="s_btn" value="검색" title="검색버튼" onclick="javascript:fnIdCheck(); return false;" />

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
                                                <input name="mberNm" id="mberNm" class="f_txt w_350" title="일반회원이름" type="text" value="" maxlength="60" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="password">비밀번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:password path="password" id="password" class="f_txt w_350" title="비밀번호" maxlength="20" />
                                                <form:errors path="password" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="password2">비밀번호확인</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="password2" id="password2" class="f_txt w_350" title="비밀번호확인" type="password" maxlength="20" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	비밀번호힌트
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_350" for="passwordHint">
                                                    <form:select path="passwordHint" id="passwordHint" title="비밀번호힌트">
                                                        <form:option value="" label="--선택하세요--"/>
                                                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                    <form:errors path="passwordHint" cssClass="error"/>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="passwordCnsr">비밀번호정답</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="passwordCnsr" id="passwordCnsr" class="f_txt w_350" title="비밀번호정답" maxlength="100" />
                                                <form:errors path="passwordCnsr" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	성별구분코드
                                            </td>
                                            <td>
                                                <label class="f_select w_350" for="sexdstnCode">
                                                    <form:select path="sexdstnCode" id="sexdstnCode" title="성별구분코드">
                                                        <form:option value="" label="--선택하세요--"/>
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
                                                <form:input path="areaNo" id="areaNo" class="f_txt w_80" title="전화번호" maxlength="5" />
                                                <span class="f_txt_inner mr5 ml5" title="전화번호 첫번째">-</span>
                                                <form:input path="middleTelno" id="middleTelno" class="f_txt w_80" title="전화번호 두번째" maxlength="5" />
                                                <span class="f_txt_inner mr5 ml5">-</span>
                                                <form:input path="endTelno" id="endTelno" class="f_txt w_80" title="전화번호 세번째" maxlength="5" />
                                                <form:errors path="areaNo" cssClass="error" />
                                                <form:errors path="middleTelno" cssClass="error" />
                                                <form:errors path="endTelno" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">팩스번호</label>
                                            </td>
                                            <td>
                                                <form:input path="mberFxnum" id="mberFxnum" class="f_txt w_350" title="팩스번호" maxlength="15" />
                                                <form:errors path="mberFxnum" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberFxnum">핸드폰번호</label>
                                            </td>
                                            <td>
                                                <form:input path="moblphonNo" id="moblphonNo" class="f_txt w_350" title="핸드폰번호" maxlength="15" />
                                                <form:errors path="moblphonNo" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">이메일주소</label>
                                            </td>
                                            <td>
                                                <form:input path="mberEmailAdres" id="mberEmailAdres" class="f_txt w_350" title="이메일주소" maxlength="50" />
                                                <form:errors path="mberEmailAdres" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="zip_view">우편번호</label>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_350">
                                                    <input name="zip_view" id="zip_view" title="우편번호" type="text" value="<c:out value='${mberManageVO.zip}'/>" maxlength="8" readonly="readonly" />
                                                    <form:hidden path="zip" />
                                                    <input type="button" name="btn_src2" id="btn_src2" class="s_btn" value="검색" title="검색버튼" onclick="fn_egov_ZipSearch();" />

                                                    <form:errors path="zip" cssClass="error" />
                                                </span>
                                                <span class="f_txt_inner ml15">(우편번호 검색)</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="adres">주소</label>
                                            </td>
                                            <td>
                                                <form:input path="adres" id="adres" class="f_txt w_full" title="주소" maxlength="100" readonly="true" />
                                                <form:errors path="adres" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="detailAdres">상세주소</label>
                                            </td>
                                            <td>
                                                <form:input path="detailAdres" id="detailAdres" class="f_txt w_full" title="상세주소" maxlength="100" />
                                                <form:errors path="detailAdres" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	그룹아이디
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_350" for="groupId">
                                                    <form:select path="groupId" id="groupId" title="그룹아이디">
                                                        <form:option value="" label="--선택하세요--"/>
                                                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                    <form:errors path="groupId" cssClass="error"/>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	일반회원상태코드
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_350" for="mberSttus">
                                                    <form:select path="mberSttus" id="mberSttus" title="일반회원상태코드">
                                                        <form:option value="" label="--선택하세요--"/>
                                                        <form:options items="${mberSttus_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                    <form:errors path="mberSttus" cssClass="error"/>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  시작-->
                                <input type="button" name="btn_cancel" id="btn_cancel" class="s_btn" value="취소" title="취소버튼" onclick="javascript:document.mberManageVO.reset();" />
                                <input type="button" name="btn_save" id="btn_save" class="s_btn" value="저장" title="저장버튼" onclick="fnInsert(); return false;" />
                                <input type="button" name="btn_list" id="btn_list" class="s_btn" value="목록" title="목록버튼" onclick="fnListPage(); return false;" />
                                <!-- 목록/저장버튼  끝-->

                                <input name="checkedIdForDel" type="hidden" />
						        <!-- 검색조건 유지 -->
						        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
						        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
						        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
						        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
						        <!-- 우편번호검색 -->
						        <input type="hidden" name="zip_url" value="<c:url value='/sym/cmm/EgovCcmZipSearchPopup.do'/>" />
						        
						        </form:form>
                                
                                <!--// 게시판 -->
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

    <script type="text/javascript" src="<c:url value='/'/>js/common.js"></script>

    <script src="<c:url value='/'/>js/ui.js"></script>
    <script src="<c:url value='/'/>js/jquery.js"></script>
    <script src="<c:url value='/'/>js/jqueryui.js"></script>
    <link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

    <!-- Footer Scripts
    ============================================= -->
    <script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>
    
</body>
</html>