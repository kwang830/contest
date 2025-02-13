<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:if test="${type == 'body'}">
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!-- 댓글 내용  -->
	<c:set var="replyTitle"><spring:message code="comCopCmt.articleCommentVO.title"/></c:set>
	<h3>${replyTitle} <c:out value="${resultCnt}"/></h3>
	<div class="reply">
		<ul>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<li>
				
				<div class="top<c:if test="${boardMasterVO.bbsId == 'BBSMSTR_000000000001' && ( result.positionCode == 'A01' || result.positionCode == 'A02' || result.positionCode == 'A03') }"> topclass</c:if>">

					<strong><c:out value="${result.wrterNm}" /></strong>
						<c:if test="${(boardMasterVO.bbsId == 'BBSMSTR_000000000001' || boardMasterVO.bbsId == 'BBSMSTR_000000000021')  && result.titleNm != '' }">
						&nbsp;<c:out value="${result.titleNm}" />&nbsp;(<c:out value="${result.deptNmS}" />)
						</c:if>
					<span class="bar">|</span>
					<c:if test="${boardMasterVO.bbsId == 'BBSMSTR_000000000001' && (result.wrterId == sessionUniqId || sessionUserSe == 'USR') }">
						<c:choose>
							<c:when test="${result.scoreNum == '1' }">
								평가:&nbsp;
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
							</c:when>
							<c:when test="${result.scoreNum == '2' }">
								평가:&nbsp;
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
							</c:when>
							<c:when test="${result.scoreNum == '3' }">
								평가:&nbsp;
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
							</c:when>
							<c:when test="${result.scoreNum == '4' }">
								평가:&nbsp;
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
							</c:when>
							<c:when test="${result.scoreNum == '5' }">
								평가:&nbsp;
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_1.png" class="reply_star">
								<img src="/images/btn/star_1.png" class="reply_star">
							</c:when>
							<c:otherwise>
								평가:&nbsp;
								<img src="/images/btn/star_0.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
								<img src="/images/btn/star_0.png" class="reply_star">
							</c:otherwise>
						</c:choose>
						<c:if test="${result.picksAt == 'Y'}">
							&nbsp;<img src="/images/btn/checker-on.svg" class="reply_star">&nbsp;<label for="checker1">추천</label>
						</c:if>
					
					</c:if>
					<span class="date"><c:out value="${result.frstRegisterPnttm}" /></span>
				</div>
				<p class="txt">
					<c:out value="${fn:replace(result.commentCn , crlf , '<br/>')}" escapeXml="false" />
				</p>
				<div class="bottom">
					<c:if test="${result.wrterId == sessionUniqId}">
					<span class="btn_s"><a href="javascript:fn_egov_selectCommentForupdt(${result.commentNo})"  title="<spring:message code="button.update" /> <spring:message code="input.button" />"><spring:message code="button.update" /> </a></span>&nbsp;
					<span class="btn_s"><a href="javascript:fn_egov_deleteCommentList(${result.commentNo})"  title="<spring:message code="button.delete" /> <spring:message code="input.button" />"><spring:message code="button.delete" /></a></span>
					</c:if>
				</div>
			</li>
			</c:forEach>
			<c:if test="${fn:length(resultList) == 0}">
			<li>
		  		<p class="txt"><spring:message code="common.nocomment.msg" /></p>
	  		</li>
			 </c:if>
		</ul>
	</div>
	
	<!-- paging navigation -->
		<div class="paging">
			<ul>
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_commentList"/>
			</ul>
		</div>
		
	<form:form commandName="articleCommentVO" name="articleCommentVO" action="${pageContext.request.contextPath}/cop/cmt/insertArticleComment.do" method="post" onSubmit="fn_egov_insert_commentList(); return false;" style="float:left; clear:both;">
	<div class="wTableFrm" >
