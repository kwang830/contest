<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle">견적서관리</c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} - 거래처별 조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<script src="<c:url value='/js/custom/jquery.number.js' />"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/modal.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/modal.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">

function fnLinkPage(pageNo){
	$("input[name='pageIndex']").val(pageNo);
 	var form = $('#estmtManageVO');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/custom/estmt/EstmtBcncInqire.do",
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
 * 모달셋팅
 ******************************************************** */
function fn_modal_setting(){

	//버튼에 모달 연결
	$("#btnBcncSrc").egovModal( "egovModal" );
	
	//타이틀 설졍
	$("#egovModal").setEgovModalTitle("거래처 조회");
	
	var contentAddTable = "";
	contentAddTable += "<table class='board_list' id='bcncTableList'>";
	contentAddTable += "<caption>거래처 검색 정보</caption>";
	contentAddTable += "<colgroup>";
	contentAddTable += "<col style='width: 10%;'>";
	contentAddTable += "<col style='width: 40%;'>";
	contentAddTable += "<col style='width: 30%;'>";
	contentAddTable += "<col style='width: 20%;'>";
	contentAddTable += "</colgroup>";
	contentAddTable += "<thead>";
	contentAddTable += "<tr style='height:33px;'>";
	contentAddTable += "<th>순번</th>";
	contentAddTable += "<th>거래처명</th>";
	contentAddTable += "<th>담당자명</th>";
	contentAddTable += "<th>선택</th>";
	contentAddTable += "</tr>";
	contentAddTable += "</thead>";
	contentAddTable += "<tbody class='ov'>";
	contentAddTable += "</tbody>";
	contentAddTable += "</table>";	
	
	var content = "";
	content += "<div class='modal-alignL' style='margin:5px 0 0 0'>"+"거래처 명 :"+"</div>"; //사용할아이디
	content += "<div class='modal-alignL'>"+"<input type='text' class='se_input' id='checkIdModal' name='checkIdModal' value='' size='20' maxlength='20' />"+"<span class='btn_style1 blue' id='btnModalSelect' onclick='fn_bcnc_check()'><a href='#'>조회</a></span></div>";	
	content += "<div style='clear:both;'></div>";
	content += "<div id='divModalResult' style='margin:10px 0 0 0'>"+""+"</div>";
	content += "<div id='divModalResult2' style='margin:10px 0 0 0'>"+contentAddTable+"</div>";
	
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
/*********************************************************
 * 거래처 조회 AJAX
 ******************************************************** */
function fn_bcnc_check(){ 
	$.ajax({
		type:"POST",
		url:"<c:url value='/custom/estmt/selectBcncListAjax.do' />",
		data:{
			"checkId": $("#checkIdModal").val()			
		},
		dataType:'json',
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				//alert("returnData.resultCnt:"+returnData.resultCnt);
				if(returnData.resultCnt > 0 ){
					$("#divModalResult").hide();
					var obj = returnData.resultList;
					fn_bcnc_table_list_set(obj);
					$("#divModalResult").hide();
				}else{
					//사용할수 없는 아이디입니다.
					$("#divModalResult").html("<font color='red'> 조회 결과가 없습니다. : ["+returnData.checkId+"]</font>"); // 수정
					$("#divModalResult").show();
					$("#bcncTableList").hide();
				}
			}else{ alert("ERROR!");return;} 
		}
	});
}
function fn_bcnc_table_list_set(data){
	var row = "";
	for(var i=0; i<data.length; i++){
		var obj = data[i];
		row += "<tr style='height:33px;'>";
		row += "<th>"+(i+1)+"</th>";
		row += "<th>"+obj.cmpnyNm+"</th>";
		row += "<th>"+obj.userNm+"</th>";
		row += "<th><span class='btn_style1 blue' id='btnChoice' onclick=\"fn_bcnc_table_list_choice('"+obj.uniqId+"','"+obj.cmpnyNm+"','"+obj.userNm+"','"+obj.emailAdres+"','"+obj.areaNo+"','"+obj.middleTelno+"','"+obj.endTelno+"','"+obj.adres+"')\"><a href='#'>선택</a></span></th>";
		row += "</tr>";		
		//break;
	}	
	$("#bcncTableList tbody").html(row);
	$("#divModalResult").show();
	$("#bcncTableList").show();
}
function fn_bcnc_table_list_choice(uniqId,cmpnyNm,userNm,emailAdres,areaNo,middleTelno,endTelno,adres){
	$("input[name='searchBcncNm']").val(cmpnyNm);
	$("input[name='searchBcncCode']").val(uniqId);
	$("#egovModal").setEgovModalClose();	
}
function fn_estmtSrc(){
	$("input[name='pageIndex']").val(1);	
 	var form = $('#estmtManageVO');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/custom/estmt/EstmtBcncInqire.do",
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
function fn_goDetail(manageNo){
	$("input[name='manageNo']").val(manageNo);
 	var form = $('#estmtManageVO');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/custom/estmt/EstmtDetail.do",
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
	
	//모달 셋팅
	fn_modal_setting();
	// 모달 사이즈 수정
	$("#btnBcncSrc").click(function(){
		$(".modal-content").css("width","400px");
		$(".modal-footer #footer").css("float","none");
		$(".modal-footer #footer").css("width","100%");
	});	
	
	$("#ui-datepicker-div").remove();	
	$("#searchFromDe").datepicker(   
	        {dateFormat:'yy-mm-dd' 
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'   
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});
	$("#searchToDe").datepicker(   
	        {dateFormat:'yy-mm-dd' 
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'   
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});		
	
	$("#btnEstmtSelect").click(function(){
		fn_estmtSrc();
	});
});
</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
<form:form commandName="estmtManageVO" name="estmtManageVO" action="${pageContext.request.contextPath}/custom/estmt/EstmtBcncInqire.do" method="post" onSubmit="fn_goSubmit(); return false;" enctype="multipart/form-data">
<div class="board">
	<h1>[>] 거래처별 조회</h1>
