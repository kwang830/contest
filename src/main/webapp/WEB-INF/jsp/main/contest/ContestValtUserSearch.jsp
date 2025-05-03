<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>

    <title>IBK시스템 AI 아이디어 챌린지</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if (document.listForm.checkAll.checked) {
        if (checkField) {
            if (checkField.length > 1) {
                for (var i = 0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if (checkField) {
            if (checkField.length > 1) {
                for (var j = 0; j < checkField.length; j++) {
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
                alert("선택된  항목이 없습니다.");
                resultCheck = false;
            }
        } else {
            if (document.listForm.delYn.checked == false) {
                alert("선택 항목이 없습니다.");
                resultCheck = false;
            } else {
                returnId = checkId.value;
                resultCheck = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }
    document.listForm.exmnIds.value = returnId;
    return resultCheck;
}

function fncSelectContValtUserList(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.submit();
}

function fncSelectGroup(groupId) {
 // window.returnValue = groupId;
    opener.listForm.searchWrd.value = groupId;
    window.close();
}

function fncInsertContestValtUser() {
	if(fncManageChecked()) {

        if (confirm('<spring:message code="common.regist.msg" />')) {
            const form = document.listForm;
            const formData = new FormData(form);

            fetch("<c:url value='/cmm/contest/valt/insertContestValtUser.do'/>", {
                method: "POST",
                body: formData
            }).then(response => {
                if (response.ok) {
                    parent.fn_egov_returnValue("등록 완료하였습니다.");
                } else {
                    alert("요청 처리 실패");
                }
            }).catch(err => {
                console.error(err);
                alert("네트워크 오류");
            });
        }
	}
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.submit();
}

/* ********************************************************
 * 취소처리
 ******************************************************** */
function fn_egov_cancel_popup() {
	parent.fn_egov_modal_remove();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectContValtUserList('1');
    }
}

function setParentData(data) {
    console.log(data);
    document.listForm.valtMngmNo.value = data;
}
//-->
</script>

</head>

<body>

	<form name="listForm" action="<c:url value='/cmm/contest/valt/selectContValtUserList.do'/>" method="post">
	
    <!-- 그룹조회 팝업 -->
    <div class="popup EgovGroupSearch" style="background-color: white;">
        <div class="pop_inner">
            <div class="pop_header">
                <h1>사용자 조회 팝업</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container">
                <!-- 검색조건 -->
                <div class="condition2">
                    <span class="lb mr15">이름 : </span>

                    <span class="item f_search">
                        <input class="f_input w_250" name="searchWrd" value="${searchWrd}" type="text" title="검색" onkeydown="press();" />
                        <button class="btn" type="submit" onclick="javascript:fncSelectContValtUserList('1')"><spring:message code='button.inquire' /></button><!-- 조회 -->
                    </span>
                </div>
                <!--// 검색조건 -->

                <div class="board_list_top">
                    <div class="left_col">
                    </div>

                    <div class="right_col">
                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncInsertContestValtUser()"><spring:message code='button.create' /></a><!-- 확인 -->
                    </div>
                </div>

                <!-- 게시판 -->
                <div class="board_list">
                    <table summary="평가자를 보여주는 테이블입니다.평가자 관련 정보를 담고 있습니다.">
                    	<caption>평가자 목록</caption>
                        <colgroup>
                            <col style="width: 80px;">
                            <col style="width: auto; min-width: 150px;">
                            <col style="width: 150px;">
                            <col style="width: 150px;">
                            <col style="width: 120px;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">
                                    <span class="f_chk_only chkAll">
                                        <input type="checkbox" name="bbsCheckAll" title="선택여부"
                                               onclick="javascript:fncCheckAll()">
                                    </span>
                                </th>
                                <th scope="col">본부</th>
                                <th scope="col">소속</th>
                                <th scope="col">이름</th>
                                <th scope="col">호칭</th>
                            </tr>
                        </thead>
                        <tbody>
                        	
                        	<c:if test="${fn:length(userList) == 0}">
                        		<tr>
                        			<td class="lt_text3" colspan="3"><spring:message code="common.nodata.msg" /></td>
                        		</tr>
                        	</c:if>
                        	
                        	<c:forEach var="user" items="${userList}" varStatus="status">
                            <tr>
                                <td>
                                    <span class="f_chk_only">
                                        <input type="checkbox" name="delYn" title="선택">
                                        <input type="hidden" name="checkId" value="<c:out value="${user.userId}"/>" />
                                    </span>
                                </td>
                                <td><c:out value="${user.deptNm}"/></td>
                                <td><c:out value="${user.teamNm}"/></td>
                                <td><c:out value="${user.userNm}"/></td>
                                <td><c:out value="${user.titleNm}"/></td>
                            </tr>
                            </c:forEach>
                            
                        </tbody>
                    </table>
                </div>
                
                <!-- 페이지 네비게이션 시작 -->
                <c:if test="${!empty contValtVO.pageIndex }">
                <div class="board_list_bot">
                    <div class="paging" id="paging_div">
                        <ul>
                            <ui:pagination paginationInfo = "${paginationInfo}" type="renew" jsFunction="linkPage" />
                        </ul>
                    </div>
                </div>
                </c:if>
                <!-- //페이지 네비게이션 끝 -->
                <!--// 게시판 -->
            </div>
        </div>
    </div>
    <!--// 그룹조회 팝업 -->
    <input type="hidden" name="valtMngmNo"/>
    <input type="hidden" name="exmnId"/>
	<input type="hidden" name="exmnIds"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${contValtVO.pageIndex}'/>"/>
	<input type="hidden" name="searchCondition"/>
	
	</form>
    
</body>
</html>