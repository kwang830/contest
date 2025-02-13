<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<title>너Do 나DO It! DT 공모전 - IBK시스템</title>
<link href="<c:url value='/'/>css/default.css?v=1234" rel="stylesheet" type="text/css" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/modal.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/modal.js' />"></script>
<script type="text/javascript">

window.history.forward(); 
function noBack(){ 
  window.history.forward();
}

$(function(){
	//fn_menu_call("<c:url value='/sym/log/clg/SelectLoginLogList.do' />");
	
	//모달 셋팅
	fn_modal_setting();	
	
	$(".dept02 a").click(function(){
		var chkTitle = $(this).attr("title");
		if(chkTitle=='전체'){
			$("#userLoginList tr").each(function(index){
				$(this).css("display","");
			});
		}else{
			$("#userLoginList tr").each(function(index){
				var chk = $(this).attr("title");
				if(chkTitle==chk){
					if(chk !='목록'){
						$(this).css("display","");
					}
				}else{
					if(chk !='목록'){
						$(this).css("display","none");
					}
				}
			});			
		}
		

	})
	
});
var noticeTitle="";
var noticeCotents="";


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

function fn_readList_pop(bbsId, nttId){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/bbs/selectArticleDetailAjax.do",
		data: {
			"bbsId": "BBSMSTR_000000000001",
			"nttId": "292",
		},
 		dataType:'json',
 		timeout:(1000*30),
 		success:function(returnData, status){
 			if(status == "success") {
 				if(returnData.noticeCotents!=""){ 					
 					//var noticeTitle=returnData.noticeTitle;
 					var noticeTitle="게시글 확인 명단";
					var noticeCotents=returnData.noticeCotents;
					
					var contentAddTable = "";
					contentAddTable += "<table class='board_list'>";
					contentAddTable += "<caption>게시글 확인 명단</caption>";
					contentAddTable += "<colgroup>";
					contentAddTable += "<col style='width: 100%;'>";
					contentAddTable += "</colgroup>";
					contentAddTable += "<thead>";
					contentAddTable += "<tr style='height:33px;'>";
					contentAddTable += "<td>예시..</td>"; 
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
</script>
<c:if test="${!empty resultMsg}">
<script type="text/javaScript">
alert('<spring:message code="${resultMsg}" />');
</script>
</c:if>
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
			<div class="view_title"><img src="/images/bl/bl_circle.gif" class="img_margin1"> 본부별 접속 현황</div> 

				<div id="count_div5">
					<div style="margin-top:15px;margin-left:8px;float:left;width:550px;height:500px;">
						<table style="width:550px;">
							<colgroup>
								<col style="width: 20%;">
								<col style="width: 10%;">
								<col style="width: 14%;">
								<col style="width: 14%;">
								<col style="width: 14%;">
								<col style="width: 14%;">
								<col style="width: 14%;">
							</colgroup>						
							<tr>
								<th>본부명</th>
								<th>전체인원</th>
								<th>접속인원</th>
								<th>접속률</th>
								<th>접속인원<br>(3회이상)</th>
								<th>접속률<br>(3회이상)</th>
								<th>접수건</th>
							</tr>
					<c:set var="dept_sum" value="0"/>
					<c:set var="tot_sum" value="0"/>
					<c:set var="score_A" value="0"/>
					<c:set var="score_B" value="0"/>
					<c:set var="tot_sum_B" value="0"/>
				    <c:forEach var="result" items="${bbsDeptLoginList}" varStatus="status">
				    				    
				    	<c:if test="${result.scoreS == 'A' || result.scoreS == 'B' }" >
				    		<c:set var="dept_sum" value="${dept_sum+result.scoreA}"/>
				    		<c:set var="tot_sum" value="${tot_sum+result.scoreA}"/>
				    		<c:if test="${result.scoreS == 'B' }" >
				    			<c:set var="score_B" value="${result.scoreA }"/>
				    			<c:set var="tot_sum_B" value="${tot_sum_B+result.scoreA}"/>
				    		</c:if>
				    	</c:if>

				    	<c:if test="${result.deptNmS != '경영전략본부' }" >
				    		<c:set var="score_A" value="${result.scoreA }"/>
				    	</c:if>
				    	<c:if test="${result.deptNmS == '경영전략본부' || result.deptNmS == '전체' }" >
				    		<c:set var="score_A" value="${result.scoreA-18 }"/>
				    	</c:if>
				    	<c:if test="${result.scoreS == '소계' && result.deptNmS != '임원' }" >						    
							<tr>
								<td class="dept02"><a href="#" title="${result.deptNmS}">${result.deptNmS}</a></td>							
								<td>${score_A}</td>
								<td>
									<c:if test="${result.deptNmS != '전체' }" >${dept_sum}</c:if>
									<c:if test="${result.deptNmS == '전체' }" >${tot_sum}</c:if>
								</td>
								<td>
									<c:if test="${result.deptNmS != '전체' }" >${fn:substring(dept_sum/score_A*100,0,5)} %
										<c:set var="dept_sum" value="0"/>
									</c:if>
									<c:if test="${result.deptNmS == '전체' }" >${fn:substring(tot_sum/score_A*100,0,5)} %</c:if>								
								</td>
								<td>
									<c:if test="${result.deptNmS != '전체' }" >${score_B}</c:if>
									<c:if test="${result.deptNmS == '전체' }" >${tot_sum_B}</c:if>
								</td>
								<td>
									<c:if test="${result.deptNmS != '전체' }" >${fn:substring(score_B/score_A*100,0,4)} %
										<c:set var="score_B" value="0"/>	
									</c:if>
									<c:if test="${result.deptNmS == '전체' }" >${fn:substring(tot_sum_B/score_A*100,0,4)} %</c:if>								
								</td>
								<td>
									<span class="dept_bbs_sum" title="${result.deptNmS}">0</span>
								</td>
							</tr>
						</c:if>
                    </c:forEach>
                    <c:if test="${fn:length(bbsDeptLoginList) == 0}" >
                        <li>접속 현황이 없습니다.</li>
                    </c:if>						
						</table>

							<br>
							* 경영전략본부 - 휴직자(17명), 장기휴가자(1명) 제외 ('23.06.16 기준)
							<br>
							* 임원(4명) 미포함
							
							<br>
							<c:set var="bbs_sum_tot" value="0"/>
							<c:forEach var="result" items="${bbsDeptBbsList}" varStatus="status">
							<c:set var="bbs_sum_tot" value="${bbs_sum_tot+result.scoreA}"/>
								<script>$(function(){
									var dept = "${result.deptNmS}";
									var cnt = "${result.scoreA}";
									var tot = "${bbs_sum_tot}";
									$(".dept_bbs_sum").each(function(){
										console.log($(this).attr("title")+','+dept);
										if( $(this).attr("title")== dept ){
											$(this).text(cnt);
										}
									});
								});</script>							
							</c:forEach>
								<script>$(function(){
									var tot = "${bbs_sum_tot}";
									$(".dept_bbs_sum").each(function(){										
										if( $(this).attr("title")== "전체" ){
											$(this).text(tot);
										}										
									});
								});</script>
						
					</div>
					<div style="margin-top:15px;margin-left:8px;float:left;width:590px;height:665px;background-color:whitesmoke;overflow:auto;">
						<table style="width:590px;" id="userLoginList">
							<colgroup>	
								<col style="width: 50%;">
								<col style="width: 10%;">
								<col style="width: 10%;">
								<col style="width: 10%;">
								<col style="width: 20%;">
							</colgroup>						
							<tr title="목록">
								<th>소속</th>
								<th>이름</th>
								<th>직급</th>
								<th>접속수</th>
								<th>최종접속일</th>
							</tr>
							<c:set var="login_sum_tot" value="0"/>
							<c:set var="user_sum_tot" value="0"/>
							<c:forEach var="result" items="${bbsUserLoginList}" varStatus="status">
							<c:set var="user_sum_tot" value="${user_sum_tot+1}"/>
							<c:if test="${result.scoreS > 2}" >
								<c:set var="login_sum_tot" value="${login_sum_tot+1}"/>
							</c:if>
							
							<tr title="${result.deptNmS}" <c:if test="${result.scoreS > 2}" >style="background-color:lightyellow;"</c:if>>
								<td style="text-align: left;">${result.deptNmF}</td>
								<td>${result.frstRegisterNm}</td>
								<td>${result.titleNm}</td>
								<td>${result.scoreS}</td>
								<td>${result.lastUpdusrPnttm}</td>
							</tr>
							</c:forEach>
                    		<c:if test="${fn:length(bbsUserLoginList) == 0}" >
                        		<li>접속 현황이 없습니다.</li>
                    		</c:if>
						</table>
					</div>
				</div>         
        </div>
	</div>
	
	<!-- footer 시작 -->
	<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
	<!-- //footer 끝 -->
</div>
<!-- //wrap end -->
<span id="main_popup"></span>
<c:import url="/EgovModal.do" charEncoding="utf-8">
	<c:param name="scriptYn" value="N" />
	<c:param name="modalName" value="egovModal" />
</c:import>

</body>
</html>
<%

%>