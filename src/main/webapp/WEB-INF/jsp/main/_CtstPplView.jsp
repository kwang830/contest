<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<title>너Do 나DO It! DT 공모전 - IBK시스템</title>
<link href="<c:url value='/'/>css/default.css" rel="stylesheet" type="text/css" >
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script type="text/javascript">

window.history.forward(); 
function noBack(){ 
  window.history.forward();
}

$(function(){

});
</script>
<script type="text/javascript">

	function fn_egov_downFile(atchFileId, fileSn){
		window.open("/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"");
	}

	function fn_egov_deleteFile(atchFileId, fileSn, delTrName) {

		var forms;
		var form;
		forms = document.getElementsByTagName("form");

		for (var i = 0; i < forms.length; i++) {
			if (typeof(forms[i].atchFileId) != "undefined" &&
					typeof(forms[i].fileSn) != "undefined" &&
					typeof(forms[i].fileListCnt) != "undefined") {
				form = forms[i];
			}
		}
		
		var newForm = document.createElement( 'form' );
		var newfileSn = document.createElement( 'input' );
		var newAtchFileId = document.createElement( 'input' );
		
		newfileSn.setAttribute("name","fileSn");
		newAtchFileId.setAttribute("name","atchFileId");
		
		newfileSn.setAttribute("type","text");
		newAtchFileId.setAttribute("type","text");

		newfileSn.setAttribute("value",fileSn);
		newAtchFileId.setAttribute("value",atchFileId);
		
		newForm.appendChild( newfileSn );
		newForm.appendChild( newAtchFileId );

		//form = document.forms[0];
		//form.atchFileId.value = atchFileId;
		//form.fileSn.value = fileSn;
		newForm.method = "post";
		newForm.action = "/cmm/fms/deleteFileInfs.do";
		newForm.target = "iframe_egov_file_delete" 
		newForm.submit();
		//console.log('del submit!!');
		var objDelTr = document.getElementById(delTrName);
		objDelTr.parentNode.removeChild(objDelTr);
		fn_egov_multi_selector_update_delete();
		//console.log('egov_file_view_table delete!!');

	}

	function fn_egov_check_file(flag) {
		if (flag=="Y") {
			document.getElementById('file_upload_posbl').style.display = "block";
			document.getElementById('file_upload_imposbl').style.display = "none";
		} else {
			document.getElementById('file_upload_posbl').style.display = "none";
			document.getElementById('file_upload_imposbl').style.display = "block";
		}
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
<!-- login status start -->
<div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
<!-- //login status end -->
<!-- wrap start -->
<div id="wrap">
	<!-- header start -->
	<div id="header"><c:import url="/sym/mms/EgovMainMenuHead.do?flag=MAIN" /></div>
	<!-- //header end -->
	<!-- 타이틀이미지, 로그인 시작 -->
	<div id="titlewrap">
		<!-- <div class="main_img">
		 <img src="<c:url value='/'/>images/header/img_portal_title.gif" width="719" height="94" alt="" />
		</div> -->
	</div>
	<!-- //타이틀이미지, 로그인 끝 -->
	<div id="bodywrap">
		<div class="viewWarp">
			<div class="view_title"><img src="/images/bl/bl_circle.gif" class="img_margin1"> 홍보 자료</div>
            <dl>
                <dt>공모전명</dt>
                <dd>너Do 나Do It! DT 공모전</dd>
                <dt>공모전 기간</dt>
                <dd>2023. 5. 8. ~ 2023. 6. 16.</dd>
                <dt>홍보영상</dt>
                <dd class="full">

<video width="1200" height="1200" autoplay="" controls="" style="width:100%;height:auto;max-width: 800px;"> <source src="https://s3.ap-northeast-2.amazonaws.com/www.ifriendspet.com/assets_gw/idea_contest_2023/pre_final_1.mp4" type="video/mp4"> Your browser does not support the video tag. </video>   
                </dd>
                <dt>카드뉴스</dt>
                <dd class="full">
<img src="https://s3.ap-northeast-2.amazonaws.com/www.ifriendspet.com/assets_gw/idea_contest_2023/001.png" style="width:100%;height:auto;max-width: 800px;"/>
<img src="https://s3.ap-northeast-2.amazonaws.com/www.ifriendspet.com/assets_gw/idea_contest_2023/002.png" style="width:100%;height:auto;max-width: 800px;"/>
<img src="https://s3.ap-northeast-2.amazonaws.com/www.ifriendspet.com/assets_gw/idea_contest_2023/003.png" style="width:100%;height:auto;max-width: 800px;"/>
<img src="https://s3.ap-northeast-2.amazonaws.com/www.ifriendspet.com/assets_gw/idea_contest_2023/004.png" style="width:100%;height:auto;max-width: 800px;"/>
<img src="https://s3.ap-northeast-2.amazonaws.com/www.ifriendspet.com/assets_gw/idea_contest_2023/005.png" style="width:100%;height:auto;max-width: 800px;"/>
<img src="https://s3.ap-northeast-2.amazonaws.com/www.ifriendspet.com/assets_gw/idea_contest_2023/006.png" style="width:100%;height:auto;max-width: 800px;"/>
<img src="https://s3.ap-northeast-2.amazonaws.com/www.ifriendspet.com/assets_gw/idea_contest_2023/007.png" style="width:100%;height:auto;max-width: 800px;"/>
<img src="https://s3.ap-northeast-2.amazonaws.com/www.ifriendspet.com/assets_gw/idea_contest_2023/008.png" style="width:100%;height:auto;max-width: 800px;"/>
                </dd>                         
                
            </dl>
        </div>
	</div>
	
	<!-- footer 시작 -->
	<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
	<!-- //footer 끝 -->
</div>
<!-- //wrap end -->
</body>
</html>
<%

%>