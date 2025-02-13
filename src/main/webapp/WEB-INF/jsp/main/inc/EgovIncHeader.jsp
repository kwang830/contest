<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="skipNav" class="invisible">
    <dl>
        <dt>콘텐츠 바로가기</dt>
        <dd><a href="#leftcontent01">컨텐츠 바로가기</a></dd>
        <dd><a href="#topmenu_nav">메인메뉴 바로가기</a></dd>
        <dd><a href="#leftmenu_div">좌메뉴 바로가기</a></dd>
    </dl>
</div>
<div class="login_area_loc">
	<div class="loginbg01"></div>
	<div class="loginbg02">

	    <%
           LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");	        
           if(loginVO == null){
        %>
		<ul>
		   <li>|</li>

           <li><a href="<c:url value='/uat/uia/egovLoginUsr.do'/>">로그인</a></li>
        </ul>
        <% }else{ %>
        <c:set var="loginName" value="<%= loginVO.getName()%>"/>
        <ul>
            <li>
            	<c:choose>
					<c:when test="${loginVO.getUserSe() =='USR'}">
						<a href="<c:url value='/cmn/main/userPage.do'/>"><c:out value="${loginName}"/> 님</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/cmn/main/userPage.do'/>"><c:out value="${loginName}"/> 님</a>
					</c:otherwise>
				</c:choose>
            </li>
            <li>|</li>
            <li><a href="<c:url value='/uat/uia/actionLogout.do'/>">로그아웃</a></li>
        </ul>
        <% } %>
	</div>
		<div class="loginbg03"></div>
</div>
<h1><a href="<c:url value='/'/>cmn/main/mainPage.do">로고</a></h1>
<div id="TopSearch" style="display:none;">
    <dl style="display: none;">
		<dd class="first"><a href="#">IBK시스템</a></dd>
		<dd><a href="#">공모전</a></dd>
	</dl>
    <form action="#LINK" name="TopSearchForm" id="TopSearchForm" method="post">
        <fieldset>
        	<legend>전체검색</legend>
        	<input type="text" style="" onfocus="" class="inputText" name="search" id="search">&nbsp;<button class="btnSearch" title="검색" type="submit">&nbsp;</button>
        </fieldset>
    </form>
