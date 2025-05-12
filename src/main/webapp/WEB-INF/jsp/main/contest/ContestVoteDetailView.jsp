<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

	<!-- preload -->
	<link rel="preload" href="<c:url value='/'/>css/reset.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/responsive.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/font-icons.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="preload" href="<c:url value='/'/>css/sub.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
	<link rel="stylesheet" href="<c:url value='/'/>css/sub-ios.css" type="text/css" media="all" />
	<link rel="preload" href="<c:url value='/'/>css/board.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

	<!-- Document Title
    ============================================= -->
	<title>IBK시스템 AI 아이디어 챌린지</title>

	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">
	<script type="text/javascript">
		function fn_vote_score_update(score) {
			if(score){
				// console.log('score:'+score);
				let sMsg = "평가를 저장하시겠습니까?"
				if (confirm(sMsg)) {
					document.vote.action = "<c:url value='/cmm/contest/contestVoteScoreUpdt.do'/>";
					document.vote.submit();
				}
			}
		}

		function fn_insert_cmt() {
			const answer = document.getElementById('answer').value.trim();
			if (answer === '') {
				alert('응원의 댓글을 입력해 주세요!');
				document.getElementById('answer').focus();
				return;
			}
			if (confirm('<spring:message code="common.regist.msg" />')) {
				//document.comment.onsubmit();
				document.comment.action = "<c:url value='/cmm/contest/insertContestCmt.do'/>";
				document.comment.submit();
			}
		}

		function fn_delete_cmt() {
			if (confirm('<spring:message code="common.delete.msg" />')) {
				//document.comment.onsubmit();
				document.comment.action = "<c:url value='/cmm/contest/insertContestCmt.do'/>";
				document.comment.submit();
			}
		}
	</script>
</head>

<body class="stretched">

