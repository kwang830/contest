<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%!
    public String DateTypeIntForString(int iInput){
		String sOutput = "";
		if(Integer.toString(iInput).length() == 1){
			sOutput = "0" + Integer.toString(iInput);
		}else{
			sOutput = Integer.toString(iInput);
		}

       return sOutput;
    }
%>

<%

String sImgUrl = "/images/egovframework/com/cop/smt/sdm/";
String sCssUrl = "/css/egovframework/com/cop/smt/sdm/";

int iNowYear = (Integer)request.getAttribute("year");
int iNowMonth = (Integer)request.getAttribute("month");
int iNowDay = (Integer)request.getAttribute("day");


java.util.Calendar cal = java.util.Calendar.getInstance();
//년도/월 셋팅
cal.set(iNowYear, iNowMonth, 1);

int iEndDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);


//현재년월일 셋팅
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
String sTodate = formatter.format(new java.util.Date());
%>

<!DOCTYPE html>
<html>
<head>
<HEAD>
	<TITLE><spring:message code="comCopSmtSdm.Gbn.Daily"/> <spring:message code="comCopSmtSdm.title"/></TITLE>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cop/smt/sdm/dept_schdule_manage.css'/>">
	<script type="text/javaScript" language="javascript">

	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_regist_DeptSchdulManage(sDate){
		$("#schdulBgnde").val(sDate);
		$("#schdulEndde").val(sDate);
		
		var form = $('#deptSchdulManageVO',parent.document);   
		var string = form.serialize();

		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageRegist.do",
			data: string, 
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					$("#bodywrap",parent.document).html(returnData);					
				}else{ alert("ERROR!");return;} 
			},
			error: function(m,err){
				alert('m:'+m+' /err:'+err);
			},
			complete:function(){}
		});		
	}


	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_detail_DeptSchdulManage(schdulId){
		$("#schdulId").val(schdulId);
		
		var form = $('#deptSchdulManageVO',parent.document);   
		var string = form.serialize();

		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageDetail.do",
			data: string, 
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					$("#bodywrap",parent.document).html(returnData);					
				}else{ alert("ERROR!");return;} 
			},
			error: function(m,err){
				alert('m:'+m+' /err:'+err);
			},
			complete:function(){}
		});			
	}

	function fnEgovSchdulSe(setValue) {
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageDailyList.do",
			data:{
				"year": "<%=iNowYear%>",
				"month": "<%=iNowMonth%>",
				"day": "<%=iNowDay%>",
				"searchCondition": "SCHDUL_SE",
				"searchKeyword": setValue
			},		
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					$("#calendar_content").html(returnData);
				}else{ alert("ERROR!");return;} 
			},
			error: function(m,err){
				alert('m:'+m+' /err:'+err);
			},
			complete:function(){}
		});			
	}

	function fnEgovSchdulTodate() {
		var schdulSe = $("schdulSe").val();
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageDailyList.do",
			//data: string,
			data:{
				"year": "<%=sTodate.substring(0, 4)%>",
				"month": "<%=Integer.valueOf(sTodate.substring(4, 6))-1%>",
				"day": "<%=sTodate.substring(6, 8)%>",
				"searchCondition": "SCHDUL_SE",
				"searchKeyword": schdulSe
			},		
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					$("#calendar_content").html(returnData);
				}else{ alert("ERROR!");return;} 
			},
			error: function(m,err){
				alert('m:'+m+' /err:'+err);
			},
			complete:function(){}
		});	
	}
	
	function fnEgovSchdulSrc(year,month,day) {
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageDailyList.do",
			data:{
				"year": year,
				"month": month,
				"day": day,
				"searchCondition": "SCHDUL_SE",
				"searchKeyword": ""
			},		
			dataType:'html',
			timeout:(1000*30),
			
			beforeSend:function(){
				//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
			},
			success:function(returnData, status){
				if(status == "success") {
					$("#calendar_content").html(returnData);
				}else{ alert("ERROR!");return;} 
			},
			error: function(m,err){
				alert('m:'+m+' /err:'+err);
			},
			complete:function(){}
		});
	}	

	</script>
	<style TYPE="text/css">
		body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
		}

		td {font-family: "돋움"; font-size: 9pt; color:#595959;}
		th {font-family: "돋움"; font-size: 9pt; color:#000000;}
		select {font-family: "돋움"; font-size: 9pt; color:#595959;}

		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

	</style>
</HEAD>
<BODY>
<form name="deptSchdulManageVO" id="deptSchdulManageVO" action="" method="post">
<DIV id="content" style="width:712px;">
<input type="hidden" name="schdulId" id="schdulId" value="" />
<input type="hidden" name="schdulBgnde" id="schdulBgnde" value="" />
<input type="hidden" name="schdulEndde" id="schdulEndde" value="" />
<!-- 날짜 네비게이션  -->
<div class="sort_area">
	<div class="select_group">
     	<select name="schdulSe" class="select" id="schdulSe" onChange="fnEgovSchdulSe(document.deptSchdulManageVO.schdulSe.options[document.deptSchdulManageVO.schdulSe.selectedIndex].value);" title="일정구분선택">
  		   <option selected value=''>-- <spring:message code="input.cSelect" /> --</option> <!-- 선택  -->
			<c:forEach var="result" items="${schdulSe}" varStatus="status">
				<option value='${result.code}' <c:if test="${searchKeyword == result.code}">selected</c:if>>${result.codeNm}</option>
			</c:forEach>
  		</select>
	</div>
	<div class="date_view">
		<ul>
			<li><a href="javascript:fnEgovSchdulTodate();" class="today"><spring:message code="comCopSmtSdm.Navi.Today"/></a></li> <!-- 오늘 -->
			
			<li><a class="prev" onClick="fnEgovSchdulSrc('<%=iNowYear-1%>','<%=iNowMonth%>','<%=iNowDay%>');">prev</a></li>
			<li class="date"><%=iNowYear%> <spring:message code="comCopSmtSdm.Navi.Year"/> </li>  <!-- 년 -->
			<li><a class="next" onClick="fnEgovSchdulSrc('<%=iNowYear+1%>','<%=iNowMonth%>','<%=iNowDay%>');">next</a></li>
			
			<li class="date">&nbsp;</li>
			
			<%if(iNowMonth > 0 ){ %>
			<li><a class="prev" onClick="fnEgovSchdulSrc('<%=iNowYear%>','<%=iNowMonth-1%>','<%=iNowDay%>');">prev</a></li>
			<%}%>
			<li class="date"><%=iNowMonth+1%> <spring:message code="comCopSmtSdm.Navi.Month"/> </li> <!-- 월 -->
			<%if(iNowMonth < 11 ){ %>
			<li><a class="next" onClick="fnEgovSchdulSrc('<%=iNowYear%>','<%=iNowMonth+1%>','<%=iNowDay%>');">next</a></li>
			<%}%>
			<li class="date">&nbsp;</li>
			<%if(iNowDay > 1 ){ %>
			<li><a class="prev" onClick="fnEgovSchdulSrc('<%=iNowYear%>','<%=iNowMonth%>','<%=iNowDay-1%>');">prev</a></li>
			<%}%>
			<li class="date"><%=iNowDay%> <spring:message code="comCopSmtSdm.Navi.Day"/> </li> <!-- 일 -->
			<%if(iNowDay < iEndDay ){ %>
			<li><a class="next" onClick="fnEgovSchdulSrc('<%=iNowYear%>','<%=iNowMonth%>','<%=iNowDay+1%>');">next</a></li>
			<%}%>
			
		</ul>
	</div>

</div>


<div class="week_calendar">
<table class="title">
<caption><spring:message code="comCopSmtSdm.Gbn.Daily"/> <spring:message code="comCopSmtSdm.title"/></caption> <!-- 일간 부서일정관리 -->
<colgroup>
	<col style="width: 170px;">
	<col style="width:;">
	<col style="width: 100px;">
</colgroup>
<thead>
<tr>
	<th><spring:message code="comCopSmtSdm.Weekly.time"/></th> <!-- 시간 -->
	<th><spring:message code="comCopSmtSdm.Weekly.title"/></th> <!-- 제목 -->
	<th><spring:message code="comCopSmtSdm.Weekly.chargeName"/></th> <!-- 담당자 -->
</tr>
<tbody>
<%

List listResult = (List)request.getAttribute("resultList");
EgovMap egovMap = new EgovMap();
if(listResult != null){
	for(int i=0;i < listResult.size(); i++){
	egovMap = (EgovMap)listResult.get(i);
%>
  <tr>
    <td height="50px">
    <%
    out.print("<a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\">");
	out.print( ((String)egovMap.get("schdulBgnde")).substring(8,10) +"시");
	out.print( ((String)egovMap.get("schdulBgnde")).substring(10,12) +"분<br/>~ ");
	out.print( ((String)egovMap.get("schdulEndde")).substring(8,10) +"시");
	out.print( ((String)egovMap.get("schdulEndde")).substring(10,12) +"분 ");
	out.println("</a>");
    %>
    </td>
    <td style="text-align:left;padding-left:5px;">
	<%
	out.print("<a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\">");
	out.print((String)egovMap.get("schdulNm"));
	out.println("</a>");
	%>
    </td>
    <td>
    	<%=(String)egovMap.get("schdulChargerName")%>
    </td>
  </tr>

	<TR class='line'><td></td><td></td><td></td></TR>
 <%
	}
}
%>
  <c:if test="${fn:length(resultList) == 0}">
	<tr>
	    <td bgcolor="#FFFFFFFF" nowrap colspan="3" align="center" style="padding-center:2px;font-size:11px;" height="30px"><spring:message code="common.nodata.msg" /></td>
	</tr>
	<TR class='line'><td></td><td></td><td></td></TR>
  </c:if>
</tbody>
</table>
</div>


</DIV>
</form>
</BODY>
</HTML>