<c:if test="${boardMasterVO.bbsId != 'BBSMSTR_000000000001'}">
	<table class="board_list top_line">
		<caption>${replyTitle } <spring:message code="title.create" /></caption>
		<colgroup>
			<col style="width: 16%;"><col style="width: ;">
		</colgroup>
		<tbody>
			<!-- 댓글 내용  -->
			<c:set var="title"><spring:message code="comCopCmt.articleCommentVO.commentCn"/> </c:set>
			<tr>
				<th><label for="commentCn">${title } <span class="pilsu">*</span></label></th>
				<td class="nopd">
					<form:textarea path="commentCn" title="${title} ${inputTxt}" cols="300" rows="20" cssClass="re_txt"/>   
					<div><form:errors path="commentCn" cssClass="error" /></div>
					<c:choose>
						<c:when test="${searchVO.commentNo == '' }">
							<span style="float:left;"><a href="javascript:fn_egov_insert_commentList(); " class="btn_s re_btn" title="<spring:message code="button.comment" /> <spring:message code="input.button" />"><spring:message code="button.comment" /><spring:message code="button.create" /></a></span>
						</c:when>
						<c:otherwise>
							<span style="float:left;"><a href="javascript:fn_egov_updt_commentList(); " class="btn_s re_btn"title="<spring:message code="button.update" /> <spring:message code="input.button" />"><spring:message code="button.comment" /><spring:message code="button.update" /></a></span>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
</c:if>
<c:if test="${boardMasterVO.bbsId == 'BBSMSTR_000000000001'}">
<c:choose>
	<c:when test="${searchVO.commentNo != '' || writeCnt == 0 }">	
	<table class="board_list top_line">
		<caption>${replyTitle } <spring:message code="title.create" /></caption>
		<colgroup>
			<col style="width: 16%;"><col style="width: ;">
		</colgroup>
		<tbody>
			<!-- 댓글 내용  -->
			<tr>
				<th>추천 및 평가<span class="pilsu">*</span></th>
				<td class="left">
					<c:set var="title">평가점수</c:set>
					추천&nbsp;<input type="checkbox" name="checker" id="checker1"><label for="checker1">체크</label>&nbsp;/&nbsp;
					
					<form:select path="scoreNum" id="scoreNum" title="${title} ${inputSelect}">
						<form:option value="0" label="- 선택하세요 -"/>
						<form:options items="${score_result}" itemValue="code" itemLabel="codeNm"/>
					</form:select>
					<span class="pilsu">* 선택하신 점수는 공모전 평가에 반영 됩니다.</span>
					<div><form:errors path="scoreNum" cssClass="error"/></div>
				</td>
			</tr>			
			<c:set var="title"><spring:message code="comCopCmt.articleCommentVO.commentCn"/> </c:set>
			<tr>
				<th><label for="commentCn">${title }</label></th>
				<td class="nopd">
					<form:textarea path="commentCn" title="${title} ${inputTxt}" cols="300" rows="20" cssClass="re_txt"/>   
					<div><form:errors path="commentCn" cssClass="error" /></div>
					<c:choose>
						<c:when test="${searchVO.commentNo == '' }">
							<span style="float:left;"><a href="javascript:fn_egov_insert_commentList(); " class="btn_s re_btn" title="<spring:message code="button.comment" /> <spring:message code="input.button" />"><spring:message code="button.comment" /><spring:message code="button.create" /></a></span>
						</c:when>
						<c:otherwise>
							<span style="float:left;"><a href="javascript:fn_egov_updt_commentList(); " class="btn_s re_btn"title="<spring:message code="button.update" /> <spring:message code="input.button" />"><spring:message code="button.comment" /><spring:message code="button.update" /></a></span>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
	</c:when>
    <c:otherwise>
	<table class="board_list top_line">
		<caption>${replyTitle } <spring:message code="title.create" /></caption>
		<colgroup>
			<col style="width: 100%;">
		</colgroup>
		<tbody>
			<tr>
				<td>
					<img src="/images/main/no_reply.png" class="no_reply">
				</td>
			</tr>
			
		</tbody>
	</table>
	</c:otherwise>
</c:choose>	
</c:if>
	</div>
	<input name="subPageIndex" type="hidden" value="<c:out value='${searchVO.subPageIndex}'/>">
	<input name="commentNo" type="hidden" value="<c:out value='${searchVO.commentNo}'/>">
	<input name="modified" type="hidden" value="false">
	<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
	<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
	<input name="picksAt" type="hidden" value="<c:out value="${articleCommentVO.picksAt}" />">
	</form:form>
	
</c:if>
<c:if test="${searchVO.commentNo != ''}">
<script type='text/javaScript'>
document.getElementById("commentCn").focus();

if($("input[name='picksAt']").val()=="Y"){
	$("input[name='checker']").prop("checked", true)
}


</script>
</c:if>
