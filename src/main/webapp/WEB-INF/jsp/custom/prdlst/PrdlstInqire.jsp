<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle">품목관리</c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} - 조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javaScript" language="javascript" defer="defer">
function fnLinkPage(pageNo){
    $("input[name='pageIndex']").val(pageNo);
    
	var form = $('#prdlstManageVO');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/custom/prdlst/PrdlstInqire.do",
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
function press() {

    if (event.keyCode==13) {
    	
    }
}

/* ********************************************************
 * 목록화면
 ******************************************************** */
function goList(){
	
	var form = $("#prdlstManageVO");  
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/custom/prdlst/PrdlstInqire.do",
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
 * 상세
 ******************************************************** */
function goRegist(id){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/custom/prdlst/selectPrdlstDetail.do",
		//data: string,
		data:{
			"jhNo": id,
			"selectOnly": $("#selectOnly").val()
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



$(function(){
	
	$("#btn_src").click(function(){
		// 페이징 값 초기화
		$("input[name=pageIndex]").val(1);
		goList();
	});
	
});
</script>

</head>

<body>

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="board">
	<h1>[>]<c:if test="${prdlstManageVO.selectOnly == 'Y'}">  품목 조회</c:if><c:if test="${empty prdlstManageVO.selectOnly || prdlstManageVO.selectOnly == ''}">  품목 조회 및 수정</c:if></h1>
</div>

<form:form commandName="prdlstManageVO" name="prdlstManageVO" action="${pageContext.request.contextPath}/custom/prdlst/PrdlstInqire.do" method="post" onSubmit="return false;" enctype="multipart/form-data">
<div class="search_box">
	<ul>
		<li style="border: 0px solid rgb(210, 210, 210); border-image: none;">
			<input title="조회 버튼" class="s_btn" type="button" value="조회" id="btn_src">
			<!-- <input title="조회(팝업) 버튼" class="s_btn" type="submit" value="조회팝업"> -->
		</li>
	</ul>
</div>	
	<table class="board_list" summary="">
	<caption>품목 조회</caption>
	<colgroup>
		<col style="width: 15%;">
		<col style="width: 20%;">
		<col style="width: 15%;">
		<col style="width: 20%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
	</colgroup>
	<thead>
	<tr>
		<th>품목구분</th> 
		<th class="left_input">
			<input type="radio" name="srcPrdlstCode" value="" checked="checked" />전체
			<form:radiobuttons path="srcPrdlstCode" items="${prdlstCode_result}" itemValue="code" itemLabel="codeNm"  />
		</th>
		<th>품번</th>
		<th class="left_input">
			<input class="s_input" name="srcPrdlstNo" type="text" size="25" title="" value="<c:out value="${prdlstManageVO.srcPrdlstNo}"/>" maxlength="20" >&nbsp;
		</th>
		<th>사용구분</th>
		<th class="left_input">
			<form:select path="srcUseSe" id="srcUseSe" title="사용구분">
				<form:option value="" label="전체"/>
				<form:options items="${useYnCode_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>
		</th>
	</tr>
	<tr>
		<th>Maker</th>
		<th class="left_input">
			<form:select path="srcMaker" id="srcMaker" title="Maker">
				<form:option value="" label="전체"/>
				<form:options items="${makerCode_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>		
		</th>
		<th>Model</th>
		<th class="left_input"><input class="s_input" name="srcModel" type="text" size="25" title="" value="<c:out value="${prdlstManageVO.srcModel}"/>" maxlength="20" ></th>
		<th>Part</th>
		<th class="left_input">
			<form:select path="srcPart" id="srcPart" title="Part">
				<form:option value="" label="전체"/>
				<form:options items="${partCode_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>
		</th>		
	</tr>
	</thead>
	<tbody class="ov">

	</tbody>
	</table>
		
	
<div class="board" style="padding-top:20px;">
	<h1>조회 리스트</h1>
</div>	
	
<table class="board_list" summary="">
	<caption>조회 리스트</caption>
	<colgroup>
		<col style="width: 4%;">
		<col style="width: 5%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 22%;">
		<col style="width: 5%;">
		<col style="width: 9%;">
		<col style="width: 9%;">
		<col style="width: 6%;">		
	</colgroup>
	<thead>
		<tr style="height:33px;">
			<th>순번</th>		
			<th>JH No</th>
			<th>번호 구분</th>
			<th>SUB 품번</th>
			<th>품목</th>
			<th>Maker</th>
			<th>Model</th>
			<th>Part</th>
			<th>제조원가(유심)</th>
			<th>제조원가(무심)</th>
			<th>사용여부</th>
		</tr>
	</thead>
	<tbody class="ov">
		<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
		<tr>
			<td><c:out value="${(prdlstManageVO.pageIndex-1) * prdlstManageVO.pageSize + status.count}"/></td>
			<td><a href="javascript:;" onclick="javascript:goRegist('<c:out value="${resultInfo.jhNo}"/>'); return false;"><font style="color:cadetblue;"><c:out value="${resultInfo.jhNo}"/></font></a></td>
			<td><c:out value="${resultInfo.subNoSe}"/></td>
			<td><c:out value="${resultInfo.subNo}"/></td>
			<td><c:out value="${resultInfo.prdlstCode}"/></td>
			<td><c:out value="${resultInfo.maker}"/></td>
			<td><c:out value="${resultInfo.model}"/></td>
			<td><c:out value="${resultInfo.part}"/></td>
			<td><c:out value="${resultInfo.mnfcturPrmpcShim}"/></td>
			<td><c:out value="${resultInfo.mnfcturPrmpc}"/></td>
			<td><c:out value="${resultInfo.useSe}"/></td>		
		</tr>
		</c:forEach>	
	
	</tbody>
</table>
	
	<!-- paging navigation -->
	<div class="pagination">
		<ul><ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/></ul>
	</div>

	<input name="pageIndex" type="hidden" value="<c:out value='${prdlstManageVO.pageIndex}'/>"/>
	<input name="selectOnly" id="selectOnly" type="hidden" value="<c:out value='${prdlstManageVO.selectOnly}'/>"/>		
</form:form>



</body>
</html>
