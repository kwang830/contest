<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="pageTitle"><spring:message code="comUssUmt.userManage.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javaScript" language="javascript" defer="defer">

/* ********************************************************
 * 목록조회
 ******************************************************** */
function fnSrcUser(){
	$("input[name=pageIndex]").val(1);
	
	var form = $('#form1');   
	var string = form.serialize();	
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/umt/EgovMberManage.do",
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
function fnDeleteUser() {
    var checkField = document.form1.checkField;
    var id = document.form1.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
        if(confirm("<spring:message code="common.delete.msg" />")){
        	//$("input[name='checkedIdForDel']").val(checkedIds); 
        	
    		$.ajax({
    			type:"POST",
    			url:"<c:url value='/uss/umt/EgovMberDelete.do' />",
    			data:{
    				"checkedIdForDel": checkedIds			
    			},
    			dataType:'json',
    			timeout:(1000*30),
    			success:function(returnData, status){
    				if(status == "success") {
    					if( returnData.resultMsg== "success.common.delete"){
    						alert('삭제되었습니다.');
    						fnSrcUser();
    					}else if( returnData.resultMsg== "fail.common.delete"){
    						alert('삭제 중 오류가 발생하였습니다.');
    					}
    				}else{ alert("ERROR!");return;} 
    			}
    		});        	
        	
        }
    }
}
function fnAddUserView() {
	var form = $('#form1');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/umt/EgovMberInsertView.do",
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
function fnSelectUser(id) {
    array = id.split(":");
    if(array[0] == "") {
    } else {
        userTy = array[0];
        userId = array[1];
    }

	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/umt/EgovMberSelectUpdtView.do",
		data: {
			"selectedId": userId			
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
function fnLinkPage(pageNo){
    $("input[name='pageIndex']").val(pageNo);
    
	var form = $('#form1');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/uss/umt/EgovMberManage.do",
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
$(function(){
	//alert('jQuery chk');
	
	$("#checkAll").click(function(){
		if($("#checkAll").prop('checked')){
			$("input[name='checkField']:checkbox").each(function(){
				$(this).prop('checked',true);
			});
		}else{
			$("input[name='checkField']:checkbox").each(function(){
				$(this).prop('checked',false);
			});			
		}
	});	
});
</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
<%-- <c:set var="resultMsg">test-msg</c:set> --%>
<c:if test="${!empty resultMsg}">
<script type="text/javaScript">
alert("<spring:message code="${resultMsg}" />");
</script>
</c:if>

<form:form id="form1" commandName="userSearchVO" name="userSearchVO" action="${pageContext.request.contextPath}/uss/umt/EgovUserManage.do" method="post" onSubmit="return false;" enctype="multipart/form-data">
<%-- <form name="listForm" action="<c:url value='/uss/umt/EgovUserManage.do'/>" method="post"> --%> 
<div class="board">
	<h1>[>] ${pageTitle} <spring:message code="title.list" /></h1>
	
	<!-- 검색영역 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li><!-- 상태-->
				<form:select path="sbscrbSttus" id="sbscrbSttus" title="사용구분">
					<form:option value="0" label="상태(전체)"/>
					<form:options items="${emplyrSttusCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</li>
			<li><!-- 조건 -->
				<form:select path="searchCondition" id="searchCondition" title="검색구분">
					<form:options items="${searchKeyword_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</li>
			<!-- 검색키워드 및 조회버튼 -->
			<li>
				<input class="s_input" name="searchKeyword" type="text"  size="35" title="" value='<c:out value="${userSearchVO.searchKeyword}"/>'  maxlength="255" >
				<input type="button" class="s_btn" onClick="fnSrcUser(); return false;"  value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
				<input type="button" class="s_btn" onClick="fnDeleteUser(); return false;" value="<spring:message code="title.delete" />" title="<spring:message code="title.delete" /> <spring:message code="input.button" />" />
				<input type="button" class="s_btn" onClick="fnAddUserView(); return false;" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
			</li>
		</ul>
	</div>


<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 5%;">
		<col style="width: 3%;">		
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 20%;">
		<col style="width: 13%;">
		<col style="width: 10%;">
		<col style="width: ;">
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 -->
		<th><input type="checkbox" name="checkAll" id="checkAll" class="check2" title="<spring:message code="input.selectAll.title" />"></th><!-- 전체선택 -->		
		<th class="board_th_link"><spring:message code="comUssUmt.userManageList.id" /></th><!--아이디 -->
		<th><spring:message code="comUssUmt.userManageList.name" /></th><!-- 사용자이름 -->
		<th><spring:message code="comUssUmt.userManageList.email" /></th><!-- 사용자이메일 -->
		<th><spring:message code="comUssUmt.userManageList.phone" /></th><!-- 전화번호 -->
		<th><spring:message code="table.regdate" /></th><!-- 등록일 -->
		<th><spring:message code="comUssUmt.userManageList.sbscrbSttus" /></th><!-- 가입상태 -->

	</tr>
	</thead>
	<tbody class="ov">
	<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td colspan="8"><spring:message code="common.nodata.msg" /></td>
	</tr>
	</c:if>
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr>
	    <td><c:out value="${(userSearchVO.pageIndex-1) * userSearchVO.pageSize + status.count}"/></td>
	    <td>
	        <input name="checkField" title="checkField <c:out value="${status.count}"/>" type="checkbox"/>
	        <input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>"/>
	    </td>
	    <td><a href="javascript:;" onclick="javascript:fnSelectUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;"><c:out value="${result.userId}"/></a></td>
	    <td><c:out value="${result.userNm}"/></td>
	    <td><c:out value="${result.emailAdres}"/></td>
	    <td><c:out value="${result.areaNo}"/>)<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/></td>
	    <td><c:out value="${fn:substring(result.sbscrbDe,0,10)}"/></td>
	    <td>
	        <c:forEach var="emplyrSttusCode_result" items="${emplyrSttusCode_result}" varStatus="status">
	            <c:if test="${result.sttus == emplyrSttusCode_result.code}"><c:out value="${emplyrSttusCode_result.codeNm}"/></c:if>
	        </c:forEach>
	    </td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<!-- paging navigation -->
	<div class="pagination">
		<ul><ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/></ul>
	</div>

<input name="selectedId" type="hidden" />
<input name="checkedIdForDel" type="hidden" />
<input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
</div>
</form:form>

</body>
</html>
