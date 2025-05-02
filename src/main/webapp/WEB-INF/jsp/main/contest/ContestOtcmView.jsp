<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

		function fn_contest_attach_file_down(key) {
			if(key==0) {
				// 정책사업 AI추천 서비스 소개
				fn_egov_downFile('lOL6JF8m5ZoPksOpjrNiuaGtkjLqYcjbsZZFEt1UnqxX9dgmJjJ+3mWoSYu1PsdTeEQo1bzVt9EUDFB5K1/5NA==','0');
			}else if(key==1){
				fn_egov_downFile('8UcTrp/4vgd5MikO+pe1uViRjkUCgnyrlKS102mcdQ5X9dgmJjJ+3mWoSYu1PsdT/1IxXO1mSRSKp+DvKMYTLg==','1');
			}else if(key==2){
				fn_egov_downFile('8UcTrp/4vgd5MikO+pe1uViRjkUCgnyrlKS102mcdQ5X9dgmJjJ+3mWoSYu1PsdT/1IxXO1mSRSKp+DvKMYTLg==','0');
			}else if(key==3){
				fn_egov_downFile('8UcTrp/4vgd5MikO+pe1uViRjkUCgnyrlKS102mcdQ5X9dgmJjJ+3mWoSYu1PsdTnX5+xF6VPZLfUJZfJkEyCA==','1');
			}else if(key==4){
				fn_egov_downFile('8UcTrp/4vgd5MikO+pe1uViRjkUCgnyrlKS102mcdQ5X9dgmJjJ+3mWoSYu1PsdTnX5+xF6VPZLfUJZfJkEyCA==','0');
			}
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
						역대수상작
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
			<div class="sub-container clearfix">
				<div class="receipt-info-con">
					<div class="receipt-info-text"><span>2023년 대상 & 최우수상</span> 수상자들이  <span>CES2024</span> 직접 참관했습니다.<br>
						현장의 열기와 글로벌 기술 트렌드를 생생히 담은 후기를 확인해보세요!</div>
					<div class="receipt-info-btn-con">
						<a href="/cmm/contest/contestPtcpRvw.do" class="receipt-info-btn">참관기 보러가기</a>
					</div>
				</div>
				<div class="prize-list-con">
					<div class="prize-list">
						<div class="prize-info">
							<div class="prize-info-top">
								<div>
									<div class="prize-ranking">
										대상 <span>(25년 1월 서비스 오픈)</span>
									</div>
									<div class="prize-title">
										개인/기업의 정부 지원 정책 매칭
									</div>
									<div class="prize-winner">
										강성용 부장(SI영업본부), 김희중 팀장(IT혁신사업본부)
									</div>
								</div>
								<div class="prize-icon">
									<img src="/images/prize-img-001.png" alt="">
								</div>
							</div>
							<div class="prize-desc">
								AI를 활용하여 수많은 공고를 수집하고 분석하여 핵심항목 추출, 요약, 해설을 제공하고, 자체 AI 모델을 학습하여 기업과 공고간의 매칭으로 기업의 사업 증진을 위한 경제활동을 위해 기업인에게 맞는 발품과 손품을 줄이기 위한 AI 추천 서비스 아이디어입니다.
							</div>
						</div>
						<div class="download-btn">
							<a href="#" onClick="fn_contest_attach_file_down(0); return false;">서비스 소개 다운로드</a>
							<a href="#" onClick="fn_contest_attach_file_down(1); return false;">발표자료 다운로드</a>
						</div>
					</div>
					<div class="prize-list">
						<div class="prize-info">
							<div class="prize-info-top">
								<div>
									<div class="prize-ranking">
										최우수상
									</div>
									<div class="prize-title">
										NFT를 활용한 자산관리 플랫폼 구축
									</div>
									<div class="prize-winner">
										이항 팀장(SI개발본부)
									</div>
								</div>
								<div class="prize-icon">
									<img src="/images/prize-img-002.png" alt="">
								</div>
							</div>
							<div class="prize-desc">
								NFT기반 인증 및 자산관리 플랫폼을 구축화하여 당사의 손익 향상에 기여하고, 디지털 자산의 인증 및 자산관리 외 다양한 스마트 컨트랙트를 개발하여 사업의 다각화를 추진하고자 하는 아이디어 입니다.
							</div>
						</div>
						<div class="download-btn">
							<a href="#" onClick="fn_contest_attach_file_down(2); return false;">발표자료 다운로드</a>
						</div>
					</div>
					<div class="prize-list">
						<div class="prize-info">
							<div class="prize-info-top">
								<div>
									<div class="prize-ranking">
										우수상
									</div>
									<div class="prize-title">
										기업 정보 스마트 스크래핑 서비스
									</div>
									<div class="prize-winner">
										안지호 팀장(은행사업디지털본부)
									</div>
								</div>
								<div class="prize-icon">
									<img src="/images/prize-img-003.png" alt="">
								</div>
							</div>
							<div class="prize-desc">
								스마트 스크래핑 서비스를 통해 기업 데이터를 수집,가공하여 데이터 판매 및 AI 모델링 기반 예측 서비스를 제공하여 데이터 신기술 분야 혁신역량을 강화하고 플랫폼 사업으로 수익을 다각화할 수 있는 아이디어 입니다.
							</div>
						</div>
						<div class="download-btn">
							<a href="#" onClick="fn_contest_attach_file_down(3); return false;">발표자료 다운로드</a>
						</div>
					</div>
					<div class="prize-list">
						<div class="prize-info">
							<div class="prize-info-top">
								<div>
									<div class="prize-ranking">
										우수상
									</div>
									<div class="prize-title">
										i-ONE Bank App '계좌 정보 스캔' 서비스
									</div>
									<div class="prize-winner">
										홍성일 과장(경영전략본부)
									</div>
								</div>
								<div class="prize-icon">
									<img src="/images/prize-img-003.png" alt="">
								</div>
							</div>
							<div class="prize-desc">
								스마트폰 자체 카메라를 통한 OCR 기술을 활용하여 통장,명함,인쇄물,자필 등의 계좌정보를 스캔(촬영)하여,문자정보(계좌정보)인식을 통해 고객이 직접 입력하지 않고 간편하게 계좌이체를 할 수 있는 사용자 편의성을 고려한 아이디어 입니다.
							</div>
						</div>
						<div class="download-btn">
							<a href="#" onClick="fn_contest_attach_file_down(4); return false;">발표자료 다운로드</a>
						</div>
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

</body>
</html>