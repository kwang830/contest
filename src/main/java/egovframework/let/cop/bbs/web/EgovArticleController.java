package egovframework.let.cop.bbs.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import egovframework.let.cop.bbs.service.*;
import egovframework.let.cop.bbs.service.EgovArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.uss.umt.service.EgovMberManageService;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.let.uss.umt.service.MberManageVO;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.string.EgovStringUtil;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


/**
 * 게시물 관리를 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * "<pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2009.3.19  이삼섭          최초 생성
 *   2009.06.29	한성곤			2단계 기능 추가 (댓글관리, 만족도조사)
 *   2011.07.01 안민정		 	댓글, 스크랩, 만족도 조사 기능의 종속성 제거
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *   2011.09.07 서준식           유효 게시판 게시일 지나도 게시물이 조회되던 오류 수정
 *   2016.06.13 김연호			표준프레임워크 3.6 개선
 * </pre>"
 */

@Controller
public class EgovArticleController {

	/** mberManageService */
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;	
	
	@Resource(name = "EgovArticleService")
    private EgovArticleService egovArticleService;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;

    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
	@Resource(name = "EgovBBSAttributeManageService")
	private EgovBBSAttributeManageService bbsAttrbService;

    @Autowired
    private DefaultBeanValidator beanValidator;

    //protected Logger log = Logger.getLogger(this.getClass());
    
    /**
     * XSS 방지 처리.
     * 
     * @param data data
     * @return unscript unscript
     */
    protected String unscript(String data) {
        if (data == null || data.trim().isEmpty()) {
            return "";
        }
        
        String ret = data;
        
        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");
        
        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");
        
        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");
        
        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        
        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }

