package egovframework.com.uat.uia.web;

import java.util.List;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uat.uia.service.EgovLoginService;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.com.custom.menu.service.EgovMenuManageService;
import egovframework.com.sym.log.clg.service.EgovLoginLogService;
import egovframework.com.sym.log.clg.service.LoginLog;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtParser;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureException;

@Controller
public class EgovLoginController {

	/** EgovLoginService */
	@Resource(name = "loginService")
	private EgovLoginService loginService;

	/** EgovCmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;
	
	@Resource(name="EgovLoginLogService")
	private EgovLoginLogService loginLogService;	

	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovLoginController.class);

	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@IncludedInfo(name = "로그인", listUrl = "/uat/uia/egovLoginUsr.do", order = 10, gid = 10)
	@RequestMapping(value = "/uat/uia/egovLoginUsr.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		if (EgovComponentChecker.hasComponent("mberManageService")) {
			model.addAttribute("useMemberManage", "true");
		}
		
		String tokenString = request.getParameter("jwt"); // 토큰스트링
		//eyJhbGciOiJIUzUxMiIsInJlZ0RhdGUiOjE2ODYxMTYxMzE1ODUsInR5cCI6IkpXVCJ9.eyJkZXB0TmFtZSI6Iu2UjOueq-2PvOyCrOyXhe2MgCIsImV4cCI6MTY4NjExNjIzMSwiZW1wTmFtZSI6Iuq5gOuMgOq0kSIsInBvc05hbWUiOiLssKjsnqUiLCJlbXBDb2RlIjoiNTAyNzkifQ.qCsZkr8J20WuEym_pQsy2Z--Fj_BsudyqkskTFG3Loy03nGfsgbwIe73Fg6W7KQFlUm-9jixSEi3q26yXIHFAg
//		String tokenString = "eyJhbGciOiJIUzUxMiIsInJlZ0RhdGUiOjE2ODYxMjE3NDg0NjYsInR5cCI6IkpXVCJ9.eyJkZXB0TmFtZSI6Iu2UjOueq-2PvOyCrOyXhe2MgCIsImV4cCI6MTY4NjEyMTg0OCwiZW1wTmFtZSI6IuuwseuLqOu5hCIsInBvc05hbWUiOiLrjIDrpqwiLCJlbXBDb2RlIjoiNTAzMTgifQ.F13FWamvRuVl4-yJP2WH6RycmmMIQKfXq5ehCUAzWFq_gl26dim9_7-q5i1S4A4xNOrUGbJkNA2SCTKtJGP6yw";		
		
		LOGGER.info("[로그인] loginUsrView >>> ");
		
		try{
			String JWT_KEY = "X19JQktTWVNURU1fT1BSSVNLX18=" ; // 암호화key
			
			JwtParser jp = Jwts.parser() ;
			jp.setSigningKey(JWT_KEY.getBytes("UTF-8"));
			Jws<Claims> claims = jp.parseClaimsJws(tokenString);
			
			/*
				empCode : 사번(ex:99511)
				empName : 이름(ex:이항)
				deptName: 부서명(ex:정보지원팀)
				posName : 직위(ex:차장)
			*/
			String empCode = claims.getBody().get("empCode").toString();
			String empName = claims.getBody().get("empName").toString();
			String deptName = claims.getBody().get("deptName").toString();
			String posName = claims.getBody().get("posName").toString();
			LOGGER.info(">>>>>>>>>>> empCode : " + empCode);
			LOGGER.info(">>>>>>>>>>> empName : " + empName);
			LOGGER.info(">>>>>>>>>>> deptName : " + deptName);
			LOGGER.info(">>>>>>>>>>> posName : " + posName);		

			String ip = request.getHeader("X-FORWARDED-FOR"); 
		     
			if (ip == null || ip.length() == 0) {
				ip= request.getHeader("Proxy-Client-IP");
			}

			if (ip == null || ip.length() == 0) {
			    ip= request.getHeader("WL-Proxy-Client-IP");  
			}

			if (ip == null || ip.length() == 0) {
			    ip= request.getRemoteAddr() ;
			}
			
