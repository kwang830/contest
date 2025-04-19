<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
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

	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css" type="text/css">

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

	<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
	<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
	<validator:javascript formName="contboard" staticJavascript="false" xhtml="true" cdata="false"/>
	<script type="text/javascript">
		function fn_egov_validateForm(obj) {
			return true;
		}

		function fn_egov_insert_bbs() {

			if (!validateContboard(document.board)){
				return;
			}
			if (confirm('<spring:message code="common.regist.msg" />')) {
				//document.board.onsubmit();
				document.board.action = "<c:url value='/cop/bbs/insertBoardArticle.do'/>";
				document.board.submit();
			}
		}
		function fn_egov_update_bbs(){

			if (!validateContboard(document.board)){
				return;
			}

			if (confirm('<spring:message code="common.update.msg" />')) {
				document.board.action = "<c:url value='/cop/bbs/updateBoardArticle.do'/>";
				document.board.submit();
			}
		}

		function fn_egov_select_noticeList() {
			document.board.action = "<c:url value='/cmm/contest/apfrRcip.do'/>";
			document.board.submit();
		}

		function fn_egov_check_file(flag) {
			if (flag=='Y') {
				document.getElementById('file_upload_posbl').style.display = "block";
				document.getElementById('file_upload_imposbl').style.display = "none";
			} else {
				document.getElementById('file_upload_posbl').style.display = "none";
				document.getElementById('file_upload_imposbl').style.display = "block";
			}
		}

	</script>

</head>

