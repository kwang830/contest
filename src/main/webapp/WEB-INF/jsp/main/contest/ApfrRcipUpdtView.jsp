<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<link rel="preload" href="<c:url value='/'/>css/form.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

	<!-- Document Title
	============================================= -->
	<title>IBK시스템 AI 아이디어 챌린지</title>

	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico">

	<script type="text/javascript">
		<!--
		function fn_egov_downFile(atchFileId, fileSn) {
			window.open("/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"&authPass=yes");
		}

		function fn_contest_attach_file_down() {
			// 공모전 참가 신청서
			fn_egov_downFile('EcqfhYxRcnWG52hkOGYp/F3suq/5SFOvAnxJUaQhI01X9dgmJjJ+3mWoSYu1PsdTs4dfuDM2VdFX2fN3C0X4iQ==','0');
		}
		//-->
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
						작품접수
					</div>
				</div>
			</div>
			<nav class="nav-menu">
				<div class="container">
					<!-- 홈 아이콘 -->
					<div class="nav-item home">
						<a href="/"><img src="/images/icon-home.png" alt="홈"/></a>
					</div>

					<!-- 1depth 메뉴 항목 -->
					<div class="nav-item has-dropdown">
						<button class="nav-button">작품접수 <span class="nav-toggle"></span></button>
					</div>
				</div>
			</nav>
		</div>
		<div class="content-wrap">
			<div class="form-wrap">
				<div class="container" style="max-width: 800px;">
					<form action="" class="form-con" id="form">
						<div class="form-list-con">
							<div class="form-list">
								<div class="form-title essential">팀명</div>
								<div class="form-input">
									<input name="name" type="text" placeholder="팀명을 입력해주세요.">
								</div>
								<div class="form-error-text" style="display: none;"></div>
							</div>
							<div class="form-list">
								<div class="form-title essential">제목</div>
								<div class="form-input">
									<input name="title" type="text" placeholder="제목을 입력해주세요.">
								</div>
								<div class="form-error-text" style="display: none;"></div>
							</div>
							<div class="form-list">
								<div class="form-title">접수자</div>
								<div class="form-input">
									<input name="writer" type="text" placeholder="접수자를 입력해주세요.">
								</div>
								<div class="form-error-text" style="display: none;"></div>
							</div>
							<div class="form-list">
								<div class="form-title essential">내용</div>
								<div class="form-input">
									<textarea name="content" cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea>
								</div>
								<div class="form-error-text" style="display: none;"></div>
							</div>
							<div class="form-list">
								<div class="form-title essential">첨부파일</div>

								<div class="form-input f_file_wrap">
									<div class="board_attach2" id="file_upload_posbl">
										<input type="file" name="file_2" >
										<input type="file" name="file_1" style="position: absolute; left: -1000px; top: -1000px; display: none; visibility: hidden; width: 0px; height: 0px; overflow: hidden;">
										<input name="file_0" id="egovComFileUploader" type="file" style="position: absolute; left: -1000px; top: -1000px; display: none; visibility: hidden; width: 0px; height: 0px; overflow: hidden;">
										<div id="egovComFileList">
											<div>
												C:\fakepath\icon-logout.png
												<input type="button" value="Delete">
											</div>
											<div>C:\fakepath\default-mem-img.jpg
												<input type="button" value="Delete">
											</div>
										</div>
									</div>
									<div class="board_attach2" id="file_upload_imposbl">
									</div>

									<input type="hidden" id="fileListCnt" name="fileListCnt" value="0">

								</div>
							</div>
							<div class="form-list">
								<div class="form-title">프로필 이미지 <span>(개인신상을 알아볼 수 있는 사진은 첨부 불가, 100*100px 정사각형 사이즈 )</span></div>
								<div class="form-input f_file_wrap">
									<div class="board_attach2" id="file_upload_posbl">
										<input type="file" name="file_2" >
										<input type="file" name="file_1" style="position: absolute; left: -1000px; top: -1000px; display: none; visibility: hidden; width: 0px; height: 0px; overflow: hidden;">
										<input name="file_0" id="egovComFileUploader" type="file" style="position: absolute; left: -1000px; top: -1000px; display: none; visibility: hidden; width: 0px; height: 0px; overflow: hidden;">
										<div id="egovComFileList">
											<div>
												C:\fakepath\icon-logout.png
												<input type="button" value="Delete">
											</div>
										</div>
									</div>
									<div class="board_attach2" id="file_upload_imposbl">
									</div>

									<input type="hidden" id="fileListCnt" name="fileListCnt" value="0">

								</div>
							</div>
						</div>
						<div class="form-btn-con">
							<button type="submit" class="submit-btn">제출</button>
						</div>
					</form>
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

</body>
</html>