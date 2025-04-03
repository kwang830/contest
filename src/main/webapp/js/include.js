$(document).ready(function () {
	//loadLayout();
	initFunctions();
	setViewport();
});

/* Header & Footer 로드 */
function loadLayout(){
	if($("#header-wrap").length){
		$("#header-wrap").load("../include/header.html", function () {
			console.log("Header Loaded!");
			if($("#footer").length) {
				$("#footer").load("../include/footer.html", function () {
					console.log("Footer Loaded!");
					initFunctions();
				});
			}else{
				initFunctions();
			}
		});
	}else{
		initFunctions();
	}
}

/* 공통 기능 초기화 */
function initFunctions() {
	if(typeof SEMICOLON !== "undefined"){
		SEMICOLON.documentOnReady.init();
		SEMICOLON.documentOnLoad.init();
		$(window).on("resize", SEMICOLON.documentOnResize.init);
	}
}

/* 뷰포트 설정 */
function setViewport() {
	if( $(window).width() <= 480 ) {
		var ww = ( document.documentElement.clientWidth < window.screen.width ) ? $(window).width() : window.screen.width;
		var mw = 480;
		var ratio = ww / mw;
		$('meta[name="viewport"]').attr( 'content', 'width=' + mw + ', initial-scale=' + ratio + ', user-scalable=no' );
	} else {
		$('meta[name="viewport"]').attr( 'content', 'width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no' );
	}
}