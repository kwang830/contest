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
<script>
$(function(){
  	$("#download_div").click(function(){
		fn_bbs_call();
  	});
  	$("#banner_div").click(function(){
  		fn_estmt_call();
  	});
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
function fn_estmt_call(){
	$.ajax({
		type:"POST",
		url:"<c:url value='/custom/estmt/EstmtBcncInqire.do'/>",
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

</script>
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
			<div>홍보내용 팜플렛</div>
		</div>
		<!-- 중간 영역 시작 -->
		<div id="middlecontent_wrap">
			
		</div>
		<!-- //중간 영역 끝 -->
		<div id="rightcontent_wrap">
			<div class="main_login">
	    		<%
	               LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
	               if(loginVO != null){
	            %>
	    		<ul>
	    		    <li><h3>[로그인정보]</h3></li>
    		    	<li><%= loginVO.getName()%>님 로그인하셨습니다.</li>
    		    	<!-- <li>로그인 :2017-06-19 12:45 (예)</li> -->
    		    	<!-- <li>받은 쪽지 : 3건 (예)</li> -->
    			</ul>
	    		<%  } else { %>
            	<!-- 메인화면 로그인위치를 사용하는 경우 -->
				<ul>
					<li>
						<input disabled="disabled" type="text" class="input_style" maxlength="25" title="아이디를 입력하세요." id="user_id" name="user_id" />
						<input disabled="disabled" type="checkbox" id="idsave"><label for="idsave">아이디 저장</label>
					</li>
					<li>
						<input disabled="disabled" type="password" class="input_style" maxlength="25" title="비밀번호를 입력하세요." id="user_password" name="user_password" />
						<a href="<c:url value='/uat/uia/egovLoginUsr.do'/>"><img alt="로그인" src="<c:url value='/'/>images/header/btn_login.gif" /></a>
					</li>
				</ul>
				<div class="find_idpw">아이디/비밀번호 찾기</div>
	     	<%  } %>
			</div>		
		
			<div id="banner_div">
				<div class="download_img">
				    <a href="#" id="bbs00">
				    	- 공지사항
				    	<!-- <img alt="최신 견적 목록" src="<c:url value='/'/>images/header/img_rightcontent_title02.gif" /> -->
				    </a>
				</div>
				<ol>
				    <c:set var="index" value="1"/>
				    <c:forEach var="result" items="${estmtList}" varStatus="status">
				    <li>
				    	<c:if test="${index == 10}" >
				    	<img src="<c:url value='/'/>images/header/num${index}.gif" alt="" />
				    	</c:if>
				    	<c:if test="${index != 10}" >
				    	<img src="<c:url value='/'/>images/header/num0${index}.gif" alt="" />
				    	</c:if>
				        <a href="#">
				        <c:out value="${fn:substring(fn:escapeXml(result.docSj), 0, 18)}" />
				        </a>
				    </li>
				    <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                    <c:if test="${fn:length(bbsList) == 0}" >
                        <li>최신 게시물이 없습니다.</li>
                    </c:if>
				</ol>				
			</div>
			
			<div id="download_div">
				<div class="download_img">
				    <a href="#" id="bbs00">
				    	- 공모전 참가 목록 (최근 등록순)
				    	<!-- <img alt="최신 게시물 목록" src="<c:url value='/'/>images/header/img_rightcontent_title01.gif" /> -->
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
				        <a href="#">
				        <c:out value="${fn:substring(fn:escapeXml(result.nttSj), 0, 18)}" />
				        </a>
				    </li>
				    <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                    <c:if test="${fn:length(bbsList) == 0}" >
                        <li>최신 게시물이 없습니다.</li>
                    </c:if>
				</ol>
			</div>
			
			<div id="count_div">
			 	<table>
			 		<tr>
			 			<td>1</td>
			 			<td>전체</td>
			 			<td>0건</td>
			 		</tr>
			 		<tr>
			 			<td>1</td>
			 			<td>금주</td>
			 			<td>0건</td>
			 		</tr>
			 		<tr>
			 			<td>1</td>
			 			<td>전주</td>
			 			<td>0건</td>
			 		</tr>
			 	</table>
			</div>
						
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