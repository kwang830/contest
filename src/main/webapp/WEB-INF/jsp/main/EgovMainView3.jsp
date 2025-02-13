<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<title>[심사위원] 너Do 나DO It! DT 공모전 - IBK시스템</title>
<link href="<c:url value='/'/>css/default.css" rel="stylesheet" type="text/css" >
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script>
$(function(){
  	$("#download_div").click(function(){
		//fn_bbs_call();
  	});
  	$("#notice_div").click(function(){
  		//fn_notice_call();
  	});
  	
    document.querySelectorAll(".chart-type06 .chart-bar").forEach(e =>{
        const o = e;
        const chartBar = o.childNodes[1];
        const chartTooltip = chartBar.childNodes[1];
        const cartWidth = o.offsetWidth;
        const barOffsetW = chartBar.offsetWidth;
        const TooltipOffsetW = chartTooltip.offsetWidth + 0.5;        
        chartTooltip.style.width = TooltipOffsetW + "px";
        
        
        setTimeout(() => {
          const case01 =  barOffsetW < TooltipOffsetW;
          const case02 = (cartWidth - barOffsetW) < TooltipOffsetW;
          if(case01){
            chartTooltip.style.left = 0;
          }else if(case02){
            chartTooltip.style.right = 0;
          }else{
            const chartLft = barOffsetW-(TooltipOffsetW/2) - 10;
            chartTooltip.style.left = chartLft + 'px';
          }
        },150);        
      }); 
  	
  	/*
    document.querySelectorAll(".chart-type06 .chart-bar").forEach(e =>{
        const o = e;
        const chartBar = o.childNodes[1];
        const chartTooltip = chartBar.childNodes[1];
        const cartWidth = o.offsetWidth;
        const barOffsetW = chartBar.offsetWidth;
        const TooltipOffsetW = chartTooltip.offsetWidth + 0.5;        
        chartTooltip.style.width = TooltipOffsetW + "px";
        
        
        setTimeout(() => {
          const case01 =  barOffsetW < TooltipOffsetW;
          const case02 = (cartWidth - barOffsetW) < TooltipOffsetW;
          if(case01){
            chartTooltip.style.left = 0;
          }else if(case02){
            chartTooltip.style.right = 0;
          }else{
            const chartLft = barOffsetW-(TooltipOffsetW/2) - 10;
            chartTooltip.style.left = chartLft + 'px';
          }
        },150);        
      }); 
  	*/
});

