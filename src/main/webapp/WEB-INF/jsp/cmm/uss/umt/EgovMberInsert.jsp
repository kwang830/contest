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
    <link rel="preload" href="<c:url value='/'/>css/font-icons.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/sub.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/board.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

    <link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css" type="text/css">

    <!-- Document Title
    ============================================= -->
    <title>IBK시스템 AI 아이디어 챌린지 - 사용자 정보 관리</title>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

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
        document.getElementById("zip").value  = retVal.vZip.replace(/\D/g, '');
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

        <!-- Content
============================================= -->
        <section id="content">
            <div class="sub-layout">
                <div class="sub-banner">
                    <div class="container">
                        <div class="sub-banner-title">
                            사용자 정보 관리
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
                            <button class="nav-button">시스템관리 <span class="nav-toggle"></span></button>
                        </div>
                        <div class="nav-item has-dropdown">
                            <button class="nav-button">사용자 정보 관리 <span class="nav-toggle"><img
                                    src="/images/icon-nav-arrow.png" alt=""></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="#">접수게시판</a></li>
                                <li><a href="#">로그인 이력</a></li>
                                <li><a href="#">부서 통계 현황</a></li>
                                <li class="active"><a href="#">사용자 정보 관리</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="content-wrap">
                <div class="container clearfix">
                    <form:form modelAttribute="mberManageVO" name="mberManageVO" action="${pageContext.request.contextPath}/uss/umt/mber/EgovMberInsert.do" method="post" >

                        <div class="board_form">
                            <div>
                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="mberId">일반회원아이디</label><span style="color:red;">*</span>
                                    </div>
                                    <div class="input">
                                        <span class="f_search2 w_350">
                                            <input id="id_view" type="text" maxlength="20" disabled="disabled" name="id_view" readonly >
                                            <form:input path="mberId" type="hidden" readonly="true" maxlength="20" />
                                            <a href="#" class="btn btn_white_46" onclick="javascript:fnIdCheck(); return false;">검색</a>
                                        </span>
                                        <span class="f_txt_inner ml15">(중복 아이디 검색)</span>
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="mberNm">일반회원이름</label><span style="color:red;">*</span>
                                    </div>
                                    <div class="input">
                                        <input name="mberNm" id="mberNm" class="f_txt w_350" title="일반회원이름" type="text" value="" maxlength="60" />
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="password">비밀번호</label><span style="color:red;">*</span>
                                    </div>
                                    <div class="input">
                                        <form:password path="password" id="password" class="f_txt w_350" title="비밀번호" maxlength="20" />
                                        <form:errors path="password" cssClass="error" />
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="password2">비밀번호확인</label><span style="color:red;">*</span>
                                    </div>
                                    <div class="input">
                                        <input name="password2" id="password2" class="f_txt w_350" title="비밀번호확인" type="password" maxlength="20" />
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="passwordHint">비밀번호힌트</label><span style="color:red;">*</span>
                                    </div>
                                    <div class="input">
                                        <label class="f_select w_350" for="passwordHint">
                                            <form:select path="passwordHint" id="passwordHint" title="비밀번호힌트">
                                                <form:option value="" label="선택하세요"/>
                                                <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                                            </form:select>
                                            <form:errors path="passwordHint" cssClass="error"/>
                                        </label>
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="passwordCnsr">비밀번호정답</label><span style="color:red;">*</span>
                                    </div>
                                    <div class="input">
                                        <form:input path="passwordCnsr" id="passwordCnsr" class="f_txt w_350" title="비밀번호정답" maxlength="100" />
                                        <form:errors path="passwordCnsr" cssClass="error"/>
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="sexdstnCode">성별구분코드</label>
                                    </div>
                                    <div class="input">
                                        <label class="f_select w_350" for="sexdstnCode">
                                            <form:select path="sexdstnCode" id="sexdstnCode" title="성별구분코드">
                                                <form:option value="" label="--선택하세요--"/>
                                                <form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
                                            </form:select>
                                        </label>
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="areaNo">전화번호</label>
                                    </div>
                                    <div class="input">
                                        <form:input path="areaNo" id="areaNo" class="f_txt w_80" title="전화번호" maxlength="5" />
                                        <span class="f_txt_inner mr5 ml5" title="전화번호 첫번째">-</span>
                                        <form:input path="middleTelno" id="middleTelno" class="f_txt w_80" title="전화번호 두번째" maxlength="5" />
                                        <span class="f_txt_inner mr5 ml5">-</span>
                                        <form:input path="endTelno" id="endTelno" class="f_txt w_80" title="전화번호 세번째" maxlength="5" />
                                        <form:errors path="areaNo" cssClass="error" />
                                        <form:errors path="middleTelno" cssClass="error" />
                                        <form:errors path="endTelno" cssClass="error" />
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="mberFxnum">팩스번호</label>
                                    </div>
                                    <div class="input">
                                        <form:input path="mberFxnum" id="mberFxnum" class="f_txt w_350" title="팩스번호" maxlength="15" />
                                        <form:errors path="mberFxnum" cssClass="error" />
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="moblphonNo">핸드폰번호</label>
                                    </div>
                                    <div class="input">
                                        <form:input path="moblphonNo" id="moblphonNo" class="f_txt w_350" title="핸드폰번호" maxlength="15" />
                                        <form:errors path="moblphonNo" cssClass="error" />
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="mberEmailAdres">이메일주소</label>
                                    </div>
                                    <div class="input">
                                        <form:input path="mberEmailAdres" id="mberEmailAdres" class="f_txt w_350" title="이메일주소" maxlength="50" />
                                        <form:errors path="mberEmailAdres" cssClass="error" />
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="zip_view">우편번호</label>
                                    </div>
                                    <div class="input">
                                        <span class="f_search2 w_350">
                                            <input name="zip_view" id="zip_view" title="우편번호" type="text" value="<c:out value='${mberManageVO.zip}'/>" maxlength="8" readonly="readonly" />
                                            <form:hidden path="zip" />
                                            <a href="#" class="btn btn_white_46" onclick="javascript:fn_egov_ZipSearch(); return false;">검색</a>
                                            <form:errors path="zip" cssClass="error" />
                                        </span>
                                        <span class="f_txt_inner ml15">(우편번호 검색)</span>
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="adres">주소</label>
                                    </div>
                                    <div class="input">
                                        <form:input path="adres" id="adres" class="f_txt w_full" title="주소" maxlength="100" readonly="true" />
                                        <form:errors path="adres" cssClass="error" />
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="detailAdres">상세주소</label>
                                    </div>
                                    <div class="input">
                                        <form:input path="detailAdres" id="detailAdres" class="f_txt w_full" title="상세주소" maxlength="100" />
                                        <form:errors path="detailAdres" cssClass="error" />
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="groupId">그룹아이디</label><span style="color:red;">*</span>
                                    </div>
                                    <div class="input">
                                        <label class="f_select w_350" for="groupId">
                                            <form:select path="groupId" id="groupId" title="그룹아이디">
                                                <form:option value="" label="--선택하세요--"/>
                                                <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                                            </form:select>
                                            <form:errors path="groupId" cssClass="error"/>
                                        </label>
                                    </div>
                                </div>

                                <div class="board_form_row">
                                    <div class="title">
                                        <label for="mberSttus">일반회원상태코드</label><span style="color:red;">*</span>
                                    </div>
                                    <div class="input">
                                        <label class="f_select w_350" for="mberSttus">
                                            <form:select path="mberSttus" id="mberSttus" title="일반회원상태코드">
                                                <form:option value="" label="--선택하세요--"/>
                                                <form:options items="${mberSttus_result}" itemValue="code" itemLabel="codeNm"/>
                                            </form:select>
                                            <form:errors path="mberSttus" cssClass="error"/>
                                        </label>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <!-- 목록/저장버튼  시작-->
                        <div class="board_view_bot">
                            <div class="left_col">
                                <a href="#" class="btn btn_gray_46" onclick="fnListPage(); return false;">목록</a>
                            </div>
                            <div class="center_col">
                                <a href="#" class="btn btn_white_46" onclick="javascript:document.mberManageVO.reset();">취소</a>
                                <a href="#" class="btn btn_white_46" onclick="fnInsert(); return false;">저장</a>
                            </div>
                            <div class="right_col"></div>
                        </div>
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

    <script type="text/javascript" src="<c:url value='/'/>js/ui.js"></script>
    <script type="text/javascript" src="<c:url value='/'/>js/jqueryui.js"></script>

    <!-- Footer Scripts
    ============================================= -->
    <script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>
    
</body>
</html>