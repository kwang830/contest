<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/'/>css/base.css">
    <link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
    <link rel="stylesheet" href="<c:url value='/'/>css/board.css">
    <link rel="stylesheet" href="<c:url value='/'/>css/page.css">
    <script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
    <link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

    <!-- Document Title
    ============================================= -->
    <title>IBK시스템 AI 아이디어 챌린지</title>

    <style type="text/css">
        .f_search input[type=number] {width: 100%; height: 46px; padding: 0 50px 0 20px; border: 0; border-radius: 5px; color: #222; font-size: 16px; background: #f7f7f7;}
    </style>

    <script type="text/javascript" language="javascript" defer="defer">
        function validateBoard(obj) {
            if (isEmptyOrWhitespace(document.board.valtMngmTtl.value)) {
                alert("공모전 제목은 필수 값입니다.");
                console.log(1);
                document.board.valtMngmTtl.focus();
                return false;
            } else if (isEmptyOrWhitespace(document.board.valtQsitMnno.value)) {
                alert("문항 관리키는 필수 값입니다.");
                console.log(2);
                document.board.valtQsitMnno.focus();
                return false;
            } else if (isEmptyOrWhitespace(document.board.baseYy.value)) {
                alert("기준년은 필수 값입니다.");
                console.log(3);
                document.board.baseYy.focus();
                return false;
            } else if (isEmptyOrWhitespace(document.board.sqn.value)) {
                alert("차수는 필수 값입니다.");
                console.log(4);
                document.board.sqn.focus();
                return false;
            } else if (isEmptyOrWhitespace(document.board.valtMngmDesc.value)) {
                alert("공모전 설명은 필수 값입니다.");
                console.log(5);
                document.board.valtMngmDesc.focus();
                return false;
            }
            return true;
        }

        function isEmptyOrWhitespace(str) {
            console.log(str)
            return !str || str.trim().length === 0;
        }

        function fncInsertContValt() {
            //document.board.onsubmit();

            if (!validateBoard(document.board)) {
                return;
            }
            if (confirm('<spring:message code="common.regist.msg" />')) {
                const form = document.board;
                const formData = new FormData(form);

                fetch("<c:url value='/cmm/contest/valt/insertContestValt.do'/>", {
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

        function fncCurrentYear() {
            const today = new Date();
            document.board.baseYy.value = today.getFullYear();
        }

        function fncCheckMaxLength(object) {
            console.log(object.value)
            if(object.value.length > object.maxLength) {
                object.value = object.value.slice(0, object.maxLength);
            }
        }

        /* ********************************************************
         * 취소처리
         ******************************************************** */
        function fn_egov_cancel_popup() {
            parent.fn_egov_modal_remove();
        }

        function press() {
            if (event.keyCode == 13) {
                fncInsertContValt();
            }
        }

        /* ********************************************************
         * 달력
         ******************************************************** */
        function fn_egov_init_date(){
            $("#useTs").datepicker(
                {dateFormat:'yy-mm-dd'
                    , showOn: 'button'
                    , buttonImage: '<c:url value='/images/ico_calendar.png'/>'
                    , buttonImageOnly: true

                    , showMonthAfterYear: true
                    , showOtherMonths: true
                    , selectOtherMonths: true
                    , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

                    , changeMonth: true // 월선택 select box 표시 (기본은 false)
                    , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
                    , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
                }
            );
        }
    </script>
</head>

<body onLoad="document.board.valtMngmTtl.focus(); fncCurrentYear(); fn_egov_init_date();">
<form name="board" method="post">
    <div class="popup EgovGroupSearch" style="background-color: white;">
        <div class="pop_inner">
            <div class="pop_header">
                <h1>평가 관리 등록 팝업</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>
            <div class="pop_container" style="display: flex; flex-direction: column">
                <div class="tit_3">평가 제목</div>
                <div class="f_search">
                    <input name="valtMngmTtl" id="valtMngmTtl" type="text" maxlength="100" />
                </div>
                <div class="tit_3">문항 관리번호</div>
                <div class="f_select">
<%--                    <input name="valtQsitMnno" id="valtQsitMnno" type="text" maxlength="50" />--%>
                    <select name="valtQsitMnno" id="valtQsitMnno">
                        <c:forEach var="qsit" items="${qsitList}">
                            <option value="${qsit.valtQsitMnno}">${qsit.valtQsitMnno}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="tit_3">기준 년도</div>
                <div class="f_search">
                    <input name="baseYy" id="baseYy" type="text" maxlength="4" oninput="fncCheckMaxLength(this)" />
                </div>
                <div class="tit_3">차수</div>
                <div class="f_search">
                    <input name="sqn" id="sqn" type="text" maxlength="4" oninput="fncCheckMaxLength(this)" />
                </div>
                <div class="tit_3">시작일자</div>
                <div class="f_search">
                    <input type="text" name="useTs" id="useTs" class="f_date" maxlength="10" value="" title="시작일자입력" />
                </div>
                <div class="tit_3">평가 설명</div>
                <div class="f_txtar">
                    <textarea id="valtMngmDesc" name="valtMngmDesc" rows="10" style="width: 100%; box-sizing: border-box"></textarea>
                </div>
            </div>

            <!-- 목록/저장버튼 시작-->
            <div class="pop_container board_view_bot">
                <div class="center_col">
                    <a href="#" class="btn btn_blue_46" onclick="javascript:fncInsertContValt(); return false;"><spring:message code="button.create" /></a>
                </div>
            </div>
        </div>
    </div>


    <!-- 목록/저장버튼 끝-->

</form>
</div><!-- #wrapper end -->

<!-- Go To Top
============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>

<!-- External JavaScripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/plugins.js"></script>

<script type="text/javascript" src="<c:url value='/'/>js/common.js"></script>

<script type="text/javascript" src="<c:url value='/'/>js/jqueryui.js"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

</body>
</html>