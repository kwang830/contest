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
$(function(){
	
	//모달 셋팅
	fn_modal_setting();	
	
  	$("#btn_main_a1").click(function(){
		$("#mn1400").click();
  	});
  	$("#btn_main_a2").click(function(){
		$("#mn2900").click();
  	});
  	$("#btn_main_a3").click(function(){
		//alert('다운로드');
  	});  	
  	//$("#middlecontent_wrap2 .list li").click(function(){
  	//	alert(891);
  	//	fn_notice_pop();
  	//});
  	$("#notice_more").click(function(){
  		fn_notice_call(); // 공지사항 더보기
  	});  	
  	
  	var $banner = $(".banner").find("ul");

  	var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
  	var $bannerHeight = $banner.children().outerHeight(); // 높이
  	var $length = $banner.children().length;//이미지의 갯수
  	var rollingId;

  	//정해진 초마다 함수 실행
  	rollingId = setInterval(function() { rollingStart(); }, 25000);//다음 이미지로 롤링 애니메이션 할 시간차

  	//마우스 오버시 롤링을 멈춘다.
  	$banner.mouseover(function(){
  		//중지
  		clearInterval(rollingId);
  		$(this).css("cursor", "pointer");
  	});
  	//마우스 아웃되면 다시 시작
  	$banner.mouseout(function(){
  		rollingId = setInterval(function() { rollingStart(); }, 25000);
  		$(this).css("cursor", "default");
  	});

  	//*
  	//왼쪽으로 롤링
  	function rollingStart() {
  		$banner.css("width", $bannerWidth * $length + "px");
  		$banner.css("height", $bannerHeight + "px");
  		//alert(bannerHeight);
  		//배너의 좌측 위치를 옮겨 준다.
  		$banner.animate({left: - $bannerWidth + "px"}, 3000, function() { //숫자는 롤링 진행되는 시간이다.
  			//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
  			$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
  			//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
  			$(this).find("li:first").remove();
  			//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
  			$(this).css("left", 0);
  			//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
  		});
  	}
  	//*/
  	/*
  	//위로 롤링
  	function rollingStart() {
  		//banner.css("width", bannerWidth * bannerLength + "px");
  		$banner.css("height", $bannerHeight * $length + "px");
  		//alert(bannerHeight);
  		//배너의 상단 위치를 옮겨 준다.
  		$banner.animate({top: - $bannerHeight + "px"}, 2500, function() { //숫자는 롤링 진행되는 시간이다.
  			//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
  			$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
  			//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
  			$(this).find("li:first").remove();
  			//다음 움직임을 위해서 배너 상단의 위치값을 초기화 한다.
  			$(this).css("top", 0);
  			//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
  		});
  	}
  	*/
});

var noticeTitle="";
var noticeCotents="";

function fn_notice_call(){
	$.ajax({
		type:"POST",
		url:"<c:url value='/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000021'/>",
		data:{
			"param1":"param1",
			"param2":"param2"			
			},
		dataType:'html',
		timeout:(1000*30),
		
		beforeSend:function(){
			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
		},
		success:function(returnData, status){
			if(status == "success") {
				$("#bodywrap").html(returnData);
			}else{ alert("ERROR!");return;} 
		},
		error: function(){
			alert('err');
		},
		complete:function(){}
		});
}
function fn_notice_pop(bbsId, nttId){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/bbs/selectArticleDetailAjax.do",
		data: {
			"bbsId": bbsId,
			"nttId": nttId,
		},
 		dataType:'json',
 		timeout:(1000*30),
 		success:function(returnData, status){
 			if(status == "success") {
 				if(returnData.noticeCotents!=""){ 					
 					var noticeTitle=returnData.noticeTitle;
					var noticeCotents=returnData.noticeCotents;
					
					var contentAddTable = "";
					contentAddTable += "<table class='board_list'>";
					contentAddTable += "<caption>공지내용</caption>";
					contentAddTable += "<colgroup>";
					contentAddTable += "<col style='width: 100%;'>";
					contentAddTable += "</colgroup>";
					contentAddTable += "<thead>";
					contentAddTable += "<tr style='height:33px;'>";
					contentAddTable += "<td>"+noticeCotents+"</td>"; 
					contentAddTable += "</tr>";
					contentAddTable += "</thead>";
					contentAddTable += "<tbody class='ov'>";
					contentAddTable += "</tbody>";
					contentAddTable += "</table>";
					
					var content = "";
					content += "<div class='modal-alignL' style='margin:5px 0 0 0'>"+contentAddTable+"</div>"; //사용할아이디
					content += "<div style='clear:both;'></div>";
					content += "<div id='divModalResult' style='margin:10px 0 0 0'></div>";
					
					//모달 body 설정
					$("#egovModal").setEgovModalBody(content);
					$("#egovModal").setEgovModalTitle(noticeTitle);
					
					$(".modal-content").css("width","400px");
					//$(".modal-content").css("top","200px");
					$(".modal-footer #footer").css("float","none");
					$(".modal-footer #footer").css("width","100%");
					
					$("#main_popup").click();
 				}
 			}else{ alert("ERROR!");return;} 
 		}
	});
}	

