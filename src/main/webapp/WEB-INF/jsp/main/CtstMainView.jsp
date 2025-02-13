<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<title>너Do 나DO It! DT 공모전 - IBK시스템</title>
<link href="<c:url value='/'/>css/default.css" rel="stylesheet" type="text/css" >
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script type="text/javascript">

window.history.forward(); 
function noBack(){ 
  window.history.forward();
}

$(function(){

});

function fn_egov_downFile(atchFileId, fileSn){
	window.open("/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"");
}
</script>
<style>

        #content {position:relative;width:100%;max-width:1200px;margin:0 auto; padding:0 0 20px 0;}
        .contentWrap {position:relative;width:100%;max-width:1100px;margin:0 auto;padding:60px 0;}

        .view_title {padding:15px 1px 15px 1px;border-top:1px solid #5e6b83;color:#333;font-weight:800;font-size:17px}
        .viewWarp dl {width:100%;margin:0;overflow:hidden;background:#f7f5f4;border-bottom: 1px solid #e5e5e5;}
        .viewWarp dl dt, .viewWarp dl dd {vertical-align:top;padding:16px 20px;margin:0;border-top:1px solid #e5e5e5;text-align:left;word-break:break-all;float:left;min-height:54px;box-sizing:border-box;-webkit-box-sizing:border-box;font-size:16px;}
        .viewWarp dl dt {width:25.71%;max-width:160px;font-weight:800;line-height:1.2em;text-align:center;}
        .viewWarp dl dd {width:calc(50% - 160px);background:#fff; line-height:1.2em;font-weight:500;}
        .viewWarp dl dd.full {width:calc(100% - 160px);padding:11px 20px; line-height:1.3em;}        
        .viewWarp dl dd.full > a {display:block;word-break:break-all}
        .viewWarp dl dd.full > a + a {margin-top:5px;}
        .viewWarp dl dd.full > .btn {display:inline-block;vertical-align:bottom}
        .viewWarp dl dd.full .add_file {line-height:28px;width:100%;padding:0 0 5px}
        .viewWarp dl dd.full .add_file a {line-height:20px;color:blue;}
        .viewWarp dl dd.full .add_file .btn {margin:0 0 0 5px;line-height:15px}

        .btn.small.h25 span {padding:6px 16px;}
        .btn.small span {padding:9px 16px 10px;line-height:1em;background:#f5f4f2;border:1px solid #d0cfcf;border-radius:0;color:#333;font-size:16px;}

        .view_synap {padding: 100px 80px 100px 80px;}

        @media all and (max-width:1024px) {
            .viewWarp dl {display:flex;flex-wrap:wrap;}
            .view_synap {padding:14px 28px 16px 32px;}
        }

        @media all and (max-width:768px) {
            .view_title{padding:12px 8px;}
            .viewWarp dl {position:relative;background:#fff}
            .viewWarp dl:before {content:"";display:block;width:20%;position:absolute;top:0;left:0;height:100%;background:#f7f5f4;z-index:1}
            .viewWarp dl dt {width:20%;clear:left}
            .viewWarp dl dt.m_11 {font-size:14px;letter-spacing:inherit}
            .viewWarp dl dd, .viewWarp dl dd.full, .viewWarp dl dd {width:80%;clear:right;line-height:21px;}
            .viewWarp dl dt, .viewWarp dl dd {min-height:auto;padding:7px;box-sizing:border-box;position:relative;z-index:5;}
            .viewWarp dl dd.full > a {font-size:13px;}
            .viewWarp dl dd.full{padding:7px;}
            .viewWarp .view_con img {width:100% !important;height:auto !important}
            .viewWarp .view_con img.tag {width:auto !important}
            .viewWarp .view_con p, .viewWarp .view_con span, .viewWarp .view_con th, .viewWarp .view_con td, .viewWarp .view_con li, .viewWarp .view_con div {font-size:14px !important;}
            .viewWarp .view_con table {table-layout:inherit;}


            .viewbtnWrap.plan .left_btn, .viewbtnWrap.plan .right_btn {padding:3px 0 0;float:none;display:inline-block;text-align:right}
            .view_synap {padding:14px 20px;}

            .hwp_down  {font-size:13px;}
        }

        @media all and (max-width:640px) {
            .view_title {padding:10px 8px;font-size:14px;}
        }
        
        .simple-table td {border:1px solid gray;padding: 10px;}
        .simple-table td.center {border:1px solid gray; text-align:center;}
        .gray_background {background-color: whitesmoke;font-weight:900;}
        
        .viewWarp li{margin-left:10px;}
        .viewWarp ul{margin-left:10px;}
        .viewWarp ol{margin-left:10px;}

</style>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<noscript><p>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</p></noscript>
<!-- login status start -->
<div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
<!-- //login status end -->
<!-- wrap start -->
<div id="wrap">
	<!-- header start -->
	<div id="header"><c:import url="/sym/mms/EgovMainMenuHead.do?flag=MAIN" /></div>
	<!-- //header end -->
	<!-- 타이틀이미지, 로그인 시작 -->
	<div id="titlewrap">
		<!-- <div class="main_img">
		 <img src="<c:url value='/'/>images/header/img_portal_title.gif" width="719" height="94" alt="" />
		</div> -->
	</div>
	<!-- //타이틀이미지, 로그인 끝 -->
	<div id="bodywrap">
		<div class="viewWarp">
			<div class="view_title"><img src="/images/bl/bl_circle.gif" class="img_margin1"> 공모개요</div> 
            <dl>
                <dt>팜플렛</dt>
                <dd class="full" style="text-align: center;">
					<img src="/images/main/b/001.png">
                </dd>
                <dt>공모 소개</dt>                
                <dd class="full">
                	<div style="background: rgb(238, 238, 238); border: 1px solid rgb(204, 204, 204); padding: 10px 10px; text-align: center;">
                	<span style="color:#696969"><span style="font-family:돋움,dotum,applegothic,verdana,arial,san-serif; font-size:16px">디지털기술을 활용한 혁신적이고 차별화된 아이디어를 발굴</span></span><span style="color:rgb(102, 102, 102); font-family:돋움,dotum,applegothic,verdana,arial,san-serif; font-size:16px">,</span><br />
					<span style="color:#696969"><span style="font-family:돋움,dotum,applegothic,verdana,arial,san-serif; font-size:16px">이를 실현하기 위한 도약점을 마련하고자 응모부터 평가까지 전 직원이 함께 참여하는</span></span><br />
					<span style="color:#696969"><span style="font-family:돋움,dotum,applegothic,verdana,arial,san-serif; font-size:16px"><strong>「너DO 나DO IT! DT 공모전」</strong>을 다음과 같이 추친합니다.</span></span></div>

                </dd>                
                <dt>공모 명칭</dt>
                <dd class="full">
					<p><span style="font-size:24px"><span style="color:#DAA520"><span style="font-family:lucida sans unicode,lucida grande,sans-serif"><strong>「너DO 나DO IT! DT 공모전」</strong></span></span></span></p>

                </dd>
                <dt>공모 주제 </dt>
                <dd class="full">
					<h1><span style="color:#696969"><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif">우리가(너</span></span></span><span style="color:#B22222"><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif">Do</span></span></span><span style="color:#696969"><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif"> 나</span></span></span><span style="color:#B22222"><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif">Do</span></span></span><span style="color:#696969"><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif">) 혁신(</span></span></span><span style="color:#B22222"><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif">Just Do It!</span></span></span><span style="color:#696969"><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif">)하는 디지털 아이디어 공모전</span></span></span></h1>
                </dd>
                <dt>행사 주관 </dt>
                <dd class="full">
					<h1><span style="font-family:arial,helvetica,sans-serif"><span style="color:#696969"><span style="font-size:20px"><strong>IT혁신사업본부</strong></span></span></span></h1>
                </dd>                
                <dt>응모 자격</dt>
                <dd class="full">
					<h1><span style="font-size:20px"><span style="color:#2F4F4F"><span style="font-family:arial,helvetica,sans-serif"><strong>당사직원</strong>&nbsp;-&nbsp;<strong>개인</strong> 또는 <strong>팀</strong> (최대 3명)참가 , <strong>多건 응모가능</strong></span></span></span></h1>
                </dd>
                <dt>공모분야</dt>
                <dd class="full">
<table class="simple-table">
	<tbody>
		<tr>
			<td class="gray_background center" style="width: 100px">구분</td>
			<td class="gray_background center" style="width: 350px">공고분야</td>
			<td class="gray_background center" style="width: 350px">디지털기술</td>
		</tr>
		<tr>
			<td class="center">내용</td>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 금융서비스 혁신<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 개발 및 운영 업무 혁신<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 고객사 및 중소기업 업무 혁신<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 기타<br>
			</td>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 인공지능 (AI)<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 빅데이터<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 클라우드 컴퓨팅<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 메타버스<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. 블록체인<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6. 가상현실 (VR), 증강현실 (AR)<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7. 사물인터넷 (IoT)<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8. 모바일<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9. 기타<br>
			</td>
		</tr>
	</tbody>
</table>
<p style="padding:10px;"><span style="color:#696969"><strong><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">※ 디지털기술 미활용 아이디어도 응모 가능</span></span></strong></span></p>

                </dd>
                <dt>접수 일정</dt>
                <dd class="full">
<p><strong><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif"><span style="color:#2F4F4F">□ 참가 접수 :</span><span style="color:rgb(105, 105, 105)">&nbsp;</span><span style="color:#DAA520">2023년 5월 8일(월) ~ 2023년 6월 16일(금), 6주</span></span></span></strong></p><br />
<p><strong><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif"><span style="color:#2F4F4F">□&nbsp;접수 방법 :</span><span style="color:rgb(105, 105, 105)"> </span><span style="color:#DAA520">공모전 홈페이지 접수</span></span></span></strong></p><br />
<p><strong><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif"><span style="color:#2F4F4F">□&nbsp;문&nbsp; 의&nbsp; 처 : </span><span style="color:#DAA520">페이지 하단 문의사항 참조</span></span></span></strong></p>

                </dd>
                <dt>평가 일정 및<br> 시상식</dt>
                <dd class="full">
<p><span style="color:#2F4F4F"><span style="font-size:20px"><strong><span style="font-family:arial,helvetica,sans-serif">□ 예선 평가 : </span></strong></span></span><span style="color:#DAA520"><span style="font-size:20px"><strong><span style="font-family:arial,helvetica,sans-serif">2023년 6월 19일(월) ~ 2023년 6월 30일(금), 2주</span></strong></span></span><br /><br />
<span style="color:#2F4F4F"><span style="font-size:20px"><strong><span style="font-family:arial,helvetica,sans-serif">□ 본선 1/2차 평가 : </span></strong></span></span><span style="color:#DAA520"><span style="font-size:20px"><strong><span style="font-family:arial,helvetica,sans-serif">2023년 7월 3일(금) ~ 2023년 7월 14일 (금), 2주</span></strong></span></span><br /><br />
<span style="color:#2F4F4F"><span style="font-size:20px"><strong><span style="font-family:arial,helvetica,sans-serif">□ 시상식 : </span></strong></span></span><span style="color:#DAA520"><span style="font-size:20px"><strong><span style="font-family:arial,helvetica,sans-serif">2023년 7월 27일(목), 경영전략회의 시상</span></strong></span></span></p>
                </dd>                
                <dt>심사절차 및<br> 평가기준</dt>
                <dd class="full">
<p style="padding: 10px;"><span style="color:#000080"><strong><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">ㅇ 심사절차</span></span></strong></span></p>                
<table class="simple-table">
	<tbody>
		<tr>
			<td class="gray_background center" style="width:120px">구분</td>
			<td class="gray_background center" style="width:130px">평가방법</td>
			<td class="gray_background center" style="width:350px">심사위원</td>
			<td class="gray_background center" style="width:200px">주요내용</td>
		</tr>
		<tr>
			<td class="center">예선 평가</td>
			<td class="center">서류심사</td>
			<td>&nbsp;&nbsp;&nbsp;직원 평가(50%), 추진실무자(50%)</td>
			<td class="center">10개 작품 선정</td>
		</tr>
		<tr>
			<td class="center">본선 1차</td>
			<td class="center">PT</td>
			<td>&nbsp;&nbsp;&nbsp;내부전문가/추친실무자 (60%)</td>
			<td class="center">4개 작품 선정</td>
		</tr>
		<tr>
			<td class="center">본선 2차</td>
			<td class="center">PT 및 시연</td>
			<td>&nbsp;&nbsp;&nbsp;임원/사업본부장 (40%)</td>
			<td class="center">수상작 순위 결정</td> 
		</tr>
	</tbody>
</table>
<p style="padding: 10px;"><strong><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">※ 일정 수준 이상(평점 80점 이상)의 작품이 존재하지 않을 경우 본선 1차에서 공모전 종료</span></span></span></strong></p>
<br>
<p style="padding: 10px;"><strong><span style="color:#000080"><span style="font-size:20px"><span style="font-family:arial,helvetica,sans-serif">ㅇ 심사위원 구성</span></span></span></strong></p>

<p style="padding:15px;background-color:floralwhite;"><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">-&nbsp;</span></span></span><span style="color:#006400"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><strong>(직원 평가)</strong></span></span></span><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><strong> </strong></span></span></span><span style="color:#000000"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><strong><span style="background-color:#FFD700">작품에 대한 별점부여 방식(☆☆☆☆☆)</span></strong></span></span></span><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><strong>으로 </strong></span></span></span><span style="color:#FF0000"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><strong>전 직원이 평가에 참여</strong></span></span></span><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><strong>, </strong></span></span></span><span style="color:#FF8C00"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><strong>5월 8일(월) ~ 6월 23일(금)</strong></span></span></span><br />
<span style="color:#696969"><span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">- (추진실무자) 디지털사업부, 경영지원부, 기술개발팀, 품질경영팀, R&amp;D팀, 감사팀 (6명)<br />
- (본선 1차) 각 사업본부별로 추천한 내부전문가*와 추진실무자 (12명)<br />
* 구매지원본부, SI영업본부, SI개발본부, 인프라사업본부, 은행사업1&middot;2본부 (6명)<br />
- (본선 2차) 임원 및 각 사업본부장 (12명)</span></span></span></p>


<br>
<p style="padding: 10px;"><span style="color:#000080"><strong><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">ㅇ 심사기준</span></span></strong></span></p>

<table class="simple-table">
	<tbody>
		<tr>
			<td class="gray_background center" style="width: 100px">구분</td>
			<td class="gray_background center" style="width: 200px">심사기준</td>
			<td class="gray_background center" style="width: 200px">평가기준</td>
			<td class="gray_background center" style="width: 300px">비고</td>			
		</tr>
		<tr>
			<td class="center" rowspan="3">본선</td>
			<td class="center">90점 이상</td>
			<td class="center">대상 수여 가능</td>
			<td class="center" rowspan="3">최상위 4개 작품 순위 결정</td>
		</tr>
		<tr>
			<td class="center">85점 이상</td>
			<td class="center">최우수상 수여 가능</td>
		</tr>
		<tr>
			<td class="center">80점 이상</td>
			<td class="center">우수상 수여 가능</td>
		</tr>
		<tr>
			<td class="center" rowspan="3">예선</td>
			<td class="center">60점 이상</td>
			<td class="center">본선 1차 진출 대상</td>
			<td class="center">최상위 10개 작품 선정 본선 진출</td>			
		</tr>
		<tr>
			<td class="center">60점 미만</td>
			<td class="center">예선 탈락</td>
			<td class="center">지식자산화 대상 작품</td>			
		</tr>
		<tr>
			<td class="center">40점 미만</td>
			<td class="center">평가 기준 미달</td>
			<td class="center">요건 미 충족</td>			
		</tr>
	</tbody>
</table>
<p style="padding: 10px;"><strong><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">※본선심사 결과 최종점수에 따라 대상 및 최우수상 수상자가 없을 수도 있음. </span></span></span></strong></p>
                </dd>
                <dt>평가항목 및<br> 배점</dt>
                <dd class="full">
<p style="padding: 10px;"><span style="color:#000080"><strong><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">ㅇ 평가항목</span></span></strong></span></p>
<table class="simple-table">
	<tbody>
		<tr>
			<td class="gray_background center" style="width:200px">평가항목</td>
			<td class="gray_background center" style="width:400px">세부항목</td>
			<td class="gray_background center" style="width:200px">배점 (100점)</td>
		</tr>
		<tr>
			<td class="center">사업측면</td>
			<td>시장성, 수익성, 효율성, 투자안정성</td>
			<td class="center">30점</td>
		</tr>
		<tr>
			<td class="center">창의측면</td>
			<td>독창성, 완전성, 계속성</td>
			<td class="center">30점</td>
		</tr>
		<tr>
			<td class="center">기술측면</td>
			<td>구현가능성, 독자가능성, 구현복잡성</td>
			<td class="center">20점</td>
		</tr>
		<tr>
			<td class="center">기타사항</td>
			<td>규칙성, 공익성, 성실성</td>
			<td class="center">20점</td>
		</tr>
	</tbody>
</table>
<p style="padding: 10px;"><strong><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><span style="color:rgb(102, 102, 102)">※ DT 공모전 구현작품 시연 시 가산점(10점) 부여</span></span></span></strong></p>

<br>
<p style="padding: 10px;"><span style="color:#000080"><strong><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">ㅇ 심사절차에 따른 배점비율</span></span></strong></span></p>

<table class="simple-table">
	<tbody>
		<tr>
			<td class="gray_background center" style="width:300px" colspan="2">예선</td>
			<td class="gray_background center" style="width:20px;background-color:white;border:0px;" rowspan="4">▶</td>
			<td class="gray_background center" style="width:230px">본선 1차</td>
			<td class="gray_background center" style="width:20px;background-color:white;border:0px;" rowspan="4">+</td>
			<td class="gray_background center" style="width:230px">본선 2차</td>			
		</tr>
		<tr>
			<td class="center">직원평가</td>
			<td class="center">추진실무자</td>
			<td class="center">내부전문가/추진실무자</td>
			<td class="center">임원/사업본부장</td>			
		</tr>
		<tr>
			<td class="center">50%</td>
			<td class="center">50%</td>
			<td class="center">60%</td>
			<td class="center">40%</td>
		</tr>
		<tr>
			<td class="center">별점부여<br>10/20/30/40/50 선택</td>
			<td class="center">평가기준<br>(평점×50%)</td>
			<td class="center">평가기준<br>(평점×60%)</td>
			<td class="center">평가기준<br>(평점×40%)</td>
		</tr>
	</tbody>
</table>

<p style="padding: 10px;"><strong><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><span style="color:rgb(102, 102, 102)">※ 예선 최종점수는 본선에 미반영 (본선부터 재평가)</span></span></span></strong></p>
<p><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">&nbsp;&nbsp;&nbsp;- 본선 1차(60점), 본선 2차(40점), 가산점(10점)을 합산하여 최종점수 반영 순위 결정</span></span></span></p>

                </dd>

                <dt>시상 내역</dt>
                <dd class="full">
<p style="padding: 10px;"><span style="color:#000080"><strong><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">ㅇ 시상 및 경품</span></span></strong></span></p>                
<table class="simple-table">
	<tbody>
		<tr>
			<td class="gray_background center" style="width:100px">구분</td>
			<td class="gray_background center" style="width:100px">선정</td>
			<td class="gray_background center" style="width:280px">경품내역</td>
			<td class="gray_background center" style="width:320px">비고</td>
		</tr>
		<tr>
			<td class="center">대상</td>
			<td class="center">1건</td>
			<td class="center">가족여행 상품권 (2백만원 상당)</td>
			<td rowspan="4">
&nbsp;- 대표이사 표창 <br>
&nbsp;- 「유명 IT 박람회*」 참가 자격 취득 <br>
&nbsp;&nbsp;&nbsp;(대상, 최우수상) <br>
&nbsp;- 사업 참여 우선권 부여 <br>
&nbsp;- 사업화 추진 시 제안자에게 이익 배분** <br>
			</td>
		</tr>
		<tr>
			<td class="center">최우수상</td>
			<td class="center">1건</td>
			<td class="center">전자제품 구매권 (1백만원 상당)</td>
		</tr>
		<tr>
			<td class="center">우수상</td>
			<td class="center">2건</td>
			<td class="center">호텔식사 이용권 (50만원 상당)</td>
		</tr>
		<tr>
			<td class="gray_background center" colspan="2">합계</td>
			<td class="center">4건</td>
		</tr>		
	</tbody>
</table>
<p style="padding: 10px;"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><strong>* 유명 IT 박람회</strong><br />
<span style="color:#696969"> CES(Consumer Electronics Show), MWC(Mobile World Confress) 등 (전제제품 및 모바일 기술박람회)</span></span></span></p><br />
<p style="padding: 10px;"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><strong>** 사업화 추진시</strong><br />
<span style="color:#696969"> 사업화를 추진할 경우 제안자에게 해당 사업 손익분기점을 초과한 수익의 5%<br />
 (연 한도 10백만원)를 5년간 지급 (사업 종료 및 제안자 퇴직 시 조기종료)</span></span></span></p>

<br>
<p style="padding:15px;background-color:floralwhite;"><span style="color:#696969"><strong><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">※ 참여 독려를 위한 지원 사항 (응모 및 평가자)<br />
&nbsp; </span></span></strong><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">□ </span></span></span><strong><span style="color:#DAA520"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">(응모자) </span></span></span></strong><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><u>평점 40점 이상 예선 탈락자 마일리지 50포인트 지급</u><br />
&nbsp; □</span></span></span><strong><span style="color:#DAA520"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"> (응모자)</span></span></span></strong><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"> <u>본선 진출자 중 2차 미진출자 마일리지 200포인트 지급</u> (6명)<br />
&nbsp; □</span></span></span><span style="color:#008080"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"> <strong>(평가자)</strong></span></span></span><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"> <u>작품평가 건수 </u></span></span></span><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><u>상위 20명<sup>*</sup></u></span></span><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><u>에게 마일리지 20포인트 지급</u><br />
&nbsp; □ </span></span></span><strong><span style="color:#008080"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">(평가자)</span></span></span></strong><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"> </span></span></span><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><u>랜덤 추첨<sup>**</sup></u></span></span><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"><u>(10명)을 통해 마일리지 10포인트 지급</u><br /><br />
&nbsp; &nbsp; * </span></span></span><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">상위 20명</span></span><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"> : 별점 등록 참여 기준 (선착순)<br />
&nbsp; &nbsp;** </span></span></span><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">랜덤추첨</span></span><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif"> : 추천 등록 참여 기준 (추천 참여수가 많을수록 당첨 확률 증가)</span></span></span></p>
 

                </dd>
                <dt>응모제출물</dt>
                <dd class="full">
<p style="padding: 10px;"><span style="font-size:18px"><span style="color:#2F4F4F"><strong><span style="font-family:arial,helvetica,sans-serif">※ 공모전 참가 신청서</span></strong></span><br />
<span style="color:#696969"><span style="font-family:arial,helvetica,sans-serif">□ <strong>참가 신청서 위치</strong> : <u>공모전 홈페이지 &gt; 신청서 다운로드 &gt; 양식 다운로드</u></span></span></span></p><br />

<p style="padding: 10px;"><span style="font-size:18px"><span style="color:#2F4F4F"><strong><span style="font-family:arial,helvetica,sans-serif">※ 공모전 아이디어 제안 설명서</span></strong></span><br />
<span style="color:#696969"><span style="font-family:arial,helvetica,sans-serif">□ <strong>파일 양식</strong> : PDF, PPT, 한글 등의 포맷으로 작성<br />
□ <strong>배점 기준</strong> : <a href="javascript:fn_egov_downFile('FILE_000000000000331','2')"><u>[평가 항목 및 배점] 기준 자료 참조 </u>&nbsp;<img src="<c:url value='/'/>images/down_01.png" width="19" height="19" alt="" /> </a></span></span></span></p><br />

<p style="padding: 10px;"><span style="font-size:18px"><span style="color:#FF0000"><strong><span style="font-family:arial,helvetica,sans-serif">※ 암호화문서, 압축파일은 해제 후 등록할 것</span></strong></span></span></p>

                </dd>
                <dt>접수방법</dt>
                <dd class="full">
<p style="padding: 10px;"><span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">□ <strong>공모전 홈페이지를 통한 온라인 접수</strong> ( http://175.45.204.201 )<br />
□ 신청서 다운로드 및 작성 후, <strong>공모전 홈페이지 접수 게시판에 등록</strong><br />
□ 참가 신청서 및 제안 설명서 제출 위치 : <u>접수 및 평가 게시판 &gt; 작성 &gt; 파일 첨부</u></span></span></span></p>
<br />
<p style="padding: 10px;"><strong><span style="color:#FF0000"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">※ 접수유의사항</span></span></span></strong><br />
<span style="color:#696969"><span style="font-size:18px"><span style="font-family:arial,helvetica,sans-serif">□ 제안 설명서의 경우, 하나 이상의 파일을 작성하여 업로드 할 수 있음<br />
□ <strong>접수 마감일 2023년 6월 16일(금) 23:59까지</strong> 접수분에 한하여 유효</span></span></span></p>
                </dd>
                <dt>문의사항</dt>
                <dd class="full">
<table class="simple-table">
	<tbody>
		<tr>
			<td class="gray_background center" style="width:175px">소속</td>
			<td class="gray_background center" style="width:75px">직급</td>
			<td class="gray_background center" style="width:100px">성명</td>
			<td class="gray_background center" style="width:250px">메일</td>
			<td class="gray_background center" style="width:200px">연락처</td>
		</tr>
		<tr>
			<td class="center">디지털사업부</td>
			<td class="center">부장</td>
			<td class="center">서상영</td>
			<td class="center">ssy0202@ibksystem.co.kr</td>
			<td class="center">02-3407-6686</td>
		</tr>
		<tr>
			<td class="center">플랫폼사업팀</td>
			<td class="center">대리</td>
			<td class="center">백단비</td>
			<td class="center">danbi.baek@ibksystem.co.kr</td>
			<td class="center">02-3407-6072</td>
		</tr>
	</tbody>
</table>
                </dd>
            </dl>
        </div>
	</div>
	<!-- footer 시작 -->
	<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
	<!-- //footer 끝 -->
</div>
<!-- //wrap end -->
</body>
</html>
<%

%>