			loginVO.setUrl("PASS");
			loginVO.setId(empCode);
			loginVO.setUserSe("GNR");
			LoginVO resultVO = loginService.actionLogin(loginVO); //사번만 확인 
			
	    	LoginLog loginLog = new LoginLog();
	    	loginLog.setLoginId(resultVO.getId());
	        loginLog.setLoginIp(ip);
	        loginLog.setLoginMthd("I"); // 로그인:I, 로그아웃:O
	        loginLog.setErrOccrrAt("N");
	        loginLog.setErrorCode("");
	        loginLog.setChkBrowser(loginVO.getChkBrowser());
	        loginLog.setChkMobile(loginVO.getChkMobile());	        
	        loginLogService.logInsertLoginLog(loginLog);
			
			// 2-1. 로그인 정보를 세션에 저장
			request.getSession().setAttribute("loginVO", resultVO);

			return "redirect:/uat/uia/actionMain.do";
		
			
		}catch(ExpiredJwtException expiredJwtException){
			// jwt 토큰만료 
			LOGGER.info(">>>>>>>>>>> expiredJwtException : " + expiredJwtException);
		}catch(SignatureException signatureException){
			// jwt 키 불일치 
			LOGGER.info(">>>>>>>>>>> signatureException : " + signatureException);
		}catch(Exception globalException){
			LOGGER.info(">>>>>>>>>>> globalException : " + globalException);
		}		

		return "egovframework/com/uat/uia/EgovLoginUsr";
	}

	/**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionLogin.do")
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

		// 1. 일반 로그인 처리
		LoginVO resultVO = loginService.actionLogin(loginVO);

		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {
			
			String ip = request.getHeader("X-FORWARDED-FOR"); 
			     
			if (ip == null || ip.length() == 0) {
				ip= request.getHeader("Proxy-Client-IP");
			}

			if (ip == null || ip.length() == 0) {
			    ip= request.getHeader("WL-Proxy-Client-IP");  
			}

			if (ip == null || ip.length() == 0) {
			    ip= request.getRemoteAddr() ;
			}
			
	    	LoginLog loginLog = new LoginLog();
	    	loginLog.setLoginId(resultVO.getId());
	        loginLog.setLoginIp(ip);
	        loginLog.setLoginMthd("I"); // 로그인:I, 로그아웃:O
	        loginLog.setErrOccrrAt("N");
	        loginLog.setErrorCode("");
	        loginLog.setChkBrowser(loginVO.getChkBrowser());
	        loginLog.setChkMobile(loginVO.getChkMobile());	        
	        
	        loginLogService.logInsertLoginLog(loginLog);
			
			// 2-1. 로그인 정보를 세션에 저장
			request.getSession().setAttribute("loginVO", resultVO);

			return "redirect:/uat/uia/actionMain.do";

		} else {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			//model.addAttribute("loginVO", loginVO);
			return "egovframework/com/uat/uia/EgovLoginUsr";
		}
	}

	/**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionMain.do")
	public String actionMain(ModelMap model) throws Exception {
		
		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /uat/uia/actionMain.do");
		//LOGGER.debug("------------------");
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		//LOGGER.debug("isAuthenticated : {}", isAuthenticated);
		
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "egovframework/com/uat/uia/EgovLoginUsr";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		//LOGGER.debug("User Id : {}", user.getId());
		//LOGGER.debug("User Url : {}", user.getUrl());
		//LOGGER.debug("User userSe : {}", user.getUserSe());
		//LOGGER.debug("User orgnztId : {}", user.getOrgnztId());
		//LOGGER.debug("User orgnztNm : {}", user.getOrgnztNm());
					
		// 2. 메인 페이지 이동
		String main_page = Globals.MAIN_PAGE;
		String main_page2 = Globals.MAIN_PAGE2;
		String main_page3 = Globals.MAIN_PAGE3;
		
		// 추가적용 요건: 권한 유형에 따른 메인 페이지 이동을 달리한다.
		if(user.getUserSe().equals("USR")){
			main_page = main_page3;
			//LOGGER.debug("main_page : {}", main_page);
		}

		//LOGGER.debug("Globals.MAIN_PAGE > {}", Globals.MAIN_PAGE);
		//LOGGER.debug("main_page > {}", main_page);

		if (main_page.startsWith("/")) {
			return "forward:" + main_page;
		} else {
			return main_page;
		}
	}

	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /uat/uia/actionLogout.do");
		//LOGGER.debug("------------------");		
		
		/*String userIp = EgovClntInfo.getClntIP(request);

		// 1. Security 연동
		return "redirect:/j_spring_security_logout";*/

		request.getSession().setAttribute("loginVO", null);

		//return "redirect:/egovDevIndex.jsp";
		return "redirect:/EgovContent.do";
	}

	/**
	 * 아이디/비밀번호 찾기 화면으로 들어간다
	 * @param
	 * @return 아이디/비밀번호 찾기 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/egovIdPasswordSearch.do")
	public String idPasswordSearchView(ModelMap model) throws Exception {

		// 1. 비밀번호 힌트 공통코드 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM022");
		List<?> code = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("pwhtCdList", code);

		return "egovframework/com/uat/uia/EgovIdPasswordSearch";
	}

	/**
	 * 아이디를 찾는다.
	 * @param vo - 이름, 이메일주소, 사용자구분이 담긴 LoginVO
	 * @return result - 아이디
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/searchId.do")
	public String searchId(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {

		if (loginVO == null || loginVO.getName() == null || loginVO.getName().equals("") && loginVO.getEmail() == null || loginVO.getEmail().equals("")
				&& loginVO.getUserSe() == null || loginVO.getUserSe().equals("")) {
			return "egovframework/com/cmm/egovError";
		}

		// 1. 아이디 찾기
		loginVO.setName(loginVO.getName().replaceAll(" ", ""));
		LoginVO resultVO = loginService.searchId(loginVO);

		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {

			model.addAttribute("resultInfo", "아이디는 " + resultVO.getId() + " 입니다.");
			return "egovframework/com/uat/uia/EgovIdPasswordResult";
		} else {
			model.addAttribute("resultInfo", egovMessageSource.getMessage("fail.common.idsearch"));
			return "egovframework/com/uat/uia/EgovIdPasswordResult";
		}
	}

	/**
	 * 비밀번호를 찾는다.
	 * @param vo - 아이디, 이름, 이메일주소, 비밀번호 힌트, 비밀번호 정답, 사용자구분이 담긴 LoginVO
	 * @return result - 임시비밀번호전송결과
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/searchPassword.do")
	public String searchPassword(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {

		if (loginVO == null || loginVO.getId() == null || loginVO.getId().equals("") && loginVO.getName() == null || loginVO.getName().equals("") && loginVO.getEmail() == null
				|| loginVO.getEmail().equals("") && loginVO.getPasswordHint() == null || loginVO.getPasswordHint().equals("") && loginVO.getPasswordCnsr() == null
				|| loginVO.getPasswordCnsr().equals("") && loginVO.getUserSe() == null || loginVO.getUserSe().equals("")) {
			return "egovframework/com/cmm/egovError";
		}

		// 1. 비밀번호 찾기
		String result = loginService.searchPassword(loginVO);

		// 2. 결과 리턴
		model.addAttribute("resultInfo", result);
		
		return "egovframework/com/uat/uia/EgovIdPasswordResult";
	}

	/**
	 * 개발 시스템 구축 시 발급된 GPKI 서버용인증서에 대한 암호화데이터를 구한다.
	 * 최초 한번만 실행하여, 암호화데이터를 EgovGpkiVariables.js의 ServerCert에 넣는다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/getEncodingData.do")
	public void getEncodingData() throws Exception {

		/*
		X509Certificate x509Cert = null;
		byte[] cert = null;
		String base64cert = null;
		try {
			x509Cert = Disk.readCert("/product/jeus/egovProps/gpkisecureweb/certs/SVR1311000011_env.cer");
			cert = x509Cert.getCert();
			Base64 base64 = new Base64();
			base64cert = base64.encode(cert);
			log.info("+++ Base64로 변환된 인증서는 : " + base64cert);

		} catch (GpkiApiException e) {
			e.printStackTrace();
		}
		*/
	}




}