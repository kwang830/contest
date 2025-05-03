<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="author" content="SemiColonWeb"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" as="style" crossorigin
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">

    <!-- preload -->
    <link rel="preload" href="<c:url value='/'/>css/reset.css" as="style"
          onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/styles.css" as="style"
          onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/responsive.css" as="style"
          onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/font-icons.css" as="style"
          onload="this.onload=null;this.rel='stylesheet'">
    <link rel="preload" href="<c:url value='/'/>css/sub.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <link rel="stylesheet" href="<c:url value='/'/>css/sub-ios.css" type="text/css" media="all" />
    <link rel="preload" href="<c:url value='/'/>css/board.css" as="style"
          onload="this.onload=null;this.rel='stylesheet'">

    <link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">


    <!-- Document Title
============================================= -->
    <title>IBK시스템 AI 아이디어 챌린지</title>

    <style type="text/css">
        table tr.selected td {
            background-color: #d0ebff; /* 모든 td에 하늘색 배경 */
            font-weight: bold;         /* 글씨 굵게 */
        }

        .marginTop5 { margin-top: 5px; }
    </style>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

    <script type="text/javaScript" language="javascript" defer="defer">
        <!--

        // 전체 체크박스 처리 (checkAll)
        function fncCheckAll(formName) {
            const form = document[formName];
            const checkAll = form.checkAll;
            const checkBoxes = form.querySelectorAll('input[name="delYn"]');

            checkBoxes.forEach(function(checkbox) {
                checkbox.checked = checkAll.checked;
                const wrapper = checkbox.closest('.f_chk_only');
                if (wrapper) {
                    if (checkAll.checked) {
                        wrapper.addClass('on');
                    } else {
                        wrapper.removeClass('on');
                    }
                }
            });
        }



        function fncManageChecked(formName, target) {

            var resultCheck = false;
            const form = document[formName];
            var checkField = form.delYn;
            var checkId = form.checkId;

            var returnId = "";
            var checkedCount = 0;

            if (checkField) {
                if (checkField.length > 1) {
                    for (var i = 0; i < checkField.length; i++) {
                        if (checkField[i].checked) {
                            checkedCount++;
                            checkField[i].value = checkId[i].value;
                            if (returnId == "") {
                                returnId = checkField[i].value;
                            } else {
                                returnId = returnId + ";" + checkField[i].value;
                            }
                        }
                    }
                    if (checkedCount > 0)
                        resultCheck = true;
                    else {
                        alert("선택한 항목이 없습니다.");
                        resultCheck = false;
                    }
                } else {
                    if (form.delYn.checked == false) {
                        alert("선택한 항목이 없습니다.");
                        resultCheck = false;
                    } else {
                        returnId = checkId.value;
                        resultCheck = true;
                    }
                }
            } else {
                alert("선택한 항목이 없습니다.");
            }
            form[target].value = returnId;
            return resultCheck;
        }

        function fncSetValtMngmNo(source) {
            document.listForm.valtMngmNo.value = source;
        }

        function fncSelectContestList(pageNo) {
            document.listForm.pageIndex.value = pageNo;
            document.listForm.action = "<c:url value='/cmm/contest/valt/contestValtMngm.do'/>";
            document.listForm.submit();
        }

        function fncContValtDeleteList() {
            if (!fncManageChecked('listForm', 'valtMngmNos')) return;

            if (confirm('<spring:message code="common.delete.msg" />')) {
                document.listForm.action = "<c:url value='/cmm/contest/valt/deleteContestValt.do'/>";
                document.listForm.submit();
            }
        }

        function fncContValtDeleteBbsList() {
            if (!fncManageChecked('bbsForm', 'nttIds')) return;

            if (confirm('<spring:message code="common.delete.msg" />')) {
                document.bbsForm.action = "<c:url value='/cmm/contest/valt/deleteContestValtBbs.do'/>";
                document.bbsForm.submit();
            }
        }

        function fncContValtDeleteUserList() {
            if (!fncManageChecked('userForm', 'exmnIds')) return;

            if (confirm('<spring:message code="common.delete.msg" />')) {
                document.userForm.action = "<c:url value='/cmm/contest/valt/deleteContestValtUser.do'/>";
                document.userForm.submit();
            }
        }

        function linkPage(pageNo) {
            //document.listForm.searchCondition.value = "1";
            document.listForm.pageIndex.value = pageNo;
            document.listForm.action = "<c:url value='/cmm/contest/valt/contestValtMngm.do'/>";
            document.listForm.submit();
        }

        function fncRegistContestValtPop() {
            var $dialog = $('<div id="modalPan"></div>')
                .html('<iframe style="border: 0px; " src="' + "<c:url value='/cmm/contest/valt/insertContestValtPopup.do'/>" + '" width="100%" height="100%"></iframe>')
                .dialog({
                    autoOpen: false,
                    modal: true,
                    width: 850,
                    height: 700
                });
            $(".ui-dialog-titlebar").hide();
            $(".ui-dialog-content").css("overflow", "hidden");
            $dialog.dialog('open');
        }

        function fncUpdateContestValtPop() {
            const selected = document.listForm.valtMngmNo.value;
            if (!selected || selected.trim().length === 0) {
                alert("선택 항목이 없습니다.")
                return;
            }
            const baseUrl = "<c:url value='/cmm/contest/valt/updateContestValtPopup.do' />";
            const action = baseUrl + "?valtMngmNo=" + selected;
            var $dialog = $('<div id="modalPan"></div>')
                .html('<iframe id="contestFrame3" style="border: 0px; " src="' + action + '" width="100%" height="100%"></iframe>')
                .dialog({
                    autoOpen: false,
                    modal: true,
                    width: 850,
                    height: 700,
                    open: function () {
                        const iframe = document.getElementById("contestFrame3");
                        iframe.onload = function () {
                            iframe.contentWindow.setParentData(document.listForm.valtMngmNo.value);
                        }
                    }
                });
            $(".ui-dialog-titlebar").hide();
            $(".ui-dialog-content").css("overflow", "hidden");
            $dialog.dialog('open');
        }

        function fncRegistContestValtBbsPop() {
            const selected = document.bbsForm.valtMngmNo.value;
            if (!selected || selected.trim().length === 0) {
                alert("평가 관리 정보를 먼저 선택하세요!")
                return;
            }
            const iframeUrl = "<c:url value='/cmm/contest/valt/selectContValtBbsList.do'/>?valtMngmNo=" + encodeURIComponent(selected);

            var $dialog = $('<div id="modalPan"></div>')
                .html('<iframe id="contestFrame" style="border: 0px; " src="' + iframeUrl  + '" width="100%" height="100%"></iframe>')
                .dialog({
                    autoOpen: false,
                    modal: true,
                    width: 850,
                    height: 700,
                    open: function () {
                        const iframe = document.getElementById("contestFrame");
                        iframe.onload = function () {
                            iframe.contentWindow.setParentData(document.bbsForm.valtMngmNo.value);
                        }
                    }
                });
            $(".ui-dialog-titlebar").hide();
            $(".ui-dialog-content").css("overflow", "hidden");
            $dialog.dialog('open');
        }

        function fncRegistContestValtUserPop() {
            const selected = document.userForm.valtMngmNo.value;
            if (!selected || selected.trim().length === 0) {
                alert("선택 항목이 없습니다.")
                return;
            }
            const baseUrl = "<c:url value='/cmm/contest/valt/selectContValtUserList.do' />";
            const action = baseUrl + "?valtMngmNo=" + selected;
            var $dialog = $('<div id="modalPan"></div>')
                .html('<iframe id="contestFrame2" style="border: 0px; " src="' + action + '" width="100%" height="100%"></iframe>')
                .dialog({
                    autoOpen: false,
                    modal: true,
                    width: 850,
                    height: 700,
                    open: function () {
                        const iframe = document.getElementById("contestFrame2");
                        iframe.onload = function () {
                            iframe.contentWindow.setParentData(document.userForm.valtMngmNo.value);
                        }
                    }
                });
            $(".ui-dialog-titlebar").hide();
            $(".ui-dialog-content").css("overflow", "hidden");
            $dialog.dialog('open');
        }

        function fn_egov_returnValue(retVal) {
            if (retVal != null && retVal.trim() != '') {
                alert(retVal);
            }
            fn_egov_modal_remove();
        }

        /**********************************************************
         * 모달 종료 버튼
         ******************************************************** */
        function fn_egov_modal_remove() {
            $('#modalPan').remove();
            location.reload();
        }

        function press(e) {
            if (e.key === 'Enter') {
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
    <c:import url="/sym/mms/ContHeader.do"/>
    <!-- //header end -->

    <!-- Content
============================================= -->
    <section id="content">
        <div class="sub-layout">
            <div class="sub-banner">
                <div class="container">
                    <div class="sub-banner-title">
                        공모전 평가 관리
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

                <form:form name="listForm" action="<c:url value='/cmm/contest/valt/contestValtMngm.do'/>" method="post">
                    <!-- 검색조건 -->
                    <div class="condition">

                        <label class="item f_select" for="sel1">
                            <select id="sel1" name="searchCnd" title="조회조건">
                                <option value="1" <c:if test="${contSearchVO.searchCnd == '1'}">selected</c:if> >평가관리번호</option>
                                <option value="2" <c:if test="${contSearchVO.searchCnd == '2'}">selected</c:if> >문항관리번호</option>
                                <option value="3" <c:if test="${contSearchVO.searchCnd == '3'}">selected</c:if> >년도</option>
                                <option value="4" <c:if test="${contSearchVO.searchCnd == '4'}">selected</c:if> >차수</option>
                                <option value="5" <c:if test="${contSearchVO.searchCnd == '5'}">selected</c:if> >제목</option>
                            </select>
                        </label>

                        <span class="item f_search">
                            <input id="searchWord" class="f_input w_500" name="searchWrd" type="text"
                                   value="<c:out value='${contSearchVO.searchWrd}'/>" title="검색" onkeydown="press(event);"/>
                            <button class="btn" type="submit" onclick="javascript:fncSelectContestList('1')">조회</button><!-- 조회 -->
                        </span>

                        <a href="#" class="item btn btn_black_46 w_100" onclick="javascript:fncRegistContestValtPop(); return false;">등록</a>
                        <a href="#" class="item btn btn_black_46 w_100" onclick="javascript:fncUpdateContestValtPop(); return false;">수정</a>
                        <a href="#" class="item btn btn_black_46 w_100" onclick="javascript:fncContValtDeleteList(); return false;">삭제</a>

                    </div>
                    <!--// 검색조건 -->

                    <!-- 평가 관리 정보 -->
                    <div class="board_list selectable-table" >
                        <table>
                            <caption>목록</caption>
                            <colgroup>
                                <col style="width: 70px;">
                                <col style="width: 70px;">
                                <col style="width: 120px;">
                                <col style="width: 120px;">
                                <col style="width: 120px;">
                                <col style="width: 70px;">
                                <col style="width: 220px;">
                                <col style="width: auto; min-width: 300px;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">
                                        <span class="f_chk_only chkAll">
                                            <input type="checkbox" name="checkAll" title="선택여부" onclick="javascript:fncCheckAll('listForm')">
                                        </span>
                                    </th>
                                    <th scope="col">평가 관리번호</th>
                                    <th scope="col">문항 관리번호</th>
                                    <th scope="col">년도</th>
                                    <th scope="col">차수</th>
                                    <th scope="col">시작일자</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">내용</th>
                                </tr>
                            </thead>
                            <tbody>

                            <c:if test="${fn:length(contValtList) == 0}">
                                <tr>
                                    <td colspan="9"><spring:message code="common.nodata.msg"/></td>
                                </tr>
                            </c:if>

                            <c:forEach var="contValt" items="${contValtList}" varStatus="status">
                                <tr onclick="javascript:fncSetValtMngmNo('${contValt.valtMngmNo}');  fncSelectBbsByValt('${contValt.valtMngmNo}'); fncSelectUsrByValt('${contValt.valtMngmNo}')">
                                    <td><c:out value="${(paginationInfo.currentPageNo-1) * paginationInfo.pageSize + status.count}"/></td>
                                    <td>
                                        <span class="f_chk_only">
                                            <input type="checkbox" name="delYn" class="check2" title="선택">
                                            <input type="hidden" name="checkId" value="<c:out value="${contValt.valtMngmNo}"/>"/>
                                        </span>
                                    </td>
                                    <td><c:out value="${contValt.valtMngmNo}"/></td>
                                    <td><c:out value="${contValt.valtQsitMnno}"/></td>
                                    <td><c:out value="${contValt.baseYy}"/></td>
                                    <td><c:out value="${contValt.sqn}"/></td>
                                    <td><c:out value="${contValt.useTs}"/></td>
                                    <td><c:out value="${contValt.valtMngmTtl}"/></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${fn:length(contValt.valtMngmDesc) > 25}">
                                                <c:out value="${fn:substring(contValt.valtMngmDesc, 0, 25)}"/>...
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${contValt.valtMngmDesc}"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <!-- 페이징 -->
                    <c:if test="${!empty contSearchVO.pageIndex }">
                        <div class="board_list_bot">
                            <div class="paging" id="paging_div">
                                <ul>
                                    <ui:pagination paginationInfo="${paginationInfo}" type="renew" jsFunction="linkPage"/>
                                </ul>
                            </div>
                        </div>
                    </c:if>
                    <!-- // 페이징 끝 -->

                    <input type="hidden" name="valtMngmNo"/>
                    <input type="hidden" name="valtMngmNos"/>
                    <input type="hidden" name="pageIndex" value="<c:out value='${contSearchVO.pageIndex}'/>"/>

                </form:form>
                <!--// 평가 관리 정보 -->
            </div>

            <!-- 평가 대상 선택 영역 -->
            <div class="container clearfix" style="display: flex; flex-direction: row">
                <form:form name="bbsForm" action="#" method="post" cssStyle="margin-right: 10px" >
                    <input type="hidden" name="valtMngmNo"/>
                    <div class="board_list_top topmargin">
                        <div class="left_col">
                            <span style="color:#3474b8; font-size: 22px; font-weight: 600;">평가 대상</span>
                        </div>
                        <div class="right_col">
                            <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncRegistContestValtBbsPop()">추가</a>
                            <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncContValtDeleteBbsList()">삭제</a>
                        </div>
                    </div>

                    <div class="board_list marginTop5">
                        <table id="valtBbs">
                            <caption>목록</caption>
                            <colgroup>
                                <col style="width: 40px;">
                                <col style="width: auto; min-width: 200px;">
                                <col style="width: 150px;">
                                <col style="width: 120px;">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">
                                    <span class="f_chk_only chkAll">
                                        <input type="checkbox" name="CheckAll" title="선택여부"
                                               onclick="javascript:fncCheckAll('bbsForm')">
                                    </span>
                                </th>
                                <th scope="col">제목</th>
                                <th scope="col">팀명</th>
                                <th scope="col">작성자</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${fn:length(boardList) == 0}">
                                <tr>
                                    <td colspan="4"><spring:message code="common.nodata.msg"/></td>
                                </tr>
                            </c:if>

                            <c:forEach var="bd" items="${boardList}" varStatus="status">
                                <tr>
                                    <td>
                                        <span class="f_chk_only">
                                            <input type="checkbox" name="delYn" class="check2" title="선택">
                                            <input type="hidden" name="checkId"
                                                   value="<c:out value="${bd.nttId}"/>"/>
                                        </span>
                                    </td>
                                    <td><c:out value="${bd.nttSj}"/></td>
                                    <td><c:out value="${bd.teamNm}"/></td>
                                    <td><c:out value="${bd.ntcrNm}"/></td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <input type="hidden" name="nttId"/>
                    <input type="hidden" name="nttIds"/>

                </form:form>
                <!-- 평가 위원 선택 영역 -->
                <form:form name="userForm" action="#" method="post">
                    <input type="hidden" name="valtMngmNo"/>
                    <div class="board_list_top topmargin">
                        <div class="left_col">
                            <span style="color:#3474b8; font-size: 22px; font-weight: 600;">평가 위원</span>
                        </div>
                        <div class="right_col">
                            <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncRegistContestValtUserPop()" >추가</a>
                            <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncContValtDeleteUserList()" >삭제</a>
                        </div>
                    </div>
                    <div class="board_list marginTop5">
                        <table id="valtUser">
                            <caption>목록</caption>
                            <colgroup>
                                <col style="width: 40px;">
                                <col style="width: auto; min-width: 150px;">
                                <col style="width: 150px;">
                                <col style="width: 150px;">
                                <col style="width: 120px;">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">
                                    <span class="f_chk_only chkAll">
                                        <input type="checkbox" name="CheckAll" title="선택여부"
                                               onclick="javascript:fncCheckAll('userForm')">
                                    </span>
                                </th>
                                <th scope="col">본부</th>
                                <th scope="col">소속</th>
                                <th scope="col">이름</th>
                                <th scope="col">호칭</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="5"><spring:message code="common.nodata.msg"/></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <input type="hidden" name="exmnId"/>
                    <input type="hidden" name="exmnIds"/>
                </form:form>
            </div>
        </div>

        <div class="content-wrap">


        </div>
    </section>

    <!-- footer 시작 -->
    <c:import url="/sym/mms/ContFooter.do"/>
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
<script src="<c:url value='/'/>js/jqueryui.js"></script>

<script>
    const noDataMsg = "<spring:message code='common.nodata.msg'/>";

    function fncSelectBbsByValt(valtMngmNo) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/api/cont/valt/selectBbsByValtAjax.do",
            data: JSON.stringify({
                valtMngmNo: valtMngmNo
            }),
            contentType: "application/json; charset=UTF-8",
            dataType: 'json',
            success: function(returnData) {
                document.bbsForm.valtMngmNo.value = valtMngmNo;
                // returnData에서 boardList 추출
                const dataList = returnData.boardList;
                const $tbody = $('#valtBbs tbody');
                $tbody.empty();
                if (dataList.length === 0) {

                    $tbody.append(
                        "<tr>" +
                            "<td colspan='4'>" + noDataMsg + "</td>" +
                        "</tr>"
                    );
                    return;
                }

                dataList.forEach(item => {
                    const row =
                        '<tr>' +
                            '<td>' +
                                '<span class="f_chk_only">' +
                                    '<input type="checkbox" name="delYn" class="check2" title="선택">' +
                                    '<input type="hidden" name="checkId" value="' + item.nttId + '">' +
                                '</span>' +
                            '</td>' +
                            '<td>' + item.nttSj + '</td>' +
                            '<td>' + item.teamNm + '</td>' +
                            '<td>' + item.ntcrNm + '</td>' +
                        '</tr>';
                    $tbody.append(row);
                });
            },
            error: function(xhr) {
                console.error("에러:", xhr.status, xhr.responseText);
            }
        })
    }

    function fncSelectUsrByValt(valtMngmNo) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/api/cont/valt/selectUserByValtAjax.do",
            data: JSON.stringify({
                valtMngmNo: valtMngmNo
            }),
            contentType: "application/json; charset=UTF-8",
            dataType: 'json',
            success: function(returnData) {
                document.userForm.valtMngmNo.value = valtMngmNo;
                // returnData에서 boardList 추출
                const dataList = returnData.userList;
                const $tbody = $('#valtUser tbody');
                $tbody.empty();
                if (dataList.length === 0) {

                    $tbody.append(
                        "<tr>" +
                        "<td colspan='5'>" + noDataMsg + "</td>" +
                        "</tr>"
                    );
                    return;
                }

                dataList.forEach(item => {
                    item.deptNmF = item.deptNmF ? item.deptNmF.split('>').pop().trim() : "";
                    item.titleNm = item.titleNm || "";
                    item.deptNm = item.deptNm || "";
                    item.teamNm = item.teamNm || "";
                    const row =
                        '<tr>' +
                        '<td>' +
                        '<span class="f_chk_only">' +
                        '<input type="checkbox" name="delYn" class="check2" title="선택">' +
                        '<input type="hidden" name="checkId" value="' + item.userId + '">' +
                        '</span>' +
                        '</td>' +
                        '<td>' + item.deptNm + '</td>' +
                        '<td>' + item.teamNm + '</td>' +
                        '<td>' + item.userNm + '</td>' +
                        '<td>' + item.titleNm + '</td>' +
                        '</tr>';
                    $tbody.append(row);
                });
            },
            error: function(xhr) {
                console.error("에러:", xhr.status, xhr.responseText);
            }
        })
    }
</script>

<script>
    $(function () {
        $('.selectable-table').each(function () {
            $(this).find('tr').click(function () {
                $(this).siblings().removeClass('selected');
                $(this).addClass('selected');
            });
        });
    });
</script>

</body>
</html>