<!-- Document Wrapper
============================================= -->
<div id="wrapper" class="clearfix">

	<!-- header start -->
	<c:import url="/sym/mms/ContHeader.do" />
	<!-- //header end -->

	<!-- Content
            ============================================= -->
	<section id="content">
		<div class="sub-layout">
			<div class="sub-banner">
				<div class="container">
					<div class="sub-banner-title">
						공모전 투표
					</div>
				</div>
			</div>
			<nav class="nav-menu">
				<div class="container">
					<!-- Left menu -->
					<c:import url="/sym/mms/ContMenuLeft.do" />
					<!--// Left menu -->
				</div>
			</nav>
		</div>
		<div class="content-wrap">
			<div class="container clearfix">
				<div class="board_view">
					<div class="board_view_top_con">
						<div class="board_view_top_inner">
							<!-- 관리자가 작성한 경우 mem-info-img display:none 처리 or src 안넣으면 기본이미지로 노출 -->
							<div class="mem-info-img">
								<c:if test="${empty result.imgUrl}">
									<img src="" alt=""><!-- 대표 이미지 -->
								</c:if>
								<c:if test="${not empty result.imgUrl}">
									<img src="<c:url value='/cmm/fms/getImage.do?atchFileId=${egovc:encrypt(result.imgUrl)}&fileSn=0'/>" alt=""><!-- 대표 이미지 -->
								</c:if>
							</div>
							<div>
								<div class="board_view_title">
									<c:out value="${result.nttSj}" escapeXml="false" />
								</div>
								<div class="board_view_info_con">
									<div class="board_view_info">
										<div class="view_info_title">팀명</div>
										<div class="view_info_desc"><c:out value="${result.teamNm}" escapeXml="false" /></div>
									</div>
									<div class="board_view_info">
										<div class="view_info_title">등록일</div>
										<div class="view_info_desc"><c:out value="${fn:replace(result.frstRegisterPnttm, '-', '.')}" escapeXml="false" /></div>
									</div>
									<div class="board_view_info">
										<div class="view_info_title">조회수</div>
										<div class="view_info_desc"><c:out value="${result.inqireCo}"/></div>
									</div>
								</div>
							</div>
						</div>
						<div class="board_view_avg_con">
							<div class="rating-value">
								<span class="rating-avg"><c:out value="${result.scoreA}" default="0" /></span> /5
							</div>
							<div>
								<div class="star-rating" data-rating="<fmt:formatNumber value="${result.scoreA}" pattern="#0" />">
									<span class="star" data-value="1">&#9733;</span>
									<span class="star" data-value="2">&#9733;</span>
									<span class="star" data-value="3">&#9733;</span>
									<span class="star" data-value="4">&#9733;</span>
									<span class="star" data-value="5">&#9733;</span>
								</div>
								<div class="rating-cnt">
									평가 <c:out value="${result.scoreCnt}" default="0" />개
								</div>
							</div>
						</div>
					</div>
					<c:if test="${result.atchFileId != ''}">
						<div class="board_view_file_con">
							<img src="/images/icon-attachment.png" alt="" style="width: 24px;">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${egovc:encrypt(result.atchFileId)}" />
							</c:import>
						</div>
					</c:if>
					<div class="board_view_content_con" style="white-space: pre-line;">
						<c:out value="${result.nttCn}" escapeXml="false"/>
					</div>
					<!--평가하기-->
					<div class="vote-con">
						<div class="vote-inner">
							<div class="vote-left-inner">
								<div class="vote-title">평가 평점</div>
								<div class="vote-info">
									<div class="star-rating" data-rating="<fmt:formatNumber value="${result.scoreA}" pattern="#0" />">
										<span class="star" data-value="1">&#9733;</span>
										<span class="star" data-value="2">&#9733;</span>
										<span class="star" data-value="3">&#9733;</span>
										<span class="star" data-value="4">&#9733;</span>
										<span class="star" data-value="5">&#9733;</span>
									</div>
									<div class="vote-rating">
										<div class="rating-value">
											<span class="rating-avg"><c:out value="${result.scoreA}" default="0" /></span> /5
										</div>
										<div class="rating-cnt">
											(평가 <c:out value="${result.scoreCnt}" default="0" />개)
										</div>
									</div>
								</div>
							</div>
							<div class="vote-right-inner">
								<div class="vote-title">평가하기 <span>(별점을 눌러 평가해주세요.)</span></div>
								<div class="star-rating" data-rating="<c:out value="${result.score}" default="0" />" data-editable="true">
									<span class="star" data-value="1">&#9733;</span>
									<span class="star" data-value="2">&#9733;</span>
									<span class="star" data-value="3">&#9733;</span>
									<span class="star" data-value="4">&#9733;</span>
									<span class="star" data-value="5">&#9733;</span>
								</div>
								<div class="vote-btn">
									평가하기
								</div>
							</div>
							<form:form modelAttribute="vote" name="vote" method="post" >
								<input type="hidden" name="score" id="score" value="" />
								<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
								<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
							</form:form>
						</div>
					</div>

					<!--평가하기 관리자-->
					<div class="vote-con">
						<div class="vote-inner">
							<div class="vote-left-inner">
								<div class="vote-title">평가 평점</div>
								<div class="vote-info">
									<div class="star-rating" data-rating="<fmt:formatNumber value="${result.scoreA}" pattern="#0" />">
										<span class="star" data-value="1">&#9733;</span>
										<span class="star" data-value="2">&#9733;</span>
										<span class="star" data-value="3">&#9733;</span>
										<span class="star" data-value="4">&#9733;</span>
										<span class="star" data-value="5">&#9733;</span>
									</div>
									<div class="vote-rating">
										<div class="rating-value">
											<span class="rating-avg"><c:out value="${result.scoreA}" default="0" /></span> /5
										</div>
										<div class="rating-cnt">
											(평가 <c:out value="${result.scoreCnt}" default="0" />개)
										</div>
									</div>
								</div>
							</div>
							<div class="vote-right-inner">
								<div class="vote-chart-con">
								</div>
							</div>
						</div>
					</div>

					<div class="comment-con">
						<div class="comment-top-con">
							<div class="comment-top-title">
								댓글(<c:out value="${result.commentCnt}" default="0" />건)
							</div>
							<form class="comment-input-con" name="comment" method="post">
								<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
								<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
								<input type="hidden" name="answerNo" value="0" />
								<input type="hidden" name="useAt" value="Y" />
								<textarea name="answer" id="answer" cols="30" rows="4" placeholder="응원의 댓글을 남겨주세요!"></textarea>
								<input type="submit" value="등록" onclick="javascript:fn_insert_cmt(); return false;"/>
							</form>
						</div>
						<div class="comment-list-con" id="resultArea">
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
						<div class="more-comment-btn-con">
							<c:if test="${resultCnt > 10}">
								<button class="more-comment-btn" id="moreBtn">
									댓글 10개 더 보기
									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40"
										 fill="none">
										<path d="M20 25.6664L10 15.6664L11.9721 13.6943L20 21.7218L28.0279 13.6943L30 15.6664L20 25.6664Z"
											  fill="#4881DE"/>
									</svg>
								</button>
							</c:if>
						</div>
					</div>
				</div>

				<div class="board_view_bot">
					<div class="left_col">
						<a href="/cmm/contest/contestVote.do" class="btn btn_gray_46">목록</a>
					</div>
					<div class="center_col"></div>
					<div class="right_col">
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- footer 시작 -->
	<c:import url="/sym/mms/ContFooter.do" />
	<!-- //footer 끝 -->

