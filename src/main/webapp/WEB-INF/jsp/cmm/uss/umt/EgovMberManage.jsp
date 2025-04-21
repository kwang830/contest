<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

    <link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css" type="text/css">

    <!-- Document Title
    ============================================= -->
    <title>IBK시스템 AI 아이디어 챌린지 - 사용자 정보 관리</title>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/*********************************************************
 * 초기화
 ******************************************************** */
function fn_select_reset(){
    let form = document.forms["listForm"];
    if(form){
        //form.reset();
        form.pageIndex.value = 1;
        form.sbscrbSttus.value = 0;
        form.searchCondition.value = 0;
        form.searchKeyword.value = '';
    } else {
        console.log("listForm을 찾을 수 없습니다.");
    }
}

function fnCheckAll() {
    var checkField = document.listForm.checkField;
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
function fnDeleteUser() {
    var checkField = document.listForm.checkField;
    var id = document.listForm.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
    	//alert(checkedIds);
        if(confirm('<spring:message code="common.delete.msg" />')) {
        	document.listForm.checkedIdForDel.value=checkedIds;
            document.listForm.action = "<c:url value='/uss/umt/mber/EgovMberDelete.do'/>";
            document.listForm.submit();
        }
    }
}
function fnSelectUser(id) {
	document.listForm.selectedId.value = id;
	array = id.split(":");
	if(array[0] == "") {
	} else {
	    userTy = array[0];
	    userId = array[1];    
	}
	document.listForm.selectedId.value = userId;
    document.listForm.action = "<c:url value='/uss/umt/mber/EgovMberSelectUpdtView.do'/>";
    document.listForm.submit();
}
function fnAddUserView() {
    document.listForm.action = "<c:url value='/uss/umt/mber/EgovMberInsertView.do'/>";
    document.listForm.submit();
}
function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/umt/mber/EgovMberManage.do'/>";
    document.listForm.submit();
}
function fnSearch(){
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/uss/umt/mber/EgovMberManage.do'/>";
    document.listForm.submit();
}

function fncUpdatePasswordReset() {
    var checkField = document.listForm.checkField;
    var id = document.listForm.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
        // alert(checkedIds);
        if(confirm('<spring:message code="common.reset.msg" />')) {
            document.listForm.selectedId.value=checkedIds;
            document.listForm.action = "<c:url value='/uss/umt/mber/EgovMberPasswordResetList.do'/>";
            document.listForm.submit();
        }
    }
}