</div>

<div class="search_box">
	<ul>
		<li style="border: 0px solid rgb(210, 210, 210); border-image: none;">
		</li>
	</ul>
</div>	
	<table class="board_list" summary="">
	<caption>품목 조회</caption>
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 25%;">
		<col style="width: 10%;">
		<col style="width: 15%;">
		<col style="width: 10%;">
		<col style="width: 20%;">
		<col style="width: 10%;">
	</colgroup>
	<thead>
	<tr style="height:33px;">
		<th class="right_input">거래처명</th> 
		<th class="left_input">
			<input class="s_input" name="searchBcncNm" type="text" size="25" title="" value="<c:out value="${estmtManageVO.searchBcncNm}"/>" maxlength="20" readonly="readonly">
			<input type="hidden" name="searchBcncCode" value="<c:out value="${estmtManageVO.searchBcncCode}"/>">
			<input title="조회 버튼" class="btn_s" type="button" name="btnBcncSrc" id="btnBcncSrc" value="선택">
		</th>
		<th class="right_input">
			<select name="cmbCharger" id="cmbCharger">
				<option value="bcnc" <c:if test="${estmtManageVO.cmbCharger == 'bcnc'}"> selected="selected"</c:if>>거래처담당자</option>
				<option value="job" <c:if test="${estmtManageVO.cmbCharger == 'job'}"> selected="selected"</c:if>>업무담당자</option>
			</select>
		</th>
		<th class="left_input" colspan="3">
			<input class="s_input" name="searchCharger" type="text" size="25" title="" value="<c:out value="${estmtManageVO.searchCharger}"/>" maxlength="20" >&nbsp;
		</th>
		<th rowspan="2">
			<span class='btn_style1 blue' id='btnEstmtSelect'><a href='#'>조회</a></span>
		</th>
	</tr>
	<tr style="height:33px;">
		<th class="right_input">
			<select name="cmbDe" id="cmbDe">
				<option value="regist" <c:if test="${estmtManageVO.cmbDe == 'regist'}"> selected="selected"</c:if>>등록일자</option>
				<option value="cntrct" <c:if test="${estmtManageVO.cmbDe == 'cntrct'}"> selected="selected"</c:if>>계약일자</option>
			</select>		
		</th> 
		<th class="left_input">
			<input class="s_input" name="searchFromDe" id="searchFromDe" type="text" size="25" title="" value="<c:out value="${estmtManageVO.searchFromDe}"/>" maxlength="20" style="width:75px;">~<input class="s_input" name="searchToDe" id="searchToDe" type="text" size="25" title="" value="<c:out value="${estmtManageVO.searchToDe}"/>" maxlength="20" style="width:75px;">
		</th>
		<th class="right_input">
			<select name="cmbNo" id="cmbNo">
				<option value="doc" <c:if test="${estmtManageVO.cmbNo == 'doc'}"> selected="selected"</c:if>>문서번호</option>
				<option value="manage" <c:if test="${estmtManageVO.cmbNo == 'manage'}"> selected="selected"</c:if>>관리번호</option>
			</select>		
		</th>
		<th class="left_input">
			<input class="s_input" name="searchNo" type="text" size="25" title="" value="<c:out value="${estmtManageVO.searchNo}"/>" maxlength="20" >&nbsp;		
		</th>
		<th class="right_input">진행상태</th>
		<th class="left_input">
			<form:select path="progrsSttus" id="progrsSttus" title="진행상태">
				<form:option value="" label="--전체--"/>
				<form:options items="${progrsSttus_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>
		</th>
	</tr>
	</thead>
	<tbody class="ov">
	</tbody>
	</table>

