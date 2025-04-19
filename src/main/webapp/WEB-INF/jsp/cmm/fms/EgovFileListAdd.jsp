<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
<script type="text/javascript">
	<!--
	function fn_egov_downFile(atchFileId, fileSn) {
		window.open("<c:url value='/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
	}

	function fn_egov_deleteImgUrlFile(atchFileId, fileSn) {
		forms = document.getElementsByTagName("form");

		for (var i = 0; i < forms.length; i++) {
			if (typeof(forms[i].atchFileId) != "undefined" && typeof(forms[i].fileSn) != "undefined" && typeof(forms[i].fileListCnt) != "undefined") {
				form = forms[i];
			}
		}
		// form = document.forms[0];
		form.atchFileId.value = atchFileId;
		form.fileSn.value = fileSn;
		form.nttId.value = "${nttId}";
		form.bbsId.value = "${bbsId}";
		form.action = "<c:url value='/cmm/fms/deleteImgUrlFileInfs.do'/>";
		form.submit();
	}

	//-->
</script>
<input type="hidden" name="imgUrl" value="<c:out value='${imgUrl}'/>">
<c:forEach var="fileVO" items="${fileList}" varStatus="status">
	<c:choose>
		<c:when test="${updateFlag=='Y'}">
			<c:out value="${fileVO.orignlFileNm}"/>&nbsp;
			<span>[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]</span>
			<input type="button" value="삭제" onClick="fn_egov_deleteImgUrlFile('<c:out value="${atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>');">
		</c:when>
		<c:otherwise>
			<a href="#LINK" onclick="javascript:fn_egov_downFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')">
				<c:out value="${fileVO.orignlFileNm}"/>
			</a>
			&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
		</c:otherwise>
	</c:choose>
	<div style="padding: 3px;"></div>
</c:forEach>

<c:if test="${fn:length(fileList) == 0}">
</c:if>