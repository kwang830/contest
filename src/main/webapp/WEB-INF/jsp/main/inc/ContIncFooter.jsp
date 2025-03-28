<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Footer
============================================= -->
<footer id="footer" class="dark">

	<div class="container">
		<div class="row">
			<div class="col-12 col-lg-8 footer-text">
				서울시 중구 퇴계로 141-7 뉴서울빌딩 10F (주)IBK 시스템<br/>
				· AI공모전 담당자 · <span class="footer-email">contest_admin@ibksystem.co.kr</span> · 02-3407-6074<br/>
				<div id="copyright">Copyright © 2025 IBK System Co. Ltd. All Rights Reserved.</div>
			</div>

			<div class="col-12 col-lg-4">
				<div class="widget clearfix">
					<div class="row" style="justify-content: center;">
						<div class="col-auto">
							<div class="counter counter-small"><span data-from="1" data-to="${visit_count}" data-refresh-interval="10" data-speed="2000" data-comma="true">${visit_count}</span></div>
							<h5 class="nobottommargin">홈페이지 방문수</h5>
						</div>
						<div class="col-auto">
							<div class="counter counter-small"><span data-from="1" data-to="${download_count}" data-refresh-interval="10" data-speed="2000" data-comma="true">${download_count}</span></div>
							<h5 class="nobottommargin">신청서 다운로드수</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</footer><!-- #footer end -->