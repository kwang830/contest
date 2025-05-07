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

    <div class="popup EgovGroupSearch" style="background-color: white;">
        <div class="pop_inner2">
            <div class="pop_header">
                <h1>평가 상세 팝업</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container">

                <div class="board_list">

                    <form:form modelAttribute="vote" name="vote" method="post" enctype="multipart/form-data" >
                        <input type="hidden" name="valtMngmNo" value="<c:out value="${valtMngmNo}" />" />
                        <input type="hidden" name="valtQsitMnno" value="<c:out value="${valtQsitMnno}" />" />
                        <input type="hidden" name="bbsId" value="<c:out value="${bbsId}" />" />
                        <input type="hidden" name="nttId" value="<c:out value="${nttId}" />" />
                        <input type="hidden" name="ntcrNm" value="" />
                        <input type="hidden" name="exmnId" value="<c:out value="${exmnId}" />" />
                        <input type="hidden" name="exmnNm" value="" />
                        <input type="hidden" name="valtQsitSendStr" value="" />
                        <input type="hidden" name="valtOpnn" value="" />

                        <table class="selectable-table">
                            <caption>목록</caption>
                            <colgroup>
                                <col style="width: 110px;">
                                <col style="width: 110px;">
                                <col style="width: 90px;" class="hid">
                                <col style="width: auto; min-width: 220px;" class="hid">
                                <col style="width: 310px;" class="hid">
                                <col style="width: 170px;">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col" colspan="2">항목</th>
                                <th scope="col" class="hid">기준<br>점수</th>
                                <th scope="col" class="hid">설명</th>
                                <th scope="col" class="hid">비고</th>
                                <th scope="col">평가<br>점수</th>
                            </tr>
                            </thead>
                            <tbody>

                            <!-- 사업측면 -->
                            <tr>
                                <td rowspan="4" >사업측면<br>40</td>
                                <td>시장성</td>
                                <td class="hid">15</td>
                                <td class="hid">실용성, 상업화 가능성</td>
                                <td class="left-center-cell hid">
                                    - 아이디어의 시장성<br>
                                    - 기존 사업과의 연계성</td>
                                <td>
                                    <label class="item f_select" for="sel_101">
                                        <select name="sel_101" id="sel_101" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(15점)|15,우수(12점)|12,보통(9점)|9,미흡(6점)|6,매우미흡(3점)|3" delims="," >
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>수익성</td>
                                <td class="hid">10</td>
                                <td class="hid">적정한 수익모델 제시</td>
                                <td class="left-center-cell hid">- 수익모델 및 수익구조 분석</td>
                                <td>
                                    <label class="item f_select" for="sel_102">
                                        <select name="sel_102" id="sel_102" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>효율성</td>
                                <td class="hid">10</td>
                                <td class="hid">당사인력 및 포지션 활용</td>
                                <td class="left-center-cell hid">
                                    - 자사 자원의 효과적 활용과 시너지 효과<br>
                                    - 자사 경쟁우위요소 활용 여부</td>
                                <td>
                                    <label class="item f_select" for="sel_103">
                                        <select name="sel_103" id="sel_103" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>투자 안전성</td>
                                <td class="hid">5</td>
                                <td class="hid">투자비용 최적화(최소화)</td>
                                <td class="left-center-cell hid">
                                    - 사업 타당성 분석<br>
                                    - 투자유치 가능성<br>
                                    - 비용/리스크 최소화 방법</td>
                                <td>
                                    <label class="item f_select" for="sel_104">
                                        <select name="sel_104" id="sel_104" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(5점)|5,우수(4점)|4,보통(3점)|3,미흡(2점)|2,매우미흡(1점)|1" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>

                            <!-- 창의측면 -->
                            <tr>
                                <td rowspan="3" class="center-cell">창의측면<br>30</td>
                                <td>독창성</td>
                                <td class="hid">10</td>
                                <td class="hid">타서비스와 차별성/혁신성</td>
                                <td class="left-center-cell hid">
                                    - 독창적인 아이디어 여부<br>
                                    - 기존 비즈니스와의 차별성</td>
                                <td>
                                    <label class="item f_select" for="sel_201">
                                        <select name="sel_201" id="sel_201" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>완전성</td>
                                <td class="hid">10</td>
                                <td class="hid">서비스 완성도</td>
                                <td class="left-center-cell hid">- 단순 아이디어가 아닌 구체적 서비스 여부</td>
                                <td>
                                    <label class="item f_select" for="sel_202">
                                        <select name="sel_202" id="sel_202" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>계속성</td>
                                <td class="hid">10</td>
                                <td class="hid">추가 서비스로 확장 여부</td>
                                <td class="left-center-cell hid">- 추가적인 확장성 및 파급효과<br>
                                    - 신시장 창출 가능성</td>
                                <td>
                                    <label class="item f_select" for="sel_203">
                                        <select name="sel_203" id="sel_203" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>

                            <!-- 기술측면 -->
                            <tr>
                                <td rowspan="3" class="center-cell">기술측면<br>20</td>
                                <td>구현 가능성</td>
                                <td class="hid">10</td>
                                <td class="hid">현재 기술로 가능 여부</td>
                                <td class="left-center-cell hid">- 실제 기술 구현 가능성<br>
                                    - 기술적 솔루션 제시 여부</td>
                                <td>
                                    <label class="item f_select" for="sel_301">
                                        <select name="sel_301" id="sel_301" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>독자 가능성</td>
                                <td class="hid">5</td>
                                <td class="hid">독자적 방어요소</td>
                                <td class="left-center-cell hid">- 시장 진입 용이성 수준<br>
                                    - 배타적 권리의 안정성 또는 확보 가능성<br>
                                    (특허, 프로세스 등)</td>
                                <td>
                                    <label class="item f_select" for="sel_302">
                                        <select name="sel_302" id="sel_302" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(5점)|5,우수(4점)|4,보통(3점)|3,미흡(2점)|2,매우미흡(1점)|1" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>구현 복잡성</td>
                                <td class="hid">5</td>
                                <td class="hid">구현 단순성 지향</td>
                                <td class="left-center-cell hid">- 이해관계자 단순 여부<br>
                                    - 단순 개발 환경과 적은 유지비용</td>
                                <td>
                                    <label class="item f_select" for="sel_303">
                                        <select name="sel_303" id="sel_303" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(5점)|5,우수(4점)|4,보통(3점)|3,미흡(2점)|2,매우미흡(1점)|1" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>

                            <!-- 기타사항 -->
                            <tr>
                                <td rowspan="2" class="center-cell">기타사항<br>10</td>
                                <td>공익성</td>
                                <td class="hid">5</td>
                                <td class="hid">그룹 정책 적합성</td>
                                <td class="left-center-cell hid">- 중소기업 상생 등<br>
                                    - 법적(인허가, 지적재산권 등) 적합성<br>
                                    - 사회적 용인성(도박/사기 금지 등)</td>
                                <td>
                                    <label class="item f_select" for="sel_401">
                                        <select name="sel_401" id="sel_401" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(5점)|5,우수(4점)|4,보통(3점)|3,미흡(2점)|2,매우미흡(1점)|1" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>성실성</td>
                                <td class="hid">5</td>
                                <td class="hid">참가 규칙 준용 여부<br>
                                    내용 구성능력, 전달력</td>
                                <td class="left-center-cell hid">- 정해진 양식과 주제 준수<br>
                                    - 적절한 논리성과 체계성<br>
                                    - 제안 내용의 구성, 참신성, 함축성 등</td>
                                <td>
                                    <label class="item f_select" for="sel_402">
                                        <select name="sel_402" id="sel_402" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(5점)|5,우수(4점)|4,보통(3점)|3,미흡(2점)|2,매우미흡(1점)|1" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>

                            <!-- 가산점 -->
                            <tr>
                                <td rowspan="1" class="center-cell">가산점<br>(10)</td>
                                <td>아이디어 구현</td>
                                <td class="hid">10</td>
                                <td class="hid">구현 완성도</td>
                                <td class="left-center-cell hid">- 구현결과에 대한 아이디어 부합 여부<br>
                                    - 시스템 정상 작동 여부<br>
                                    - 디지털기술 적용 여부 등</td>
                                <td>
                                    <label class="item f_select" for="sel_501">
                                        <select name="sel_501" id="sel_501" title="평가 선택" disabled>
                                            <option value="">-선택-</option>
                                            <c:forTokens var="item" items="매우우수(10점)|10,우수(8점)|8,보통(6점)|6,미흡(4점)|4,매우미흡(2점)|2,해당없음(0점)|0" delims=",">
                                                <c:set var="label" value="${fn:split(item, '|')[0]}" />
                                                <c:set var="value" value="${fn:split(item, '|')[1]}" />
                                                <option value="${value}">${label}</option>
                                            </c:forTokens>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr style="background: #EAEAEA;">
                                <td colspan="2" class="center-cell">&nbsp;</td>
                                <td colspan="3" class="center-cell hid">합계</td>
                                <td>
                                    <input class="f_input" style="width:40px; border: none; font-size: 22px;" name="tot_sel_point" type="text" value="0" maxlength="3" readonly="readonly">점
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form:form>
                </div>
                <div class="board_form_row">
                    <div class="title">
                        <label for="valtOpnn2">평가 의견</label>
                    </div>
                    <div class="input">
                        <textarea id="valtOpnn2" name="valtOpnn2" title="평가 의견" class="f_txtar w_full h_200" rows="10" cols="30"></textarea>
                    </div>
                </div>
                <div class="board_list_bot">
                    <div class="paging">
                        <a href="#" class="btn btn_blue_46 w_100" onclick="javascript:fn_egov_cancel_popup(); return false;">닫기</a>
                    </div>
                </div>

            </div>
        </div>
    </div>

	</form>
    <script>
        function decodeHtmlEntities(str) {
            if (!str) return '';
            const txt = document.createElement('textarea');
            txt.innerHTML = str;
            return txt.value;
        }

        function fn_select_votes(bbsId, nttId, valtMngmNo, valtQsitMnno, exmnId){

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/api/cont/vote/selectAdminVotesAjax.do",
                data: JSON.stringify({
                    bbsId: bbsId,
                    nttId: nttId,
                    valtMngmNo: valtMngmNo,
                    valtQsitMnno: valtQsitMnno,
                    exmnId: exmnId
                }),
                contentType: "application/json; charset=UTF-8",
                dataType: 'json',
                success: function(returnData) {
                    //console.log(returnData);

                    // returnData에서 contVoteAdminGroupList 추출
                    const dataList = returnData.contVoteAdminGroupList;
                    const valtOpnn = returnData.valtOpnn;

                    dataList.forEach(item => {
                        const qsitNo = item.qsitNo;
                        const valtScr = item.valtScr;
                        //console.log('qsitNo:' + qsitNo + ', valtScr:' + valtScr);

                        const $select = $('#sel_' + qsitNo);  // 문자열 연결로 변경
                        if ($select.length) {
                            $select.val(valtScr);
                            //console.log('#sel_' + qsitNo + ' 값을 ' + valtScr + '로 설정');
                        } else {
                            console.warn('#sel_' + qsitNo + ' 셀렉터를 찾을 수 없습니다');
                        }

                    });

                    const decodedValtOpnn = decodeHtmlEntities(valtOpnn);
                    $('#valtOpnn2').val(decodedValtOpnn);
                    //$('#valtOpnn2').val(valtOpnn);

                    calculateTotalPoints();
                },
                error: function(xhr) {
                    console.error("에러:", xhr.status, xhr.responseText);
                }
            });

        }

        function calculateTotalPoints() {
            let total = 0;

            // name이 sel_로 시작하는 select 요소들을 순회
            $('select[name^="sel_"]').each(function () {
                let val = parseFloat($(this).val());
                if (!isNaN(val)) {
                    total += val;
                }
            });

            // name이 tot_sel_point인 요소에 합계 설정
            $('[name="tot_sel_point"]').val(total);
        }


        $(document).ready(function () {
            $('select[name^="sel_"]').on('change', calculateTotalPoints);


            const valtMngmNo = $('input[name="valtMngmNo"]').val();
            const valtQsitMnno = $('input[name="valtQsitMnno"]').val();
            const bbsId = $('input[name="bbsId"]').val();
            const nttId = $('input[name="nttId"]').val();
            const exmnId = $('input[name="exmnId"]').val();

            fn_select_votes(bbsId, nttId, valtMngmNo, valtQsitMnno, exmnId);
        });
    </script>
</body>
</html>