<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle">품목관리</c:set>
<c:set var="urlString" value="/custom/prdlst/PrdlstInqire.do" />
<c:if test="${'Y' == selectOnly}">
<c:set var="urlString" value="/custom/prdlst/PrdlstInqireSelectOnly.do" />
</c:if>
<%-- <c:out value="${urlString}" /> (Outputs true) --%>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} - 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/modal.js' />"></script>
<script src="<c:url value='/js/custom/jquery.form.min.js' />"></script>
<script src="<c:url value='/js/custom/jquery.number.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/modal.css' />">
<script type="text/javaScript" language="javascript" defer="defer">
function press() {

    if (event.keyCode==13) {
    	fncSelectDeptManageList('1');
    }
}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function goSubmit(){
	
	$("#prdlstManageVO").ajaxForm({
		url:"${pageContext.request.contextPath}/custom/prdlst/insertPrdlst.do",
		enctype : "multipart/form-data",
		dataType : "html",
		error: function(m,err){
			alert('m:'+m+' /err:'+err);
		},
		beforeSubmit : function(){
		},
		success : function(returnData, status){
			if(status == "success") {
				$("#bodywrap").html(returnData);
			}else{ alert("ERROR!");return;} 	                
		}
	});
			 
	$("#prdlstManageVO").submit() ;
}
/* ********************************************************
 * 목록화면
 ******************************************************** */
function goList(){
	
	//var form = $('#' + id);   
	//var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}${urlString}",
		data: "", 
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
	$("#btnMbrId").egovModal( "egovModal" );
	
	//타이틀 설졍
	$("#egovModal").setEgovModalTitle("관리번호조회");
	var content = "";
	content = content + "<div class='modal-alignL' style='margin:5px 0 0 0'>"+"사용할 품번 :"+"</div>"; //사용할아이디
	content = content + "<div class='modal-alignL'>"+"<input type='text' class='se_input' id='checkIdModal' name='checkIdModal' value='' size='20' maxlength='20' />"+"</div>";	
	content += "<div style='clear:both;'></div>";
	content += "<div id='divModalResult' style='margin:10px 0 0 0'>영문,숫자만 입력가능합니다. 입력 후 조회버튼을 누르세요.</div>"; //결과 : 중복확인을 실행하십시오.
	//모달 body 설정
	$("#egovModal").setEgovModalBody(content);
	$(".modal-content").css("width","400px");

	var footer = "";
	footer += "<span class='btn_style1 blue' id='btnModalSelect' onclick='fn_id_check()'><a href='#'>조회</a></span>&nbsp;";
	footer += "<span class='btn_style1 blue' id='btnModalOk' onclick='fn_id_checkOk()'><a href='#'>확인</a></span>&nbsp;";
	
	//모달 footer 설정
	$("#egovModal").setEgovModalfooter(footer);
	$(".modal-footer #footer").css("float","none");
	$(".modal-footer #footer").css("width","100%");
	//modal-footer
	
	//엔터이벤트처리
	$("input[name=checkIdModal]").keydown(function (key) {
		if(key.keyCode == 13){
			fn_id_check();	
		}
	});
	
	footer = null;
	content = null;
}

/*********************************************************
 * 관리번호 체크 AJAX
 ******************************************************** */
function fn_id_check(){	
	$.ajax({
		type:"POST",
		url:"<c:url value='/custom/prdlst/checkKeyCnfirmAjax.do' />",
		data:{
			"checkId": $("#checkIdModal").val()			
		},
		dataType:'json',
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				if(returnData.usedCnt > 0 ){
					//사용할수 없는 아이디입니다.
					$("#divModalResult").html("<font color='red'> 이미 등록된 품번입니다. : ["+returnData.checkId+"]</font>");
				}else{
					//사용가능한 아이디입니다.
					$("#divModalResult").html("<font color='blue'> 사용할 수 있는 품번입니다 : ["+returnData.checkId+"]</font>");
				}
			}else{ alert("ERROR!");return;} 
		}
	});
}

/*********************************************************
 * 아이디 체크 확인
 ******************************************************** */
