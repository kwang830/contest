<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="comUatUia.title" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/uat/uia/login.css' />">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/jquery.js'/>" ></script>
<script type="text/javaScript">
$(function(){
  	$("#id").click(function(){
		$("#visual_login1").css('display','none');
		$("#visual_login2").css('display','block');
  	});	
  	$("#password").click(function(){
		$("#visual_login1").css('display','block');
		$("#visual_login2").css('display','none');
  	});
});

function checkLogin(userSe) {
    // 일반회원
    if (userSe == "GNR") {
        document.loginForm.rdoSlctUsr[0].checked = true;
        document.loginForm.rdoSlctUsr[1].checked = false;
        document.loginForm.rdoSlctUsr[2].checked = false;
        document.loginForm.userSe.value = "GNR";
    // 기업회원
    } else if (userSe == "ENT") {
        document.loginForm.rdoSlctUsr[0].checked = false;
        document.loginForm.rdoSlctUsr[1].checked = true;
        document.loginForm.rdoSlctUsr[2].checked = false;
        document.loginForm.userSe.value = "ENT";
    // 업무사용자
    } else if (userSe == "USR") {
        document.loginForm.rdoSlctUsr[0].checked = false;
        document.loginForm.rdoSlctUsr[1].checked = false;
        document.loginForm.rdoSlctUsr[2].checked = true;
        document.loginForm.userSe.value = "USR";
    }
}

function actionLogin() {
	if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
    } else if (document.loginForm.password.value =="") {
        alert("비밀번호를 입력하세요");
    } else {
        document.loginForm.action="<c:url value='/uat/uia/actionLogin.do'/>";
        document.loginForm.submit();
    }
}

function actionCrtfctLogin() {
    document.defaultForm.action="<c:url value='/uat/uia/actionCrtfctLogin.do'/>";
    document.defaultForm.submit();
}

function goFindId() {
    document.defaultForm.action="<c:url value='/uat/uia/egovIdPasswordSearch.do'/>";
    document.defaultForm.submit();
}

function goRegiUsr() {
	var useMemberManage = '${useMemberManage}';

	if(useMemberManage != 'true'){
		<%-- 사용자 관리 컴포넌트가 설치되어 있지 않습니다. \n관리자에게 문의하세요. --%>
		alert("<spring:message code="comUatUia.validate.userManagmentCheck" />");
		return false;
	}

    var userSe = document.loginForm.userSe.value;
 
    // 일반회원
    if (userSe == "GNR") {
        document.loginForm.action="<c:url value='/uss/umt/EgovStplatCnfirmMber.do'/>";
        document.loginForm.submit();
    // 기업회원
    } else if (userSe == "ENT") {
        document.loginForm.action="<c:url value='/uss/umt/EgovStplatCnfirmEntrprs.do'/>";
        document.loginForm.submit();
    // 업무사용자
    } else if (userSe == "USR") {
    	<%-- 업무사용자는 별도의 회원가입이 필요하지 않습니다. --%>
        alert("<spring:message code="comUatUia.validate.membershipCheck" />");
    }
}

function goGpkiIssu() {
    document.defaultForm.action="<c:url value='/uat/uia/egovGpkiIssu.do'/>";
    document.defaultForm.submit();
}

function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "=";
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search);
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
    return "";
}

function saveid(form) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    else
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("saveid", form.id.value, expdate);
}

function getid(form) {
    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
}

function fnInit() {
	if (document.getElementById('loginForm').message.value != null) {
	    var message = document.getElementById('loginForm').message.value;
	}
    if (message != "") {
        alert(message);
    }

    /* *************************
    document.loginForm.rdoSlctUsr[0].checked = false;
    document.loginForm.rdoSlctUsr[1].checked = false;
    document.loginForm.rdoSlctUsr[2].checked = true;
    document.loginForm.userSe.value = "USR";
    document.loginForm.id.value="TEST1";
    document.loginForm.password.value="rhdxhd12";
    **************************** */

    //getid(document.loginForm);
    // 포커스
    //document.loginForm.rdoSlctUsr.focus();
    
    getid(document.loginForm);
    
    fnLoginTypeSelect("typeGnr");
}

