<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" crossorigin="anonymous">
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/modal.js' />"></script>
<script>
window.history.forward(); 
function noBack(){ 
  window.history.forward();
}

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
  	
  	document.querySelectorAll('.btnmove').forEach(function(item){
  	    item.addEventListener('click', function(e){
  	    	clearInterval(rollingId);
  	        //화살표 방향 구분
  	        if(e.target.parentElement.parentElement.classList.contains('prev')){
  	          	$(".banner").find("ul").append("<li>" + $(".banner").find("ul").find("li:first").html() + "</li>");
    			$(".banner").find("ul").find("li:first").remove();
  	        }else{
  	          	$(".banner").find("ul").prepend("<li>" + $(".banner").find("ul").find("li:last").html() + "</li>");
    			$(".banner").find("ul").find("li:last").remove();
  	        }
  	      	rollingId = setInterval(function() { rollingStart(); }, 25000);
  	    });
  	}); 
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
					
					$(".modal-content").css("width","500px");
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

.img_wrap .btnmove{
    position: absolute;
    top: 380px;
    width: 40px;
    height: 85px;
    z-index: 1;
    font-size: 4em;
    opacity: 0.5;
}
.img_wrap .btnmove.prev{
    left: 10px;
}
.img_wrap .btnmove.next{
    right: 10px;
}
.img_wrap i{
    color: #8C8C8C;
}
.img_wrap i:hover{
    color: #000;
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
	</div>
	<!-- //타이틀이미지, 로그인 끝 -->		
	<div id="bodywrap">
		<div class="contents">
			<div class="img_wrap">
    			<div class="prev btnmove">
        			<a href="#" title="이전"><i class="fas fa-chevron-left"></i></a>
    			</div>
    			<div class="next btnmove">
        			<a href="#" title="다음"><i class="fas fa-chevron-right"></i></a>
    			</div>    
				<div class="banner">
					<ul>
						<li><img src="<c:url value='/'/>images/main/a/002.png" alt="공모전 홍보이미지" /></li>				
						<li><img src="<c:url value='/'/>images/main/a/003.png" alt="공모전 홍보이미지" /></li>
						<li><img src="<c:url value='/'/>images/main/a/004.png" alt="공모전 홍보이미지" /></li>
						<li><img src="<c:url value='/'/>images/main/a/005.png" alt="공모전 홍보이미지" /></li>				
					</ul>
				</div>
			</div>
		</div>
		<div id="leftcontent_wrap2">
			<p class="content_title">문의사항</p>
			<div class="list">
				<ul>
					<li><code><span class="num">1</span><strong>운영부서</strong></code><span class="txt">IT혁신사업본부</span></li>
					<li><code><span class="num">2</span><strong>운영담당자</strong></code><span class="txt">백단비 대리</span></li>
					<li><code><span class="num">3</span><strong>문의전화</strong></code><span class="txt">02-3407-6072</span></li>
					<li><code><span class="num">4</span><strong>문의시간</strong></code><span class="txt">AM : 9시 ~ PM : 6시</span></li>
				</ul>
			</div>
		</div>
		<!-- 중간 영역 시작 -->
		<div id="middlecontent_wrap2">
			<p class="content_title"><span id="main_popup"></span>공지사항&nbsp;<span id="notice_more"><img src="<c:url value='/'/>images/btn/btn_more.png" alt="공지사항 더보기"></span></p>
			
			<div class="list">
				<ol>
				    <c:set var="index" value="1"/>
				    <c:forEach var="result" items="${bbsList}" varStatus="status">
				    <c:if test="${index < 5}" >
				    <li>
				    	<c:if test="${index == 10}" >
				    	<!-- <img src="<c:url value='/'/>images/header/num${index}.gif" alt="" /> -->
				    	<img src="<c:url value='/'/>images/egovframework/com/cop/bbs/icon_notice.png" alt="notice">
				    	</c:if>
				    	<c:if test="${index != 10}" >
				    	<!-- <img src="<c:url value='/'/>images/header/num0${index}.gif" alt="" /> -->
				    	<img src="<c:url value='/'/>images/egovframework/com/cop/bbs/icon_notice.png" alt="notice">
				    	</c:if>
				        <a href="#" onClick="fn_notice_pop('<c:out value="${result.bbsId}" />','<c:out value="${result.nttId}" />');">
				        <c:out value="${fn:substring(fn:escapeXml(result.nttSj), 0, 30)}" />
				        </a>
				    </li>
				    </c:if>
				    <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                    <c:if test="${fn:length(bbsList) == 0}" >
                        <li>최신 게시물이 없습니다.</li>
                    </c:if>
				</ol>
			</div>
		</div>
		<!-- //중간 영역 끝 -->
		<div id="rightcontent_wrap2">
			<div>
				<ul>
					<li class="first-child">
						<a href="/cmn/ctst/boardPage.do">
						<img src="http://seochocontest.gcontest.co.kr/template/images/3/img_icon01_empty.png" alt="접수하기">
						<code><p class="main_icon_text">접수하기</p></code>
						</a>
					</li>
					<li class="second-child">
						<a href="#" id="btn_main_a2">
						<img src="http://seochocontest.gcontest.co.kr/template/images/3/img_icon02_empty.png" alt="QNA">
						<code><p class="main_icon_text">QNA</p></code>
						</a>
					</li>
					<li class="last-child">
						<a href="/cmn/ctst/downPage.do" id="btn_main_a3">
						<img src="http://seochocontest.gcontest.co.kr/template/images/3/img_icon03_empty.png" alt="다운로드">
						<code><p class="main_icon_text">다운로드</p></code>
						</a>
					</li>
				</ul>
			</div>
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

</body>
</html>
<%

%>