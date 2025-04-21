<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">


    <!-- Document Title
============================================= -->
    <title>IBK시스템 AI 아이디어 챌린지 - 사용자별권한관리</title>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

    <script type="text/javaScript" language="javascript" defer="defer">
        <!--

        function fncCheckAll() {
            var checkField = document.listForm.delYn;
            if(document.listForm.checkAll.checked) {
                if(checkField) {
                    if(checkField.length > 1) {
                        for(var i=0; i < checkField.length; i++) {
                            checkField[i].checked = true;
                        }
                    } else {
                        checkField.checked = true;
                    }
                }
            } else {
                if(checkField) {
                    if(checkField.length > 1) {
                        for(var j=0; j < checkField.length; j++) {
                            checkField[j].checked = false;
                        }
                    } else {
                        checkField.checked = false;
                    }
                }
            }
        }

        function fncManageChecked() {

            var resultCheck = false;

            var checkField = document.listForm.delYn;
            var checkId = document.listForm.checkId;
            var selectAuthor = document.listForm.authorManageCombo;
            var booleanRegYn = document.listForm.regYn;
            var listMberTyCode = document.listForm.mberTyCode;

            var returnId = "";
            var returnAuthor = "";
            var returnRegYn = "";
            var returnmberTyCode = "";

            var checkedCount = 0;

            if(checkField) {
                if(checkField.length > 1) {
                    for(var i=0; i<checkField.length; i++) {
                        if(checkField[i].checked) {
                            checkedCount++;
                            checkField[i].value = checkId[i].value;
                            if(returnId == "") {
                                returnId = checkField[i].value;
                                returnAuthor = selectAuthor[i].value;
                                returnRegYn = booleanRegYn[i].value;
                                returnmberTyCode = listMberTyCode[i].value;
                            }
                            else {
                                returnId = returnId + ";" + checkField[i].value;
                                returnAuthor = returnAuthor + ";" + selectAuthor[i].value;
                                returnRegYn = returnRegYn + ";" + booleanRegYn[i].value;
                                returnmberTyCode = returnmberTyCode + ";" + listMberTyCode[i].value;

                            }
                        }
                    }

                    if(checkedCount > 0)
                        resultCheck = true;
                    else {
                        alert("선택된  항목이 없습니다.");
                        resultCheck = false;
                    }

                } else {
                    if(document.listForm.delYn.checked == false) {
                        alert("선택 항목이 없습니다.");
                        resultCheck = false;
                    }
                    else {
                        returnId = checkId.value;
                        returnAuthor = selectAuthor.value;
                        returnRegYn = booleanRegYn.value;
                        returnmberTyCode = listMberTyCode.value;

                        resultCheck = true;
                    }
                }
            } else {
                alert("조회된 결과가 없습니다.");
            }

            document.listForm.userIds.value = returnId;
            document.listForm.authorCodes.value = returnAuthor;
            document.listForm.regYns.value = returnRegYn;
            document.listForm.mberTyCodes.value = returnmberTyCode;
            return resultCheck;
        }

        function fncSelectAuthorGroupList(pageNo){
            //document.listForm.searchCondition.value = "1";
            document.listForm.pageIndex.value = pageNo;
            document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>";
            document.listForm.submit();
        }

        function fncAddAuthorGroupInsert() {

            if(!fncManageChecked()) return;

            if(confirm('<spring:message code="common.regist.msg" />')) {
                document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupInsert.do'/>";
                document.listForm.submit();
            }
        }

        function fncAuthorGroupDeleteList() {

            if(!fncManageChecked()) return;

            if(confirm('<spring:message code="common.delete.msg" />')) {
                document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupDelete.do'/>";
                document.listForm.submit();
            }
        }

        function linkPage(pageNo){
            //document.listForm.searchCondition.value = "1";
            document.listForm.pageIndex.value = pageNo;
            document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>";
            document.listForm.submit();
        }

        function fncSelectAuthorGroupPop() {

            if(document.listForm.searchCondition.value == '3') {

                var $dialog = $('<div id="modalPan"></div>')
                    .html('<iframe style="border: 0px; " src="' + "<c:url value='/sec/gmt/EgovGroupSearchList.do'/>" +'" width="100%" height="100%"></iframe>')
                    .dialog({
                        autoOpen: false,
                        modal: true,
                        width: 850,
                        height: 700
                    });
                $(".ui-dialog-titlebar").hide();
                $dialog.dialog('open');
            } else {
                alert("그룹을 선택하세요.");
                return;
            }

            /*
            var url = "<c:url value='/sec/gmt/EgovGroupSearchView.do'/>";
    var varParam = new Object();
    var openParam = "dialogWidth:500px;dialogHeight:485px;scroll:no;status:no;center:yes;resizable:yes;";
    var retVal;

    if(document.listForm.searchCondition.value == '3') {
        retVal = window.showModalDialog(url, varParam, openParam);
        if(retVal) {
            document.listForm.searchKeyword.value = retVal;
            alert(document.listForm.searchKeyword.value);
        }
    } else {
        alert("그룹을 선택하세요.");
        return;
    }
    */

        }

        function fn_egov_returnValue(retVal){
            if(retVal != null){

                document.listForm.searchKeyword.value = retVal;
            }

            fn_egov_modal_remove();
        }

        /**********************************************************
         * 모달 종료 버튼
         ******************************************************** */
        function fn_egov_modal_remove() {
            $('#modalPan').remove();
        }

        function onSearchCondition() {
            document.listForm.searchKeyword.value = "";
            if(document.listForm.searchCondition.value == '3') {
                document.listForm.searchKeyword.readOnly = true;
            } else {
                document.listForm.searchKeyword.readOnly = false;
            }
        }

        function press() {

            if (event.keyCode==13) {
                fncSelectAuthorGroupList('1');
            }
        }
        //-->
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
                        사용자 권한 관리
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

                <form:form name="listForm" action="<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>" method="post">
                    <!-- 검색조건 -->
                    <div class="condition">

                        <label class="item f_select" for="sel1">
                            <select id="sel1" name="searchCondition" onchange="onSearchCondition()" title="조회조건">
                                <option value="1" <c:if test="${authorGroupVO.searchCondition == '1'}">selected</c:if> >사용자 ID</option>
                                <option value="2" <c:if test="${authorGroupVO.searchCondition == '2'}">selected</c:if> >사용자 명</option>
                                <option value="3" <c:if test="${authorGroupVO.searchCondition == '3'}">selected</c:if> >그룹</option>
                            </select>
                        </label>

                        <span class="item f_search">
                            <input id="searchWord" class="f_input w_500" name="searchKeyword" type="text" value="<c:out value='${authorGroupVO.searchKeyword}'/>" title="검색" onkeypress="press();"/>
                            <button class="btn" type="submit" onclick="javascript:fncSelectAuthorGroupList('1')" style="selector-dummy:expression(this.hideFocus=false);">조회</button><!-- 조회 -->
                        </span>


                    </div>
                    <!--// 검색조건 -->

                    <div class="board_list_top topmargin">
                        <div class="left_col">
                            <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:fncSelectAuthorGroupPop()">팝업조회</a><!-- 팝업조회 -->
                        </div>

                        <div class="right_col">
                            <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncAddAuthorGroupInsert()" style="selector-dummy:expression(this.hideFocus=false);">권한등록</a><!-- 등록 -->
                            <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncAuthorGroupDeleteList()" style="selector-dummy:expression(this.hideFocus=false);">등록취소</a><!-- 삭제 -->
                        </div>
                    </div>


                    <!-- 게시판 -->
                    <div class="board_list">
                        <table>
                            <caption>목록</caption>
                            <colgroup>
                                <col style="width: 70px;">
                                <col style="width: 70px;">
                                <col style="width: auto; min-width: 250px;">
                                <col style="width: 250px;">
                                <col style="width: 250px;">
                                <col style="width: 250px;">
                                <col style="width: 250px;">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">No.</th>
                                <th scope="col">
                                    <span class="f_chk_only chkAll">
                                        <input type="checkbox" name="checkAll" title="선택여부" onclick="javascript:fncCheckAll()">
                                    </span>
                                </th>
                                <th scope="col">사용자ID</th>
                                <th scope="col">사용자명</th>
                                <th scope="col">사용자 유형</th>
                                <th scope="col">권한</th>
                                <th scope="col">등록여부</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${fn:length(authorGroupList) == 0}">
                                <tr>
                                    <td colspan="7"><spring:message code="common.nodata.msg" /></td>
                                </tr>
                            </c:if>

                            <c:forEach var="authorGroup" items="${authorGroupList}" varStatus="status">
                                <tr>
                                    <td><c:out value="${(paginationInfo.currentPageNo-1) * paginationInfo.pageSize + status.count}" /></td>
                                    <td>
                                        <span class="f_chk_only">
                                            <input type="checkbox" name="delYn" class="check2" title="선택">
                                            <input type="hidden" name="checkId" value="<c:out value="${authorGroup.uniqId}"/>"/>
                                        </span>
                                    </td>
                                    <td><a href="" class="lnk"><c:out value="${authorGroup.userId}"/></a></td>
                                    <td><c:out value="${authorGroup.userNm}"/></td>
                                    <td>
                                        <c:out value="${authorGroup.mberTyNm}"/>
                                        <input type="hidden" name="mberTyCode" value="<c:out value="${authorGroup.mberTyCode}"/>"/>
                                    </td>
                                    <td>
                                        <label class="f_select w_130" for="">
                                            <select id="" name="authorManageCombo" title="권한선택">
                                                <c:forEach var="authorManage" items="${authorManageList}" varStatus="status">
                                                    <option value="<c:out value="${authorManage.authorCode}"/>" <c:if test="${authorManage.authorCode == authorGroup.authorCode}">selected</c:if> ><c:out value="${authorManage.authorNm}"/></option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                    </td>
                                    <td>
                                        <c:out value="${authorGroup.regYn}"/>
                                        <input type="hidden" name="regYn" value="<c:out value="${authorGroup.regYn}"/>">
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <!-- 페이징 -->
                    <c:if test="${!empty authorGroupVO.pageIndex }">
                        <div class="board_list_bot">
                            <div class="paging" id="paging_div">
                                <ul>
                                    <ui:pagination paginationInfo = "${paginationInfo}" type="renew" jsFunction="linkPage" />
                                </ul>
                            </div>
                        </div>
                    </c:if>
                    <!-- // 페이징 끝 -->

                    <input type="hidden" name="userId"/>
                    <input type="hidden" name="userIds"/>
                    <input type="hidden" name="authorCodes"/>
                    <input type="hidden" name="regYns"/>
                    <input type="hidden" name="mberTyCodes"/>
                    <input type="hidden" name="pageIndex" value="<c:out value='${authorGroupVO.pageIndex}'/>"/>

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

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

<script src="<c:url value='/'/>js/ui.js"></script>
<%--<script src="<c:url value='/'/>js/jquery.js"></script>--%>
<script src="<c:url value='/'/>js/jqueryui.js"></script>

</body>
</html>