<div class="board" style="padding-top:20px;">
	<h1>견적 리스트</h1>
</div>	

	<table class="board_list" summary="">
	<caption>견적 리스트</caption>
	<colgroup>
		<col style="width: 3%;">
		<col style="width: 14%;">
		<col style="width: 9%;">
		<col style="width: 8%;">
		<col style="width: 8%;">
		<col style="width: 8%;">
		<col style="width: 20%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 7%;">
		<col style="width: 8%;">		
	</colgroup>
	<thead>
	<tr style="height:33px;">
		<th>순번</th>
		<th>거래처명</th>
		<th>거래처담당자</th>
		<th>업무담당자</th>
		<th>등록일자</th>
		<th>계약일자</th>
		<th>문서제목</th>
		<th>문서번호</th>				
		<th>관리번호</th>
		<th>진행상태</th>
		<th>견적금액</th>
	</tr>
	</thead>
	<tbody class="ov">
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr style="height:33px;">
		<td><c:out value="${(estmtManageVO.pageIndex-1) * estmtManageVO.pageSize + status.count}"/></td>
		<td><c:out value="${resultInfo.bcncNm}"/></td>
		<td><c:out value="${resultInfo.bcncCharger}"/></td>
		<td><c:out value="${resultInfo.jobCharger}"/></td>
		<td><c:out value="${resultInfo.registDe}"/></td>
		<td><c:out value="${resultInfo.cntrctDe}"/></td>
		<td title="<c:out value="${resultInfo.docSj}"/>"><c:if test="${fn:length(resultInfo.docSj) > 25}"><c:out value="${fn:substring(resultInfo.docSj,0,25) }"/>...</c:if><c:if test="${fn:length(resultInfo.docSj) < 26}"><c:out value="${resultInfo.docSj}"/></c:if></td>
		<td><c:out value="${resultInfo.docNo}"/></td>				
		<td>
		<a href="javascript:;" onclick="javascript:fn_goDetail('<c:out value="${resultInfo.manageNo}"/>'); return false;"><font style="color:cadetblue;"><c:out value="${resultInfo.manageNo}"/></font></a>
		</td>
		<td><c:out value="${resultInfo.progrsSttus}"/></td>
		<td class="right_input"><c:out value="${resultInfo.totamount}"/></td>
	</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	<tr style="height:33px;">
	<th colspan="11" class="right_input">총: <c:out value="${resultCnt}"/>건</th>
	</tr>
	</tfoot>
	</table>
	
	<!-- paging navigation -->
	<div class="pagination">
		<ul><ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/></ul>
	</div>

	<input name="pageIndex" type="hidden" value="<c:out value='${estmtManageVO.pageIndex}'/>"/>
	<input name="manageNo" type="hidden" value=""/>	
	
</form:form>

<c:import url="/EgovModal.do" charEncoding="utf-8">
	<c:param name="scriptYn" value="N" />
	<c:param name="modalName" value="egovModal" />
</c:import>

</body>
</html>
