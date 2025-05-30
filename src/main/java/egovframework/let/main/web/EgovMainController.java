package egovframework.let.main.web;

import java.math.BigDecimal;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSManageService;
import egovframework.let.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.let.sym.mnu.mpm.service.MenuManageVO;
import egovframework.let.uss.olh.faq.service.EgovFaqManageService;
import egovframework.let.uss.olh.faq.service.FaqManageDefaultVO;
import egovframework.let.uss.olp.qri.service.EgovQustnrRespondInfoService;
import egovframework.let.cop.bbs.service.EgovArticleService;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * 템플릿 메인 페이지 컨트롤러 클래스(Sample 소스)
 * @author 실행환경 개발팀 JJY
 * @since 2011.08.31
 * @version 1.0
 * @see
 *
 * "<pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일              수정자           수정내용
 *  ----------  --------   ---------------------------
 *  2011.08.31  JJY        최초 생성
 *  2021.08.12  신용호            추가 URL 생성
 *
 * </pre>"
 */
@Controller@SessionAttributes(types = ComDefaultVO.class)
public class EgovMainController {

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;

	/** FaqManageService */
	@Resource(name = "FaqManageService")
    private EgovFaqManageService faqManageService;

	/** egovQustnrRespondInfoService */
	@Resource(name = "egovQustnrRespondInfoService")
	private EgovQustnrRespondInfoService egovQustnrRespondInfoService;