</div><!-- #wrapper end -->

<!-- Go To Top
============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>

<!-- External JavaScripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/plugins.js"></script>

<script type="text/javascript" src="<c:url value='/'/>js/common.js"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

<script>
	$(document).ready(function() {
		$('#moreBtn').click(function () {
			$.ajax({
				url: '/cmm/contest/contestVoteCmt.do',
				type: 'POST',
				data: {
					nttId: '<c:out value='${result.nttId}'/>',
					bbsId: '<c:out value='${result.bbsId}'/>',
					AnswerNo: getLastCommentId()
				},
				success: function (response) {
					// response를 임시 DOM에 삽입하여 파싱
					let temp = $('<div>').html(response);
					let flag = temp.find('#flag').text().trim();

					if (flag === '200') {
						let contentHtml = temp.find('#content').html();
						$('#resultArea').append(contentHtml);
					} else if (flag === '400') {
						alert('더 이상 불러올 댓글이 없습니다.');
						$('#moreBtn').hide();
					} else {
						console.warn('알 수 없는 응답입니다.');
					}
				},
				error: function () {
					alert('댓글을 불러오는 중 오류가 발생했습니다.');
				}
			});
		});

		function getLastCommentId() {
			return $('#resultArea .comment-list').last().data('comment-id') || 0;
		}

		document.querySelector('.vote-btn').addEventListener('click', function() {
			const editableRating = document.querySelector('.star-rating[data-editable="true"]');
			const selectedRating = editableRating.getAttribute('data-rating');  // 현재 선택된 별점 값을 가져옴

			// rating-value 입력 필드에 값을 넣어줌
			document.getElementById('score').value = selectedRating;
			fn_vote_score_update(selectedRating);
		});


	});
</script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		document.getElementById('content').addEventListener('click', function(e) {
			if (e.target.closest('.btn-edit')) {
				var btn = e.target.closest('.btn-edit');
				var commentList = btn.closest('.comment-list');

				var commentId = commentList.getAttribute('data-comment-id');
				var commentText = commentList.querySelector('.comment-text').innerText.trim();

				document.querySelector('input[name="answerNo"]').value = commentId;
				document.querySelector('textarea[name="answer"]').value = commentText;
				document.querySelector('textarea[name="answer"]').focus();

				// 버튼 글씨를 '수정'으로 변경
				document.querySelector('input[type="submit"]').value = '수정';

			}

			if (e.target.closest('.btn-delete')) {
				var btn = e.target.closest('.btn-delete');
				var commentList = btn.closest('.comment-list');

				var commentId = commentList.getAttribute('data-comment-id');
				var commentText = commentList.querySelector('.comment-text').innerText.trim();

				document.querySelector('input[name="answerNo"]').value = commentId;
				document.querySelector('textarea[name="answer"]').value = commentText;
				document.querySelector('input[name="useAt"]').value = "N";

				fn_delete_cmt();

			}
		});
	});
</script>

<script>
	$(function () {
		const voteData = [
			{score: 5, count: 15},
			{score: 4, count: 25},
			{score: 3, count: 50},
			{score: 2, count: 10},
			{score: 1, count: 0}
		];

		const total = voteData.reduce((sum, v) => sum + v.count, 0);
		const maxCount = Math.max(...voteData.map(v => v.count));

		const $container = $('.vote-chart-con');
		let html = '';
		for (let i = 0; i < voteData.length; i++) {
			const v = voteData[i];
			const percent = (v.count / total) * 100;
			const isTop = (v.count === maxCount) ? ' top' : '';

			html +=
					'<div class="vote-chart-box' + isTop + '">' +
					'<div class="vote-cnt">' + v.count + '</div>' +
					'<div class="vote-chart">' +
					'<span class="vote-bar" data-percent="'+percent+'"></span>' +
					'</div>' +
					'<div class="vote-score">' + v.score + '점</div>' +
					'</div>';
		}
		$container.html(html);

		setTimeout(() => {
			document.querySelectorAll('.vote-bar').forEach(bar => {
				const percent = bar.getAttribute('data-percent');
				bar.style.height = percent + '%';
			});
		}, 50);
	})

</script>
</body>
</html>