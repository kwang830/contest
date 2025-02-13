<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="pageTitle">품목관리</c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} - 품목코드 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javaScript" language="javascript" defer="defer">
function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/umt/dpt/selectDeptManageList.do'/>";
    document.listForm.submit();
}
function press() {

    if (event.keyCode==13) {
    	fncSelectDeptManageList('1');
    }
}
/* ********************************************************
 * 조회
 ******************************************************** */
function fnSrc(){
	$("input[name='pageIndex']").val(1);
	$("input[name='dmlType']").val("select");
	
	var form = $('#prdlstManageVO');   
	var string = form.serialize();

	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/custom/prdlst/PrdlstCodeRegist.do",
		data:string,
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
function fnSave(){
	$("input[name='pageIndex']").val(1);
	$("input[name='dmlType']").val("update");
	
	var form = $('#prdlstManageVO');   
	var string = form.serialize();

	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/custom/prdlst/PrdlstCodeRegist.do",
		data:string,
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
	$("#sub_chk_all").click(function(){
		if($("#sub_chk_all").prop('checked')){
			$("input[name='sub_chk']:checkbox").each(function(){
				$(this).prop('checked',true);
			});
		}else{
			$("input[name='sub_chk']:checkbox").each(function(){
				$(this).prop('checked',false);
			});			
		}
	});
	
	$("#btn_sub_del").click(function(){
		if ($("input[name='sub_chk']").is(":checked")){ 
	    	if (confirm("삭제 하시겠습니까?")) { 
	    		var chkDelAll = $("input[name='chkDelAll']").val();
	    	﻿	for(var i=$("[name='sub_chk']:checked").length-1; i>-1; i--){
	    			var chkDel = $("[name='sub_chk']:checked").eq(i).closest("tr").find("input[name='subSn']").val();
	    			chkDelAll = (chkDelAll==""? chkDel : chkDelAll+","+chkDel);
	    	﻿    	$("[name='sub_chk']:checked").eq(i).closest("tr").remove();
	    	    }﻿
	    	    $("input[name='chkDelAll']").val(chkDelAll);
	    	}﻿ 
	    } else { 
	    	alert("선택된 데이터가 없습니다.");   
	    }﻿ 
	});
	
$("#btn_sub_add").click(function(){
		
		// 사용구분
		var list_code = [];
		var list_codeNm = [];
		<c:forEach items="${useYnCode_result}" var="item">
		list_code.push("${item.code}");
		list_codeNm.push("${item.codeNm}");
		</c:forEach>		
		var comboUseYn = "<select name='useAt'>";
		//comboMaker += "<option value=''>--선택--</option>";
		for(var i=0;list_code.length>i;i++){
			comboUseYn += "<option value='"+list_code[i]+"'>"+list_codeNm[i]+"</option>";
		}
		comboUseYn += "</select>";		
		
		var row = "<tr>";
		row += "<th><input type='hidden' name='subSn' value='N'>-</th>";
		row += "<th><input class='s_input' name='codeId' type='text' size='25' value='${prdlstManageVO.searchCondition}' maxlength='20' style='width:100px;' readonly='readonly'></th>";
		row += "<th><input class='s_input' name='code' type='text' size='25' value='' maxlength='20' ></th>";
		row += "<th><input class='s_input' name='codeNm' type='text' size='25' value='' maxlength='20' ></th>";
		row += "<th><input class='s_input' name='codeDc' type='text' size='25' value='' maxlength='20' ></th>";
		row += "<th><input class='s_input' name='orderBy' type='text' size='25' value='' maxlength='20' ></th>";
		row += "<th>"+comboUseYn+"</th>";
		row += "<th><input type='checkbox' name='sub_chk'></th>";	
		row += "</tr>";		
		$("#sub_list").append(row);
	});
});
</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
<c:if test="${!empty resultMsg}">
<script type="text/javaScript">
alert("<spring:message code="${resultMsg}" />");
</script>
</c:if>
<form:form commandName="prdlstManageVO" name="prdlstManageVO" action="${pageContext.request.contextPath}/custom/prdlst/PrdlstCodeRegist.do" method="post" onSubmit="fnSrc(); return false;">
<div class="board">
	<h1>[>] 품목코드 조회 및 수정</h1>
