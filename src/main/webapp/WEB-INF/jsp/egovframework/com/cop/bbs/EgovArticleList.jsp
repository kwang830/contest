<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.ctest.title"/></c:set>

<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript">

window.history.forward(); 
function noBack(){ 
  window.history.forward();
}

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	// 첫 입력란에 포커스..
	document.searchVO.searchCnd.focus();
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){

	$("input[name='pageIndex']").val(pageNo);
	
	var form = $('#form1');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/bbs/selectArticleList.do",
		data: string, 
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
/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_article(){
	$("input[name=pageIndex]").val(1);
	
	var form = $('#form1');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/bbs/selectArticleList.do",
		data: string, 
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
/* ********************************************************
 * 등록
 ******************************************************** */
function fnAddArticle(bbsid){	
	//var form = $('#form1');   
	//var string = form.serialize();	
	<c:if test="${boardMasterVO.bbsId =='BBSMSTR_000000000001'}">
	var xmlHttpRequest;
	if(window.XMLHttpRequest){// code for Firefox, Mozilla, IE7, etc.
		xmlHttpRequest = new XMLHttpRequest();
	}else if(window.ActiveXObject){// code for IE5, IE6
		xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}else{
		return;
	}

	xmlHttpRequest.open('HEAD', window.location.href.toString(), false);
	xmlHttpRequest.setRequestHeader("ContentType", "text/html");
	xmlHttpRequest.send('');

	var serverDate = xmlHttpRequest.getResponseHeader("Date");
	var date = new Date(serverDate);
	var gDate = date.getDate();
	if(gDate<10){
		gDate = '0'+gDate;
	}	
	var gMonth = date.getMonth()+1;
	if(gMonth<10){
		gMonth = '0'+gMonth;
	}
	var gFullYear = date.getFullYear();
	var fDate = gFullYear+gMonth+gDate;
	//alert('fDate:'+fDate);
	if(fDate>20230616){
		alert('지금은 접수 기간이 아닙니다. \n접수기간 : 2023년 5월 8일(월) ~ 2023년 6월 16일(금), 6주')
		return;		
	}
	</c:if>
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/cop/bbs/insertArticleView.do",
		data: {
			"bbsId": bbsid			
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

$(function() {
	$("#ui-datepicker-div").remove();
});

</script>
<%-- <c:set var="resultMsg">success.common.delete</c:set> --%>
<c:if test="${!empty resultMsg}">
<script type="text/javaScript">
alert("<spring:message code="${resultMsg}" />");
</script>
</c:if>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
<div class="board"> 
	<form:form id="form1" commandName="searchVO" name="searchVO" action="${pageContext.request.contextPath}/cop/bbs/selectArticleList.do" method="post" onSubmit="fn_egov_search_article(); return false;" enctype="multipart/form-data">
	<h1><img src="/images/bl/bl_circle.gif" class="img_margin1"> ${boardMasterVO.bbsNm} <spring:message code="title.list" /></h1>
	<!-- 하단 버튼 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li>
				<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
					<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comCopBbs.articleVO.list.nttSj" /></option><!-- 글 제목  -->
					<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comCopBbs.articleVO.list.nttCn" /></option><!-- 글 내용 -->
					<option value="2"  <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> ><spring:message code="table.reger" /></option><!-- 작성자 -->
				</select>
			</li>
			<!-- 검색키워드 및 조회버튼 -->
			<li>
				<input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
				<input type="button" class="s_btn" onClick="fn_egov_search_article(); return false;" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
				<c:if test="${boardMasterVO.bbsId=='BBSMSTR_000000000001' || sessionUserSe == 'USR'}">
				<input type="button" class="s_btn" onClick="fnAddArticle('${boardMasterVO.bbsId}'); return false;" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
				</c:if>
			</li>
		</ul>
	</div>
	<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	</form:form>
	
	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<c:choose>
		<c:when test="${boardMasterVO.bbsId =='BBSMSTR_000000000001'}">
			<colgroup>
				<col style="width: 4%;">
				<col style="width: 42%;">
				<col style="width: 8%;">
				<col style="width: 16%;">
				<col style="width: 6%;">
				<col style="width: 5%;">
				<col style="width: 6%;">
				<col style="width: 6%;">
				<col style="width: 7%;">
			</colgroup>
		</c:when>
		<c:otherwise>
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 44%;">
				<col style="width: 23%;">
				<col style="width: 23%;">
				<col style="width: 20%;">
			</colgroup>
		</c:otherwise>
	</c:choose>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 -->
		<th class="board_th_link"><spring:message code="comCopBbs.articleVO.list.nttSj" /></th><!--글 제목  -->
		<th><spring:message code="table.reger" /></th><!-- 작성자명 -->
		<c:if test="${boardMasterVO.bbsId =='BBSMSTR_000000000001'}">
		<th>직급 /소속</th>
		</c:if>
		<th><spring:message code="table.regdate" /></th><!-- 작성시각 -->
		<th><spring:message code="comCopBbs.articleVO.list.inqireCo" /></th><!-- 조회수  -->
		<c:if test="${boardMasterVO.bbsId =='BBSMSTR_000000000001'}">
		<th>평가참여</th>
		<th>추천</th>
		<th>평점<br>(50점기준)</th>
		</c:if>
	</tr>
	</thead>
	<tbody class="ov">
	<!-- 공지사항 본문 -->
	<c:forEach items="${noticeList}" var="noticeInfo" varStatus="status">
	<tr>
		<td><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_notice.png'/>" alt="notice"></td>
		<td class="bold">
			<span class="link">
				<input type="button" onclick="fn_egov_inquire_articledetail('<c:out value="${noticeInfo.bbsId}"/>','<c:out value="${noticeInfo.nttId}"/>');" value="<c:out value='${fn:substring(noticeInfo.nttSj, 0, 40)}'/><c:if test="${noticeInfo.commentCo != ''}">	<c:out value='[${noticeInfo.commentCo}]'/></c:if>" style="border:0px solid #e0e0e0;">
			</span>
		</td>
		<td><c:out value='${noticeInfo.frstRegisterNm}'/></td>
		<c:if test="${boardMasterVO.bbsId =='BBSMSTR_000000000001'}">
		<td>&nbsp;</td>
		</c:if>
		<td><c:out value='${noticeInfo.frstRegisterPnttm}'/></td>
		<c:choose>
			<c:when test="${boardMasterVO.bbsId =='BBSMSTR_000000000001'}">
				<td><c:out value='${noticeInfo.inqireCo}'/></td>
				<td colspan="3">&nbsp;</td>
			</c:when>
			<c:otherwise>
				<td><c:out value='${noticeInfo.inqireCo}'/></td>
			</c:otherwise>
		</c:choose>		
	</tr>
	</c:forEach>
	<!-- 게시글 본문 -->
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr>
		<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		
	<c:choose>
		<c:when test="${resultInfo.sjBoldAt == 'Y'}">
		<!-- 제목 Bold인 경우  -->
		<td class="bold">
		    <span class="link"><c:if test="${resultInfo.replyLc!=0}"><c:forEach begin="0" end="${resultInfo.replyLc}" step="1"> </c:forEach><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_reply.png'/>" alt=""></c:if>&nbsp;<a onclick="fn_egov_inquire_articledetail('<c:out value="${resultInfo.bbsId}"/>','<c:out value="${resultInfo.nttId}"/>');"><c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/><c:if test="${resultInfo.commentCo != ''}"> <span class="pilsu"><c:out value='[${resultInfo.commentCo}]'/></span></c:if></a></span>
		</td>
		</c:when>	
		<c:when test="${resultInfo.secretAt == 'Y' && sessionUniqId != resultInfo.frstRegisterId}">
		<!-- 비밀글이며 작성자가 본인이 아닌 경우(클릭 불가) -->
		<td class="left">
		<c:if test="${resultInfo.replyLc!=0}">
    		<c:forEach begin="0" end="${resultInfo.replyLc}" step="1">
    			&nbsp;
    		</c:forEach>
    	</c:if>
		<img src="<c:url value='/images/egovframework/com/cop/bbs/icon_lock.png'/>" alt="secret">&nbsp;<c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/>
		<c:if test="${resultInfo.commentCo != ''}">
			<c:out value='[${resultInfo.commentCo}]'/>
		</c:if>			
		</td>
		</c:when>
		<c:otherwise>
		<!-- 나머지 경우 -->
		<td class="left">
			<span class="link"><c:if test="${resultInfo.replyLc!=0}"><c:forEach begin="0" end="${resultInfo.replyLc}" step="1"> </c:forEach><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_reply.png'/>" alt=""></c:if>&nbsp;<a onclick="fn_egov_inquire_articledetail('<c:out value="${resultInfo.bbsId}"/>','<c:out value="${resultInfo.nttId}"/>');"><c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/><c:if test="${resultInfo.commentCo != ''}"> <span class="pilsu"><c:out value='[${resultInfo.commentCo}]'/></span></c:if></a></span>
		</td>
		</c:otherwise>
	</c:choose>
		<td><c:out value='${resultInfo.frstRegisterNm}'/></td>
		<c:if test="${boardMasterVO.bbsId =='BBSMSTR_000000000001'}">
		<td>&nbsp;<c:out value='${resultInfo.titleNm}'/>&nbsp;/&nbsp;<c:out value='${resultInfo.deptNmS}'/></td>
		</c:if>
		<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
		<td><c:out value='${resultInfo.inqireCo}'/></td>
		<c:if test="${boardMasterVO.bbsId =='BBSMSTR_000000000001'}">
		<td>
			<c:if test="${resultInfo.replyRegCo != ''}"><span class="boxGreen"><c:out value='참여완료'/></span></c:if>
			<c:if test="${resultInfo.replyRegCo == ''}">
				<c:if test="${deptCode == resultInfo.deptCode}">
				<!-- 같은팀 허용 -->
				</c:if>
				<c:if test="${deptCode != resultInfo.deptCode}">
				<!-- 참여필요 -->
				</c:if>				
				<span class="boxGray"><c:out value='참여필요'/></span>
			</c:if>
		</td>
			<c:choose>
				<c:when test="${resultInfo.commentCo >= 5 || sessionUserSe == 'USR'}">
					<td>		
						<c:if test="${resultInfo.picksCo != ''}">
							<img src="<c:url value='/images/btn/btn_reply_class_1.png'/>" alt="bbs good" class="reply_good"><c:out value='${resultInfo.picksCo}'/>
						</c:if>
					</td>
					<td>
						<c:if test="${resultInfo.scoreA != ''}"><c:out value='${resultInfo.scoreA}'/>/50</c:if>		
					</td>
				</c:when>
				<c:otherwise>
					<td></td>
					<td></td>
				</c:otherwise>
			</c:choose>
		</c:if>
	</tr>
	</c:forEach>

	<c:if test="${fn:length(resultList) == 0}">
	<!-- 글이 없는 경우 -->
	<tr>
	<c:choose>
		<c:when test="${boardMasterVO.bbsId =='BBSMSTR_000000000001'}">
		<td colspan="9"><spring:message code="common.nodata.msg" /></td>			
		</c:when>
		<c:otherwise>
		<td colspan="5"><spring:message code="common.nodata.msg" /></td>
		</c:otherwise>
	</c:choose>

	</tr>
	</c:if>
	</tbody>
	</table>
	
	<!-- paging navigation -->
	<div class="pagination">
		<ul>
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
		</ul>
	</div>
	<input name="nttId" type="hidden" value="0">
	<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
</div>
</body>
</html>