<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
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
                            사용자 정보 관리
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
                    <form name="listForm" action="/uss/umt/mber/EgovMberManage.do" method="post">
                    <!-- 검색조건 -->
                    <div class="condition">

                        <input name="selectedId" type="hidden" />
                        <input name="checkedIdForDel" type="hidden" />
                        <input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>

                        <label class="item f_select" for="sbscrbSttus">
                            <select name="sbscrbSttus" id="sbscrbSttus" title="조회조건1">
                                <option value="0" <c:if test="${empty userSearchVO.sbscrbSttus || userSearchVO.sbscrbSttus == '0'}">selected="selected"</c:if> >상태(전체)</option>
                                <option value="A" <c:if test="${userSearchVO.sbscrbSttus == 'A'}">selected="selected"</c:if> >가입신청</option>
                                <option value="D" <c:if test="${userSearchVO.sbscrbSttus == 'D'}">selected="selected"</c:if> >삭제</option>
                                <option value="P" <c:if test="${userSearchVO.sbscrbSttus == 'P'}">selected="selected"</c:if> >승인</option>
                            </select>
                        </label>

                        <label class="item f_select" for="searchCondition">
                            <select name="searchCondition" id="searchCondition" title="조회조건2">
                                <option value="0" <c:if test="${userSearchVO.searchCondition == '0'}">selected="selected"</c:if> >ID</option>
                                <option value="1" <c:if test="${empty userSearchVO.searchCondition || userSearchVO.searchCondition == '1'}">selected="selected"</c:if> >이름</option>
                            </select>
                        </label>

                        <span class="item f_search">
                            <input class="f_input w_500" name="searchKeyword" id="searchKeyword" type="text" value="<c:out value="${userSearchVO.searchKeyword}"/>"
                                   maxlength="35" title="검색어 입력">
                            <button class="btn" type="submit" onclick="fnSearch(); return false;">조회</button>
                        </span>

                        <a href="#" class="item btn btn_black_46 w_100" onclick="javascript:fn_select_reset(); return false;">초기화</a>
                        <a href="#" class="item btn btn_black_46 w_100" onclick="fnDeleteUser(); return false;">삭제</a>
                        <a href="#" class="item btn btn_black_46 w_100" onclick="fnAddUserView(); return false;">등록</a>

                    </div>
                    <!--// 검색조건 -->
                    <div class="board_list_top topmargin">
                        <div class="right_col">
                            <a href="#LINK" class="btn btn_blue_46 w_150" onclick="fncUpdatePasswordReset()" style="selector-dummy:expression(this.hideFocus=false);">비밀번호 초기화</a><!-- 초기화 -->
                        </div>
                    </div>
                    <!-- 게시판 -->
                    <div class="board_list">
                        <table>
                            <caption>목록</caption>
                            <colgroup>
                                <col style="width: 60px;">
                                <col style="width: 60px;">
                                <col style="width: 150px;">
                                <col style="width: 150px;">
                                <col style="width: auto; min-width: 200px;">
                                <col style="width: 200px;">
                                <col style="width: 200px;">
                                <col style="width: 200px;">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">No.</th>
                                <th scope="col">
                                    <span class="f_chk_only chkAll">
                                        <input name="checkAll" type="checkbox" title="Check All" onclick="javascript:fnCheckAll();"/>
                                    </span>
                                </th>
                                <th scope="col">아이디</th>
                                <th scope="col">사용자이름</th>
                                <th scope="col">사용자이메일</th>
                                <th scope="col">전화번호</th>
                                <th scope="col">등록일</th>
                                <th scope="col">가입상태</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${fn:length(resultList) == 0}">
                                <tr>
                                    <td colspan="8"><spring:message code="common.nodata.msg" /></td>
                                </tr>
                            </c:if>

                            <c:forEach var="result" items="${resultList}" varStatus="status">
                                <tr>
                                    <td><c:out value="${(paginationInfo.currentPageNo-1) * paginationInfo.pageSize + status.count}" /></td>
                                    <td>
                                        <span class="f_chk_only">
                                            <input name="checkField" title="checkField <c:out value="${status.count}"/>" type="checkbox"/>
                                            <input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>"/>
                                        </span>
                                    </td>
                                    <td>
                                        <a href="<c:url value='/uss/umt/mber/EgovMberSelectUpdtView.do'/>?selectedId=<c:out value="${result.uniqId}"/>" class="lnk" onclick="javascript:fnSelectUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;">
                                            <c:out value="${result.userId}"/>
                                        </a>
                                    </td>
                                    <td><c:out value="${result.userNm}"/></td>
                                    <td><c:out value="${result.emailAdres}"/></td>
                                    <td><c:out value="${result.areaNo}"/>)<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/></td>
                                    <td><c:out value="${result.sbscrbDe}"/></td>
                                    <td>
                                        <c:forEach var="entrprsMberSttus_result" items="${entrprsMberSttus_result}" varStatus="status">
                                            <c:if test="${result.sttus == entrprsMberSttus_result.code}">
                                                <c:out value="${entrprsMberSttus_result.codeNm}"/>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <!-- 페이징 -->
                    <div class="board_list_bot">
                        <div class="paging" id="paging_div">
                            <ul>
                                <ui:pagination paginationInfo = "${paginationInfo}" type="renew" jsFunction="fnLinkPage" />
                            </ul>
                        </div>
                    </div>
                    <!-- // 페이징 끝 -->

                    </form>

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
</body>
</html>