function fn_id_checkOk(){
	$.ajax({
		type:"POST",
		url:"<c:url value='/custom/prdlst/checkKeyCnfirmAjax.do' />",
		data:{
			"checkId": $("#checkIdModal").val()			
		},
		dataType:'json',
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				if(returnData.usedCnt > 0 ){
					alert("사용할 수 없는 번호입니다 ");
					return;
				}else{
					
					$("input[name=jhNo]").val(returnData.checkId);
					$("#egovModal").setEgovModalClose();
				}
			}else{ alert("ERROR!");return;} 
		}
	});
}

	
$(function(){
	
	//모달 셋팅
	fn_modal_setting();	
	
	//------------------------------------------
	//------------------------- 첨부파일 등록 Start
	//-------------------------------------------
	var maxFileNum = document.getElementById('posblAtchFileNumber').value;
	if(maxFileNum==null || maxFileNum==""){ maxFileNum = 3;}
	var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum, 'file_label' );
	multi_selector.addElement( document.getElementById( 'egovfile_1' ) );
	//fn_egov_multi_selector_update_setting(multi_selector);
	//------------------------- 첨부파일 등록 End	
	
	$("#btn_submit").click(function(){
		// 등록시 필수 체크
		if($("input[name='jhNo']").val()==""){
			alert('관리번호를 입력하세요.');
			$("input[name='jhNo']").focus();
			return false;
		}
		
		goSubmit();
	});
	
	$("#btn_list").click(function(){
		goList();
	});
		
	
	var msg = '${message}';
	if(msg != ''){
		alert(msg);
	}
	
	$("#btn_sub_add").click(function(){
		
		// subMaker
		var list_code = [];
		var list_codeNm = [];
		<c:forEach items="${makerCode_result}" var="item">
		list_code.push("${item.code}");
		list_codeNm.push("${item.codeNm}");
		</c:forEach>		
		var comboMaker = "<select name='subMaker'>";
		comboMaker += "<option value=''>--선택--</option>";
		for(var i=0;list_code.length>i;i++){
			comboMaker += "<option value='"+list_code[i]+"'>"+list_codeNm[i]+"</option>";
		}
		comboMaker += "</select>";
		
		// subNoSeCode
		list_code = [];
		list_codeNm = [];
		<c:forEach items="${subNoSeCode_result}" var="item">
		list_code.push("${item.code}");
		list_codeNm.push("${item.codeNm}");
		</c:forEach>		
		var comboSubNoSe = "<select name='subNoSe'>";
		comboSubNoSe += "<option value=''>--선택--</option>";		
		for(var i=0;list_code.length>i;i++){
			comboSubNoSe += "<option value='"+list_code[i]+"'>"+list_codeNm[i]+"</option>";
		}
		comboSubNoSe += "</select>";		
		
		// subPart
		list_code = [];
		list_codeNm = [];
		<c:forEach items="${partCode_result}" var="item">
		list_code.push("${item.code}");
		list_codeNm.push("${item.codeNm}");
		</c:forEach>		
		var comboPart = "<select name='subPart'>";
		comboPart += "<option value=''>--선택--</option>";
		for(var i=0;list_code.length>i;i++){
			comboPart += "<option value='"+list_code[i]+"'>"+list_codeNm[i]+"</option>";
		}
		comboPart += "</select>";
		
		var row = "<tr>";
		row += "<th><input type='hidden' name='subSn' value='N'>-</th>";
		row += "<th style='display:none;'>"+comboMaker+"</th>";
		row += "<th style='display:none;'><input class='s_input' name='subModel' type='text' size='25' value='' maxlength='20' style='width:100px;'></th>";
		row += "<th style='display:none;'>"+comboPart+"</th>";
		row += "<th><input class='s_input' name='subYear' type='text' size='25' value='' maxlength='20' style='width:50px;'></th>";
		row += "<th><input class='s_input' name='subApplication' type='text' size='25' value='' maxlength='20' style='width:150px;'></th>";
		row += "<th>"+comboSubNoSe+"</th>";
		row += "<th><input class='s_input' name='subNo' type='text' size='25' value='' maxlength='20' ></th>";
		row += "<th><input type='checkbox' name='sub_chk'></th>";	
		row += "</tr>";		
		$("#sub_list").append(row);
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

	$("#mnfcturPrmpcShim").val(function(){
		return 	$.number($(this).val());
	});
	$("#mnfcturPrmpc").val(function(){
		return 	$.number($(this).val());
	});
	$(document).on("keyup", "input:text[name='mnfcturPrmpcShim']", function() {
		$(this).number(true);
	});
	$(document).on("keyup", "input:text[name='mnfcturPrmpc']", function() {
		$(this).number(true);
	});
	$(document).on("keyup", "input:text[name='jhNo']", function() {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,'').toUpperCase());
		}		
	});
	$(document).on("keyup", "input:text[name='checkIdModal']", function() {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,'').toUpperCase());
		}		
	});	

});	

</script>

</head>

<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="board">
	<h1>[>]<c:if test="${selectOnly == 'Y'}"> 품목 등록 정보 조회</c:if><c:if test="${empty selectOnly || selectOnly == ''}"> 품목 등록 및 수정</c:if></h1>