	/** EgovMessageSource */
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "EgovArticleService")
	private EgovArticleService egovArticleService;

	/** ID Generation */
	@Resource(name="egovVisitCountLogIdGnrService")
	private EgovIdGnrService egovVisitCountLogIdGnrService;

	/**
	 * 메인 페이지에서 각 업무 화면으로 연계하는 기능을 제공한다.
	 *
	 * @param request request
	 * @param commandMap commandMap
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/forwardPage.do")
	public String forwardPageWithMenuNo(HttpServletRequest request, @RequestParam Map<String, Object> commandMap)
	  throws Exception{
		return "";
	}

	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request request
	 * @param model model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/main/mainPage.do")
	public String getMgtMainPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		// 방문수 확인용
		BigDecimal visit_count = egovVisitCountLogIdGnrService.getNextBigDecimalId();
		//System.out.println("visit_count:"+visit_count);

		//LoginVO user =
		//		EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;
		//if(EgovUserDetailsHelper.isAuthenticated() && user!=null){
			// 공모전 접수 카운트 조회 시작 ---------------------------------
			BoardVO vo = new BoardVO();
			vo.setBbsId("BBSMSTR_BBBBBBBBBBBB");

			Map<String, Object> map = egovArticleService.selectGuestArticleList(vo);
			int contestBbsTotCnt = Integer.parseInt((String)map.get("resultCnt"));
			model.addAttribute("contestBbsTotCnt", contestBbsTotCnt);
			// 공모전 접수 카운트 조회 끝 -----------------------------------

			// 공지사항 메인 컨텐츠 조회 시작 ---------------------------------
			BoardVO boardVO = new BoardVO();
			boardVO.setUseAt("Y");
			boardVO.setPageUnit(10);
			boardVO.setPageSize(10);
			boardVO.setBbsId("BBSMSTR_AAAAAAAAAAAA");

			PaginationInfo paginationInfo = new PaginationInfo();

			paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
			paginationInfo.setPageSize(boardVO.getPageSize());

			boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
			boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			//System.out.println("boardVO.getUseAt():"+boardVO.getUseAt());

			model.addAttribute("notiList", bbsMngService.selectBoardArticles(boardVO, "BBSA02").get("resultList"));
			// 공지사항 메인컨텐츠 조회 끝 -----------------------------------

			return "main/EgovMainView";
		//}else{
		//	return "main/contest/ContIntroView";
		//}
	}

	/**
     * Header Page를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "EgovIncHeader"
     * @exception Exception Exception
     */
	@RequestMapping(value="/sym/mms/EgovHeader.do")
    public String selectHeader(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam(value="flag", required=false) String flag,
    		ModelMap model)
            throws Exception {

    	LoginVO user =
    		EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;
    	if(EgovUserDetailsHelper.isAuthenticated() && user!=null){
    		menuManageVO.setTmp_Id(user.getId());
        	menuManageVO.setTmp_Password(user.getPassword());
        	menuManageVO.setTmp_UserSe(user.getUserSe());
        	menuManageVO.setTmp_Name(user.getName());
        	menuManageVO.setTmp_Email(user.getEmail());
        	menuManageVO.setTmp_OrgnztId(user.getOrgnztId());
        	menuManageVO.setTmp_UniqId(user.getUniqId());
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHead(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeft(menuManageVO));
    	}else{
    		menuManageVO.setAuthorCode("ROLE_ANONYMOUS");
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHeadByAuthor(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeftByAuthor(menuManageVO));
    	}

    	return "main/inc/EgovIncHeader"; // 업무화면의 상단메뉴 화면

    }

	/**
     * Header Page를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "ContIncHeader"
     * @exception Exception Exception
     */
	@RequestMapping(value="/sym/mms/ContHeader.do")
    public String selectHeader2(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam(value="flag", required=false) String flag,
    		ModelMap model)
            throws Exception {

    	LoginVO user =
    		EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;
    	if(EgovUserDetailsHelper.isAuthenticated() && user!=null){
    		menuManageVO.setTmp_Id(user.getId());
        	menuManageVO.setTmp_Password(user.getPassword());
        	menuManageVO.setTmp_UserSe(user.getUserSe());
        	menuManageVO.setTmp_Name(user.getName());
        	menuManageVO.setTmp_Email(user.getEmail());
        	menuManageVO.setTmp_OrgnztId(user.getOrgnztId());
        	menuManageVO.setTmp_UniqId(user.getUniqId());
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHead(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeft(menuManageVO));
    	}else{
    		menuManageVO.setAuthorCode("ROLE_ANONYMOUS");
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHeadByAuthor(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeftByAuthor(menuManageVO));
    	}

    	return "main/inc/ContIncHeader"; // 업무화면의 상단메뉴 화면

    }

	/**
     * Footer Page를 조회한다.
     * @return 출력페이지정보 "EgovIncFooter"
     * @exception Exception Exception
     */
	@RequestMapping(value="/sym/mms/EgovFooter.do")
    public String selectFooter(ModelMap model) throws Exception {
    	return "main/inc/EgovIncFooter";
    }

	/**
     * Footer Page를 조회한다.
     * @return 출력페이지정보 "ContIncFooter"
     * @exception Exception Exception
     */
	@RequestMapping(value="/sym/mms/ContFooter.do")
    public String selectFooter2(ModelMap model) throws Exception {

		// 신청서 다운로드 첨부파일 조회수 시작 ---------------------------------
		BoardVO boardVO = new BoardVO();
		boardVO.setAtchFileId("FILE_000000000000061");

		String visit_count = bbsMngService.selectBoardArticleVisitRdcnt(boardVO);
		model.addAttribute("visit_count", visit_count);

		String download_count = bbsMngService.selectBoardArticleFileRdcnt(boardVO);
		model.addAttribute("download_count", download_count);

    	return "main/inc/ContIncFooter";
    }

    /**
     * 좌측메뉴를 조회한다.
     * @return 출력페이지정보 "EgovIncLeftmenu"
     * @exception Exception Exception
     */
	@RequestMapping(value="/sym/mms/EgovMenuLeft.do")
    public String selectMenuLeft(ModelMap model) throws Exception {

    	//LoginVO user = EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;

    	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	if(EgovUserDetailsHelper.isAuthenticated()){
    		//인증된 경우 처리할 사항 추가 ...
    		model.addAttribute("lastLogoutDateTime", "로그아웃 타임: 2021-08-12 11:30");
    		//최근 로그아웃 시간 등에 대한 확보 후 메인 컨텐츠로 활용
    	}

      	return "main/inc/EgovIncLeftmenu";
    }

	/**
	 * 좌측메뉴를 조회한다.
	 * @return 출력페이지정보 "EgovIncLeftmenu"
	 * @exception Exception Exception
	 */
	@RequestMapping(value="/sym/mms/ContMenuLeft.do")
	public String selectContMenuLeft(ModelMap model) throws Exception {

		//LoginVO user = EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;

		//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(EgovUserDetailsHelper.isAuthenticated()){
			//인증된 경우 처리할 사항 추가 ...
			model.addAttribute("lastLogoutDateTime", "로그아웃 타임: 2021-08-12 11:30");
			//최근 로그아웃 시간 등에 대한 확보 후 메인 컨텐츠로 활용
		}

		return "main/inc/ContIncLeftmenu";
	}

	/**
     * Head메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "main_headG", "main_head"
     * @exception Exception Exception
     */
	@RequestMapping(value="/sym/mms/EgovMainMenuHead.do")
    public String selectMainMenuHead(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam(value="flag", required=false) String flag,
    		ModelMap model)
            throws Exception {

    	LoginVO user =
    		EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;
    	if(EgovUserDetailsHelper.isAuthenticated() && user!=null){
    		menuManageVO.setTmp_Id(user.getId());
        	menuManageVO.setTmp_Password(user.getPassword());
        	menuManageVO.setTmp_UserSe(user.getUserSe());
        	menuManageVO.setTmp_Name(user.getName());
        	menuManageVO.setTmp_Email(user.getEmail());
        	menuManageVO.setTmp_OrgnztId(user.getOrgnztId());
        	menuManageVO.setTmp_UniqId(user.getUniqId());
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHead(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeft(menuManageVO));
    	}else{
    		menuManageVO.setAuthorCode("ROLE_ANONYMOUS");
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHeadByAuthor(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeftByAuthor(menuManageVO));
    	}

    	if(flag==null){
    		return "main/inc/EgovIncSubHeaderOld"; // 업무화면의 상단메뉴 화면
    	}else if(flag.equals("MAIN")){
    		return "main/inc/EgovIncHeaderOld"; // 메인화면의 상단메뉴 화면
    	}else{
    		return "main/inc/EgovIncSubHeaderOld"; // 업무화면의 상단메뉴 화면
    	}
    }


    /**
     * 좌측메뉴를 조회한다.
     * @return 출력페이지정보 "main_left"
     * @exception Exception Exception
     */
	@RequestMapping(value="/sym/mms/EgovMainMenuLeft.do")
    public String selectMainMenuLeft(
    		ModelMap model)
            throws Exception {

    	//LoginVO user = EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;

    	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	if(EgovUserDetailsHelper.isAuthenticated()){
    		//인증된 경우 처리할 사항 추가 ...
    		model.addAttribute("lastLogoutDateTime", "로그아웃 타임: 2011-11-10 11:30");
    		//최근 로그아웃 시간 등에 대한 확보 후 메인 컨텐츠로 활용
    	}

      	return "main/inc/EgovIncLeftmenuOld";
    }


	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request request
	 * @param model model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/main/mainPage99.do")
	public String getMgtMainPage99(HttpServletRequest request, ModelMap model)
	  throws Exception{

		// 공지사항 메인 컨텐츠 조회 시작 ---------------------------------
		BoardVO boardVO = new BoardVO();
		boardVO.setUseAt("Y");
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


		// 공지사항 메인컨텐츠 조회 끝 -----------------------------------

		// 접수게시판 메인 컨텐츠 조회 시작 ---------------------------------
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_BBBBBBBBBBBB");

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("bbsList", bbsMngService.selectBoardArticles(boardVO, "BBSA02").get("resultList"));

		// 자유게시판 메인컨텐츠 조회 끝 -----------------------------------

		// FAQ 메인 컨텐츠 조회 시작 ---------------------------------
		/* EgovPropertyService.SiteList */
		FaqManageDefaultVO searchVO = new FaqManageDefaultVO();
		searchVO.setPageUnit(3);
    	searchVO.setPageSize(10);

    	/* pageing */
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("faqList", faqManageService.selectFaqList(searchVO));

		// FAQ 메인 컨텐츠 조회 끝 -----------------------------------

        // 설문참여 메인 컨텐츠 조회 시작 -----------------------------------
        ComDefaultVO qVO = new ComDefaultVO();
    	qVO.setPageUnit(1);
    	qVO.setPageSize(10);

    	/* pageing */
		paginationInfo.setCurrentPageNo(qVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(qVO.getPageUnit());
		paginationInfo.setPageSize(qVO.getPageSize());

		qVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		qVO.setLastIndex(paginationInfo.getLastRecordIndex());
		qVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("qriList", egovQustnrRespondInfoService.selectQustnrRespondInfoManageList(qVO));

     // 설문참여 메인 컨텐츠 조회 끝 -----------------------------------

		return "main/EgovMainView2";
	}

	/**
	 * 공모전 소개 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request request
	 * @param model model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/main/contIntroPage.do")
	public String getContIntroPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		return "main/contest/ContIntroView";
	}

	/**
	 * 공모전 성과 (역대수상작)
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request request
	 * @param model model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestOtcm.do")
	public String getContestOtcmPage(HttpServletRequest request, ModelMap model)
			throws Exception{

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "4000000");
		request.getSession().setAttribute("activeMenuNo", "4010000");

		return "main/contest/ContestOtcmView";
	}

	/**
	 * 공모전 참관기
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request request
	 * @param model model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestPtcpRvw.do")
	public String getContestPtcpRvwPage(HttpServletRequest request, ModelMap model)
			throws Exception{

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "4000000");
		request.getSession().setAttribute("activeMenuNo", "4020000");

		return "main/contest/ContestPtcpRvwView";
	}

	/**
	 * 공모전 후기
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request request
	 * @param model model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestRvw.do")
	public String getContestRvwPage(HttpServletRequest request, ModelMap model)
			throws Exception{

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "4000000");
		request.getSession().setAttribute("activeMenuNo", "4030000");

		return "main/contest/ContestRvwView";
	}

	/**
	 * 공모전 부서 통계 현황
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request request
	 * @param model model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/deptSttcPsst.do")
	public String getContestDeptSttcPsstPage(HttpServletRequest request, ModelMap model)
			throws Exception{

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "6000000");
		request.getSession().setAttribute("activeMenuNo", "6030000");

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);

		// 게시물 검색 기준
		boardVO.setSearchBgnDe("2025-04-25");
		boardVO.setSearchEndDe("2025-12-31");
		boardVO.setBbsId("BBSMSTR_BBBBBBBBBBBB");

		model.addAttribute("bbsDeptBbsList", egovArticleService.selectDeptBbsList(boardVO).get("resultList"));
		model.addAttribute("bbsDeptLoginList", egovArticleService.selectDeptLoginList(boardVO).get("resultList"));
		model.addAttribute("bbsUserLoginList", egovArticleService.selectUserLoginList(boardVO).get("resultList"));

		return "main/contest/DeptSttcPsstView";
	}

	/**
	 * 공모전 부서 통계 현황 (임원용)
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request request
	 * @param model model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/deptSttcPsst2.do")
	public String getContestDeptSttcPsstPage2(HttpServletRequest request, ModelMap model)
			throws Exception{

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "8000000");
		request.getSession().setAttribute("activeMenuNo", "8010000");

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);

		// 게시물 검색 기준
		boardVO.setSearchBgnDe("2025-04-25");
		boardVO.setSearchEndDe("2025-12-31");
		boardVO.setBbsId("BBSMSTR_BBBBBBBBBBBB");

		model.addAttribute("bbsDeptBbsList", egovArticleService.selectDeptBbsList(boardVO).get("resultList"));
		model.addAttribute("bbsDeptLoginList", egovArticleService.selectDeptLoginList(boardVO).get("resultList"));
		model.addAttribute("bbsUserLoginList", egovArticleService.selectUserLoginList(boardVO).get("resultList"));

		return "main/contest/DeptSttcPsstView";
	}

	/**
	 * 공모전 개요 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request request
	 * @param model model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestOvrv.do")
	public String getContestOvrvPage(HttpServletRequest request, ModelMap model)
			throws Exception{

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "1000000");
		request.getSession().setAttribute("activeMenuNo", "1010000");

		return "main/contest/ContestOvrvView";
	}

	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request request
	 * @param model model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/main/mainPage2.do")
	public String getMgtMainPage2(HttpServletRequest request, ModelMap model)
			throws Exception{

		// 방문수 확인용
		BigDecimal visit_count = egovVisitCountLogIdGnrService.getNextBigDecimalId();

		LoginVO user =
				EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;
		if(EgovUserDetailsHelper.isAuthenticated() && user!=null){
			// 공모전 접수 카운트 조회 시작 ---------------------------------
			BoardVO vo = new BoardVO();
			vo.setBbsId("BBSMSTR_BBBBBBBBBBBB");

			Map<String, Object> map = egovArticleService.selectGuestArticleList(vo);
			int contestBbsTotCnt = Integer.parseInt((String)map.get("resultCnt"));
			model.addAttribute("contestBbsTotCnt", contestBbsTotCnt);
			// 공모전 접수 카운트 조회 끝 -----------------------------------

			// 공지사항 메인 컨텐츠 조회 시작 ---------------------------------
			BoardVO boardVO = new BoardVO();
			boardVO.setUseAt("Y");
			boardVO.setPageUnit(10);
			boardVO.setPageSize(10);
			boardVO.setBbsId("BBSMSTR_AAAAAAAAAAAA");

			PaginationInfo paginationInfo = new PaginationInfo();

			paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
			paginationInfo.setPageSize(boardVO.getPageSize());

			boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
			boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			model.addAttribute("notiList", bbsMngService.selectBoardArticles(boardVO, "BBSA02").get("resultList"));


			// 공지사항 메인컨텐츠 조회 끝 -----------------------------------

			return "main/EgovMainView2";
		}else{
			return "main/contest/ContIntroView";
		}
	}
}