</div>
<!-- topmenu start -->
<script type="text/javascript">
    function getLastLink(menuNo){
        var tNode = new Array;
        for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
            tNode[i] = document.menuListForm.tmp_menuNm[i].value;
            var nValue = tNode[i].split("|");
            //선택된 메뉴(menuNo)의 하위 메뉴중 첫번재 메뉴의 링크정보를 리턴한다.
            if (nValue[1]==menuNo) {
                if(nValue[5]!="dir" && nValue[5]!="" && nValue[5]!="/"){
                    //링크정보가 있으면 링크정보를 리턴한다.
                    return nValue[5];
                }else{
                    //링크정보가 없으면 하위 메뉴중 첫번째 메뉴의 링크정보를 리턴한다.
                    return getLastLink(nValue[0]);
                }
            }
        }
    }
    function goMenuPage(menuNo){
        document.getElementById("menuNo").value=menuNo;
        document.getElementById("link").value="forward:"+getLastLink(menuNo);
        document.menuListForm.action = "<c:url value='/EgovPageLink.do'/>";
        document.menuListForm.submit();
    }
    function actionLogout()
    {
        document.selectOne.action = "<c:url value='/uat/uia/actionLogout.do'/>";
        document.selectOne.submit();
    }
    
    function fn_menu_call(vurl){
    	$.ajax({
    		type:"POST",
    		url:vurl,
    		data:{
    			"param1":"param1",
    			"param2":"파라미터2"			
    			},
    		dataType:'html',
    		timeout:(1000*30),
    		
    		beforeSend:function(){
    			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
    		},
    		success:function(returnData, status){
    			if(status == "success") {
    				//console.log(returnData);
    				$("#bodywrap").empty();
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

<style>
body { margin: 0; }
.zeta-menu-bar {
  background: #0c4ca4;
  display: inline-block;
  width: 100%;
  position: absolute;
  top: 80px;
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 16px;
  font-weight: 500;
}
.zeta-menu { margin: 0; padding: 0; }
.zeta-menu li {
  float: left;
  list-style:none;
  position: relative;
}
.zeta-menu li:hover { background: white; }
.zeta-menu li:hover>a { color: #0c4ca4; }
.zeta-menu a {
  color: white;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}
.zeta-menu ul {
  background: #eee;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 180px;
}
.zeta-menu ul li { float: none; }
.zeta-menu ul li:hover { background: #ddd; }
.zeta-menu ul li:hover a { color: black; }
.zeta-menu ul a { color: black; }
.zeta-menu ul ul { left: 100%; top: 0; }
.zeta-menu ul ul li {float:left; margin-right:10px;}
</style>
<script>
$(function(){
  $(".zeta-menu li").hover(function(){
    $('ul:first',this).show();
  }, function(){
    $('ul:first',this).hide();
  });
  $(".zeta-menu>li:has(ul)>a").each( function() {
    $(this).html( $(this).html()+' &or;' );
  });
  $(".zeta-menu ul li:has(ul)")
    .find("a:first")
    .append("<p style='float:right;margin:-3px'>&#9656;</p>");

  $("#mn0000").click(function(){
	  fn_menu_call("<c:url value='/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000021' />");
  });
  $("#mn1500").click(function(){
	  fn_menu_call("<c:url value='/uss/olh/faq/selectFaqList.do' />");
  });  
  $("#mn2900").click(function(){
	  fn_menu_call("<c:url value='/uss/olh/qna/selectQnaList.do' />");
  });
  $("#mn3000").click(function(){
	  fn_menu_call("<c:url value='/uss/olh/qna/selectQnaAnswerList.do' />");
  });  
  
  <% if(loginVO.getUserSe().equals("USR") && (loginVO.getId().equals("kimdaekwang") || loginVO.getId().equals("baekdanbi"))){ %>   
  

  $("#mn6551").click(function(){
	  fn_menu_call("<c:url value='/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000031' />");
  });
  // 메뉴  
  $("#mn1000").click(function(){ // 전체일정관리
	  fn_menu_call("<c:url value='/cop/smt/sam/EgovAllSchdulManageList.do' />");
  });  
  $("#mn1100").click(function(){
	  fn_menu_call("<c:url value='/cop/smt/sdm/EgovDeptSchdulManageList.do' />");
  });
  $("#mn1200").click(function(){
	  fn_menu_call("<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageList.do' />");
  });  
  $("#mn1300").click(function(){
	  fn_menu_call("<c:url value='/cop/smt/dsm/EgovDiaryManageList.do' />");
  });
  $("#mn1400").click(function(){
	  fn_menu_call("<c:url value='/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000001' />");
  });

  $("#mn1600").click(function(){
	  fn_menu_call("<c:url value='/cmn/ctst/downPage.do' />");
  });
  $("#mn1700").click(function(){
	  fn_menu_call("<c:url value='/uss/umt/EgovEntrprsMberManage.do' />");
  });
  $("#mn1800").click(function(){
	  fn_menu_call("<c:url value='/uss/umt/EgovUserManage.do' />");
  });
  $("#mn1900").click(function(){
	  fn_menu_call("<c:url value='/uss/umt/EgovMberManage.do' />");
  });
  $("#mn2000").click(function(){
	  alert("준비중");
  });  
	  
  $("#mn2100").click(function(){
	  fn_menu_call("<c:url value='/sec/rmt/EgovRoleList.do' />");
  });
  $("#mn2200").click(function(){
	  fn_menu_call("<c:url value='/sec/ram/EgovAuthorList.do' />");
  });  
  $("#mn2300").click(function(){
	  fn_menu_call("<c:url value='/sec/gmt/EgovGroupList.do' />");
  });
  $("#mn2400").click(function(){
	  fn_menu_call("<c:url value='/sec/rgm/EgovAuthorGroupList.do' />");
  });
  $("#mn2500").click(function(){
	  fn_menu_call("<c:url value='/uss/umt/dpt/selectDeptManageListView.do' />");
  });
  $("#mn2600").click(function(){
	  fn_menu_call("<c:url value='/sec/drm/EgovDeptAuthorList.do' />");
  });
  $("#mn2700").click(function(){
	  fn_menu_call("<c:url value='/cop/bbs/selectBBSMasterInfs.do' />");
  });
  $("#mn2800").click(function(){
	  fn_menu_call("<c:url value='/uss/olh/faq/selectFaqList.do' />");
  });
  $("#mn2900").click(function(){
	  fn_menu_call("<c:url value='/uss/olh/qna/selectQnaList.do' />");
  });
  $("#mn3000").click(function(){
	  fn_menu_call("<c:url value='/uss/olh/qna/selectQnaAnswerList.do' />");
  });  
  
  $("#mn3100").click(function(){
	  fn_menu_call("<c:url value='/uss/olh/omm/selectOnlineManualList.do' />");
  });
  $("#mn3200").click(function(){
	  fn_menu_call("<c:url value='/uss/olh/omn/selectOnlineManualList.do' />");
  });  
  $("#mn3300").click(function(){
	  fn_menu_call("<c:url value='/uss/olp/cns/CnsltListInqire.do' />");
  });
  $("#mn3400").click(function(){
	  fn_menu_call("<c:url value='/uss/olp/cnm/CnsltAnswerListInqire.do' />");
  });
  $("#mn3500").click(function(){
	  fn_menu_call("<c:url value='/uss/olp/opm/listOnlinePollManage.do' />");
  });
  $("#mn3600").click(function(){
	  fn_menu_call("<c:url value='/uss/olp/opp/listOnlinePollPartcptn.do' />");
  });
  $("#mn3700").click(function(){
	  fn_menu_call("<c:url value='/uss/ion/ecc/selectEventCmpgnList.do' />");
  });
  <% } %>
});
</script>

<div class='zeta-menu-bar'>
  <ul class="zeta-menu">
    <li><a href="/cmn/main/mainPage.do">공모전 홈</a></li>
    <li><a href="/cmn/ctst/mainPage.do">공모개요</a></li>
    <li><a href="/cmn/ctst/boardPage.do">접수 및 평가</a></li>
    <li style="display:;"><a href="#">커뮤니티</a>
      <ul>
        <li><a href="#" id="mn0000">공지사항</a></li>
        <li><a href="/cmn/ctst/pplPage.do">홍보자료</a></li>        
        <li><a href="#" id="mn1500">FAQ</a></li>
        <li><a href="#" id="mn2900">QnA</a></li>
        <% if(loginVO.getUserSe().equals("USR")){%>
        <li><a href="#" id="mn3000">Q&amp;A답변관리 </a></li>
        <% } %>
        <li><a href="/cmn/ctst/downPage.do">신청서 다운로드</a></li>
      </ul>
    </li>
    <% if(loginVO.getUserSe().equals("USR")){%>
    <li style="display:;"><a href="#">통계</a>
      <ul>
        <li><a href="/stst/ctst/loginLogPage.do">접속기록 로그</a></li>
        <li><a href="/stst/ctst/DeptLoginListPage.do">본부별 접속 현황</a></li>
      </ul>
    </li>
    <% } %>    
	<% if(loginVO.getUserSe().equals("USR") && (loginVO.getId().equals("kimdaekwang") || loginVO.getId().equals("baekdanbi"))){ %>        
    <li style="display:;"><a href="#">시스템관리</a> 
      <ul>
        <li><a href="#">사용자관리</a>
          <ul>
            <li style="display:none;"><a href="#" id="mn1700">기업회원관리  </a></li>
            <li><a href="#" id="mn1800">업무사용자관리  </a></li>
            <li><a href="/cmn/user/userList.do">일반사용자관리 </a></li>
          </ul>
        </li>
        <% if(loginVO.getUserSe().equals("USR") && loginVO.getId().equals("kimdaekwang")){ %>        
    	<li><a href="#">일정관리</a>
      		<ul>
        		<li style="display:none;"><a href="#" id="mn1000">전체일정관리</a></li>
        		<li style="display:none;"><a href="#" id="mn1100">부서일정관리</a></li>
        		<li><a href="#" id="mn1200">일정관리</a></li>
        		<li><a href="#" id="mn1300">일지관리</a></li>
      		</ul>
    	</li>         
        <li style="display:;"><a href="#">프로그램 관리</a>
          <ul>
            <li><a href="#" id="mn2000">메뉴관리  </a></li>
            <li><a href="#" id="mn2100">롤관리  </a></li>
            <li><a href="#" id="mn2200">권한관리  </a></li>
            <li><a href="#" id="mn2300">그룹관리  </a></li>
            <li><a href="#" id="mn2400">권한그룹관리 </a></li>
            <li><a href="#" id="mn2500">부서관리  </a></li>
            <li><a href="#" id="mn2600">부서권한관리  </a></li>
          </ul>
        </li>
        <li style="display:;"><a href="#">사용자지원</a>
          <ul>
			<li><a href="#" id="mn6551">관리용 게시판</a></li>
            <li><a href="#" id="mn2700">게시판관리  </a></li>
            <li><a href="#" id="mn2800">FAQ관리  </a></li>
            <li><a href="#" id="mn2900">Q&amp;A관리  </a></li>
            <li><a href="#" id="mn3000">Q&amp;A답변관리 </a></li>
            <li><a href="#" id="mn3100">온라인매뉴얼  </a></li>
            <li><a href="#" id="mn3200">사용자온라인매뉴얼  </a></li>
            <li><a href="#" id="mn3300">상담관리  </a></li>
            <li><a href="#" id="mn3400">상담답변관리  </a></li>
            <li><a href="#" id="mn3500">온라인poll관리  </a></li>
            <li><a href="#" id="mn3600">온라인poll참여  </a></li>
            <li><a href="#" id="mn3700">행사/이벤트/캠페인  </a></li>
          </ul>        
        </li>
        <% } %>
      </ul>    
    </li> 
	<% } %>
  </ul>
</div>

<div id="topmenu_nav">
    <ul>
		<li><a href="#LINK" onclick="javascript:fn_menu_test()">견적관리</a></li>    
    	<c:forEach var="resultList" items="${list_headmenu}" varStatus="status">
        <li><a href="#LINK" onclick="javascript:goMenuPage('<c:out value="${resultList.menuNo}"/>')"><c:out value="${resultList.menuNm}"/></a></li>
        </c:forEach>
    </ul>    
</div>

<form name="menuListForm" action ="/sym/mnu/mpm/EgovMenuListSelect.do" method="post">
    <input type="hidden" id="menuNo" name="menuNo" value="<%=session.getAttribute("menuNo")%>" />
    <input type="hidden" id="link" name="link" value="" />
    <div style="width:0px; height:0px;">
    <c:forEach var="result" items="${list_menulist}" varStatus="status" >
        <input type="hidden" name="tmp_menuNm" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.relateImagePath}|${result.relateImageNm}|${result.chkURL}|" />
    </c:forEach>
    </div>
</form>
