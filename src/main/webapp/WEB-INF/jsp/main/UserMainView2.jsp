<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<meta property="og:image" content="http://175.45.204.201/images/bg_h2.gif">
<title>너Do 나DO It! DT 공모전 - IBK시스템</title>
<link href="<c:url value='/'/>css/default.css" rel="stylesheet" type="text/css" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/modal.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/modal.js' />"></script>
<script>

window.history.forward(); 
function noBack(){ 
  window.history.forward();
}

$(function(){
	

});

function fnUpdate(){	 		
	if($("input[name='newPassword']").val() != $("input[name='newPassword2']").val()){
        alert("<spring:message code="fail.user.passwordUpdate2" />");
        return;
    }
	
	var form = $('#userManageVO');
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/umt/EgovUserPasswordUpdtAjax.do",
		data: string, 
		dataType:'json',
		timeout:(1000*30),
		
		beforeSend:function(){
			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
		},
		success:function(returnData, status){
			if(status == "success") {
				if(returnData.resultMsg=='fail.user.passwordUpdate1'){
					$("#oldPassword").val("");
					$("#newPassword").val("");
					$("#newPassword2").val("");					
					alert('이전 비밀번호가 일치하지 않습니다.');
				}else{
					$("#oldPassword").val("");
					$("#newPassword").val("");
					$("#newPassword2").val("");
					alert('변경 되었습니다.');	
				}
			}else{ alert("ERROR!");return;} 
		},
		error: function(m,err){
			alert('m:'+m+' /err:'+err);
		},
		complete:function(){}
	});    
}