    /**
     * 게시물에 대한 목록을 조회한다.
     *
	 * @param searchVO searchVO
     * @param model model
     * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/selectArticleList.do")
    public String selectArticleList(@ModelAttribute("searchVO") BoardVO searchVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String mberId = user.getUniqId();
		String deptCode = "";
		
		if(user.getUserSe().equals("GNR")){
			MberManageVO mberManageVO = mberManageService.selectMber(mberId);
			deptCode = mberManageVO.getDeptCode();
		}else{
			deptCode = "QQQ";
		}
	
		BoardMasterVO vo = new BoardMasterVO();
				
		vo.setBbsId(searchVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
		
		//방명록은 방명록 게시판으로 이동
		if(master.getBbsTyCode().equals("BBST03")){
			return "forward:/cop/bbs/selectGuestArticleList.do";
		}
				
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();			
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
	
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		searchVO.setSearchId(user.getUniqId());

		
		Map<String, Object> map = egovArticleService.selectArticleList(searchVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		//공지사항 추출
		List<BoardVO> noticeList = egovArticleService.selectNoticeArticleList(searchVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		// 기본 BBS template 지정
		if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
		    master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("sessionUniqId", user.getUniqId());
		model.addAttribute("sessionUserSe", user.getUserSe());

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("articleVO", searchVO);
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("deptCode", deptCode);
		return "egovframework/com/cop/bbs/EgovArticleList";
    }

    /**
     * 게시물에 대한 상세 정보를 조회한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/selectArticleDetail.do")
    public String selectArticleDetail(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
		boardVO.setLastUpdusrId(user.getUniqId());
		BoardVO vo = egovArticleService.selectArticleDetail(boardVO);

		boardVO.setNtcrId(user.getId());
		boardVO.setNtcrNm(user.getName());
		boardVO.setFrstRegisterId(user.getUniqId());
		
		// 게시판 읽은 기록 저장
		egovArticleService.insertArticleLog(boardVO);
	
		model.addAttribute("result", vo);
		model.addAttribute("sessionUniqId", user.getUniqId());
		model.addAttribute("sessionUserSe", user.getUserSe());
		
		//비밀글은 작성자만 볼수 있음 
		if(!EgovStringUtil.isEmpty(vo.getSecretAt()) && vo.getSecretAt().equals("Y") && !user.getUniqId().equals(vo.getFrstRegisterId()))
			return "forward:/cop/bbs/selectArticleList.do";
		
		//----------------------------
		// template 처리 (기본 BBS template 지정  포함)
		//----------------------------
		BoardMasterVO master = new BoardMasterVO();
		
		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());
		
		BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);
	
		if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().isEmpty()) {
		    masterVo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
	
		model.addAttribute("boardMasterVO", masterVo);
	
		return "egovframework/com/cop/bbs/EgovArticleDetail";
    }
    
	/**
	 * 게시물에 대한 상세 정보를 조회한다. 팝업 전달용
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
    @RequestMapping("/cop/bbs/selectArticleDetailAjax.do")
    public ModelAndView selectArticleDetailAjax(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		boardVO.setLastUpdusrId(user.getUniqId());
		BoardVO vo = egovArticleService.selectArticleDetail(boardVO);
	
		String noticeTitle = "";
		String noticeCotents = "";
		if (vo.getNttSj() != null || !vo.getNttSj().isEmpty()) {
			noticeTitle = vo.getNttSj();
		}		
		if (vo.getNttCn() != null || !vo.getNttCn().isEmpty()) {
			noticeCotents = vo.getNttCn();
		}		
		
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setViewName("jsonView");		

		modelAndView.addObject("noticeTitle", noticeTitle);
		modelAndView.addObject("noticeCotents", noticeCotents);

		return modelAndView;
    }

    /**
     * 게시물 등록을 위한 등록페이지로 이동한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/insertArticleView.do")
    public String insertArticleView(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		BoardMasterVO bdMstr = new BoardMasterVO();
		BoardVO board = new BoardVO();
	
		if (isAuthenticated) {
	
		    BoardMasterVO vo = new BoardMasterVO();
		    vo.setBbsId(boardVO.getBbsId());
		    vo.setUniqId(user.getUniqId());
	
		    bdMstr = bbsAttrbService.selectBBSMasterInf(vo);
		}
	
		//----------------------------
		// 기본 BBS template 지정 
		//----------------------------
		if (bdMstr.getTmplatCours() == null || bdMstr.getTmplatCours().isEmpty()) {
		    bdMstr.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
	
		model.addAttribute("articleVO", board);
		model.addAttribute("boardMasterVO", bdMstr);
		////-----------------------------
	
		return "egovframework/com/cop/bbs/EgovArticleRegist";
    }

    /**
     * 게시물을 등록한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/insertArticle.do")
    public String insertArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") BoardVO board, BindingResult bindingResult, 
	    ModelMap model) throws Exception {

    	//System.out.println(">>> insertArticle.do");;
    	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
	
		    BoardMasterVO master = new BoardMasterVO();
		    
		    master.setBbsId(boardVO.getBbsId());
		    master.setUniqId(user.getUniqId());
	
		    master = bbsAttrbService.selectBBSMasterInf(master);
		    
	
		    //----------------------------
		    // 기본 BBS template 지정 
		    //----------------------------
		    if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
			master.setTmplatCours("css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		    }
	
		    model.addAttribute("boardMasterVO", master);
		    ////-----------------------------
	
		    return "egovframework/com/cop/bbs/EgovArticleRegist";
		}
	
		if (isAuthenticated) {
		    String atchFileId = "";
		    
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    if (!files.isEmpty()) {
				List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
		    }
		    board.setAtchFileId(atchFileId);
		    board.setFrstRegisterId(user.getUniqId());
		    board.setBbsId(board.getBbsId());
		    
		    
		    //익명등록 처리 
		    if(board.getAnonymousAt() != null && board.getAnonymousAt().equals("Y")){
		    	board.setNtcrId("anonymous"); //게시물 통계 집계를 위해 등록자 ID 저장
		    	board.setNtcrNm("익명"); //게시물 통계 집계를 위해 등록자 Name 저장
		    	board.setFrstRegisterId("anonymous");
		    	
		    } else {
		    	board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		    	board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		    	
		    }
		    
		    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
		    
		    egovArticleService.insertArticle(board);
		}

		return "forward:/cop/bbs/selectArticleList.do";
    }

    /**
     * 게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/replyArticleView.do")
    public String addReplyBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
		BoardMasterVO master = new BoardMasterVO();
		BoardVO articleVO = new BoardVO();
		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());
	
		master = bbsAttrbService.selectBBSMasterInf(master);
		boardVO = egovArticleService.selectArticleDetail(boardVO);
		
		//----------------------------
		// 기본 BBS template 지정 
		//----------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
		    master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
	
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("result", boardVO);
	
		model.addAttribute("articleVO", articleVO);
		
		return "egovframework/com/cop/bbs/EgovArticleReply";
    }

    /**
     * 게시물에 대한 답변을 등록한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/replyArticle.do")
    public String replyBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") BoardVO board, BindingResult bindingResult, ModelMap model
	    ) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
		    BoardMasterVO master = new BoardMasterVO();
		    
		    master.setBbsId(boardVO.getBbsId());
		    master.setUniqId(user.getUniqId());
	
		    master = bbsAttrbService.selectBBSMasterInf(master);
		    
	
		    //----------------------------
		    // 기본 BBS template 지정 
		    //----------------------------
		    if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
			master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		    }
	
		    model.addAttribute("articleVO", boardVO);
		    model.addAttribute("boardMasterVO", master);
		    ////-----------------------------
	
		    return "egovframework/com/cop/bbs/EgovArticleReply";
		}
	
		if (isAuthenticated) {
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    String atchFileId = "";
	
		    if (!files.isEmpty()) {
			List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		    }
	
		    board.setAtchFileId(atchFileId);
		    board.setReplyAt("Y");
		    board.setFrstRegisterId(user.getUniqId());
		    board.setBbsId(board.getBbsId());
		    board.setParnts(Long.toString(boardVO.getNttId()));
		    board.setSortOrdr(boardVO.getSortOrdr());
		    board.setReplyLc(Integer.toString(Integer.parseInt(boardVO.getReplyLc()) + 1));
		    
		  //익명등록 처리 
		    if(board.getAnonymousAt() != null && board.getAnonymousAt().equals("Y")){
		    	board.setNtcrId("anonymous"); //게시물 통계 집계를 위해 등록자 ID 저장
		    	board.setNtcrNm("익명"); //게시물 통계 집계를 위해 등록자 Name 저장
		    	board.setFrstRegisterId("anonymous");
		    	
		    } else {
		    	board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		    	board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		    	
		    }
		    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
		    
		    egovArticleService.insertArticle(board);
		}
		
		return "forward:/cop/bbs/selectArticleList.do";
    }

    /**
     * 게시물 수정을 위한 수정페이지로 이동한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/updateArticleView.do")
    public String updateArticleView(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model)
	    throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		boardVO.setFrstRegisterId(user.getUniqId());
		
		BoardMasterVO bmvo = new BoardMasterVO();
		BoardVO bdvo = new BoardVO();
		
		vo.setBbsId(boardVO.getBbsId());
		
		bmvo.setBbsId(boardVO.getBbsId());
		bmvo.setUniqId(user.getUniqId());
	
		if (isAuthenticated) {
		    bmvo = bbsAttrbService.selectBBSMasterInf(bmvo);
		    bdvo = egovArticleService.selectArticleDetail(boardVO);
		}
	
		//----------------------------
		// 기본 BBS template 지정 
		//----------------------------
		if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().isEmpty()) {
		    bmvo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
	
		//익명 등록글인 경우 수정 불가 
		if(bdvo.getNtcrId().equals("anonymous")){
			model.addAttribute("result", bdvo);
			model.addAttribute("boardMasterVO", bmvo);
			return "egovframework/com/cop/bbs/EgovArticleDetail";
		}
		
		model.addAttribute("articleVO", bdvo);
		model.addAttribute("boardMasterVO", bmvo);
		
		return "egovframework/com/cop/bbs/EgovArticleUpdt";
    }

    /**
     * 게시물에 대한 내용을 수정한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/updateArticle.do")
    public String updateBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		String atchFileId = boardVO.getAtchFileId();
	
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
	
		    boardVO.setFrstRegisterId(user.getUniqId());
		    
		    BoardMasterVO bmvo = new BoardMasterVO();

		    bmvo.setBbsId(boardVO.getBbsId());
		    bmvo.setUniqId(user.getUniqId());
	
		    bmvo = bbsAttrbService.selectBBSMasterInf(bmvo);
			BoardVO bdvo = egovArticleService.selectArticleDetail(boardVO);
	
		    model.addAttribute("articleVO", bdvo);
		    model.addAttribute("boardMasterVO", bmvo);
	
		    return "egovframework/com/cop/bbs/EgovArticleUpdt";
		}
		
		if (isAuthenticated) {
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    if (!files.isEmpty()) {
				if ("".equals(atchFileId)) {
				    List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
				    atchFileId = fileMngService.insertFileInfs(result);
				    board.setAtchFileId(atchFileId);
				} else {
				    FileVO fvo = new FileVO();
				    fvo.setAtchFileId(atchFileId);
				    int cnt = fileMngService.getMaxFileSN(fvo);
				    List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
				    fileMngService.updateFileInfs(_result);
				}
		    }
	
		    board.setLastUpdusrId(user.getUniqId());
		    
		    board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    
		    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
		    
		    egovArticleService.updateArticle(board);
		}
		
		return "forward:/cop/bbs/selectArticleList.do";
    }

    /**
     * 게시물에 대한 내용을 삭제한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/deleteArticle.do")
    public String deleteBoardArticle(HttpServletRequest request, @ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {
	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		//--------------------------------------------------------------------------------------------
    	// @ XSS 대응 권한체크 체크  START
    	// param1 : 사용자고유ID(uniqId,esntlId)
    	//--------------------------------------------------------


		BoardVO bdvo = egovArticleService.selectArticleDetail(boardVO);
		//익명 등록글인 경우 수정 불가 
		if(bdvo.getNtcrId().equals("anonymous")){
			model.addAttribute("result", bdvo);
			model.addAttribute("boardMasterVO", bdMstr);
			return "egovframework/com/cop/bbs/EgovArticleDetail";
		}
		
		if (isAuthenticated) {
		    board.setLastUpdusrId(user.getUniqId());
		    
		    egovArticleService.deleteArticle(board);
		    model.addAttribute("resultMsg", "success.common.delete");
		}
	
		return "forward:/cop/bbs/selectArticleList.do";
    }
    
    /**
     * 방명록에 대한 목록을 조회한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/selectGuestArticleList.do")
    public String selectGuestArticleList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		@SuppressWarnings("unused")
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		// 수정 및 삭제 기능 제어를 위한 처리
		model.addAttribute("sessionUniqId", user.getUniqId());
		
		BoardVO vo = new BoardVO();
	
		vo.setBbsId(boardVO.getBbsId());
		vo.setBbsNm(boardVO.getBbsNm());
		vo.setNtcrNm(user.getName());
		vo.setNtcrId(user.getUniqId());
	
		BoardMasterVO masterVo = new BoardMasterVO();
		
		masterVo.setBbsId(vo.getBbsId());
		masterVo.setUniqId(user.getUniqId());
		
		BoardMasterVO mstrVO = bbsAttrbService.selectBBSMasterInf(masterVo);
	
		vo.setPageIndex(boardVO.getPageIndex());
		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
	
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = egovArticleService.selectGuestArticleList(vo);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("user", user);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardMasterVO", mstrVO);
		model.addAttribute("articleVO", vo);
		model.addAttribute("paginationInfo", paginationInfo);
	
		return "egovframework/com/cop/bbs/EgovGuestArticleList";
    }
    
	
    /**
     * 방명록에 대한 내용을 등록한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/insertGuestArticle.do")
    public String insertGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("Board") Board board, BindingResult bindingResult,
	    ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
	
		    BoardVO vo = new BoardVO();
	
		    vo.setBbsId(boardVO.getBbsId());
		    vo.setBbsNm(boardVO.getBbsNm());
		    vo.setNtcrNm(user.getName());
		    vo.setNtcrId(user.getUniqId());
	
		    BoardMasterVO masterVo = new BoardMasterVO();
		    
		    masterVo.setBbsId(vo.getBbsId());
		    masterVo.setUniqId(user.getUniqId());
		    
		    BoardMasterVO mstrVO = bbsAttrbService.selectBBSMasterInf(masterVo);
	
		    vo.setPageUnit(propertyService.getInt("pageUnit"));
		    vo.setPageSize(propertyService.getInt("pageSize"));
	
		    PaginationInfo paginationInfo = new PaginationInfo();
		    paginationInfo.setCurrentPageNo(vo.getPageIndex());
		    paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		    paginationInfo.setPageSize(vo.getPageSize());
	
		    vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		    vo.setLastIndex(paginationInfo.getLastRecordIndex());
		    vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		    Map<String, Object> map = egovArticleService.selectGuestArticleList(vo);
		    int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		    
		    paginationInfo.setTotalRecordCount(totCnt);
	
		    model.addAttribute("resultList", map.get("resultList"));
		    model.addAttribute("resultCnt", map.get("resultCnt"));
		    model.addAttribute("boardMasterVO", mstrVO);
		    model.addAttribute("articleVO", vo);	    
		    model.addAttribute("paginationInfo", paginationInfo);
	
		    return "egovframework/com/cop/bbs/EgovGuestArticleList";
	
		}
	
		if (isAuthenticated) {
		    board.setFrstRegisterId(user.getUniqId());
		    
		    egovArticleService.insertArticle(board);
	
		    boardVO.setNttCn("");
		    boardVO.setPassword("");
		    boardVO.setNtcrId("");
		    boardVO.setNttId(0);
		}
	
		return "forward:/cop/bbs/selectGuestArticleList.do";
    }
    
    /**
     * 방명록에 대한 내용을 삭제한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/deleteGuestArticle.do")
    public String deleteGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("articleVO") Board board, ModelMap model) throws Exception {
		@SuppressWarnings("unused")
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (isAuthenticated) {
		    egovArticleService.deleteArticle(boardVO);
		}
		
		return "forward:/cop/bbs/selectGuestArticleList.do";
    }
    
    /**
     * 방명록 수정을 위한 특정 내용을 조회한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/updateGuestArticleView.do")
    public String updateGuestArticleView(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("boardMasterVO") BoardMasterVO brdMstrVO,
	    ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		@SuppressWarnings("unused")
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		// 수정 및 삭제 기능 제어를 위한 처리
		model.addAttribute("sessionUniqId", user.getUniqId());
		
		BoardVO vo = egovArticleService.selectArticleDetail(boardVO);
	
		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());
		boardVO.setNtcrNm(user.getName());
	
		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
	
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = egovArticleService.selectGuestArticleList(boardVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("articleVO", vo);
		model.addAttribute("paginationInfo", paginationInfo);
	
		return "egovframework/com/cop/bbs/EgovGuestArticleList";
    }
    
    /**
     * 방명록을 수정하고 게시판 메인페이지를 조회한다.
     *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
     */
    @RequestMapping("/cop/bbs/updateGuestArticle.do")
    public String updateGuestArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute Board board, BindingResult bindingResult,
	    ModelMap model) throws Exception {

		//BBST02, BBST04
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
	
		    BoardVO vo = new BoardVO();
	
		    vo.setBbsId(boardVO.getBbsId());
		    vo.setBbsNm(boardVO.getBbsNm());
		    vo.setNtcrNm(user.getName());
		    vo.setNtcrId(user.getUniqId());
	
		    BoardMasterVO masterVo = new BoardMasterVO();
		    
		    masterVo.setBbsId(vo.getBbsId());
		    masterVo.setUniqId(user.getUniqId());
		    
		    BoardMasterVO mstrVO = bbsAttrbService.selectBBSMasterInf(masterVo);
	
		    vo.setPageUnit(propertyService.getInt("pageUnit"));
		    vo.setPageSize(propertyService.getInt("pageSize"));
	
		    PaginationInfo paginationInfo = new PaginationInfo();
		    paginationInfo.setCurrentPageNo(vo.getPageIndex());
		    paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		    paginationInfo.setPageSize(vo.getPageSize());
	
		    vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		    vo.setLastIndex(paginationInfo.getLastRecordIndex());
		    vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		    Map<String, Object> map = egovArticleService.selectGuestArticleList(vo);
		    int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
		    paginationInfo.setTotalRecordCount(totCnt);
		    
		    model.addAttribute("resultList", map.get("resultList"));
		    model.addAttribute("resultCnt", map.get("resultCnt"));
		    model.addAttribute("boardMasterVO", mstrVO);
		    model.addAttribute("articleVO", vo);
		    model.addAttribute("paginationInfo", paginationInfo);
	
		    return "egovframework/com/cop/bbs/EgovGuestArticleList";
		}
	
		if (isAuthenticated) {
		    egovArticleService.updateArticle(board);
		    boardVO.setNttCn("");
		    boardVO.setPassword("");
		    boardVO.setNtcrId("");
		    boardVO.setNttId(0);
		}
	
		return "forward:/cop/bbs/selectGuestArticleList.do";
    }
    

}