</div>
<table class="board_list" summary="">
	<caption>품목코드 등록</caption>
	<colgroup>
		<col style="width: 20%; height: 20px;">
		<col style="width: 80%;">
	</colgroup>
	<thead>
	<tr style="height:33px;">
		<th>코드구분</th> 
		<th>
			<input type="radio" name="searchCondition" value="JHB004" <c:if test="${prdlstManageVO.searchCondition == 'JHB004'}">checked="checked"</c:if>/>&nbsp;품목구분&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="searchCondition" value="JHB002" <c:if test="${prdlstManageVO.searchCondition == 'JHB002'}">checked="checked"</c:if>/>&nbsp;Maker&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="searchCondition" value="JHB001" <c:if test="${prdlstManageVO.searchCondition == 'JHB001'}">checked="checked"</c:if>/>&nbsp;Part&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="searchCondition" value="JHB003" <c:if test="${prdlstManageVO.searchCondition == 'JHB003'}">checked="checked"</c:if>/>&nbsp;번호 구분&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn_s" onClick="fnSrc(); return false;" value="<spring:message code="button.inquire" />" title="<spring:message code="button.inquire" /> <spring:message code="input.button" />" />
		</th>		
	</tr>
	</thead>
	<tbody class="ov">

	</tbody>
</table>
	
	<input type="hidden" name="subSn" value="X">
	<input type="hidden" name="codeId" value="${prdlstManageVO.searchCondition}">
	<input type="hidden" name="code" value="">
	<input type="hidden" name="codeNm" value="">
	<input type="hidden" name="codeDc" value="">
	<input type="hidden" name="orderBy" value="">
	<input type="hidden" name="useAt" value="">
	<input type="hidden" name="chkDelAll" value="">	
<div class="board" style="padding-top:20px;">
	<h1>조회 리스트</h1>
</div>	
<div class="search_box">
	<ul>
		<li style="border: 0px solid rgb(210, 210, 210); border-image: none;">			
			<input type="button" class="s_btn" id="btn_sub_add" value="추가" title="추가 버튼" />
			<input type="button" class="s_btn" id="btn_sub_del" value="선택삭제" title="선택삭제 버튼" />
			<input type="button" class="s_btn" onClick="fnSave(); return false;" value="저장" title="저장 버튼" />
		</li>
	</ul>
</div>
<table class="board_list" summary="" id="sub_list">
	<caption>기본정보 입력</caption>
	<colgroup>
		<col style="width: 5%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 20%;">
		<col style="width: 15%;">
		<col style="width: 10%;">
		<col style="width: 5%;">		
	</colgroup>
	<thead>
	<tr style="height:33px;">
		<th>순번</th>
		<th>코드그룹</th>
		<th>코드</th>
		<th>코드명</th>
		<th>코드설명</th>
		<th>소팅순번</th>
		<th>사용여부</th>
		<th>전체<input type="checkbox" name="sub_chk_all" id="sub_chk_all"></th>
	</tr>

	</thead>
	<tbody class="ov">
	<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td colspan="7"><spring:message code="common.nodata.msg" /></td>
	</tr>
	</c:if>
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr>
		<th><input type='hidden' name='subSn' value='${resultInfo.code}'><c:out value="${status.count}"/></th>
		<th><input class='s_input' name='codeId' type='text' size='25' value='<c:out value="${resultInfo.codeId}"/>' maxlength='20' readonly="readonly"></th>
		<th><input class='s_input' name='code' type='text' size='25' value='<c:out value="${resultInfo.code}"/>' maxlength='20'></th>
		<th><input class='s_input' name='codeNm' type='text' size='25' value='<c:out value="${resultInfo.codeNm}"/>' maxlength='20'></th>
		<th><input class='s_input' name='codeDc' type='text' size='25' value='<c:out value="${resultInfo.codeDc}"/>' maxlength='20'></th>
		<th><input class='s_input' name='orderBy' type='text' size='25' value='<c:out value="${resultInfo.orderBy}"/>' maxlength='20'></th>
		<th>
			<select name="useAt" id="useAt">
				<c:forEach items="${useYnCode_result}" var="map">
					<option value="${map.code}" ${map.code==resultInfo.useAt?"selected":"" }>${map.codeNm}</option>
				</c:forEach>								
			</select>
		</th>
		<th><input type="checkbox" name="sub_chk" id="sub_chk"></th>		
	</tr>
	</c:forEach>
	</tbody>
</table>

<input name="pageIndex" type="hidden" value="<c:out value='${deptManageVO.pageIndex}'/>">
<input name="dmlType" type="hidden" value="select">
<input name="codeGroup" type="hidden" value="<c:out value='${prdlstManageVO.searchCondition}'/>">

</form:form>
</body>
</html>
