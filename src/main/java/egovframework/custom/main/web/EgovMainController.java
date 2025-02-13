package egovframework.custom.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.custom.menu.service.MenuManageVO;
import egovframework.com.uat.uia.service.EgovLoginService;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserManageVO;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.custom.estmt.service.EstmtManageService;
import egovframework.custom.estmt.service.EstmtManageVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import egovframework.com.custom.menu.service.EgovMenuManageService;
import egovframework.com.cop.adb.service.AddressBookUserVO;
import egovframework.com.cop.adb.service.AddressBookVO;
import egovframework.com.cop.adb.service.impl.AddressBookDAO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovArticleService;
import egovframework.com.cop.bbs.service.EgovBBSMasterService;

@Controller
public class EgovMainController {

	/** userManageService */
	@Resource(name = "userManageService")
	private EgovUserManageService userManageService;
	
	/** mberManageService */
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;
	
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

	@Resource(name = "EgovArticleService")
    private EgovArticleService egovArticleService;	
	
	/** userManageService */
	@Resource(name = "EstmtManageService")
	private EstmtManageService estmtManageService;	
	
    @Resource(name = "AdressBookDAO")
    private AddressBookDAO adbkDAO;	

	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovMainController.class);

	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmn/main/mainPage.do")
	public String getMgtMainPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /cmn/main/mainPage.do");
		//LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		//LOGGER.debug("isAuthenticated : {}", isAuthenticated);						
		
		// 권한에 따른 페이지만 호출
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (loginVO != null) {
			if(loginVO.getUserSe().equals("GNR")){
				//LOGGER.debug("/cmn/main/mainPage.do : OK! ");
			}else if(loginVO.getUserSe().equals("ENT")){
				ModelAndView modelAndView = new ModelAndView("redirect:/cmn/main/entPage.do");
				throw new ModelAndViewDefiningException(modelAndView);				
			}else if(loginVO.getUserSe().equals("USR")){
				ModelAndView modelAndView = new ModelAndView("redirect:/cmn/main/usrPage.do");
				throw new ModelAndViewDefiningException(modelAndView);				
			}
		}
		
		// 공지사항 메인 컨텐츠 조회 시작 ---------------------------------
		/*
		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(5);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_AAAAAAAAAAAA");

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, "BBSA02");
		model.addAttribute("notiList", map.get("resultList"));
		*/

		// 공지사항 메인컨텐츠 조회 끝 -----------------------------------

		// 자유게시판 메인 컨텐츠 조회 시작 ---------------------------------
		/* */
		// 공지사항 : BBSMSTR_000000000021
		// 신청게시판 : BBSMSTR_000000000001
		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_000000000021");

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("bbsList", egovArticleService.selectArticleList(boardVO).get("resultList"));
		/* */
		// 자유게시판 메인컨텐츠 조회 끝 -----------------------------------

		// 조회 품목 리스트
		/*
		EstmtManageVO estmtManageVO = new EstmtManageVO();
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);		
		
    	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());		
		
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
		
		model.addAttribute("estmtList", estmtManageService.selectEstmtList(estmtManageVO).get("resultList"));		
		*/
		// FAQ 메인 컨텐츠 조회 시작 ---------------------------------
		/** EgovPropertyService.SiteList */
		/*
		FaqManageDefaultVO searchVO = new FaqManageDefaultVO();
		searchVO.setPageUnit(3);
    	searchVO.setPageSize(10);
		*/
    	/** pageing */
		/*
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("faqList", faqManageService.selectFaqList(searchVO));
		*/
		// FAQ 메인 컨텐츠 조회 끝 -----------------------------------

        // 설문참여 메인 컨텐츠 조회 시작 -----------------------------------
		/*
        ComDefaultVO qVO = new ComDefaultVO();
    	qVO.setPageUnit(1);
    	qVO.setPageSize(10);
		*/
    	/** pageing */
		/*
		paginationInfo.setCurrentPageNo(qVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(qVO.getPageUnit());
		paginationInfo.setPageSize(qVO.getPageSize());

		qVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		qVO.setLastIndex(paginationInfo.getLastRecordIndex());
		qVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("qriList", egovQustnrRespondInfoService.selectQustnrRespondInfoManageList(qVO));
        */
     // 설문참여 메인 컨텐츠 조회 끝 -----------------------------------


		return "main/EgovMainView";
	}	
	
	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmn/main/usrPage.do")
	public String getUsrMainPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /cmn/main/usrPage.do");
		//LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();		
		//LOGGER.debug("isAuthenticated : {}", isAuthenticated);
		
		// 권한에 따른 페이지만 호출
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (loginVO != null) {
			if(loginVO.getUserSe().equals("GNR")){
				ModelAndView modelAndView = new ModelAndView("redirect:/cmn/main/mainPage.do");
				throw new ModelAndViewDefiningException(modelAndView);				
			}else if(loginVO.getUserSe().equals("ENT")){
				ModelAndView modelAndView = new ModelAndView("redirect:/cmn/main/entPage.do");
				throw new ModelAndViewDefiningException(modelAndView);				
			}else if(loginVO.getUserSe().equals("USR")){
				//LOGGER.debug("/cmn/main/usrPage.do : OK! ");
			}
		}		

		// 공지사항 : BBSMSTR_000000000021
		// 신청게시판 : BBSMSTR_000000000001
		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(8);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_000000000021"); 

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		model.addAttribute("notiList", egovArticleService.selectArticleList(boardVO).get("resultList"));		
		
		// 공지사항 메인컨텐츠 조회 끝 -----------------------------------

		// 자유게시판 메인 컨텐츠 조회 시작 ---------------------------------
		/* */
		// 공지사항 : BBSMSTR_000000000021
		// 신청게시판 : BBSMSTR_000000000001
		//BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(10);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_000000000001"); 

		paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("bbsList", egovArticleService.selectArticleList(boardVO).get("resultList"));		
		model.addAttribute("bbsListPicks", egovArticleService.selectArticleListPicks(boardVO).get("resultList"));
		model.addAttribute("bbsListScore", egovArticleService.selectArticleListScore(boardVO).get("resultList"));
		// 자유게시판 메인컨텐츠 조회 끝 -----------------------------------	
		
		// 접수 카운트
		model.addAttribute("bbsListBoard", egovArticleService.selectArticleListBoard(boardVO).get("resultList"));

		return "main/EgovMainView3";
	}	
	
	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmn/main/userPage.do")
	public String getUserMainPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /cmn/main/userPage.do");
		//LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}		
		
		String mberId = "";		
		//LOGGER.debug("isAuthenticated : {}", isAuthenticated);
		
		// 권한에 따른 페이지만 호출
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (loginVO != null) {
			//mberId = loginVO.getId();
			mberId = loginVO.getUniqId();
		}		

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//패스워드힌트목록을 코드정보로부터 조회
		vo.setCodeId("COM022");
		List<?> passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);

		//성별구분코드를 코드정보로부터 조회
		vo.setCodeId("COM014");
		List<?> sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);

		//사용자상태코드를 코드정보로부터 조회
		vo.setCodeId("COM013");
		List<?> mberSttus_result = cmmUseService.selectCmmCodeDetail(vo);

		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("COMTNORGNZTINFO");
		List<?> groupId_result = cmmUseService.selectGroupIdDetail(vo);

		model.addAttribute("passwordHint_result", passwordHint_result); //패스워트힌트목록
		model.addAttribute("sexdstnCode_result", sexdstnCode_result); //성별구분코드목록
		model.addAttribute("mberSttus_result", mberSttus_result); //사용자상태코드목록
		model.addAttribute("groupId_result", groupId_result); //그룹정보 목록

		if(loginVO.getUserSe().equals("USR")){
			UserManageVO userManageVO = userManageService.selectUser(mberId);
			model.addAttribute("mberManageVO", userManageVO);
			//System.out.println("### mberManageVO.getEmplyrId():"+userManageVO.getEmplyrId());
			//System.out.println("### mberManageVO.getEmplyrNm():"+userManageVO.getEmplyrNm());
			return "main/UserMainView2";
		}else{ 
			MberManageVO mberManageVO = mberManageService.selectMber(mberId);
			model.addAttribute("mberManageVO", mberManageVO);			
			//System.out.println("### mberManageVO.getMberId():"+mberManageVO.getMberId());
			//System.out.println("### mberManageVO.getMberNm():"+mberManageVO.getMberNm());
			return "main/UserMainView";
		}
	}		
	
	/**
     * Head메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "main_headG", "main_head"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mms/EgovMainMenuHead.do")
    public String selectMainMenuHead(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam(value="flag", required=false) String flag,
    		ModelMap model)
            throws Exception {
    	
			//LOGGER.debug("------------------");
			//LOGGER.debug("do : /sym/mms/EgovMainMenuHead.do");
			//LOGGER.debug("------------------");
						
	    	// 1. Spring Security 사용자권한 처리
			Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
			if (!isAuthenticated) {
				//LOGGER.debug(" xxxxxx ");
			}			
			
	    	LoginVO user =
	        		EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;   		
    		
        	if(EgovUserDetailsHelper.isAuthenticated() && user!=null){
        		/*
        		menuManageVO.setTmp_Id(user.getId());
            	menuManageVO.setTmp_Password(user.getPassword());
            	menuManageVO.setTmp_UserSe(user.getUserSe());
            	menuManageVO.setTmp_Name(user.getName());
            	menuManageVO.setTmp_Email(user.getEmail());
            	menuManageVO.setTmp_OrgnztId(user.getOrgnztId());
            	menuManageVO.setTmp_UniqId(user.getUniqId());
        		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHead(menuManageVO));
        		LOGGER.debug(" --------- ");
        		LOGGER.debug(" user.getId() : "+user.getId());
        		LOGGER.debug(" user.getPassword() : "+user.getPassword());
        		LOGGER.debug(" user.getUserSe() : "+user.getUserSe());
        		LOGGER.debug(" user.getName() : "+user.getName());
        		LOGGER.debug(" user.getEmail() : "+user.getEmail());
        		LOGGER.debug(" user.getOrgnztId() : "+user.getOrgnztId());
        		LOGGER.debug(" user.getUniqId() : "+user.getUniqId());
        		*/
        		
        		menuManageVO.setAuthorCode("ROLE_USER");
        		Map<String, Object> map = menuManageService.selectMainMenuHeadByAuthor(menuManageVO);
        		//int totCnt = Integer.parseInt((String)map.get("resultCnt"));        		
        		//paginationInfo.setTotalRecordCount(totCnt);
        		model.addAttribute("list_headmenu", map.get("resultList"));
        		//model.addAttribute("resultCnt", map.get("resultCnt"));
        		//model.addAttribute("paginationInfo", paginationInfo);
        	}else{
        		menuManageVO.setAuthorCode("ROLE_ANONYMOUS");
        		Map<String, Object> map = menuManageService.selectMainMenuHeadByAuthor(menuManageVO);
        		//int totCnt = Integer.parseInt((String)map.get("resultCnt"));        		
        		//paginationInfo.setTotalRecordCount(totCnt);
        		model.addAttribute("list_headmenu", map.get("resultList"));
        		//model.addAttribute("resultCnt", map.get("resultCnt"));
        		//model.addAttribute("paginationInfo", paginationInfo);        		
        	}    	       	
        	
    	if(flag==null){
    		return "main/inc/EgovIncSubHeader"; // 업무화면의 상단메뉴 화면
    	}else if(flag.equals("MAIN")){
    		return "main/inc/EgovIncHeader"; // 메인화면의 상단메뉴 화면
    	}else{
    		return "main/inc/EgovIncSubHeader"; // 업무화면의 상단메뉴 화면
    	}
    }

	/**
	 * contest 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]   
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmn/ctst/mainPage.do")
	public String getCtstMainPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /cmn/ctst/mainPage.do");
		//LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();		
		//LOGGER.debug("isAuthenticated : {}", isAuthenticated);				
		
		// 자유게시판 메인 컨텐츠 조회 시작 ---------------------------------
		/* */
		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_000000000001");

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("bbsList", egovArticleService.selectArticleList(boardVO).get("resultList"));
		/* */
		// 자유게시판 메인컨텐츠 조회 끝 -----------------------------------

		// 조회 품목 리스트
		EstmtManageVO estmtManageVO = new EstmtManageVO();
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);		
		
    	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());		
		
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
		
		model.addAttribute("estmtList", estmtManageService.selectEstmtList(estmtManageVO).get("resultList"));		

		return "main/CtstMainView";
	}	
	
	/**
	 * contest 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]   
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmn/ctst/userPwd.do")
	public String getUserPwd(HttpServletRequest request, ModelMap model)
	  throws Exception{

		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /cmn/ctst/userPwd.do");
		//LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();		
		//LOGGER.debug("isAuthenticated : {}", isAuthenticated);				
		
		AddressBookUserVO addressBookUserVO = new AddressBookUserVO();
        List<AddressBookUserVO> result = adbkDAO.selectPwdList(addressBookUserVO);
        
        //System.out.println("##### result.size():"+result.size());
        for(int i=0;i<result.size();i++){
        	//System.out.println("----");
        	//System.out.println("result.get("+i+").getEmplyrId():"+result.get(i).getEmplyrId());
        	//System.out.println("result.get("+i+").getEsntlId():"+result.get(i).getEsntlId());
        	//System.out.println("result.get("+i+").getUserNm():"+result.get(i).getUserNm());
        	//System.out.println("result.get("+i+").getIhidNum():"+result.get(i).getIhidNum());
    		//System.out.println("enpassword:"+enpassword);
    		String enpassword = EgovFileScrty.encryptPassword("ibkS"+result.get(i).getIhidNum(), result.get(i).getEmplyrId());
    		//System.out.println(i+","+result.get(i).getEmplyrId()+","+result.get(i).getEsntlId()+","+result.get(i).getUserNm()+","+result.get(i).getIhidNum()+","+enpassword);

    		//UserManageVO userManageVO = new UserManageVO();
			//userManageVO.setPassword(EgovFileScrty.encryptPassword(enpassword, result.get(i).getEsntlId()));
			//userManageVO.setUniqId(result.get(i).getEsntlId());
			//mberManageService.updatePassword(userManageVO);
			
    		//MberManageVO mberManageVO = new MberManageVO();
			//mberManageVO.setPassword(enpassword);
			//mberManageVO.setUniqId(result.get(i).getEsntlId());
			//mberManageService.updatePassword(mberManageVO);
        }
        
        
        int cnt = adbkDAO.selectPwdListCnt(addressBookUserVO);        
        //System.out.println("### cnt:"+cnt);

        model.addAttribute("resultList", result);
        model.addAttribute("resultCnt", cnt);
        
		return "main/UserPwdView";
	}	
	
	/**
	 * contest 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]   
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmn/ctst/downPage.do")
	public String getCtstDownPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /cmn/ctst/downPage.do");
		//LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();		
		//LOGGER.debug("isAuthenticated : {}", isAuthenticated);				
		
		// 자유게시판 메인 컨텐츠 조회 시작 ---------------------------------
		/* */
		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_000000000001");

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("bbsList", egovArticleService.selectArticleList(boardVO).get("resultList"));
		/* */
		// 자유게시판 메인컨텐츠 조회 끝 -----------------------------------

		// 조회 품목 리스트
		EstmtManageVO estmtManageVO = new EstmtManageVO();
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);		
		
    	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());		
		
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
		
		model.addAttribute("estmtList", estmtManageService.selectEstmtList(estmtManageVO).get("resultList"));		

		return "main/CtstDownView";
	}
	
	/**
	 * contest ppl 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]   
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmn/ctst/pplPage.do")
	public String getCtstPplPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /cmn/ctst/pplPage.do");
		//LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();		
		//LOGGER.debug("isAuthenticated : {}", isAuthenticated);				

		return "main/CtstPplView";
	}	
	
	/**
	 * 사용자 리스트 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]   
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmn/user/userList.do")
	public String getUserListPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /cmn/ctst/pplPage.do");
		//LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();		
		LOGGER.debug("isAuthenticated : {}", isAuthenticated);
		if (!isAuthenticated) {
			LOGGER.debug(" xxxxxx ");
		}

		return "main/UserListView";
	}		
	
	/**
	 * contest 접수게시판 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]   
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmn/ctst/boardPage.do")
	public String getCtstBoardPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		//LOGGER.debug("------------------");
		//LOGGER.debug("do : /cmn/ctst/boardPage.do");
		//LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();		
		//LOGGER.debug("isAuthenticated : {}", isAuthenticated);				
				
		return "main/CtstBoardView";
	}
	
	/**
	 * 로그인 이력 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]   
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/stst/ctst/loginLogPage.do")
	public String getUserLoginLogPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		LOGGER.debug("------------------");
		LOGGER.debug("do : /stst/ctst/loginLogPage.do");
		LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();		
		LOGGER.debug("isAuthenticated : {}", isAuthenticated);
		if (!isAuthenticated) {
			return "index";
		}

		return "custom/stat/UserLoginLogView";
	}		
	
	/**
	 * 부서별 접속현황 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]   
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/stst/ctst/DeptLoginListPage.do")
	public String getDeptLoginListPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		LOGGER.debug("------------------");
		LOGGER.debug("do : /stst/ctst/DeptLoginListPage.do");
		LOGGER.debug("------------------");
					
    	// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();		
		LOGGER.debug("isAuthenticated : {}", isAuthenticated);
		if (!isAuthenticated) {
			return "index";
		}

		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_000000000021"); 		
		
		model.addAttribute("bbsDeptBbsList", egovArticleService.selectDeptBbsList(boardVO).get("resultList"));
		model.addAttribute("bbsDeptLoginList", egovArticleService.selectDeptLoginList(boardVO).get("resultList"));
		model.addAttribute("bbsUserLoginList", egovArticleService.selectUserLoginList(boardVO).get("resultList"));
		
		
		return "custom/stat/DeptLoginListView";
	}	
}