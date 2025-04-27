<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<c:if test="${resultCnt > 0}">
	<div id="flag">200</div>
</c:if>
<c:if test="${resultCnt < 1}">
	<div id="flag">400</div>
</c:if>
<div id="content">
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<div class="comment-list" data-comment-id="<c:out value='${result.answerNo}'/>">
		<div class="comment-info">
			<div class="mem-info-img">
				<c:if test="${empty result.imgUrl}">
					<img src="" alt=""><!-- 대표 이미지1 -->
				</c:if>
				<c:if test="${not empty result.imgUrl}">
					<img src="<c:out value="${result.imgUrl}" />" alt=""><!-- 대표 이미지2 -->
				</c:if>
			</div>
			<div class="comment-detail-info">
				<div>
					<div class="comment-name">
						<c:out value='${result.ntcrNm}'/> <c:out value='${result.titleNm}'/>
					</div>
					<div class="comment-department">
						<c:if test="${not empty result.teamNm}">
							(<c:out value='${result.teamNm}'/>)
						</c:if>
					</div>
				</div>
				<div class="comment-date">
					<c:out value="${fn:replace(result.frstRegisterPnttm, '-', '.')}" />
				</div>
			</div>
			<div class="comment-util-btn">
				<%
					LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
					if (loginVO != null){
				%>
				<c:set var="chkId" value="<%= loginVO.getId()%>"/>
				<c:if test="${chkId == result.ntcrId}">
				<span class="btn-edit"><img src="/images/icon-edit.png" alt="수정"></span>
				<span class="btn-delete"><img src="/images/icon-trash.png" alt="삭제"></span>
				</c:if>
				<%  } %>
			</div>
		</div>
		<div class="comment-text">
			<c:out value='${result.answer}' escapeXml="false"/>
		</div>
	</div>
	</c:forEach>
</div>