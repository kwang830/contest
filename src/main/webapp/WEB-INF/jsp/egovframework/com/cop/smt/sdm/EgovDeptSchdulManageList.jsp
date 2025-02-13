<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="pageTitle"><spring:message code="comCopSmtSdm.title"/></c:set>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cop/smt/sdm/dept_schdule_manage.css'/>">
<script type="text/javaScript" language="javascript">

/* ********************************************************
* 등록 처리 함수
******************************************************** */
function fnInit(){
	fn_egov_main_tab("tabMonth");
}

function fn_egov_main_tab(objName) {
	document.getElementById("tabMonth").className = "";
	document.getElementById("tabWeek").className = "";
	document.getElementById("tabDay").className = "";
	
	document.getElementById(objName).className = "on";
	
	var ajax_url = "";
	if(objName == 'tabMonth'){
		ajax_url = "<c:url value='/cop/smt/sdm/EgovDeptSchdulManageMonthList.do' />";
	}else if(objName == 'tabWeek'){
		ajax_url = "<c:url value='/cop/smt/sdm/EgovDeptSchdulManageWeekList.do' />";
	}else if(objName == 'tabDay'){
		ajax_url = "<c:url value='/cop/smt/sdm/EgovDeptSchdulManageDailyList.do' />";
	}
		
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}"+ajax_url,
		data: "", 
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
$(function(){
	fnInit();
});
</script>

<div class="calendar">
	<h2>[>] ${pageTitle} <spring:message code="title.list" /></h2>

	<div class="sort_area_top">
	<div class="view_type_top">
		<ul>
			<li><a href="javascript:fn_egov_main_tab('tabMonth');" id="tabMonth"><spring:message code="comCopSmtSdm.Gbn.Monthly" /></a></li><!-- 월간 -->
			<li><a href="javascript:fn_egov_main_tab('tabWeek');" id="tabWeek"><spring:message code="comCopSmtSdm.Gbn.Weekly" /></a></li><!-- 주간 -->
			<li><a href="javascript:fn_egov_main_tab('tabDay');" id="tabDay"><spring:message code="comCopSmtSdm.Gbn.Daily" /></a></li><!-- 일간 -->
			</ul>
		</div>
	</div>

	<div id="calendar_content">달력표시</div>
</div>


