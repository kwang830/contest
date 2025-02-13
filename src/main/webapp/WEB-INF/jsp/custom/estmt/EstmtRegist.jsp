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
<title>${pageTitle} <spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<script src="<c:url value='/js/custom/jquery.number.js' />"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/modal.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/modal.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">

function fnLinkPage(pageNo){
	fn_prdlst_check(pageNo);
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
/*********************************************************
 * 관리번호 체크 AJAX
 ******************************************************** */
function fn_id_check(){	
	$.ajax({
		type:"POST",
		url:"<c:url value='/custom/estmt/checkEstmtManageNoAjax.do' />",
 		data:{
 			"checkId": $("#checkBcncIdModal").val()			
 		},
 		dataType:'json',
 		timeout:(1000*30),
 		success:function(returnData, status){
 			if(status == "success") {
 				if(returnData.manageNo!=""){
 					$("#manageNo").val(returnData.manageNo);
 					fn_id_check_callback();
 				}
 			}else{ alert("ERROR!");return;} 
 		}
 	});
}
function fn_id_check_callback(){	
 	var form = $('#estmtManageVO');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/custom/estmt/insertEstmt.do",
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
function fn_goSubmit(){
	
	// 등록시 필수 체크
	if($("input[name='docSj']").val()==""){
		alert('문서제목을 입력하세요.');
		$("input[name='docSj']").focus();
		return false;
	}
	if($("input[name='bcncNm']").val()==""){
		alert('거래처를 조회하세요.');
		$("input[name='bcncNm']").focus();
		return false;
	}

	if($("input[name='dmlType']:checked").val()=='insert'){
		fn_id_check();
	}else if($("input[name='dmlType']:checked").val()=='update'){
		fn_id_check_callback();
	}
	
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
	content += "<div class='modal-alignL'>"+"<input type='text' class='se_input' id='checkBcncIdModal' name='checkBcncIdModal' value='' size='20' maxlength='20' />"+"<span class='btn_style1 blue' id='btnModalSelect' onclick='fn_bcnc_check()'><a href='#'>조회</a></span></div>";	
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
	$("input[name=checkBcncIdModal]").keydown(function (key) {
		if(key.keyCode == 13){
			fn_bcnc_check();	
		}
	});
	
	footer = null;
	content = null;
}
function fn_modal2_setting(){

	//버튼에 모달 연결
	$("#prdlstListAdd").egovModal( "egovModal2" );
	
	//타이틀 설졍
	$("#egovModal2").setEgovModalTitle("품목 조회");
	
	// 품목구분
	var list_code = [];
	var list_codeNm = [];
	<c:forEach items="${prdlstCode_result}" var="item">
	list_code.push("${item.code}");
	list_codeNm.push("${item.codeNm}");
	</c:forEach>		
	var comboPrdlstCode = "<select name='srcPrdlstCode' id='srcPrdlstCode'>";
	comboPrdlstCode += "<option value=''>전체</option>";
	for(var i=0;list_code.length>i;i++){
		comboPrdlstCode += "<option value='"+list_code[i]+"'>"+list_codeNm[i]+"</option>";
	}
	comboPrdlstCode += "</select>";	
	
	// Part
	list_code = [];
	list_codeNm = [];
	<c:forEach items="${partCode_result}" var="item">
	list_code.push("${item.code}");
	list_codeNm.push("${item.codeNm}");
	</c:forEach>		
	var comboPart = "<select name='srcPart' id='srcPart'>";
	comboPart += "<option value=''>전체</option>";
	for(var i=0;list_code.length>i;i++){
		comboPart += "<option value='"+list_code[i]+"'>"+list_codeNm[i]+"</option>";
	}
	comboPart += "</select>";
	
	// Maker
	list_code = [];
	list_codeNm = [];
	<c:forEach items="${makerCode_result}" var="item">
	list_code.push("${item.code}");
	list_codeNm.push("${item.codeNm}");
	</c:forEach>		
	var comboMaker = "<select name='srcMaker' id='srcMaker'>";
	comboMaker += "<option value=''>전체</option>";
	for(var i=0;list_code.length>i;i++){
		comboMaker += "<option value='"+list_code[i]+"'>"+list_codeNm[i]+"</option>";
	}
	comboMaker += "</select>";	
	
	var contentTable = ""; 
	contentTable += "<table class='board_list' summary='' id='prdlstSrcList'>";
	contentTable += "<caption>기본정보 입력</caption>";
	contentTable += "<colgroup>";
	contentTable += "<col style='width: 5%;'>";
	contentTable += "<col style='width: 10%;'>";
	contentTable += "<col style='width: 13%;'>";
	contentTable += "<col style='width: 12%;'>";
	contentTable += "<col style='width: 10%;'>";
	contentTable += "<col style='width: 13%;'>";
	contentTable += "<col style='width: 12%;'>";
	contentTable += "<col style='width: 5%;'>";
	contentTable += "<col style='width: 10%;'>";
	contentTable += "<col style='width: 10%;'>";
	contentTable += "</colgroup>";
	contentTable += "<thead>";
	contentTable += "<tr>";
	contentTable += "<th>순번</th>";
	contentTable += "<th>JH No</th>";
	contentTable += "<th>번호 구분</th>";
	contentTable += "<th>SUB 품번</th>";
	contentTable += "<th>품목</th>";
	contentTable += "<th>Maker</th>";
	contentTable += "<th>Model</th>";
	contentTable += "<th>Part</th>";
	contentTable += "<th>제조원가(유심)</th>";
	contentTable += "<th>제조원가(무심)</th>";
	contentTable += "</tr>";
	contentTable += "</thead>";
	contentTable += "<tbody class='ov'>";
	contentTable += "</tbody>";
	contentTable += "</table>";	
	
	var content = "";
	content += "<div class='modal-alignL' style='margin:5px 0 0 0; border:1px solid green;'>";
	content += "<span class='modal_btn_title'>품목구분</span> "+comboPrdlstCode+"&nbsp;";
	content += "<span class='modal_btn_title'>품번</span> <input type='text' class='se_input' id='srcPrdlstNo' name='srcPrdlstNo' value='' size='20' maxlength='20' />&nbsp;";
	content += "<span class='modal_btn_title'>Maker</span> "+comboMaker+"&nbsp;";
	content += "<span class='modal_btn_title'>모델명</span> <input type='text' class='se_input' id='srcModel' name='srcModel' value='' size='20' maxlength='20' />&nbsp;";
	content += "<span class='modal_btn_title'>파트</span> "+comboPart+"&nbsp;";	
	content += "<span class='btn_style1 blue' id='btnModalSelect2' onclick='fn_prdlst_check(1)'><a href='#'>조회</a></span>";		
	content += "</div>";
	content += "<div class='modal-alignL' id='prdlstListRsCount' style='margin:15px 0 0 15px;'>";
	content += "조회결과: 0건 ";
	content += "</div>";
	content += "<div style='clear:both;'></div>";
	content += "<div id='divModalResultPrdlst' style='margin:10px 0 0 0'>";
	content += ""+contentTable+"";	
	content += "</div>";
	content += "<div class='modal-align' id='prdlst_list_pagination' style='margin:15px 0 0 15px;'></div>";
	content += "<div style='clear:both;'></div>";	
	
	//모달 body 설정
	$("#egovModal2").setEgovModalBody(content);

	var footer = "";
	footer += "";
	
	//모달 footer 설정
	$("#egovModal2").setEgovModalfooter(footer);
	
	//엔터이벤트처리
	$("input[name=srcPrdlstNo]").keydown(function (key) {
		if(key.keyCode == 13){
			fn_prdlst_check(1);	
		}
	});
	$("input[name=srcModel]").keydown(function (key) {
		if(key.keyCode == 13){
			fn_prdlst_check(1);	
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
			"checkId": $("#checkBcncIdModal").val()			
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
/*********************************************************
 * 품목 조회 AJAX
 ******************************************************** */
function fn_prdlst_check(page){
	$.ajax({
		type:"POST",
		url:"<c:url value='/custom/estmt/selectPrdlstListAjax.do' />",
		data:{
			"srcPrdlstCode": $("#srcPrdlstCode").val(),
			"srcPart": $("#srcPart").val(),
			"srcMaker": $("#srcMaker").val(),
			"srcPrdlstNo": $("#srcPrdlstNo").val(),
			"srcModel": $("#srcModel").val(),
			"srcFirstIndex": page
		},
		dataType:'json',
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
 				if(returnData.resultCnt > 0 ){
					$("#prdlstSrcList tbody").empty();
					var obj = returnData.resultList;
					fn_prdlst_table_list_set(obj);
					fn_prdlst_list_pagination(returnData.resultCnt,page); // 페이징
					$("#prdlstListRsCount").html("조회결과: "+returnData.resultCnt+"건");
				}else{
					$("#prdlstSrcList tbody").empty();
					$("#prdlstListRsCount").html("<font color='red'> 조회 결과가 없습니다.</font>");
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
function fn_prdlst_table_list_set(data){
	var row = "";
	for(var i=0; i<data.length; i++){
		var obj = data[i];
		row += "<tr style='height:33px;'>";	
		row += "<th>"+(i+1)+"</th>";
		row += "<th>"+obj.jhNo+"</th>";
		row += "<th>"+obj.noSe+"</th>";
		row += "<th>"+obj.subNo+"</th>";
		row += "<th>"+obj.prdlstCode+"</th>";
		row += "<th>"+obj.maker+"</th>";
		row += "<th>"+obj.model+"</th>";
		row += "<th>"+obj.part+"</th>";
		row += "<th><a href='javascipt:;' onclick=\"fn_prdlst_table_list_add('"+obj.jhNo+"','"+obj.noSe+"','"+obj.subNo+"','"+obj.prdlstCode+"','"+obj.maker+"','"+obj.model+"','"+obj.part+"','"+obj.mnfcturPrmpcShim+"','X');return false;\"><font style='color:cadetblue;'>"+obj.mnfcturPrmpcShim+"</font></a></th>";
		row += "<th><a href='javascipt:;' onclick=\"fn_prdlst_table_list_add('"+obj.jhNo+"','"+obj.noSe+"','"+obj.subNo+"','"+obj.prdlstCode+"','"+obj.maker+"','"+obj.model+"','"+obj.part+"','X','"+obj.mnfcturPrmpc+"');return false;\"><font style='color:cadetblue;'>"+obj.mnfcturPrmpc+"</font></a></th>";
		row += "</tr>";		
	}	
	$("#prdlstSrcList tbody").html(row);
	$("#divModalResult").show();
	$("#bcncTableList").show();
}

function fn_prdlst_table_list_add(jhNo,noSe,subNo,prdlstCode,maker,model,part,mnfcturPrmpcShim,mnfcturPrmpc){
	var directYn = 'N';
	var shimYn = '';
	var untpc = '';
	if(mnfcturPrmpc=='X'&& mnfcturPrmpcShim!=''){
		shimYn = 'Y';
		untpc = mnfcturPrmpcShim;
	}else if(mnfcturPrmpcShim=='X'&& mnfcturPrmpc!=''){
		shimYn = 'N';
		untpc = mnfcturPrmpc;		
	}
	fn_prdlstList_tbody_add(directYn,jhNo,noSe,subNo,prdlstCode,maker,model,part,shimYn,untpc);
	$("#egovModal2").setEgovModalClose();
}

function fn_bcnc_table_list_choice(uniqId,cmpnyNm,userNm,emailAdres,areaNo,middleTelno,endTelno,adres){
	$("input[name='bcncNm']").val(cmpnyNm);
	$("input[name='bcncCode']").val(uniqId);
	var chkDelAll = $("input[name='chkDelAll']").val();
	for(var i=$("input[name='sub_chk']").length-1; i>-1; i--){	    			
		var chkDel = $("input[name='sub_chk']").eq(i).closest("tr").find("input[name='subSn']").val();
		chkDelAll = (chkDelAll==""? chkDel : chkDelAll+","+chkDel);
	}﻿
    $("input[name='chkDelAll']").val(chkDelAll);	
	
	var row = "<tr>";
	row += "<th rowspan='2'><input type='checkbox' name='sub_chk' value=''><input type='hidden' name='subSn' value='N'></th>";
	row += "<th>거래처담당자</th>";
	row += "<th><input class='s_input' name='bcncCharger' type='text'  size='25' title='' value='"+userNm+"'  maxlength='20' style='width:100%;' ></th>";
	row += "<th>연락처</th>";
	row += "<th><input class='s_input' name='cttpc' type='text'  size='25' title='' value='"+areaNo+"-"+middleTelno+"-"+endTelno+"'  maxlength='20' style='width:100%;' ></th>";
	row += "<th>이메일</th>";
	row += "<th><input class='s_input' name='email' type='text'  size='25' title='' value='"+emailAdres+"'  maxlength='20' style='width:100%;' ></th>";
	row += "<th>업무담당자</th>";
	row += "<th><input class='s_input' name='jobCharger' type='text'  size='25' title='' value=''  maxlength='20' style='width:100%;' ></th>";
	row += "<th>대표정보</th>";
	row += "<th><input type='radio' name='mainYnChk' id='mainYnChk' checked='checked'><input type='hidden' name='mainYn' id='mainYn' value='1'></th>";		
	row += "</tr>";
	row += "<tr>";
	row += "<th>주소</th>";
	row += "<th colspan='5'><input class='s_input' name='adres' type='text'  size='25' title='' value='"+adres+"' maxlength='20' style='width:100%;'></th>";	
	row += "<th>메모</th>";
	row += "<th colspan='3'><input class='s_input' name='memo' type='text'  size='25' title='' value='' maxlength='20' style='width:100%;'></th>";
	row += "</tr>";	

	$("#estmtList tbody").html(row);	
	$("#egovModal").setEgovModalClose();
}

function fn_amountSum(seq){
	var prdlstUntpc = $("#prdlstList tbody tr").eq(seq).find("input[name='prdlstUntpc']").val().replace(/,/g, '');
	var prdlstProfitRt = $("#prdlstList tbody tr").eq(seq).find("input[name='prdlstProfitRt']").val().replace(/,/g, '');
	var prdlstQy = $("#prdlstList tbody tr").eq(seq).find("input[name='prdlstQy']").val().replace(/,/g, '');
	var prdlstAmount = "";
	
	if( prdlstUntpc != "" && prdlstProfitRt != "" && prdlstQy != ""){		
		prdlstAmount = parseFloat(prdlstUntpc)*parseFloat(prdlstProfitRt)*parseInt(prdlstQy);
	}
	$("#prdlstList tbody tr").eq(seq).find("input[name='prdlstAmount']").val(prdlstAmount).number(true);
	fn_totAmountSum();
}
function fn_totAmountSum(){
	var prdlsttotAmount = 0;
 	$("input[name='prdlstAmount']").each(function(index, item){
 		prdlsttotAmount += parseFloat($(this).val().replace(/,/g, ''));
 	});
 	$("input[name='totAmount']").val(prdlsttotAmount).number(true);
}

var navy_totpage=1; // 전체
var navy_page_w=10; // 길이
var navy_nowpage=1; // 현재
function fn_prdlst_list_pagination(totpage,nowpage){
	navy_totpage = totpage;
	navy_nowpage = Math.ceil(nowpage/10);
	
	/* console.log('totpage:'+totpage+' nowpage:'+nowpage+' navy_totpage:'+navy_totpage+' navy_nowpage:'+navy_nowpage); */
	
	var html = "";
	html += "<div class='pagination'>";
	html += "<ul>";
	
	var displayPageG = 1; // 보여줄페이지 그룹
	var page_count = 0; // 페이지그룹 증가용

	/* console.log('Math.ceil(totpage/10):'+Math.ceil(totpage/10)); */
	for(var i=1;i<Math.ceil(totpage/10)+1;i++){ //
/* 		console.log('i:'+i);
		console.log('Math.ceil(totpage/10):'+Math.ceil(totpage/10)); */
		if(Math.ceil(totpage/10)>10 && i==1){
			var prev_page = nowpage==1?1:nowpage-1;
			html += "<li class='first'><a onclick='fnLinkPage(1);return false; ' href='javascript:;'>첫 페이지</a></li>";			
			html += "<li class='prev'><a onclick='fnLinkPage("+prev_page+");return false; ' href='javascript:;'>이전 페이지</a></li>";
		}
		page_count++;
/* 		console.log('page_count:'+page_count);
		console.log('displayPageG:'+displayPageG);
		console.log('navy_nowpage:'+navy_nowpage); */
		if(displayPageG==navy_nowpage){
			if(nowpage==i){
				html += "<li class='current'><a onclick='fnLinkPage("+i+");return false; ' href='javascript:;'>"+(i)+"</a></li>";
			}else{
				html += "<li><a onclick='fnLinkPage("+i+");return false; ' href='javascript:;'>"+(i)+"</a></li>";
			}
		}
		if(page_count==navy_page_w){
			displayPageG++;
			page_count = 0;
		}		
		
		if(Math.ceil(totpage/10)>10 && i==Math.ceil(totpage/10)){
			var next_page = nowpage==Math.ceil(totpage/navy_page_w)?Math.ceil(totpage/navy_page_w):nowpage+1;
			html += "<li class='next'><a onclick='fnLinkPage("+next_page+");return false; ' href='javascript:;'>다음 페이지</a></li>";
			html += "<li class='last'><a onclick='fnLinkPage("+Math.ceil(totpage/navy_page_w)+");return false; ' href='javascript:;'>끝 페이지</a></li>";			
		}		
	}
	html += "</ul>";
	html += "</div>";
	$("#prdlst_list_pagination").html(html);
}
function fn_prdlstList_tbody_add(directYn,jhNo,noSe,subNo,prdlstCode,maker,model,part,shimYn,untpc){
	var vdirectReadonly = "";
	if(directYn == 'N') vdirectReadonly = "readonly=\"readonly\"";
	var row = "<tr style='height:26px;'>";
	row += "<th><input type='checkbox' name='prdlst_chk' id='prdlst_chk'><input type='hidden' name='prdlstSubSn' value='N'><input type='hidden' name='prdlstDirectYn' value='"+directYn+"'></th>";
	row += "<th><input class='se_input' name='prdlstJhno' type='text'  size='25' title='' value='"+jhNo+"'  maxlength='20' style='width:100%;' "+vdirectReadonly+"></th>";
	row += "<th><input class='s_input' name='prdlstNoSe' type='text'  size='25' title='' value='"+noSe+"'  maxlength='20' style='width:100%;' "+vdirectReadonly+"></th>";
	row += "<th><input class='s_input' name='prdlstSubNo' type='text'  size='25' title='' value='"+subNo+"'  maxlength='20' style='width:100%;' "+vdirectReadonly+"></th>";
	row += "<th><input class='s_input' name='prdlstModel' type='text'  size='25' title='' value='"+model+"'  maxlength='20' style='width:100%;' ></th>";
	row += "<th><input class='s_input' name='prdlstPart' type='text'  size='25' title='' value='"+part+"'  maxlength='20' style='width:100%;' ></th>";
	row += "<th><input class='s_input' name='prdlstShim' type='text'  size='25' title='' value='"+shimYn+"'  maxlength='20' style='width:100%;' ></th>";
	row += "<th><input class='n_input' name='prdlstUntpc' id='prdlstUntpc' type='text'  size='25' title='' value='"+untpc+"'  maxlength='20' style='width:100%;' ></th>";
	row += "<th><input class='nd_input' name='prdlstProfitRt' type='text'  size='25' title='' value='1.00'  maxlength='20' style='width:100%;' ></th>";
	row += "<th><input class='n_input' name='prdlstQy' type='text'  size='25' title='' value=''  maxlength='20' style='width:100%;' ></th>";
	row += "<th><input class='n_input' name='prdlstAmount' type='text'  size='25' title='' value=''  maxlength='20' style='width:100%;' ></th>";
	row += "</tr>";
	$("#prdlstList tbody").append(row);	
}
function fn_estmtSrc(){
 	var form = $('#estmtManageVO');   
	var string = form.serialize();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/custom/estmt/EstmtRegist.do",
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
function fn_goList(){
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
$(function(){
	
	//모달 셋팅
	fn_modal_setting();
	fn_modal2_setting();
	
	// 모달 사이즈 수정
	$("#btnBcncSrc").click(function(){
		$(".modal-content").css("width","400px");
		$(".modal-footer #footer").css("float","none");
		$(".modal-footer #footer").css("width","100%");
	});	
	$("#prdlstListAdd").click(function(){
		$(".modal-content").css("width","1100px");
		$(".modal-footer #footer").css("float","none");
		$(".modal-footer #footer").css("width","100%");		
	});		
	
	<c:if test="${empty estmtManageVO.manageNo || estmtManageVO.manageNo == ''}">
	$("#divDocSn").hide();
	</c:if>
	$("#bcncTableList").hide();
	
	$("#ui-datepicker-div").remove();
	$("#registDe").datepicker(   
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
	$("#cntrctDe").datepicker(   
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
	
	$("input[name='dmlType']").change(function() {
		var radioValue = $(this).val();
		if(radioValue=="insert"){
			$("#divDocSn").hide();
			//$("#manageNo").val("");
		}else if(radioValue=="update"){
			$("#divDocSn").show();
		}
	});
		
	$("#estmtListDel").click(function(){
		if ($("input[name='sub_chk']").is(":checked")){ 
	    	if (confirm("삭제 하시겠습니까?")) { 
	    		var chkDelAll = $("input[name='chkDelAll']").val();
	    	﻿	for(var i=$("input[name='sub_chk']:checked").length-1; i>-1; i--){	    			
	    			var chkMainYnChecked = $("input[name='sub_chk']:checked").eq(i).closest("tr").find("input[name='mainYnChk']").is(":checked");
	    			if(chkMainYnChecked==true){
	    				alert("대표설정 값으로 체크된 항목은 삭제할 수 없습니다.");
	    			}else if(chkMainYnChecked==false){
		    			var chkDel = $("input[name='sub_chk']:checked").eq(i).closest("tr").find("input[name='subSn']").val();
		    			chkDelAll = (chkDelAll==""? chkDel : chkDelAll+","+chkDel);
		    	﻿    	//$("[name='sub_chk']:checked").eq(i).closest("tr").remove();
		    			var rowIndex = $("input[name='sub_chk']:checked").eq(i).closest("tr").index();
		    			$("#estmtList tbody tr").eq(rowIndex+1).remove();
		    			$("#estmtList tbody tr").eq(rowIndex).remove();	
	    			}
	 			}﻿
	    	    $("input[name='chkDelAll']").val(chkDelAll);
	    	}﻿ 
	    } else { 
	    	alert("선택된 데이터가 없습니다.");   
	    }﻿ 		
	});	
	
	$("#estmtListAdd").click(function(){
		var row = "<tr>";
		row += "<th rowspan='2'><input type='checkbox' name='sub_chk' value=''><input type='hidden' name='subSn' value='N'></th>";
		row += "<th>거래처담당자</th>";
		row += "<th><input class='s_input' name='bcncCharger' type='text'  size='25' title='' value=''  maxlength='20' style='width:100%;' ></th>";
		row += "<th>연락처</th>";
		row += "<th><input class='s_input' name='cttpc' type='text'  size='25' title='' value=''  maxlength='20' style='width:100%;' ></th>";
		row += "<th>이메일</th>";
		row += "<th><input class='s_input' name='email' type='text'  size='25' title='' value=''  maxlength='20' style='width:100%;' ></th>";
		row += "<th>업무담당자</th>";
		row += "<th><input class='s_input' name='jobCharger' type='text'  size='25' title='' value=''  maxlength='20' style='width:100%;' ></th>";
		row += "<th>대표정보</th>";
		row += "<th><input type='radio' name='mainYnChk' id='mainYnChk'><input type='hidden' name='mainYn' id='mainYn' value='0'></th>";		
		row += "</tr>";
		row += "<tr>";
		row += "<th>주소</th>";
		row += "<th colspan='5'><input class='s_input' name='adres' type='text'  size='25' title='' value='' maxlength='20' style='width:100%;'></th>";	
		row += "<th>메모</th>";
		row += "<th colspan='3'><input class='s_input' name='memo' type='text'  size='25' title='' value='' maxlength='20' style='width:100%;'></th>";
		row += "</tr>";		

		$("#estmtList").append(row);
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
			
	$("#prdlstDirectAdd").click(function(){
		var directYn = 'Y';
		var jhNo = '';
		var noSe = '';
		var subNo = '';
		var prdlstCode = '';
		var maker = '';
		var model = '';
		var part = '';
		var shimYn = '';
		var untpc = '';
		fn_prdlstList_tbody_add(directYn,jhNo,noSe,subNo,prdlstCode,maker,model,part,shimYn,untpc);
	});
	$("#prdlstListDel").click(function(){
		if ($("input[name='prdlst_chk']").is(":checked")){ 
	    	if (confirm("삭제 하시겠습니까?")) { 
	    		var chkDelAll = $("input[name='chkDelPrdlstAll']").val();
	    	﻿	for(var i=$("input[name='prdlst_chk']:checked").length-1; i>-1; i--){	    			
	    			var chkDel = $("input[name='prdlst_chk']:checked").eq(i).closest("tr").find("input[name='prdlstSubSn']").val();
	    			chkDelAll = (chkDelAll==""? chkDel : chkDelAll+","+chkDel);
	    	﻿    	$("[name='prdlst_chk']:checked").eq(i).closest("tr").remove();
	 			}﻿
	    	    $("input[name='chkDelPrdlstAll']").val(chkDelAll);
	 			fn_totAmountSum();
	    	}﻿ 
	    } else { 
	    	alert("선택된 데이터가 없습니다.");   
	    }﻿ 		
	});		

	$("#prdlst_chk_all").click(function(){
		if($("#prdlst_chk_all").prop('checked')){
			$("input[name='prdlst_chk']:checkbox").each(function(){
				$(this).prop('checked',true);
			});
		}else{
			$("input[name='prdlst_chk']:checkbox").each(function(){
				$(this).prop('checked',false);
			});			
		}
	});
	
 	$(".n_input").val(function(){
		return 	$.number($(this).val());
	});
	$(document).on("keyup", ".n_input", function() {
		fn_amountSum($(this).closest("tr").index());
		$(this).number(true);
	});
 	$(".nd_input").val(function(){
		return 	$.number($(this).val(),2);
	});
	$(document).on("keyup", ".nd_input", function() {
		var pattern = /(^[0-9\._]+$)/;
		if(!pattern.test($(this).val())){
			//alert('숫자와 점만 입력가능합니다.');
			$(this).val("");
			event.returnValue = false;
		}
		fn_amountSum($(this).closest("tr").index());
	});	
	
	$(document).on("keyup", "input:text[name='prdlstJhno']", function() {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,'').toUpperCase());
		}		
	});		
	
	$(document).on("change", "input:radio[name='mainYnChk']", function() {
		$("input:text[name='mainYn']").val("0");
		$(this).closest("tr").find("input[name='mainYn']").val("1");
	});		
	
	$("#btn_submit").click(function(){
		fn_goSubmit();
	});	
	
	$("#estmtSrc").click(function(){
		fn_estmtSrc();
	});
	
	$("#btn_list").click(function(){
		fn_goList();
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
<form:form commandName="estmtManageVO" name="estmtManageVO" action="${pageContext.request.contextPath}/custom/estmt/insertEstmt.do" method="post" onSubmit="fn_goSubmit(); return false;" enctype="multipart/form-data">
<div class="board">
	<h1>[>] 견적 등록</h1>
</div>

<div class="search_box">
	<ul>
		<li style="border: 0px solid rgb(210, 210, 210); border-image: none;">
		</li>
	</ul>
</div>
<table class="board_list" summary="">
	<caption>거래처 견적 정보 조회</caption>
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 20%;">
		<col style="width: 30%;">
		<col style="width: ;">
	</colgroup>
	<thead>
	<tr style="height:33px;">
		<th>구분</th>
		<th>
			<c:choose>
    			<c:when test="${empty estmtManageVO.manageNo || estmtManageVO.manageNo == ''}">
			<input type="radio" name="dmlType" value="insert" checked="checked" /> 신규 &nbsp;&nbsp;&nbsp;
			<input type="radio" name="dmlType" value="update" /> 조회 후 수정
    			</c:when>
    			<c:otherwise>
			<input type="radio" name="dmlType" value="insert" /> 신규 &nbsp;&nbsp;&nbsp;
			<input type="radio" name="dmlType" value="update" checked="checked" /> 조회 및 수정
    			</c:otherwise>
			</c:choose>			
		</th>
		<th>
			<div id="divDocSn">
			관리번호 : <input class="s_input" name="manageNo" id="manageNo" type="text"  size="25" title="" value="<c:out value="${estmtManageVO.manageNo}"/>"  maxlength="20" style="width:110px;">
			<input title="조회 버튼" class="btn_s" type="button" name="estmtSrc" id="estmtSrc" value="조회">
			</div> 
		</th>
		<th></th>
	</tr>
	</thead>
	<tbody class="ov">
	</tbody>
</table>

<div class="board" style="padding-top:20px;">
	<h1>계약정보 입력</h1>
</div>	
<table class="board_list" summary="">
	<caption>계약정보 입력</caption>
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 15%;">
		<col style="width: 10%;">
		<col style="width: 15%;">
		<col style="width: 10%;">
		<col style="width: 15%;">
		<col style="width: 13%;">
		<col style="width: 12%;">
	</colgroup>
	<thead>
	<tr>
		<th>문서번호</th>
		<th><input class="s_input" name="docNo" id="docNo" type="text"  size="25" title="" value="<c:out value="${estmtManageVO.docNo}"/>"  maxlength="20" style="width:100%;" ></th>
		<th>등록일자</th>
		<th><input class="s_input" name="registDe" id="registDe" type="text"  size="25" title="" value="<c:out value="${estmtManageVO.registDe}"/>"  maxlength="20" ></th>
		<th>계약일자</th>
		<th><input class="s_input" name="cntrctDe" id="cntrctDe" type="text"  size="25" title="" value="<c:out value="${estmtManageVO.cntrctDe}"/>"  maxlength="20" ></th>
		<th>진행상태</th>
		<th>
			<form:select path="progrsSttus" id="progrsSttus" title="진행상태">
				<form:options items="${progrsSttus_result}" itemValue="code" itemLabel="codeNm"/>
			</form:select>		
		</th>
	</tr>
	<tr>
		<th>문서제목</th>
		<th colspan="7"><input class="s_input" name="docSj" id="docSj" type="text"  size="25" title="" value="<c:out value="${estmtManageVO.docSj}"/>"  maxlength="100" style="width:100%;" ></th>
	</tr>	
	</thead>
	<tbody class="ov">
	</tbody>
</table>
		
	
<div class="board" style="padding-top:20px;">
	<h1>거래처 정보 입력</h1>
</div>	
<div class="search_box">
	<ul>
		<li style="border: 0px solid rgb(210, 210, 210); border-image: none;">
			<input title="추가 버튼" id="estmtListAdd" class="s_btn" type="button" value="담당자 추가">
			<input title="삭제 버튼" id="estmtListDel" class="s_btn" type="button" value="선택 삭제">
		</li>
	</ul>
</div>
<table class="board_list" summary="" id="estmtList">
	<caption>거래처 정보 입력</caption>
	<colgroup>
		<col style="width: 5%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 7%;">
		<col style="width: 10%;">
		<col style="width: 7%;">
		<col style="width: 15%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 6%;">		
	</colgroup>
	<thead>
	<tr>
		<th>전체<input type="checkbox" name="sub_chk_all" id="sub_chk_all"></th>
		<th>거래처명</th>
		<th colspan="3">
			<input class="s_input" name="bcncNm" type="text" size="25" title="" value="<c:out value="${estmtManageVO.bcncNm}"/>" maxlength="20" style="width:145px;" readonly="readonly">
			<input title="거래처 조회" id="btnBcncSrc" class="btn_s2" type="button" value="거래처 조회">
			<input type="hidden" name="bcncCode" value="<c:out value="${estmtManageVO.bcncCode}"/>">
		</th>
		<th></th>
		<th></th>
		<th colspan="4">
		</th>		
	</tr>
	</thead>
	<tbody class="ov">
	<c:choose>
		<c:when test="${empty resultCnt || resultCnt==0}">
	<tr>
		<th rowspan="2"><input type="checkbox" name="sub_chk" value=""><input type="hidden" name="subSn" value="N"></th>
		<th>거래처담당자</th>
		<th><input class="s_input" name="bcncCharger" type="text"  size="25" title="" value=""  maxlength="20" style="width:100%;" ></th>
		<th>연락처</th>
		<th><input class="s_input" name="cttpc" type="text"  size="25" title="" value=""  maxlength="20" style="width:100%;" ></th>
		<th>이메일</th>
		<th><input class="s_input" name="email" type="text"  size="25" title="" value=""  maxlength="20" style="width:100%;" ></th>
		<th>업무담당자</th>
		<th><input class="s_input" name="jobCharger" type="text"  size="25" title="" value=""  maxlength="20" style="width:100%;" ></th>
		<th>대표정보</th>
		<th><input type="radio" name="mainYnChk" id="mainYnChk" checked="checked"><input type="hidden" name="mainYn" id="mainYn" value="1"></th>		
	</tr>
	<tr>
		<th>주소</th>
		<th colspan="5"><input class="s_input" name="adres" id="adres" type="text"  size="25" title="" value="" maxlength="20" style="width:100%;"></th>	
		<th>메모</th>
		<th colspan="3"><input class="s_input" name="memo" type="text"  size="25" title="" value="" maxlength="20" style="width:100%;"></th>
	</tr>
		</c:when>
		<c:otherwise>
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr>
		<th rowspan="2"><input type="checkbox" name="sub_chk" value=""><input type="hidden" name="subSn" value="<c:out value="${resultInfo.subSn}"/>"></th>
		<th>거래처담당자</th>
		<th><input class="s_input" name="bcncCharger" type="text"  size="25" title="" value="<c:out value="${resultInfo.bcncCharger}"/>"  maxlength="20" style="width:100%;" ></th>
		<th>연락처</th>
		<th><input class="s_input" name="cttpc" type="text"  size="25" title="" value="<c:out value="${resultInfo.cttpc}"/>"  maxlength="20" style="width:100%;" ></th>
		<th>이메일</th>
		<th><input class="s_input" name="email" type="text"  size="25" title="" value="<c:out value="${resultInfo.email}"/>"  maxlength="20" style="width:100%;" ></th>
		<th>업무담당자</th>
		<th><input class="s_input" name="jobCharger" type="text"  size="25" title="" value="<c:out value="${resultInfo.jobCharger}"/>"  maxlength="20" style="width:100%;" ></th>
		<th>대표정보</th>
		<th><input type="radio" name="mainYnChk" id="mainYnChk" <c:if test="${resultInfo.mainYn == '1'}">checked="checked"</c:if>><input type="hidden" name="mainYn" id="mainYn" value="<c:out value="${resultInfo.mainYn}"/>"></th>		
	</tr>
	<tr>
		<th>주소</th>
		<th colspan="5"><input class="s_input" name="adres" id="adres" type="text"  size="25" title="" value="<c:out value="${resultInfo.adres}"/>" maxlength="20" style="width:100%;"></th>	
		<th>메모</th>
		<th colspan="3"><input class="s_input" name="memo" type="text"  size="25" title="" value="<c:out value="${resultInfo.memo}"/>" maxlength="20" style="width:100%;"></th>
	</tr>
	</c:forEach>
		</c:otherwise>
	</c:choose>	

	
	

	</tbody>
</table>	
	
<div class="board" style="padding-top:20px;"> 
	<h1>품목 리스트</h1>
</div>
<div class="search_box">
	<ul>
		<li style="border: 0px solid rgb(210, 210, 210); border-image: none;">
			<input title="추가 버튼" id="prdlstListAdd" class="s_btn" type="button" value="품목 추가">
			<input title="추가 버튼" id="prdlstDirectAdd" class="s_btn" type="button" value="직접입력 추가">
			<input title="삭제 버튼" id="prdlstListDel" class="s_btn" type="button" value="선택 삭제">
		</li>
	</ul>
</div>
<table class="board_list" summary="" id="prdlstList">
	<caption>품목 리스트</caption>
	<colgroup>
		<col style="width: 5%;">
		<col style="width: 11%;">
		<col style="width: 11%;">
		<col style="width: 11%;">
		<col style="width: 11%;">
		<col style="width: 5%;">
		<col style="width: 5%;">
		<col style="width: 9%;">
		<col style="width: 8%;">
		<col style="width: 8%;">
		<col style="width: 8%;">
	</colgroup>
	<thead>
	<tr style="height:30px;">
		<th>전체<input type="checkbox" name="prdlst_chk_all" id="prdlst_chk_all"></th>
		<th>JH No</th>		
		<th>번호구분</th>
		<th>Sub번호</th>
		<th>Model</th>
		<th>Part</th>
		<th>SHIM</th>
		<th>단가</th>
		<th>이익률</th>
		<th>수량</th>
		<th>금액</th>
	</tr>	
	</thead>
	<tbody class="ov">
	<c:forEach items="${resultList2}" var="resultInfo" varStatus="status">
	<tr style='height:26px;'>
		<th><input type='checkbox' name='prdlst_chk' id='prdlst_chk'><input type='hidden' name='prdlstSubSn' value='<c:out value="${resultInfo.prdlstSubSn}"/>'><input type='hidden' name='prdlstDirectYn' value='<c:out value="${resultInfo.prdlstDirectYn}"/>'></th>
		<th><input class='se_input' name='prdlstJhno' type='text'  size='25' title='' value='<c:out value="${resultInfo.prdlstJhno}"/>'  maxlength='20' style='width:100%;' <c:if test="${resultInfo.prdlstDirectYn == 'N'}"> readonly="readonly"</c:if>></th>
		<th><input class='s_input' name='prdlstNoSe' type='text'  size='25' title='' value='<c:out value="${resultInfo.prdlstNoSe}"/>'  maxlength='20' style='width:100%;' <c:if test="${resultInfo.prdlstDirectYn == 'N'}"> readonly="readonly"</c:if>></th>
		<th><input class='s_input' name='prdlstSubNo' type='text'  size='25' title='' value='<c:out value="${resultInfo.prdlstSubNo}"/>'  maxlength='20' style='width:100%;' <c:if test="${resultInfo.prdlstDirectYn == 'N'}"> readonly="readonly"</c:if>></th>
		<th><input class='s_input' name='prdlstModel' type='text'  size='25' title='' value='<c:out value="${resultInfo.prdlstModel}"/>'  maxlength='20' style='width:100%;' ></th>
		<th><input class='s_input' name='prdlstPart' type='text'  size='25' title='' value='<c:out value="${resultInfo.prdlstPart}"/>'  maxlength='20' style='width:100%;' ></th>
		<th><input class='s_input' name='prdlstShim' type='text'  size='25' title='' value='<c:out value="${resultInfo.prdlstShim}"/>'  maxlength='20' style='width:100%;' ></th>
		<th><input class='n_input' name='prdlstUntpc' id='prdlstUntpc' type='text'  size='25' title='' value='<c:out value="${resultInfo.prdlstUntpc}"/>'  maxlength='20' style='width:100%;' ></th>
		<th><input class='nd_input' name='prdlstProfitRt' type='text'  size='25' title='' value='<c:out value="${resultInfo.prdlstProfitRt}"/>'  maxlength='20' style='width:100%;' ></th>
		<th><input class='n_input' name='prdlstQy' type='text'  size='25' title='' value='<c:out value="${resultInfo.prdlstQy}"/>'  maxlength='20' style='width:100%;' ></th>
		<th><input class='n_input' name='prdlstAmount' type='text'  size='25' title='' value='<c:out value="${resultInfo.prdlstAmount}"/>'  maxlength='20' style='width:100%;' ></th>
	</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	<tr style="background:#E0F2F7; height:26px;">
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th colspan="2">합계</th>
		<th colspan="2"><input class='n_input' name='totAmount' type='text' size='25' title='' value='<c:out value="${estmtManageVO.totAmount}"/>' maxlength='20' readonly="readonly" style='width:80%;' > 원</th>
	</tr>
	</tfoot>
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
		<th><pre><textarea style="width:100%; height: 100px;" name="estmtMemo"><c:out value="${estmtManageVO.estmtMemo}"/></textarea></pre></th>	
	</tr>
	</thead>
</table>

<input type="hidden" name="chkDelAll" value="">
<input type="hidden" name="chkDelPrdlstAll" value="">	
</form:form>

<!-- 하단 버튼 -->    
<div class="center_box" style="padding-top:20px;">
	<div class="btn">
       	<input type="button" class="s_submit" id="btn_submit" value="저장" title="저장 버튼" />
       	<input type="button" class="s_submit" id="btn_list" value="목록" title="목록 버튼" />
	</div>	
	<div style="clear:both;"></div>
</div>

<c:import url="/EgovModal.do" charEncoding="utf-8">
	<c:param name="scriptYn" value="N" />
	<c:param name="modalName" value="egovModal" />
</c:import>
<c:import url="/EgovModal.do" charEncoding="utf-8">
	<c:param name="scriptYn" value="N" />
	<c:param name="modalName" value="egovModal2" />
</c:import>

</body>
</html>
