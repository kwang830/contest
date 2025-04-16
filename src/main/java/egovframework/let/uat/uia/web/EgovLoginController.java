package egovframework.let.uat.uia.web;

import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import javax.servlet.http.HttpServletRequest;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.let.sym.log.clg.service.LoginLog;
import egovframework.let.uat.uia.service.EgovLoginService;
import egovframework.let.sym.log.clg.service.EgovLoginLogService;

import org.egovframe.rte.fdl.cmmn.trace.LeaveaTrace;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.WebApplicationContextUtils;

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

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	/** EgovLoginLogService */
	@Resource(name="EgovLoginLogService")
	private EgovLoginLogService loginLogService;

	/** TRACE */
    @Resource(name="leaveaTrace")
    LeaveaTrace leaveaTrace;

	public static String getClientIp(HttpServletRequest request) {
		String ip = getHeaderIp(request);

		// IPv4 주소인지 확인하는 정규식
		String ipv4Pattern = "^([0-9]{1,3}\\.){3}[0-9]{1,3}$";
		Pattern pattern = Pattern.compile(ipv4Pattern);
		Matcher matcher = pattern.matcher(ip);

		if (matcher.matches()) {
			return ip; // IPv4면 그대로 반환
		} else {
			return request.getRemoteAddr(); // IPv4가 아니면 request.getRemoteAddr() 사용
		}
	}

	// 클라이언트 IP를 가져오는 메서드 (X-Forwarded-For 포함)
	public static String getHeaderIp(HttpServletRequest request) {
		String[] headers = {
				"X-FORWARDED-FOR",
				"Proxy-Client-IP",
				"WL-Proxy-Client-IP"
		};

		for (String header : headers) {
			String ip = request.getHeader(header);
			if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
				// X-Forwarded-For 값이 여러 개일 경우 첫 번째 값 사용
				if (ip.contains(",")) {
					ip = ip.split(",")[0].trim();
				}
				return ip;
			}
		}
		return request.getRemoteAddr(); // 모든 값이 없으면 기본 IP 반환
	}

	/**
	 * 로그인 화면으로 들어간다
	 */
    @RequestMapping(value="/uat/uia/egovLoginUsr.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model)
			throws Exception {

		String tokenString = request.getParameter("jwt"); // 토큰스트링
		//System.out.println("[로그인] loginUsrView >>> tokenString :"+tokenString);

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
			System.out.println(">>>>>>>>>>> empCode : " + empCode);
			System.out.println(">>>>>>>>>>> empName : " + empName);
			System.out.println(">>>>>>>>>>> deptName : " + deptName);
			System.out.println(">>>>>>>>>>> posName : " + posName);

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
			//System.out.println("resultVO.getId():"+resultVO.getId());

			boolean loginPolicyYn = true;

			if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("") && loginPolicyYn) {

				// 2. spring security 연동
				request.getSession().setAttribute("LoginVO", resultVO);

				UsernamePasswordAuthenticationFilter springSecurity = null;

				ApplicationContext act = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());


				Map<String, UsernamePasswordAuthenticationFilter> beans = act.getBeansOfType(UsernamePasswordAuthenticationFilter.class);

				if (beans.size() > 0) {

					springSecurity = (UsernamePasswordAuthenticationFilter) beans.values().toArray()[0];
					springSecurity.setUsernameParameter("egov_security_username");
					springSecurity.setPasswordParameter("egov_security_password");
					springSecurity.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher(request.getServletContext().getContextPath() +"/egov_security_login", "POST"));

				} else {
					throw new IllegalStateException("No AuthenticationProcessingFilter");
				}

				springSecurity.doFilter(new RequestWrapperForSecurity(request, resultVO.getUserSe() + resultVO.getId() , resultVO.getUniqId()), response, null);

				LoginLog loginLog = new LoginLog();
				loginLog.setLoginId(resultVO.getId());
				loginLog.setLoginIp(ip);
				loginLog.setLoginMthd("I"); // 로그인:I, 로그아웃:O
				loginLog.setErrOccrrAt("N");
				loginLog.setErrorCode("");
				loginLog.setPcInfo(loginVO.getPcInfo());
				loginLog.setBrowserInfo(loginVO.getBrowserInfo());

				loginLogService.logInsertLoginLog(loginLog);

				return "forward:/cmm/main/mainPage.do";	// 성공 시 페이지.. (redirect 불가)

			} else {

				//model.addAttribute("message", egovMessageSource.getMessage("fail.common.login", null, null, locale.KOREAN));
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
				return "uat/uia/EgovLoginUsr";
			}

		}catch(ExpiredJwtException expiredJwtException){
			// jwt 토큰만료
			System.out.println(">>>>>>>>>>> expiredJwtException : " + expiredJwtException);
		}catch(SignatureException signatureException){
			// jwt 키 불일치
			System.out.println(">>>>>>>>>>> signatureException : " + signatureException);
		}catch(Exception globalException){
			System.out.println(">>>>>>>>>>> globalException : " + globalException);
		}

    	return "uat/uia/EgovLoginUsr";
	}

    /**
	 * 일반(스프링 시큐리티) 로그인을 처리한다
	 */
    @RequestMapping(value="/uat/uia/actionSecurityLogin.do")
    public String actionSecurityLogin(@ModelAttribute("loginVO") LoginVO loginVO,
									  HttpServletRequest request, HttpServletResponse response,
									  ModelMap model, Locale locale)
            throws Exception {

    	// 1. 일반 로그인 처리
        LoginVO resultVO = loginService.actionLogin(loginVO);

        boolean loginPolicyYn = true;

        if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("") && loginPolicyYn) {

            // 2. spring security 연동
        	request.getSession().setAttribute("LoginVO", resultVO);

        	UsernamePasswordAuthenticationFilter springSecurity = null;

        	ApplicationContext act = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
        	
        	
        	Map<String, UsernamePasswordAuthenticationFilter> beans = act.getBeansOfType(UsernamePasswordAuthenticationFilter.class);
			
			if (beans.size() > 0) {
				
				springSecurity = (UsernamePasswordAuthenticationFilter) beans.values().toArray()[0];
				springSecurity.setUsernameParameter("egov_security_username");
				springSecurity.setPasswordParameter("egov_security_password");
				springSecurity.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher(request.getServletContext().getContextPath() +"/egov_security_login", "POST"));
				
			} else {
				throw new IllegalStateException("No AuthenticationProcessingFilter");
			}
        	
        	springSecurity.doFilter(new RequestWrapperForSecurity(request, resultVO.getUserSe() + resultVO.getId() , resultVO.getUniqId()), response, null);

			String ip = EgovLoginController.getHeaderIp(request);  // static 메서드로 호출

			LoginLog loginLog = new LoginLog();
			loginLog.setLoginId(resultVO.getId());
			loginLog.setLoginIp(ip);
			loginLog.setLoginMthd("I"); // 로그인:I, 로그아웃:O
			loginLog.setErrOccrrAt("N");
			loginLog.setErrorCode("");
			loginLog.setPcInfo(loginVO.getPcInfo());
			loginLog.setBrowserInfo(loginVO.getBrowserInfo());

			loginLogService.logInsertLoginLog(loginLog);

        	return "forward:/cmm/main/mainPage.do";	// 성공 시 페이지.. (redirect 불가)

        } else {
        	
        	//model.addAttribute("message", egovMessageSource.getMessage("fail.common.login", null, null, locale.KOREAN));
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "uat/uia/EgovLoginUsr";
        }
    }

    /**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @RequestMapping(value="/uat/uia/actionMain.do")
	public String actionMain(ModelMap model)
			throws Exception {

		System.out.println("# /uat/uia/actionMain.do ; actionMain >> ");
    	
    	// 1. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		System.out.println("isAuthenticated:"+isAuthenticated);
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "uat/uia/EgovLoginUsr";
    	}
    	
		// 2. 메인 페이지 이동
    	return "forward:/cmm/main/mainPage.do";

	}

    /**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/uat/uia/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {
    	request.getSession().setAttribute("LoginVO", null);
    	
    	return "redirect:/egov_security_logout";
    }
}

class RequestWrapperForSecurity extends HttpServletRequestWrapper {
	private String username = null;
	private String password = null;

	public RequestWrapperForSecurity(HttpServletRequest request, String username, String password) {
		super(request);

		this.username = username;
		this.password = password;
	}
	
	@Override
	public String getServletPath() {		
		return ((HttpServletRequest) super.getRequest()).getContextPath() + "/egov_security_login";
	}

	@Override
	public String getRequestURI() {		
		return ((HttpServletRequest) super.getRequest()).getContextPath() + "/egov_security_login";
	}

	@Override
	public String getParameter(String name) {
		if (name.equals("egov_security_username")) {
			return username;
		}

		if (name.equals("egov_security_password")) {
			return password;
		}

		return super.getParameter(name);
	}


}