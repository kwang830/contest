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
			if(key==1){
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
				<div class="prize-list-con">
					<div class="prize-list">
						<div class="prize-info">
							<div class="prize-info-top">
								<div>
									<div class="prize-ranking">
										대상
									</div>
									<div class="prize-title">
										개인/기업의 정부 지원 정책 매칭
									</div>
									<div class="prize-winner">
										강성용 팀장(SI영업본부), 김희중 차장(IT혁신사업본부)
									</div>
								</div>
								<div class="prize-icon">
									<img src="/images/prize-img-001.png" alt="">
								</div>
							</div>
							<div class="prize-desc">
								코로나 이후로 정부의 수많은 경제활성화 정책이 시행되고 있습니다.<br/>
								- 정부 부처 별 뿐만 아니라 지방자체단체에서도 개인 또는 기업을 위해 여러 지원들이 존재 (약1만개 이상)<br/>
								이러한 많은 지원 정책에도 불구하고 필요한 시기에 필요한 내용을 지원 받지 못하고 넘어가는 개인/기업 경제 활동가들이 많습니다.<br/>
								이에따라 금융사의 경쟁사 대비 고객 유치의 차별화 서비스 제공을 목적을 위한 개인/기업-기관 간의 정부 지원정책 매칭 서비스를 제안 합니다.
							</div>
						</div>
						<div class="download-btn">
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
								NFT(Non-Fungible Token)는 대체 불가능한 토큰으로 디지털 자산의 소유주를 증명할 수 있는 가상의 토큰입니다.<br/>
								기업은 수많은 디지털 자산(오프라인 문서, 전자결재문서, 데이터베이스 등)을 소유하고 있으며, 이런 디지털 자산을 관리 및 검증, 통제하기 위해 별도의 상용 솔루션을 구매해서 사용하고 있습니다.<br/>
								제안한 NFT를 활용한 디지털 자산관리 플랫폼은 이러한 상용 솔루션을 대체할 수 있으며, 당사의 SI프로젝트 수행 시 솔루션 구매비용 및 유지보수 비용 절감에 따른 손익향상을 기대할 수 있습니다.<br/>
								또한 은행 및 자회사와의 네트워크를 현재 VPN 및 전용회선에서 당사가 구축한 블록체인으로 네트워크 채널을 일원화 해서 자회사간의 시너지 효과 및 효율적인 협업수행을 할 수 있도록 지원해줍니다.<br/>
								현재 암호화폐 및 NFT 거래에 초점이 맞춰진 블록체인과 NFT기반 기술을 일반기업의 업무의 많은 부분에 활용할 수 있을 것 같아 제안하게 되었습니다.
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
										안지호 팀장(은행사업2본부)
									</div>
								</div>
								<div class="prize-icon">
									<img src="/images/prize-img-003.png" alt="">
								</div>
							</div>
							<div class="prize-desc">
								데이터 경제가 부상하고 데이터 3법이 시행됨에 따라 데이터의 중요성이 강조되고 있습니다.<br/>
								또한 4차 산업혁명의 진전에 따라 데이터는 사람, 자본 등 기존의 생산요소를 능가하는 핵심자원으로 부상하고 있으며,
								전체 산업의 혁신 성장을 가속하고 있습니다.
								데이터 생태계의 가치사슬(공급-중개-수요) 중 데이터를 중개하는 스크래핑 서비스를 제안하고자 합니다.<br/>
								현재, 정부기관 및 공공기관에서 보유한 데이터를 활용하기 위해서는 스크래핑 업체를 이용하고 있으며,
								그 중에서 데이터 가치가 높은 기업정보에 관하여 현 스크래핑 업체 이용에 대한 문제점을 식별하고, 해결방안을 제시하여
								"기업정보 스마트 스크래핑 서비스"를 제안합니다.
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
										홍성일 과장(인프라사업본부)
									</div>
								</div>
								<div class="prize-icon">
									<img src="/images/prize-img-003.png" alt="">
								</div>
							</div>
							<div class="prize-desc">
								스마트폰 자체 카메라를 통한 OCR* 기술을 활용하여 통장, 명함, 인쇄물, 자필 등의 계좌 정보를 스캔(촬영)하여,
								문자정보(계좌 정보) 인식을 통해 고객이 직접 입력하지 않고 간편하게 계좌이체를 할 수 있음.<br/>
								고객이 계좌 정보를 직접 입력을 해야 하는 번거로움을 덜어주고, 복잡한 계좌 정보도 직접 입력 방식 보다 정확
								하게 입력 가능하여, 보다 빠르고 간편하게 이체 업무를 처리할 수 있음.<br/>
								* OCR은 'Optical Character Recognition'의 약자 (광학 문자 인식)<br/>
								OCR 기술은 스캔된 문서나 이미지에 있는 문자를 컴퓨터가 인식하고 텍스트를 데이터로 변환 하는
								과정이며, 해당 기술을 통해 종이 문서를 디지털 텍스트로 변환 하거나, 이미지 속 텍스트 정보를
								추출할 수 있음.<br/>
								※ 활용 예시) 주민등록증, 운전면허증, 여권 등의 신분증부터 신용/체크카드, 영수증 등
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