/*********************************************************
 * 모달셋팅
 ******************************************************** */
function fn_modal_setting(){
	//버튼에 모달 연결
	$("#main_popup").egovModal( "egovModal" );
	
	//타이틀 설졍
	$("#egovModal").setEgovModalTitle("공지사항");
	
	var contentAddTable = "";
	contentAddTable += "<table class='board_list'>";
	contentAddTable += "<caption>공지내용</caption>";
	contentAddTable += "<colgroup>";
	contentAddTable += "<col style='width: 100%;'>";
	contentAddTable += "</colgroup>";
	contentAddTable += "<thead>";
	contentAddTable += "<tr style='height:33px;'>";
	contentAddTable += "<td>"+noticeCotents+"</td>"; 
	contentAddTable += "</tr>";
	contentAddTable += "</thead>";
	contentAddTable += "<tbody class='ov'>";
	contentAddTable += "</tbody>";
	contentAddTable += "</table>";
	
	var content = "";
	content += "<div class='modal-alignL' style='margin:5px 0 0 0'>"+"제목:"+noticeTitle+"</div>"; //사용할아이디
	content += "<div style='clear:both;'></div>";
	content += "<div id='divModalResult' style='margin:10px 0 0 0'>"+contentAddTable+"</div>";
	
	//모달 body 설정
	$("#egovModal").setEgovModalBody(content);

	var footer = "";
	//footer += "<span class='btn_style1 blue' id='btnModalSelect' onclick='fn_bcnc_check()'><a href='#'>조회</a></span>&nbsp;";
	
	//모달 footer 설정
	$("#egovModal").setEgovModalfooter(footer);
	
	//엔터이벤트처리
	$("input[name=checkIdModal]").keydown(function (key) {
		if(key.keyCode == 13){
			fn_bcnc_check();	
		}
	});
	
	footer = null;
	content = null;
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
<body>
<noscript><p>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</p></noscript>
<form:form commandName="articleVO" name="articleVO" action="${pageContext.request.contextPath}/cop/bbs/insertArticle.do" method="post" onSubmit="return false;" enctype="multipart/form-data">

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
			<div class="view_title"><img src="/images/bl/bl_circle.gif" class="img_margin1"> 개인정보 정보수정</div> 
            <dl>
                <dt>아이디</dt>
                <dd class="full">${mberManageVO.getMberId() }</dd>
                <dt>이름</dt>
                <dd class="full">${mberManageVO.getMberNm() }</dd>
            </dl>
        </div>
        
        
	<table class="board_list" summary="" id="sub_list">
	<caption>test</caption>
	<colgroup>
		<col style="width: 5%;">
		<col style="width: 10%;"> 
		<col style="width: 15%;">
		<col style="width: 10%;">
		<col style="width: 15%;">
	</colgroup>
	<thead>
		<tr style="height:33px;">
			<th>순번</th>			
		</tr>
	</thead>
	<tbody class="ov">
		<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
		<tr>
			<th><c:out value="${status.count}"/></th>			
		</tr>
		</c:forEach>	
	</tbody>
	</table>
        
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