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
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />?v=230509">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/uat/uia/login.css' />?v=230509">
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

function getMobileCheck() {
	var os;
	var mobile = (/iphone|ipad|ipod|android/i.test(navigator.userAgent.toLowerCase()));  
	if (mobile) {
		var userAgent = navigator.userAgent.toLowerCase();
		if (userAgent.search("android") > -1){
			return os = "ANDROID";
		}
		else if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1) || (userAgent.search("ipad") > -1)){
			return os = "IOS";
		}
		else {
			return os = "OTHER";
		}
	}
	else {
		return os = "PC";
	}
};

function getBrowserInfo() {
    var agent = navigator.userAgent.toUpperCase();
    console.log('agent:'+agent);
    if (agent.indexOf('TRIDENT') >= 0) {
        return 'IE';
    } else if (agent.indexOf('FIREFOX') >= 0) {
        return 'FIREFOX';
    } else if (agent.indexOf('CHROME') >= 0) {
        return 'CHROME';
    } else if (agent.indexOf('EDG') >= 0) {
        return 'EDGE';
    } else if (agent.indexOf('SAFARI') >= 0) {
        return 'SAFARI';
    } else {
        return '';
    }
}


$(document).ready(function() {
	// 로그인 버튼 클릭
	$("#password").keypress(function(event){
		if(event.which == 13){
			actionLogin();
		}
	});
	
	var chkMobile = getMobileCheck();
	var chkBrowser = getBrowserInfo();	
	$("input[name='chkMobile']").val(chkMobile);
	$("input[name='chkBrowser']").val(chkBrowser);
	
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
		<img src="<c:url value='/images/login/009.png'/>" id="visual_login1" alt="logo">
		<img src="<c:url value='/images/login/003.png'/>" id="visual_login2" style="display:none;" alt="logo">
	</div>
	<div id="login_middlecontent">
		&nbsp;
	</div>
	<div id="login_rightcontent">
		<div class="login_info">
			<p><strong><span style="background-color:#2F4F4F;padding:7px 18px;color:#FFFFFF;font-size:16px">너DO 나DO IT! DT 공모전」 안내</span></strong></p>
			<p style="margin-top: 10px;padding:2px 14px;"><strong><span style="color:gray;">- 우리가(너Do 나Do) 혁신(Just Do It!)하는<br>&nbsp;&nbsp;디지털 아이디어 공모전</span></strong></p>
			<p style="margin-top: 7px;padding:1px;color:cadetblue;"><strong>□ 주요일정 </strong></p>
			<p style="background:aliceblue;padding:10px 20px;color:cadetblue;">
			- 참가접수 : &#39;23. 5. 8(월) ~ &#39;23. 6. 16(금), 6주<br />
			- 직원평가 : &#39;23. 5. 8(월) ~ &#39;23. 6. 23(금), 7주<br />
			- 예선평가 : &#39;23. 6.19(월) ~ &#39;23. 6. 30(금), 2주<br />
			- 본선평가 : &#39;23. 7. 3(월) ~ &#39;23. 7. 14(금), 2주</p>
			<p style="margin-top: 7px;padding:1px;color:gray;"><strong>□ 운영 담당자</strong></p>
			<p style="background:aliceblue;padding:10px 20px;color:gray;">- IT혁신사업본부 &gt; 플랫폼사업팀<br>
			&nbsp;&nbsp;백단비 대리 ☎ 02-3407-6072</p>
		</div>
		<div class="login_info2">
			<p style="margin-top: 7px;padding:1px;color:indianred;"><strong>□ 로그인 방법</strong></p>
			<p style="background:cornsilk;padding:10px 18px;font-weight:600;color:indianred;">- 아이디 : (직원번호, 5자리)<br>
			- 비밀번호 : (ibkS+생년월일6자리, 10자리)<br>
			<span style="color:gray;">&nbsp;&nbsp;그룹웨어에 등록된 실제 생년월일6자리</span><br>
			<span style="color:gray;">&nbsp;&nbsp;*로그인 후 비밀번호 변경 가능함</span><br></p>
		</div>
		<div class="login_header_logo" style="">
			<img src="<c:url value='/images/header/logo.png'/>" alt="login title image"  title="login title image">
		</div>
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
				<c:set var="title">아이디 : (직원번호, 5자리)</c:set>
				<li>
					<label for="id">${title}</label>
					<input type="text" name="id" id="id" maxlength="25" title="${title} ${inputTxt}" placeholder="${title} ${inputTxt}">
				</li>
				<!-- 비밀번호 -->
				<c:set var="title">비밀번호 : (ibkS+생년월일6자리, 10자리)</c:set>
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
			</ul>
		</div>
	</div>
</div>
<!-- //wrap end -->
</fieldset>
<input name="chkMobile" type="hidden" value=""/>
<input name="chkBrowser" type="hidden" value=""/>
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