</script>
<style>

        #content {position:relative;width:100%;max-width:1200px;margin:0 auto; padding:0 0 20px 0;}
        .contentWrap {position:relative;width:100%;max-width:1100px;margin:0 auto;padding:60px 0;}

        .view_title {padding:15px 1px 15px 1px;border-top:1px solid #5e6b83;color:#333;font-weight:800;font-size:17px}
        .viewWarp dl {width:100%;margin:0;overflow:hidden;background:#f7f5f4;border-bottom: 1px solid #e5e5e5;}
        .viewWarp dl dt, .viewWarp dl dd {vertical-align:top;padding:16px 20px;margin:0;border-top:1px solid #e5e5e5;text-align:left;word-break:break-all;float:left;min-height:54px;box-sizing:border-box;-webkit-box-sizing:border-box;font-size:16px;}
        .viewWarp dl dt {width:29.71%;max-width:197px;font-weight:800;line-height:1.2em;}
        .viewWarp dl dd {width:calc(50% - 197px);background:#fff; line-height:1.2em;font-weight:500;}
        .viewWarp dl dd.full {width:calc(100% - 197px);padding:11px 20px; line-height:1.3em;}        
        .viewWarp dl dd.full > a {display:block;word-break:break-all}
        .viewWarp dl dd.full > a + a {margin-top:5px;}
        .viewWarp dl dd.full > .btn {display:inline-block;vertical-align:bottom}
        .viewWarp dl dd.full .add_file {line-height:28px;width:100%;padding:0 0 5px}
        .viewWarp dl dd.full .add_file a {line-height:20px;color:blue;}
        .viewWarp dl dd.full .add_file .btn {margin:0 0 0 5px;line-height:15px}

        .btn.small.h25 span {padding:6px 16px;}
        .btn.small span {padding:9px 16px 10px;line-height:1em;background:#f5f4f2;border:1px solid #d0cfcf;border-radius:0;color:#333;font-size:16px;}

        .view_synap {padding: 100px 80px 100px 80px;}

        @media all and (max-width:1024px) {
            .viewWarp dl {display:flex;flex-wrap:wrap;}
            .view_synap {padding:14px 28px 16px 32px;}
        }

        @media all and (max-width:768px) {
            .view_title{padding:12px 8px;}
            .viewWarp dl {position:relative;background:#fff}
            .viewWarp dl:before {content:"";display:block;width:20%;position:absolute;top:0;left:0;height:100%;background:#f7f5f4;z-index:1}
            .viewWarp dl dt {width:20%;clear:left}
            .viewWarp dl dt.m_11 {font-size:14px;letter-spacing:inherit}
            .viewWarp dl dd, .viewWarp dl dd.full, .viewWarp dl dd {width:80%;clear:right;line-height:21px;}
            .viewWarp dl dt, .viewWarp dl dd {min-height:auto;padding:7px;box-sizing:border-box;position:relative;z-index:5;}
            .viewWarp dl dd.full > a {font-size:13px;}
            .viewWarp dl dd.full{padding:7px;}
            .viewWarp .view_con img {width:100% !important;height:auto !important}
            .viewWarp .view_con img.tag {width:auto !important}
            .viewWarp .view_con p, .viewWarp .view_con span, .viewWarp .view_con th, .viewWarp .view_con td, .viewWarp .view_con li, .viewWarp .view_con div {font-size:14px !important;}
            .viewWarp .view_con table {table-layout:inherit;}


            .viewbtnWrap.plan .left_btn, .viewbtnWrap.plan .right_btn {padding:3px 0 0;float:none;display:inline-block;text-align:right}
            .view_synap {padding:14px 20px;}

            .hwp_down  {font-size:13px;}
        }

        @media all and (max-width:640px) {
            .view_title {padding:10px 8px;font-size:14px;}
        }

</style>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<noscript><p>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</p></noscript>
<form:form commandName="userManageVO" name="userManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovUserPasswordUpdt.do" method="post" onSubmit="return false;" enctype="multipart/form-data">

<!-- login status start -->
<div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
<!-- //login status end -->
<!-- wrap start -->

<div id="wrap">
	<!-- header start -->
	<div id="header"><c:import url="/sym/mms/EgovMainMenuHead.do?flag=MAIN" /></div>
	<!-- //header end -->		
	<!-- //타이틀이미지, 로그인 끝 -->
	<div id="bodywrap">
		<div class="viewWarp">
			<div class="view_title"><img src="/images/bl/bl_circle.gif" class="img_margin1"> 개인정보</div> 
            <dl>
                <dt>아이디</dt>
                <dd class="full">${mberManageVO.getEmplyrId() }
                <input name="uniqId" id="uniqId" title="uniqId" type="hidden" size="20" value="<c:out value='${mberManageVO.uniqId}'/>"/>
                <input name="returnUrl" id="returnUrl" title="returnUrl" type="hidden" size="20" value="userPage.do"/>
                </dd>
                <dt>이름</dt>
                <dd class="full">${mberManageVO.getEmplyrNm() }</dd>
                <dt>직급</dt>
                <dd class="full">-</dd>
                <dt>부서</dt>
                <dd class="full">-</dd>
            </dl>
            
			<div class="view_title"><img src="/images/bl/bl_circle.gif" class="img_margin1"> 비밀번호 변경</div> 
            <dl>
                <dt>이전 비밀번호:</dt>
                <dd class="full">
					<input name="oldPassword" id="oldPassword" type="password" size="20" value=""  maxlength="20" >
                </dd>
                <dt>변경 비밀번호:</dt>
                <dd class="full">
					<input name="newPassword" id="newPassword" type="password" size="20" value=""  maxlength="20" >                
                </dd>
                <dt>비밀번호 확인:</dt>
                <dd class="full">
					<input name="newPassword2" id="newPassword2" type="password" size="20" value=""  maxlength="20" >
					<div class="add_file"><a href="javascript:fnUpdate()">비밀번호 변경</a></div>                
                </dd>
            </dl>
        </div>
        
	</div>
	<!-- footer 시작 -->
	<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
	<!-- //footer 끝 -->
</div>
<!-- //wrap end -->

<c:import url="/EgovModal.do" charEncoding="utf-8">
	<c:param name="scriptYn" value="N" />
	<c:param name="modalName" value="egovModal" />
</c:import>
</form:form>
</body>
</html>
<%

%>