</div>
<br><br>		
<c:set var="isvisible" value="${ 'Y' == selectOnly}" />
<c:set var="isvisibleString" value="" />
<c:if test="${'Y' == selectOnly}">
<c:set var="isvisibleString" value="disabled='disabled'" />
</c:if>
<%-- <c:out value="${isvisible}" /> (Outputs true) --%>	
	
<form:form commandName="prdlstManageVO" name="prdlstManageVO" action="${pageContext.request.contextPath}/custom/prdlst/insertPrdlst.do" method="post" onSubmit="return false;" enctype="multipart/form-data">	
<div class="board" style="padding-top:20px;">
	<h1>기준정보 입력</h1>
</div>	
	
	<table class="board_list" summary="">
	<caption>기준정보 입력</caption>
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">		
	</colgroup>
	<thead>
	<tr>
		<th>JH No<font color="red">*</font></th>		
		<th>
			<input class="s_input" name="jhNo" type="text" readonly="readonly" size="25" title="" value='<c:out value="${prdlstManageVO.jhNo}"/>'  maxlength="20" >
			<form:hidden path="pkKey" />	
		</th>
		<th>
			<c:choose>
    			<c:when test="${empty prdlstManageVO.jhNo}">
        			<input title="등록품번조회" id="btnMbrId" class="btn_s2" type="button" value="등록품번조회">
    			</c:when>
    			<c:otherwise>
					[등록됨]
    			</c:otherwise>
			</c:choose>			
		</th>
		<th></th>		
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th>사용여부</th>
		<th>
			<form:select path="useSe" id="useSe" title="사용구분" disabled="${isvisible}">
				<form:options items="${useYnCode_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>			
		</th>
	</tr>
	<tr>
		<th></th>		
		<th></th>
		<th>품목구분</th>
		<th>
			<form:select path="prdlstCode" id="prdlstCode" title="품목구분" disabled="${isvisible}">
				<form:option value="" label="--선택--"/>
				<form:options items="${prdlstCode_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>
		</th>		
		<th>Maker</th>
		<th>
			<form:select path="maker" id="maker" title="Maker" disabled="${isvisible}">
				<form:option value="" label="--선택--"/>
				<form:options items="${makerCode_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>
		</th>
		<th>Model</th>
		<th><input class="s_input" name="model" type="text"  size="25" title="" value='<c:out value="${prdlstManageVO.model}"/>' maxlength="20" ${isvisibleString}></th>
		<th>Part</th>
		<th>
			<form:select path="part" id="part" title="Part" disabled="${isvisible}">
				<form:option value="" label="--선택--"/>
				<form:options items="${partCode_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>
		</th>
	</tr>	
	<tr>
		<th></th>
		<th></th>
		<th>EMARK</th>
		<th>
			<form:select path="emark" id="emark" title="EMARK" disabled="${isvisible}">
				<form:option value="" label="--선택--"/>
				<form:options items="${ynCode_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>
		</th>
		<th>도면 출처</th>
		<th><input class="s_input" name="drwOrigin" type="text"  size="25" title="" value='<c:out value="${prdlstManageVO.drwOrigin}"/>' maxlength="20" ${isvisibleString}></th>
		<th>제작가능여부</th>
		<th>
			<form:select path="mnfctPosblAt" id="mnfctPosblAt" title="제작가능여부" disabled="${isvisible}">
				<form:option value="" label="--선택--"/>
				<form:options items="${ynCode_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>
		</th>
		<th><!-- BP신규개발여부 --></th>
		<th>
<%-- 			<form:select path="newDevlopAt" id="newDevlopAt" title="BP신규개발여부" disabled="${isvisible}">
				<form:option value="" label="--선택--"/>
				<form:options items="${ynCode_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select> --%>
		</th>
	</tr>
	<tr>
		<th></th>
		<th></th>	
		<th>BOX(Set)</th>
		<th><input class="n_input" name="boxQy" type="text"  size="25" title="" value='<c:out value="${prdlstManageVO.boxQy}"/>' maxlength="20" ${isvisibleString}></th>
		<th>N/W(Kg)</th>
		<th><input class="n_input" name="wt" type="text"  size="25" title="" value='<c:out value="${prdlstManageVO.wt}"/>' maxlength="20" ${isvisibleString}></th>
		<th>Inbox size</th>
		<th><input class="n_input" name="size" type="text"  size="25" title="" value='<c:out value="${prdlstManageVO.size}"/>' maxlength="20" ${isvisibleString}></th>
		<th>Outbox size</th>
		<th><input class="n_input" name="outboxSize" type="text"  size="25" title="" value='<c:out value="${prdlstManageVO.outboxSize}"/>' maxlength="20" ${isvisibleString}></th>
	</tr>
	</thead>
	<tbody class="ov">

	</tbody>
	</table>