function fnLoginTypeSelect(objName){

		document.getElementById("typeGnr").className = "";
		document.getElementById("typeEnt").className = "";
		document.getElementById("typeUsr").className = "";
		
		document.getElementById(objName).className = "on";
		
		if(objName == "typeGnr"){ //일반회원
			document.loginForm.userSe.value = "GNR";
		}else if(objName == "typeEnt"){	//기업회원
			 document.loginForm.userSe.value = "ENT";
		}else if(objName == "typeUsr"){	//업무사용자
			 document.loginForm.userSe.value = "USR";
		}
	
}
$(document).ready(function() {
	// 로그인 버튼 클릭
	$("#password").keypress(function(event){
		if(event.which == 13){
			actionLogin();
		}
	});
 });

</script>
</head>
<body onLoad="fnInit();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>


<!-- login영역 -->
<form name="loginForm" id="loginForm" action="<c:url value='/uat/uia/actionLogin.do'/>" method="post">
<input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
     
<!-- wrap start -->
<fieldset class="login_form">
<div id="wrap">     	
		<div id="login_leftcontent">
			<img src="<c:url value='/images/login/visual_login1.png'/>" id="visual_login1" style="width:580px;" alt="logo">
			<img src="<c:url value='/images/login/visual_login2.png'/>" id="visual_login2" style="width:580px;display:none;" alt="logo">
		</div>
		<div id="login_middlecontent">
			&nbsp;
		</div>
		<div id="login_rightcontent">


	<img src="<c:url value='/images/header/logo.png'/>" style="margin:150px 0 0px 60px;width:160px;" alt="login title image"  title="login title image">
	<div class="login_type">
		<ul id="ulLoginType">
			<li><a href="javascript:fnLoginTypeSelect('typeGnr');" id="typeGnr" title="">일반 참가자</a></li>
			<li style="display:none;"><a href="javascript:fnLoginTypeSelect('typeEnt');" id="typeEnt" title="">기업</a></li>
			<li><a href="javascript:fnLoginTypeSelect('typeUsr');" id="typeUsr" title="">심사위원</a></li>
		</ul>
	</div>

	<div class="login_input">
		<ul>
			<!-- 아이디 -->
			<c:set var="title">아이디</c:set>
			<li>
				<label for="id">${title}</label>
				<input type="text" name="id" id="id" maxlength="25" title="${title} ${inputTxt}" placeholder="${title} ${inputTxt}">
			</li>
			<!-- 비밀번호 -->
			<c:set var="title">비밀번호</c:set>
			<li>
				<label for="password">${title}</label>
				<input type="password" name="password" id="password" maxlength="25" title="${title} ${inputTxt}" placeholder="${title} ${inputTxt}">
			</li>
			<li>
				<input type="button" class="btn_login" value="로그인" onClick="actionLogin()">
			</li>
			<c:set var="title">아이디 저장</c:set>
			<li class="chk">
				<input type="checkbox" name="checkId" class="check2" onClick="javascript:saveid(document.loginForm);" id="checkId">${title}
			</li>
<%						
			//<li>
			//	<ul class="btn_idpw" > 
			//		<li><a href="#" onClick="goRegiUsr(); return false;">회원가입</a></li>
			//		<li><a href="#" onClick="goFindId(); return false;">아이디/비밀번호 찾기 </a></li>
			//	</ul>
			//</li>
%>			
		</ul>
	</div>
	

		</div>

</div>
<!-- //wrap end -->
</fieldset>

<input name="userSe" type="hidden" value="GNR"/>
<input name="j_username" type="hidden"/>
</form>


<!-- 팝업 폼 -->
<form name="defaultForm" action ="" method="post" target="_blank">
<div style="visibility:hidden;display:none;">
<input name="iptSubmit3" type="submit" value="전송" title="전송">
</div>
</form>
<!-- login영역 //-->



</body>
</html>