<body class="stretched" onLoad="document.board.teamNm.focus();">

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
					<form:form modelAttribute="board" name="board" method="post" enctype="multipart/form-data" class="form-con">
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
						<c:if test="${not empty result.nttId}">
							<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
						</c:if>
						<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
						<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
						<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
						<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
						<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
						<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
						<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
						<input type="hidden" name="callbackUrl" value="/cmm/contest/apfrRcip.do" />

						<input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
						<input type="hidden" name="authFlag" value="<c:out value='${bdMstr.authFlag}'/>" />

						<c:if test="${anonymous != 'true'}">
							<input type="hidden" name="ntcrNm" value="dummy">   <!-- validator 처리를 위해 지정 -->
							<input type="hidden" name="password" value="dummy"> <!-- validator 처리를 위해 지정 -->
						</c:if>

						<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
							<input name="ntceBgnde" type="hidden" value="10000101">
							<input name="ntceEndde" type="hidden" value="99991231">
						</c:if>


						<div class="form-list-con">
							<div class="form-list">
								<div class="form-title essential">팀명</div>
								<div class="form-input">
									<input name="teamNm" id="teamNm" type="text" placeholder="팀명을 입력해주세요." maxlength="30" value="<c:out value="${result.teamNm}" escapeXml="false" />">
								</div>
								<div class="form-error-text" style="display: none;"></div>
							</div>
							<div class="form-list">
								<div class="form-title essential">제목</div>
								<div class="form-input">
									<input name="nttSj" id="nttSj" type="text" placeholder="제목을 입력해주세요." size="60" maxlength="60" value="<c:out value="${result.nttSj}" escapeXml="false" />">
								</div>
								<div class="form-error-text" style="display: none;"></div>
							</div>
							<c:if test="${not empty result.frstRegisterNm}">
								<div class="form-list">
									<div class="form-title">접수자</div>
									<div class="form-input">
										<input name="wrterNm" type="text" readonly="readonly" value="<c:out value="${result.frstRegisterNm}" escapeXml="false" />">
									</div>
									<div class="form-error-text" style="display: none;"></div>
								</div>
							</c:if>
							<div class="form-list">
								<div class="form-title essential">내용</div>
								<div class="form-input">
									<textarea id="nttCn" name="nttCn" title="내용" class="f_txtar w_full h_200"
											  rows="10" cols="30" placeholder="내용을 입력해주세요.">${result.nttCn}</textarea>
								</div>
								<div class="form-error-text" style="display: none;"></div>
							</div>
							<div class="form-list">
								<div class="form-title essential">
									파일첨부
								</div>
								<div class="form-input f_file_wrap">
									<!-- 첨부파일목록 시작 -->
									<c:if test="${not empty result.atchFileId}">
										<div class="board_attach2">
                                            <span>
                                                <c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
													<c:param name="param_atchFileId" value="${egovc:encrypt(result.atchFileId)}" />
												</c:import>
                                            </span>
										</div>
									</c:if>
									<!-- /첨부파일목록 끝 -->
									<div class="board_attach2" id="file_upload_posbl">
										<input name="file_1" id="egovComFileUploader" type="file" accept=".ppt,.pptx,.hwp,.hwpx,.doc,.docx,.pdf,.xls,.xlsx,.zip"/>
										<div id="egovComFileList"></div>
									</div>
									<div class="board_attach2" id="file_upload_imposbl">
										<spring:message code="common.imposbl.fileupload" />
									</div>
									<c:if test="${empty result.atchFileId}">
										<input type="hidden" id="fileListCnt" name="fileListCnt" value="0" />
									</c:if>
								</div>
							</div>
							<div class="form-info-text">
								<div style="float:left; margin-right: 5px;">※</div>
								<div style="overflow: hidden;">
									첨부파일은 최대 2개까지 등록할 수 있으며, 파일당 30MB 이하만 가능합니다.<br/>
									허용 확장자: ppt, pptx, pdf, doc, docx, hwp, hwpx, xls, xlsx, zip
								</div>
							</div>
							<div class="form-list topmargin-sm">
								<div class="form-title">대표 이미지 <span>(개인신상을 알아볼 수 있는 사진은 첨부 불가, 100*100px 정사각형 사이즈 )</span></div>
								<div class="form-input f_file_wrap">
									<div class="board_attach2" id="file_upload_posbl2">
										<input name="file2_1" id="egovComFileUploader2" type="file" accept=".jpg,.jpeg,.png"/>
										<div id="egovComFileList2"></div>
									</div>
								</div>
							</div>
							<div class="form-info-text">
								<div style="float:left; margin-right: 5px;">※</div>
								<div style="overflow: hidden;">
									허용 확장자: jpg, jpeg, png
								</div>
							</div>
						</div>
						<div class="form-btn-con">
							<c:if test="${empty result.nttId}">
								<button type="submit" class="submit-btn" onclick="javascript:fn_egov_insert_bbs(); return false;">저장</button>
							</c:if>
							<c:if test="${not empty result.nttId}">
								<button type="submit" class="submit-btn" onclick="javascript:fn_egov_update_bbs(); return false;">수정</button>
							</c:if>

						</div>

					</form:form>
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

<script type="text/javascript" src="<c:url value='/'/>js/jqueryui.js"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value='/'/>js/functions.js"></script>

<!-- 파일첨부 스크립트 시작 -->
<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
	<script type="text/javascript">
		var existFileNum = document.board.fileListCnt.value;
		var maxFileNum = document.board.posblAtchFileNumber.value;

		if (existFileNum=="undefined" || existFileNum ==null) {
			existFileNum = 0;
		}
		if (maxFileNum=="undefined" || maxFileNum ==null) {
			maxFileNum = 0;
		}
		var uploadableFileNum = maxFileNum - existFileNum;
		if (uploadableFileNum<0) {
			uploadableFileNum = 0;
		}
		if (uploadableFileNum != 0) {
			fn_egov_check_file('Y');
			var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
			multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
		} else {
			fn_egov_check_file('N');
		}
	</script>
</c:if>
<!-- /파일첨부 스크립트 끝 -->
<script type="text/javascript">
	var maxFileNum2 = 1;
	var multi_selector2 = new MultiSelector2( document.getElementById( 'egovComFileList2' ), maxFileNum2 );
	multi_selector2.addElement( document.getElementById( 'egovComFileUploader2' ) );
</script>
</body>
</html>