<div class="board" style="padding-top:20px;">
	<h1>제조원가 입력</h1>
</div>	
	<table class="board_list" summary="">
	<caption>제조원가 입력</caption>
	<colgroup>
		<col style="width: 40%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
	</colgroup>
	<thead>
	<tr>
		<th></th>
		<th>제조원가 (유심)</th>
		<th><input class="n_input" name="mnfcturPrmpcShim" id="mnfcturPrmpcShim" type="text" size="25" title="" value='<c:out value="${prdlstManageVO.mnfcturPrmpcShim}"/>' maxlength="20" ${isvisibleString}></th>
		<th>제조원가 (무심)</th>
		<th><input class="n_input" name="mnfcturPrmpc" id="mnfcturPrmpc" type="text" size="25" title="" value='<c:out value="${prdlstManageVO.mnfcturPrmpc}"/>' maxlength="20" ${isvisibleString}></th>
	</tr>
	</thead>
	</table>
	
<div class="board" style="padding-top:20px;">
	<h1>SUB 품목 입력</h1>
</div>	
<div class="search_box">
	<c:if test="${empty selectOnly || selectOnly == ''}">
	<ul>
		<li style="border: 0px solid rgb(210, 210, 210); border-image: none;">
			<input title="추가 버튼" class="s_btn" id="btn_sub_add" type="button" value="추가">
			<input title="선택삭제 버튼" class="s_btn" id="btn_sub_del" type="button" value="선택삭제">
		</li>
	</ul>
	</c:if>
</div>	
	
	<input type="hidden" name="subSn" value="X">
	<input type="hidden" name="subMaker" value="">
	<input type="hidden" name="subModel" value="">
	<input type="hidden" name="subPart" value="">
	<input type="hidden" name="subYear" value="">
	<input type="hidden" name="subApplication" value="">
	<input type="hidden" name="subNoSe" value="">
	<input type="hidden" name="subNo" value="">
	<input type="hidden" name="sub_chk" value="">
	<input type="hidden" name="chkDelAll" value="">
	
	<table class="board_list" summary="" id="sub_list">
	<caption>SUB 품번 입력</caption>
	<colgroup>
		<col style="width: 5%;">
<%-- 		<col style="width: 12%;">
		<col style="width: 10%;">
		<col style="width: 8%;"> --%>
		<col style="width: 10%;"> 
		<col style="width: 15%;">
		<col style="width: 10%;">
		<col style="width: 15%;">
		<c:if test="${empty selectOnly || selectOnly == ''}">
		<col style="width: 5%;">
		</c:if>
	</colgroup>
	<thead>
		<tr style="height:33px;">
			<th>순번</th>
			<th style='display:none;'>Maker</th>
			<th style='display:none;'>Model</th>
			<th style='display:none;'>Part</th>
			<th>Year</th>
			<th>Application</th>		
			<th>번호 구분</th>
			<th>SUB 품번</th>
			<c:if test="${empty selectOnly || selectOnly == ''}">
			<th>전체<input type="checkbox" name="sub_chk_all" id="sub_chk_all"></th>
			</c:if>		
		</tr>
	</thead>
	<tbody class="ov">
		<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
		<tr>
			<th><input type='hidden' name='subSn' value='${resultInfo.subSn}'><c:out value="${status.count}"/></th>
			<th style='display:none;'>
				<select name="subMaker" id="subMaker" ${isvisibleString}>
					<option value="">--선택--</option>
					<c:forEach items="${makerCode_result}" var="map">
						<option value="${map.code}" ${map.code==resultInfo.subMaker?"selected":"" }>${map.codeNm}</option>
					</c:forEach>								
				</select>
			</th>
			<th style='display:none;'><input class='s_input' name='subModel' type='text' size='25' value='<c:out value="${resultInfo.subModel}"/>' maxlength='20' style='width:100px;' ${isvisibleString}></th>
			<th style='display:none;'>
				<select name="subPart" id="subPart" ${isvisibleString}>
					<option value="">--선택--</option>
					<c:forEach items="${partCode_result}" var="map">
						<option value="${map.code}" ${map.code==resultInfo.subPart?"selected":"" }>${map.codeNm}</option>
					</c:forEach>								
				</select>			
			</th>
			<th><input class='s_input' name='subYear' type='text' size='25' value='<c:out value="${resultInfo.subYear}"/>' maxlength='20' style='width:50px;' ${isvisibleString}></th>
			<th><input class='s_input' name='subApplication' type='text' size='25' value='<c:out value="${resultInfo.subApplication}"/>' maxlength='20' style='width:150px;' ${isvisibleString}></th>
			<th>
				<select name="subNoSe" id="subNoSe" ${isvisibleString}>
					<option value="">--선택--</option>
					<c:forEach items="${subNoSeCode_result}" var="map">
						<option value="${map.code}" ${map.code==resultInfo.subNoSe?"selected":"" }>${map.codeNm}</option>
					</c:forEach>								
				</select>
			</th>
			<th><input class='s_input' name='subNo' type='text' size='25' value='<c:out value="${resultInfo.subNo}"/>' maxlength='20' ${isvisibleString}></th>
			<c:if test="${empty selectOnly || selectOnly == ''}">
			<th><input type="checkbox" name="sub_chk" id="sub_chk"></th>
			</c:if>
		</tr>
		</c:forEach>	
	</tbody>
	</table>
	