function fn_bbs_call(){
	$.ajax({
		type:"POST",
		url:"<c:url value='/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000001'/>",
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
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_articledetail(bbsId, nttId) {	
	//var form = $('#form1');   
	//var string = form.serialize();	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/bbs/selectArticleDetail.do",
		data: {
			"bbsId": bbsId,
			"nttId": nttId,
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
		error: function(m,err){
			alert('m:'+m+' /err:'+err);
		},
		complete:function(){}
	});  	
}
</script>
    <style>
     .chart-type06{position:relative;height:76px;padding:40px 0 26px;margin:0 auto;width:200px;}
     .chart-type06 .chart-bar{display:block;position:relative;width:100%;border-radius:5px;background:#efefef;height:10px;}
     .chart-type06 .chart-bar .bar{width:100%;border-radius:5px;height:10px;background:blue;}
     .chart-type06 .chart-bar .bar-tooltip{position:absolute;top:-36px;padding:4px 10px;display:inline-block;text-align:center;font-size:13px;line-height:16px;color:#fff;font-weight:500;background:#000;border-radius:7px;}
     .chart-type06 .chart-bar .bar-tooltip::after{content:"";position:absolute;left:50%;bottom:-5px;transform:translate(-50%,0);width:0;height:0;border-top:5px solid #000;border-right:5px solid transparent;border-left:5px solid transparent;}
    </style>
</head>
<body>
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
		<div id="leftcontent_wrap">
			<!-- c:import url="/cop/smt/sdm/EgovDeptSchdulManageList.do" /> -->
			<div>
				<img src="<c:url value='/'/>images/main/a/002.png" alt="공모전 홍보이미지" style="width:940px;"/>
			</div>
			<div></div>

			<div id="board_div1" style="float:left;">
				<div class="board_img">
				    <a href="#" id="bbs00">
				    	<p class="content_title2">□ 별점 TOP</p>
				    </a>
				</div>
				<ol>
				    <c:set var="index" value="1"/>
				    <c:forEach var="result" items="${bbsListScore}" varStatus="status">
				    <li>
				    	<c:if test="${index == 10}" >
				    	<img src="<c:url value='/'/>images/header/num${index}.gif" alt="" />
				    	</c:if>
				    	<c:if test="${index != 10}" >
				    	<img src="<c:url value='/'/>images/header/num0${index}.gif" alt="" />
				    	</c:if>
				        <a href="#" onclick="fn_egov_inquire_articledetail('<c:out value="${result.bbsId}"/>','<c:out value="${result.nttId}"/>');" >
				    	<c:choose>
					    	<c:when test="${result.scoreA == 0 || result.scoreA == null }">
						        0점 [<c:out value="${result.frstRegisterNm}" />] <c:out value="${fn:substring(fn:escapeXml(result.nttSj), 0, 18)}" />
						    </c:when>
					    	<c:otherwise>
						        <c:out value="${result.scoreA}" />점 [<c:out value="${result.frstRegisterNm}" />] <c:out value="${fn:substring(fn:escapeXml(result.nttSj), 0, 18)}" />
					    	</c:otherwise>
				    	</c:choose>
				        </a>
				    </li>
				    <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                    <c:if test="${fn:length(bbsListScore) == 0}" >
                        <li>최신 게시물이 없습니다.</li>
                    </c:if>
				</ol>
			</div>			
			<div id="board_div2" style="float:left;">
				<div class="board_img">
				    <a href="#" id="bbs00">
				    	<p class="content_title2">□ 추천 TOP</p>
				    </a>
				</div>
				<ol>
				    <c:set var="index" value="1"/>
				    <c:forEach var="result" items="${bbsListPicks}" varStatus="status">
				    <li>
				    	<c:if test="${index == 10}" >
				    	<img src="<c:url value='/'/>images/header/num${index}.gif" alt="" />
				    	</c:if>
				    	<c:if test="${index != 10}" >
				    	<img src="<c:url value='/'/>images/header/num0${index}.gif" alt="" />
				    	</c:if>
				    	<c:choose>
				    		<c:when test="${result.picksCo == 0 || result.picksCo == null }">
						        <a href="#" onclick="fn_egov_inquire_articledetail('<c:out value="${result.bbsId}"/>','<c:out value="${result.nttId}"/>');" >
								추천:0[<c:out value="${result.frstRegisterNm}" />] <c:out value="${fn:substring(fn:escapeXml(result.nttSj), 0, 18)}" />
						        </a>
				    		</c:when>
				    		<c:otherwise>
						        <a href="#" onclick="fn_egov_inquire_articledetail('<c:out value="${result.bbsId}"/>','<c:out value="${result.nttId}"/>');" >
								추천:<c:out value="${result.picksCo}" /> [<c:out value="${result.frstRegisterNm}" />] <c:out value="${fn:substring(fn:escapeXml(result.nttSj), 0, 17)}" />
						        </a>
				    		</c:otherwise>
				    	</c:choose>	
						<%-- <input type="text" value="${result.nttSj }"/> --%>				    
				    </li>
				    <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                    <c:if test="${fn:length(bbsListPicks) == 0}" >
                        <li>최신 게시물이 없습니다.</li>
                    </c:if>
				</ol>
			</div>
			
			<div id="board_div3">
				<div class="board_img">
				    <a href="#" id="bbs00">
				    	<p class="content_title2">□ 최근 등록</p>
				    </a>
				</div>
				<ol>
				    <c:set var="index" value="1"/>
				    <c:forEach var="result" items="${bbsList}" varStatus="status">
				    <li>
				    	<c:if test="${index == 10}" >
				    	<img src="<c:url value='/'/>images/header/num${index}.gif" alt="" />
				    	</c:if>
				    	<c:if test="${index != 10}" >
				    	<img src="<c:url value='/'/>images/header/num0${index}.gif" alt="" />
				    	</c:if>
				        <a href="#" onclick="fn_egov_inquire_articledetail('<c:out value="${result.bbsId}"/>','<c:out value="${result.nttId}"/>');" >
				        [<c:out value="${result.frstRegisterNm}" />] <c:out value="${fn:substring(fn:escapeXml(result.nttSj), 0, 18)}" />
				        </a>
				    </li>
				    <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                    <c:if test="${fn:length(bbsList) == 0}" >
                        <li>최신 게시물이 없습니다.</li>
                    </c:if>
				</ol>
			</div>
		</div>
		<!-- 중간 영역 시작 -->
		<!-- 
		<div id="middlecontent_wrap">
			임시
		</div>
		 -->
		<!-- //중간 영역 끝 -->
		<div id="rightcontent_wrap">		
			<div id="notice_div">
				<div class="notice_img">
				    <a href="#" id="bbs00">
				    	<p class="content_title2">공지사항</p>
				    </a>
				</div>
				<ol>
				    <c:set var="index" value="1"/>
				    <c:forEach var="result" items="${notiList}" varStatus="status">
				    <li>
				    	<c:if test="${index == 10}" >
				    	<img src="<c:url value='/'/>images/header/num${index}.gif" alt="" />
				    	</c:if>
				    	<c:if test="${index != 10}" >
				    	<img src="<c:url value='/'/>images/header/num0${index}.gif" alt="" />
				    	</c:if>
				        <a href="#" onclick="fn_egov_inquire_articledetail('<c:out value="${result.bbsId}"/>','<c:out value="${result.nttId}"/>');" >
				        <c:out value="${fn:substring(fn:escapeXml(result.nttSj), 0, 18)}" />
				        </a>
				    </li>
				    <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                    <c:if test="${fn:length(notiList) == 0}" >
                        <li>최신 게시물이 없습니다.</li>
                    </c:if>
				</ol>				
			</div>
												
			<div id="count_div">
				    <c:forEach var="result" items="${bbsListBoard}" varStatus="status">
				    	<c:if test="${result.rankNm == 'cntWeekTot'}" ><c:set var="cntWeekTot"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'cntWeek1'}" ><c:set var="cntWeek1"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'cntWeek2'}" ><c:set var="cntWeek2"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'cntWeek3'}" ><c:set var="cntWeek3"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'cntWeek4'}" ><c:set var="cntWeek4"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'cntWeek5'}" ><c:set var="cntWeek5"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'cntWeek6'}" ><c:set var="cntWeek6"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'cntWeekTest'}" ><c:set var="cntWeekTest"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'cntTotWId'}" ><c:set var="cntTotWId"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'cntTotCId'}" ><c:set var="cntTotCId"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'perTotWId'}" ><c:set var="perTotWId"><c:out value="${result.scoreS}" /></c:set></c:if>
				    	<c:if test="${result.rankNm == 'perTotCId'}" ><c:set var="perTotCId"><c:out value="${result.scoreS}" /></c:set></c:if>
                    </c:forEach>			
				<div class="count_img">
				    <a href="#" id="bbs00">
				    	<p class="content_title2">접수 현황 (기간)</p>
				    </a>				    
				</div>
				<div style="margin-top:15px;margin-left:8px;">
					<table style="width:230px;">
						<tr>
							<th>5.8~5.13</th>
							<th>5.14~5.20</th>
							<th>5.21~5.27</th>
						</tr>
						<tr>
							<td>${cntWeek1}</td>
							<td>${cntWeek2}</td>
							<td>${cntWeek3}</td>
						</tr>
						<tr>
							<th>5.28~6.3</th>
							<th>6.4~6.10</th>
							<th>6.11~6.16</th>
						</tr>
						<tr>
							<td>${cntWeek4}</td>
							<td>${cntWeek5}</td>
							<td>${cntWeek6}</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="count_div2">
				<div class="count_img">
				    <a href="#" id="bbs00">
				    	<p class="content_title2">접수 목표 100명 (누적)</p>
				    </a>
				</div>
				<div style="margin-top:15px;margin-left:8px;">
				    <div class="chart-type06">
      					<div class="chart-bar">
        					<div class="bar" style="width:${cntWeekTot}%">
          						<span class="bar-tooltip">${cntWeekTot}명</span>
        					</div>
      					</div>
    				</div>  
				</div>
			</div>
			<div id="count_div3">
				<div class="count_img">
				    <a href="#" id="bbs00">
				    	<p class="content_title2">참여도 (1회이상, 댓글 참여)</p>
				    </a>
				</div>
				<div style="margin-top:15px;margin-left:8px;">
				    <div class="chart-type06">
      					<div class="chart-bar">
        					<div class="bar" style="width:${perTotWId}%">
          						<span class="bar-tooltip">${cntTotWId}명</span>
        					</div>
      					</div>
    				</div>  
				</div>
			</div>
			<div id="count_div4">
				<div class="count_img">
				    <a href="#" id="bbs00">
				    	<p class="content_title2">참여도 (1회이상, 로그인)</p>
				    </a>
				</div>
				<div style="margin-top:15px;margin-left:8px;">
				    <div class="chart-type06">
      					<div class="chart-bar">
        					<div class="bar" style="width:${perTotCId}%">
          						<span class="bar-tooltip">${cntTotCId}명</span>
        					</div>
      					</div>
    				</div>  
				</div>
			</div>
			<!-- 			
			<div id="board_div">
			</div>
			 -->			
						
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