<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
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
	<link rel="preload" href="<c:url value='/'/>css/board.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

	<!-- Document Title
    ============================================= -->
	<title>IBK시스템 AI 아이디어 챌린지</title>

	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

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
								<span class="rating-avg">4.5</span> /5
							</div>
							<div>
								<div class="star-rating" data-rating="4">
									<span class="star" data-value="1">&#9733;</span>
									<span class="star" data-value="2">&#9733;</span>
									<span class="star" data-value="3">&#9733;</span>
									<span class="star" data-value="4">&#9733;</span>
									<span class="star" data-value="5">&#9733;</span>
								</div>
								<div class="rating-cnt">
									평가 100개
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
					<div class="board_view_content_con">
						<c:out value="${result.nttCn}" escapeXml="false" />
					</div>
					<!--평가하기-->
					<div class="vote-con">
						<div class="vote-inner">
							<div class="vote-left-inner">
								<div class="vote-title">평가 평점</div>
								<div class="vote-info">
									<div class="star-rating" data-rating="4">
										<span class="star" data-value="1">&#9733;</span>
										<span class="star" data-value="2">&#9733;</span>
										<span class="star" data-value="3">&#9733;</span>
										<span class="star" data-value="4">&#9733;</span>
										<span class="star" data-value="5">&#9733;</span>
									</div>
									<div class="vote-rating">
										<div class="rating-value">
											<span class="rating-avg">4.5</span> /5
										</div>
										<div class="rating-cnt">
											(평가 100개)
										</div>
									</div>
								</div>
							</div>
							<div class="vote-right-inner">
								<div class="vote-title">평가하기 <span>(별점을 눌러 평가해주세요.)</span></div>
								<div class="star-rating" data-rating="0" data-editable="true">
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
						</div>
					</div>
					<div class="comment-con">
						<div class="comment-top-con">
							<div class="comment-top-title">
								댓글(000건)
							</div>
							<form class="comment-input-con">
								<textarea name="" id="" cols="30" rows="4" placeholder="응원의 댓글을 남겨주세요!"></textarea>
								<input type="submit" value="등록" />
							</form>
						</div>
						<div class="comment-list-con" id="resultArea">
							<div class="comment-list">
								<div class="comment-info">
									<div class="mem-info-img">
										<img src="" alt=""> <!--그룹웨어 이미지-->
									</div>
									<div>
										<div class="comment-name">
											권승주 과장
										</div>
										<div class="comment-department">
											(디지털사업기획팀)
										</div>

									</div>
									<div class="comment-date">
										2025.04.09 PM 03:00:00
									</div>
								</div>
								<div class="comment-text">
									공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다.
									공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다.
									공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다.
									공모전 댓글 내용입니다. 공모전 댓글 내용입니다.
								</div>
							</div>
							<div class="comment-list">
								<div class="comment-info">
									<div class="mem-info-img">
										<img src="" alt=""> <!--그룹웨어 이미지-->
									</div>
									<div>
										<div class="comment-name">
											권승주 과장
										</div>
										<div class="comment-department">
											(디지털사업기획팀)
										</div>

									</div>
									<div class="comment-date">
										2025.04.09 PM 03:00:00
									</div>
								</div>
								<div class="comment-text">
									공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다.
									공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다.
									공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다. 공모전 댓글 내용입니다.
									공모전 댓글 내용입니다. 공모전 댓글 내용입니다.
								</div>
							</div>
						</div>
						<div class="more-comment-btn-con">
							<button class="more-comment-btn" id="moreBtn">
								댓글 10개 더 보기
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40"
									 fill="none">
									<path d="M20 25.6664L10 15.6664L11.9721 13.6943L20 21.7218L28.0279 13.6943L30 15.6664L20 25.6664Z"
										  fill="#4881DE"/>
								</svg>
							</button>
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
					postId: 123,
					lastCommentId: getLastCommentId()
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



	});
</script>

</body>
</html>