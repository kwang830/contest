<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css"-->

<script type="text/javascript">

	function fn_egov_downFile(atchFileId, fileSn){
		window.open("<c:url value='/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
	}

	function fn_egov_deleteFile(atchFileId, fileSn, delTrName) {
		
		//console.log('atchFileId:'+atchFileId);
		//console.log('fileSn:'+fileSn);
		//console.log('delTrName:'+delTrName);
				
	 	$.ajax({
	 		type:"POST",
	 		url:"${pageContext.request.contextPath}/cmm/fms/deleteFileInfs.do",
			data:{
				"atchFileId": atchFileId,
				"fileSn": fileSn
			},
	 		dataType:'html',
	 		timeout:(1000*30),
	 		
	 		beforeSend:function(){
	 			//alert('<c:url value='/uss/umt/EgovMberManage.do' />');
	 		},
	 		success:function(returnData, status){
	 			if(status == "success") {
	 				$("#"+delTrName).remove();
	 			}else{ alert("ERROR!");return;} 
	 		},
	 		error: function(m,err){
	 			alert('m:'+m+' /err:'+err);
	 		},
	 		complete:function(){}
	 	});
	}

	function fn_egov_check_file(flag) {
		if (flag=="Y") {
			document.getElementById('file_upload_posbl').style.display = "block";
			document.getElementById('file_upload_imposbl').style.display = "none";
		} else {
			document.getElementById('file_upload_posbl').style.display = "none";
			document.getElementById('file_upload_imposbl').style.display = "block";
		}
	}
</script>

<!-- <form name="fileForm" action="" method="post" >  -->
<input type="hidden" name="atchFileId" value="${atchFileId}">
<input type="hidden" name="fileSn" >
<input type="hidden" name="fileListCnt" id="fileListCnt" value="${fileListCnt}">
<c:set var="fileCount" value="${fn:length(fileList) }" />
<!-- </form>  -->

<!--<title>파일목록</title> -->

	<table id="egov_file_view_table" style="border:0px solid #666;">
		<c:forEach var="fileVO" items="${fileList}" varStatus="status">
		<tr id="egov_file_view_table_tr_${status.count}">
			<td style="border:0px solid #666;text-align:left;padding:0 0 0 0;margin:0 0 0 0;" height="22">
			<c:choose>
				<c:when test="${updateFlag eq 'Y'}">
					<a href="javascript:fn_egov_downFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')">
					<c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
					</a>
					<img src="<c:url value='/images/egovframework/com/cmm/btn/btn_del.png' />" class="cursor" onClick="fn_egov_deleteFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>','egov_file_view_table_tr_${status.count}');" alt="<spring:message code="title.attachedFileDelete" />">
				</c:when>
				<c:otherwise>
					<a href="javascript:fn_egov_downFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')">
					<c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
					</a>
				</c:otherwise>
			
			</c:choose>
			</td>
		</tr>
		</c:forEach>
		<c:if test="${fn:length(fileList) == 0}">
			<tr>
				<td style="border:0px solid #666;padding:0 0 0 0;margin:0 0 0 0;"></td>
			</tr>
	    </c:if>
	</table>
<c:if test="${updateFlag eq 'Y'}">
<div style="display:;"><iframe name="iframe_egov_file_delete" id="iframe_egov_file_delete" src=""></iframe></div>

<script type="text/javaScript">
/*
multi_selector.update_count = <c:out value="${fileCount}"/>;
var _multi_selector;
function fn_egov_multi_selector_update_setting(multi_selector){
	_multi_selector = multi_selector;
	multi_selector.update_count = <c:out value="${fileCount}"/>;
}
function fn_egov_multi_selector_update_delete(){
	_multi_selector.update_count = _multi_selector.update_count -1;
	//alert(_multi_selector.update_count);
}
*/
/*
window.addEventListener('load', function(){
	multi_selector.update_count = <c:out value="${fileCount}"/>;
});
*/
</script>
</c:if>