<div class="board" style="padding-top:20px;">
	<h1>메모 입력</h1>
</div>	
	
<table class="board_list" summary="">
	<caption>메모 입력</caption>
	<colgroup>
		<col style="width: 20%;">
		<col style="width: 80%;">
	</colgroup>
	<thead>
	<tr>
		<th>메모</th>			
		<th><pre><textarea style="width:100%; height: 100px;" name="memo"><c:out value="${prdlstManageVO.memo}"/></textarea></pre></th>	
	</tr>
	</thead>
</table>

<div class="board" style="padding-top:20px;">
	<h1>첨부파일</h1>
</div>	
	
	<table class="board_list" summary="">
	<caption>첨부파일 입력</caption>
	<colgroup>
		<col style="width: 20%;">
		<col style="width: 80%;">
	</colgroup>
	<thead>
	<tr style="height:33px;">
		<th>첨부파일</th>
		<th style="text-align:left;">
			<!--첨부목록을 보여주기 위한 -->
			<c:if test="${prdlstManageVO.atchFileId ne null && prdlstManageVO.atchFileId ne ''}">
			<c:if test="${empty selectOnly || selectOnly == ''}">
			<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfsForUpdate.do" >
			<c:param name="param_atchFileId" value="${prdlstManageVO.atchFileId}" />
			</c:import>
			</c:if>
			<c:if test="${selectOnly == 'Y'}">
			<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
			<c:param name="param_atchFileId" value="${prdlstManageVO.atchFileId}" />
			</c:import>			
			</c:if>
			</c:if>
  			
  			 <!-- 첨부화일 업로드를 위한 Start -->
			<c:if test="${prdlstManageVO.atchFileId eq null || prdlstManageVO.atchFileId eq ''}">
			<input type="hidden" name="fileListCnt" value="0" />
			<input name="atchFileAt" type="hidden" value="N">
			</c:if>
			<c:if test="${prdlstManageVO.atchFileId ne null && prdlstManageVO.atchFileId ne ''}">
			<input name="atchFileAt" type="hidden" value="Y">
			</c:if> 
		
			<!-- attached file Start -->
			<div <c:if test="${selectOnly == 'Y'}">style="display:none;"</c:if>>
				<div class="egov_file_box">
				<label for="egovfile_1" id="file_label"><spring:message code="title.attachedFileSelect" /></label> 
				<input type="file" name="file_1" id="egovfile_1"> 
				</div>
				<div id="egovComFileList"></div>
			</div>
			<!-- attached file End -->

		</th>	
	</tr>
	</thead>
	</table>


	<!-- 하단 버튼 -->    
<div class="center_box" style="padding-top:20px;">
	<c:if test="${empty selectOnly || selectOnly == ''}">
	<div class="btn">
		<c:choose>
			<c:when test="${empty prdlstManageVO.jhNo}">
       			<input type="button" class="s_submit" id="btn_submit" value="등록" title="등록 버튼" />
			</c:when>
   			<c:otherwise>
       			<input type="button" class="s_submit" id="btn_submit" value="수정" title="수정 버튼" />
			</c:otherwise>
		</c:choose>	
	</div>	
	</c:if>
	<div class="btn" style="margin-right: 5px;">
		<input type="button" class="s_submit" id="btn_list" value="목록" title="목록 버튼" />
	</div>
	<div style="clear:both;"></div>
</div>

<!--첨부파일 갯수를 위한 hidden -->
<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />

</form:form>

<c:import url="/EgovModal.do" charEncoding="utf-8">
	<c:param name="scriptYn" value="N" />
	<c:param name="modalName" value="egovModal" />
</c:import>

</body>
</html>
