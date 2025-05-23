package egovframework.let.cop.bbs.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.let.cop.bbs.service.Board;
import egovframework.let.cop.bbs.service.BoardMaster;
import egovframework.let.cop.bbs.service.BoardMasterVO;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.let.cop.bbs.service.EgovBBSManageService;
import egovframework.let.utl.sim.service.EgovFileScrty;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;


/**
 * 게시물 관리를 위한 컨트롤러 클래스
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009.03.19
 * @version 1.0
 * @see
 *
 * "<pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.19  이삼섭          최초 생성
 *  2009.06.29  한성곤	       2단계 기능 추가 (댓글관리, 만족도조사)
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>"
 */
@Controller
public class EgovBBSManageController {

	@Resource(name = "EgovBBSManageService")
	private EgovBBSManageService bbsMngService;

	@Resource(name = "EgovBBSAttributeManageService")
	private EgovBBSAttributeManageService bbsAttrbService;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Autowired
	private DefaultBeanValidator beanValidator;

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
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/selectBoardList.do")
	public String selectBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "5000000");
		if(boardVO.getBbsId().equals("BBSMSTR_BBBBBBBBBBBB")){
			request.getSession().setAttribute("activeMenuNo", "5040000");
		}else{
			request.getSession().setAttribute("activeMenuNo", "5010000");
		}

		LoginVO user;
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		} else {
			user = new LoginVO();
			user.setUniqId("anonymous");
		}
		
		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());
		
		BoardMasterVO vo = new BoardMasterVO();
		
		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		
		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
		
		// 방명록이면 방명록 URL로 forward
		if ("BBST04".equals(master.getBbsTyCode())) {
			return "forward:/cop/bbs/selectGuestList.do";
		}
		
		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));
		boardVO.setUseAt("Y");

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		// 기본 BBS template 지정
		if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
			master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "cop/bbs/ContNoticeList";
	}

	/**
	 * 게시물에 대한 상세 정보를 조회한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/selectBoardArticle.do")
	public String selectBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "5000000");
		if(boardVO.getBbsId().equals("BBSMSTR_BBBBBBBBBBBB")){
			request.getSession().setAttribute("activeMenuNo", "5040000");
		}else{
			request.getSession().setAttribute("activeMenuNo", "5010000");
		}

		LoginVO user;
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		} else {
			user = new LoginVO();
			user.setUniqId("anonymous");
		}

		// 조회수 증가 여부 지정
		boardVO.setPlusCount(true);

		if (!boardVO.getSubPageIndex().isEmpty()) {
			boardVO.setPlusCount(false);
		}

		boardVO.setLastUpdusrId(user.getUniqId());
		BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

		model.addAttribute("result", vo);
		model.addAttribute("sessionUniqId", user.getUniqId());
		// template 처리 (기본 BBS template 지정  포함)
		BoardMasterVO master = new BoardMasterVO();

		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

		if (masterVo != null) {
			if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().isEmpty()) {
				masterVo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
			}
		} else {
			masterVo = new BoardMasterVO();
			masterVo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", masterVo);

		return "cop/bbs/ContNoticeInqire";
	}

	/**
	 * 게시물 등록을 위한 등록페이지로 이동한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/addBoardArticle.do")
	public String addBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		BoardMasterVO vo = new BoardMasterVO();
		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		BoardMasterVO bdMstr = bbsAttrbService.selectBBSMasterInf(vo);
		model.addAttribute("bdMstr", bdMstr);

		// 기본 BBS template 지정
		if (bdMstr.getTmplatCours() == null || bdMstr.getTmplatCours().isEmpty()) {
			bdMstr.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bdMstr);

		return "cop/bbs/ContNoticeRegist";
	}

	/**
	 * 게시물을 등록한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/insertBoardArticle.do")
	public String insertBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("bdMstr") BoardMaster bdMstr,
									 @ModelAttribute("board") Board board, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String callbackUrl = "/cop/bbs/selectBoardList.do";
		if (boardVO.getCallbackUrl() != null && !boardVO.getCallbackUrl().isEmpty()) {
			callbackUrl = boardVO.getCallbackUrl();
		}

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

			BoardMasterVO vo = new BoardMasterVO();
			vo.setBbsId(boardVO.getBbsId());
			vo.setUniqId(user.getUniqId());

			BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

			model.addAttribute("bdMstr", master);

			// 기본 BBS template 지정
			if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
				master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
			}

			model.addAttribute("brdMstrVO", master);

			return "cop/bbs/EgovNoticeRegist";
		}

		if (isAuthenticated) {
			String atchFileId = "";
			String atchFileImgUrl = "";

			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if (!files.isEmpty()) {
				Map<String, MultipartFile> fileGroup1 = new HashMap<>();
				Map<String, MultipartFile> fileGroup2 = new HashMap<>();

				// 파일 이름에 따라 그룹 분리
				for (Map.Entry<String, MultipartFile> entry : files.entrySet()) {
					String name = entry.getKey(); // form input의 name 속성 (예: file_1, file2_1)
					if (name.startsWith("file_")) {
						fileGroup1.put(name, entry.getValue());
					} else if (name.startsWith("file2_")) {
						fileGroup2.put(name, entry.getValue());
					}
				}

				// 그룹1 처리
				if (fileGroup1 != null && !fileGroup1.isEmpty()) {
					List<FileVO> result1 = fileUtil.parseFileInf(fileGroup1, "BBS_", 0, "", "");
					atchFileId = fileMngService.insertFileInfs(result1);
				}

				// 그룹2 처리
				if (fileGroup2 != null && !fileGroup2.isEmpty()) {
					List<FileVO> result2 = fileUtil.parseFileInf(fileGroup2, "BBS2_", 0, "", "Globals.imgFileStorePath");
					atchFileImgUrl = fileMngService.insertFileInfs(result2);
				}

			}

			board.setAtchFileId(atchFileId);
			board.setImgUrl(atchFileImgUrl);
			board.setFrstRegisterId(user.getUniqId());
			board.setBbsId(board.getBbsId());

			board.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			board.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)

			board.setNttCn(unscript(board.getNttCn())); // XSS 방지

			bbsMngService.insertBoardArticle(board);
		}

		return "forward:"+callbackUrl;
	}

	/**
	 * 게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/addReplyBoardArticle.do")
	public String addReplyBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		BoardMasterVO vo = new BoardMasterVO();
		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

		model.addAttribute("bdMstr", master);
		model.addAttribute("result", boardVO);

		// 기본 BBS template 지정
		if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
			master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", master);

		return "cop/bbs/ContNoticeReply";
	}

	/**
	 * 게시물에 대한 답변을 등록한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/replyBoardArticle.do")
	public String replyBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("bdMstr") BoardMaster bdMstr,
			@ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			BoardMasterVO vo = new BoardMasterVO();
			vo.setBbsId(boardVO.getBbsId());
			vo.setUniqId(user.getUniqId());

			BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

			model.addAttribute("bdMstr", master);
			model.addAttribute("result", boardVO);

			// 기본 BBS template 지정
			if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
				master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
			}

			model.addAttribute("brdMstrVO", master);

			return "cop/bbs/EgovNoticeReply";
		}

		if (isAuthenticated) {
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			String atchFileId = "";

			if (files != null && !files.isEmpty()) {
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

			board.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			board.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)

			board.setNttCn(unscript(board.getNttCn())); // XSS 방지

			bbsMngService.insertBoardArticle(board);
		}

		return "forward:/cop/bbs/selectBoardList.do";
	}

	/**
	 * 게시물 수정을 위한 수정페이지로 이동한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/forUpdateBoardArticle.do")
	public String selectBoardArticleForUpdt(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		boardVO.setFrstRegisterId(user.getUniqId());

		BoardMaster master = new BoardMaster();
		BoardMasterVO bmvo = new BoardMasterVO();
		BoardVO bdvo = new BoardVO();

		vo.setBbsId(boardVO.getBbsId());

		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		if (isAuthenticated) {
			bmvo = bbsAttrbService.selectBBSMasterInf(master);
			bdvo = bbsMngService.selectBoardArticle(boardVO);
		}

		model.addAttribute("result", bdvo);
		model.addAttribute("bdMstr", bmvo);

		// 기본 BBS template 지정
		if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().isEmpty()) {
			bmvo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bmvo);

		return "cop/bbs/ContNoticeUpdt";
	}

	/**
	 * 게시물에 대한 내용을 수정한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/updateBoardArticle.do")
	public String updateBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("bdMstr") BoardMaster bdMstr,
			@ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String callbackUrl = "/cop/bbs/selectBoardList.do";
		if(!boardVO.getCallbackUrl().isEmpty()) {
			callbackUrl = boardVO.getCallbackUrl();
		}

		String atchFileId = boardVO.getAtchFileId();
		String imgUrl = boardVO.getImgUrl();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

			boardVO.setFrstRegisterId(user.getUniqId());

			BoardMaster master = new BoardMaster();
			master.setBbsId(boardVO.getBbsId());
			master.setUniqId(user.getUniqId());

			BoardMasterVO bmvo = bbsAttrbService.selectBBSMasterInf(master);
			BoardVO bdvo = bbsMngService.selectBoardArticle(boardVO);

			model.addAttribute("result", bdvo);
			model.addAttribute("bdMstr", bmvo);

			return "cop/bbs/EgovNoticeUpdt";
		}

		if (isAuthenticated) {
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if (!files.isEmpty()) {
				Map<String, MultipartFile> fileGroup1 = new HashMap<>();
				Map<String, MultipartFile> fileGroup2 = new HashMap<>();

				// 파일 이름에 따라 그룹 분리
				for (Map.Entry<String, MultipartFile> entry : files.entrySet()) {
					String name = entry.getKey(); // form input의 name 속성 (예: file_1, file2_1)
					if (name.startsWith("file_")) {
						fileGroup1.put(name, entry.getValue());
					} else if (name.startsWith("file2_")) {
						fileGroup2.put(name, entry.getValue());
					}
				}

				// 그룹1 처리
				if (!fileGroup1.isEmpty()) {
					if ("".equals(atchFileId)) {
						List<FileVO> result = fileUtil.parseFileInf(fileGroup1, "BBS_", 0, atchFileId, "");
						atchFileId = fileMngService.insertFileInfs(result);
						board.setAtchFileId(atchFileId);
					} else {
						FileVO fvo = new FileVO();
						fvo.setAtchFileId(atchFileId);
						int cnt = fileMngService.getMaxFileSN(fvo);
						List<FileVO> _result = fileUtil.parseFileInf(fileGroup1, "BBS_", cnt, atchFileId, "");
						fileMngService.updateFileInfs(_result);
					}
				}
				// 그룹2 처리
				if (!fileGroup2.isEmpty()) {
					if ("".equals(imgUrl)) {
						List<FileVO> result = fileUtil.parseFileInf(fileGroup2, "BBS2_", 0, imgUrl, "Globals.imgFileStorePath");
						imgUrl = fileMngService.insertFileInfs(result);
						board.setImgUrl(imgUrl);
					} else {
						FileVO fvo = new FileVO();
						fvo.setAtchFileId(imgUrl);
						int cnt = fileMngService.getMaxFileSN(fvo);
						List<FileVO> _result = fileUtil.parseFileInf(fileGroup2, "BBS2_", cnt, imgUrl, "Globals.imgFileStorePath");
						fileMngService.updateFileInfs(_result);
					}
				}
			}

			board.setLastUpdusrId(user.getUniqId());

			board.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			board.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)

			board.setNttCn(unscript(board.getNttCn())); // XSS 방지

			bbsMngService.updateBoardArticle(board);
		}

		return "forward:"+callbackUrl;
	}

	/**
	 * 게시물에 대한 내용을 삭제한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/deleteBoardArticle.do")
	public String deleteBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model)
			throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			board.setLastUpdusrId(user.getUniqId());

			bbsMngService.deleteBoardArticle(board);
		}

		return "forward:/cop/bbs/selectBoardList.do";
	}

	/**
	 * 게시물에 대한 내용을 삭제한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/deleteContBoard.do")
	public String deleteContBoard(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model)
			throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			board.setLastUpdusrId(user.getUniqId());

			bbsMngService.deleteBoardArticle(board);
		}

		return "forward:/cmm/contest/apfrRcip.do";
	}

	/**
	 * 방명록에 대한 목록을 조회한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/selectGuestList.do")
	public String selectGuestList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
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

		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bbsMngService.selectGuestList(vo);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("brdMstrVO", mstrVO);
		model.addAttribute("boardVO", vo);
		model.addAttribute("paginationInfo", paginationInfo);

		return "cop/bbs/EgovGuestList";
	}

	/**
	 * 방명록 수정을 위한 특정 내용을 조회한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/selectSingleGuestList.do")
	public String selectSingleGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("brdMstrVO") BoardMasterVO brdMstrVO, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		@SuppressWarnings("unused")
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

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

		Map<String, Object> map = bbsMngService.selectGuestList(boardVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", vo);
		model.addAttribute("brdMstrVO", brdMstrVO);
		model.addAttribute("paginationInfo", paginationInfo);

		return "cop/bbs/EgovGuestList";
	}

	/**
	 * 방명록에 대한 내용을 삭제한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/deleteGuestList.do")
	public String deleteGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, ModelMap model) throws Exception {
		@SuppressWarnings("unused")
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			bbsMngService.deleteGuestList(boardVO);
		}

		return "forward:/cop/bbs/selectGuestList.do";
	}

	/**
	 * 방명록 수정의 위한 목록을 조회한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/updateGuestList.do")
	public String updateGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model) throws Exception {

		//BBST02, BBST04
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
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

			Map<String, Object> map = bbsMngService.selectGuestList(vo);
			int totCnt = Integer.parseInt((String) map.get("resultCnt"));

			paginationInfo.setTotalRecordCount(totCnt);

			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultCnt", map.get("resultCnt"));
			model.addAttribute("brdMstrVO", mstrVO);
			model.addAttribute("boardVO", vo);
			model.addAttribute("paginationInfo", paginationInfo);

			return "cop/bbs/EgovGuestList";
		}

		if (isAuthenticated) {
			bbsMngService.updateBoardArticle(board);
			boardVO.setNttCn("");
			boardVO.setPassword("");
			boardVO.setNtcrId("");
			boardVO.setNttId(0);
		}

		return "forward:/cop/bbs/selectGuestList.do";
	}

	/**
	 * 방명록에 대한 내용을 등록한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/insertGuestList.do")
	public String insertGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model) throws Exception {

		// 익명으로 등록이 가능한 부분임
		// 무인증이 되려면 별도의 컨트롤러를 하나 더 등록해야함

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
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

			Map<String, Object> map = bbsMngService.selectGuestList(vo);
			int totCnt = Integer.parseInt((String) map.get("resultCnt"));

			paginationInfo.setTotalRecordCount(totCnt);

			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultCnt", map.get("resultCnt"));
			model.addAttribute("brdMstrVO", mstrVO);
			model.addAttribute("boardVO", vo);
			model.addAttribute("paginationInfo", paginationInfo);

			return "cop/bbs/EgovGuestList";

		}

		if (isAuthenticated) {
			board.setFrstRegisterId(user.getUniqId());

			bbsMngService.insertBoardArticle(board);

			boardVO.setNttCn("");
			boardVO.setPassword("");
			boardVO.setNtcrId("");
			boardVO.setNttId(0);
		}

		return "forward:/cop/bbs/selectGuestList.do";
	}

	/**
	 * 익명게시물에 대한 목록을 조회한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/anonymous/selectBoardList.do")
	public String selectAnonymousBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());

		BoardMasterVO vo = new BoardMasterVO();

		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId("ANONYMOUS"); // 익명

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

		// 익명게시판이 아니면.. 원래 게시판 URL로 forward
		if (!"BBST02".equals(master.getBbsTyCode())) {
			return "forward:/cop/bbs/selectBoardList.do";
		}


		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		// 기본 BBS template 지정
		if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
			master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("anonymous", "true");

		return "cop/bbs/EgovNoticeList";
	}

	/**
	 * 익명게시물 등록을 위한 등록페이지로 이동한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/anonymous/addBoardArticle.do")
	public String addAnonymousBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		BoardMasterVO vo = new BoardMasterVO();
		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId("ANONYMOUS");

		BoardMasterVO bdMstr = bbsAttrbService.selectBBSMasterInf(vo);
		model.addAttribute("bdMstr", bdMstr);

		// 익명게시판이 아니면.. 원래 게시판 URL로 forward
		if (!"BBST02".equals(bdMstr.getBbsTyCode())) {
			return "forward:/cop/bbs/addBoardArticle.do";
		}

		// 기본 BBS template 지정
		if (bdMstr.getTmplatCours() == null || bdMstr.getTmplatCours().isEmpty()) {
			bdMstr.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bdMstr);
		model.addAttribute("anonymous", "true");

		return "cop/bbs/EgovNoticeRegist";
	}

	/**
	 * 익명게시물을 등록한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/anonymous/insertBoardArticle.do")
	public String insertAnonymousBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
			@ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

			BoardMasterVO vo = new BoardMasterVO();
			vo.setBbsId(boardVO.getBbsId());
			vo.setUniqId("ANONYMOUS");

			BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

			model.addAttribute("bdMstr", master);

			// 익명게시판이 아니면.. 원래 게시판 URL로 forward
			if (!"BBST02".equals(bdMstr.getBbsTyCode())) {
				return "forward:/cop/bbs/insertBoardArticle.do";
			}

			// 기본 BBS template 지정
			if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
				master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
			}

			model.addAttribute("brdMstrVO", master);
			model.addAttribute("anonymous", "true");

			return "cop/bbs/EgovNoticeRegist";
		}

		String atchFileId = "";

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (files != null && !files.isEmpty()) {
			List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		}
		board.setAtchFileId(atchFileId);
		board.setFrstRegisterId("ANONYMOUS");
		board.setBbsId(board.getBbsId());

		// 익명게시판 관련
		board.setNtcrNm(board.getNtcrNm());
		board.setPassword(EgovFileScrty.encryptPassword(board.getPassword(), board.getBbsId()));

		board.setNttCn(unscript(board.getNttCn())); // XSS 방지

		bbsMngService.insertBoardArticle(board);

		return "forward:/cop/bbs/anonymous/selectBoardList.do";
	}

	/**
	 * 익명게시물에 대한 상세 정보를 조회한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/anonymous/selectBoardArticle.do")
	public String selectAnonymousBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		// 조회수 증가 여부 지정
		boardVO.setPlusCount(true);

		if (boardVO.getSubPageIndex() != null && !boardVO.getSubPageIndex().isEmpty()) {
			boardVO.setPlusCount(false);
		}

		boardVO.setLastUpdusrId("ANONYMOUS");
		BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

		model.addAttribute("result", vo);
		model.addAttribute("sessionUniqId", "ANONYMOUS");

		// template 처리 (기본 BBS template 지정  포함)
		BoardMasterVO master = new BoardMasterVO();

		master.setBbsId(boardVO.getBbsId());
		master.setUniqId("ANONYMOUS");

		BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

		// 익명게시판이 아니면.. 원래 게시판 URL로 forward
		if (!"BBST02".equals(masterVo.getBbsTyCode())) {
			return "forward:/cop/bbs/selectBoardArticle.do";
		}

		if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().isEmpty()) {
			masterVo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", masterVo);
		model.addAttribute("anonymous", "true");

		return "cop/bbs/EgovNoticeInqire";
	}

	/**
	 * 익명게시물에 대한 내용을 삭제한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/anonymous/deleteBoardArticle.do")
	public String deleteAnonymousBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, @ModelAttribute("bdMstr") BoardMaster bdMstr,
			ModelMap model) throws Exception {

		// 마스터 정보 얻기
		BoardMasterVO master = new BoardMasterVO();

		master.setBbsId(boardVO.getBbsId());
		master.setUniqId("ANONYMOUS");

		BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

		if (!"BBST02".equals(masterVo.getBbsTyCode())) {
			return "forward:/cop/bbs/deleteBoardArticle.do";
		}

		// 패스워드 비교
		String dbpassword = bbsMngService.getPasswordInf(board);
		String enpassword = EgovFileScrty.encryptPassword(board.getPassword(), board.getBbsId());

		if (dbpassword == null || !dbpassword.equals(enpassword)) {
			model.addAttribute("msg", egovMessageSource.getMessage("cop.password.not.same.msg"));
			return "forward:/cop/bbs/anonymous/selectBoardArticle.do";
		}

		board.setLastUpdusrId("ANONYMOUS");
		bbsMngService.deleteBoardArticle(board);

		return "forward:/cop/bbs/anonymous/selectBoardList.do";
	}

	/**
	 * 익명게시물 수정을 위한 수정페이지로 이동한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/anonymous/forUpdateBoardArticle.do")
	public String selectAnonymousBoardArticleForUpdt(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model) throws Exception {

		boardVO.setFrstRegisterId("ANONYMOUS");

		vo.setBbsId(boardVO.getBbsId());
		BoardMaster master = new BoardMaster();
		master.setBbsId(boardVO.getBbsId());
		master.setUniqId("ANONYMOUS");

		BoardMasterVO bmvo = bbsAttrbService.selectBBSMasterInf(master);

		if (!"BBST02".equals(bmvo.getBbsTyCode())) {
			return "forward:/cop/bbs/forUpdateBoardArticle.do";
		}


		// 패스워드 비교
		String dbpassword = bbsMngService.getPasswordInf(boardVO);
		String enpassword = EgovFileScrty.encryptPassword(boardVO.getPassword(), boardVO.getBbsId());

		if (dbpassword == null || !dbpassword.equals(enpassword)) {
			model.addAttribute("msg", egovMessageSource.getMessage("cop.password.not.same.msg"));
			return "forward:/cop/bbs/anonymous/selectBoardArticle.do";
		}


		BoardVO bdvo = bbsMngService.selectBoardArticle(boardVO);

		model.addAttribute("result", bdvo);
		model.addAttribute("bdMstr", bmvo);

		// 기본 BBS template 지정
		if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().isEmpty()) {
			bmvo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bmvo);
		model.addAttribute("anonymous", "true");

		return "cop/bbs/EgovNoticeUpdt";
	}

	/**
	 * 익명게시물에 대한 내용을 수정한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/anonymous/updateBoardArticle.do")
	public String updateAnonymousBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
			@ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

		String atchFileId = boardVO.getAtchFileId();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

			boardVO.setFrstRegisterId("ANONYMOUS");

			BoardMaster master = new BoardMaster();
			master.setBbsId(boardVO.getBbsId());
			master.setUniqId("ANONYMOUS");

			BoardMasterVO bmvo = bbsAttrbService.selectBBSMasterInf(master);

			// 익명게시판이 아니면.. 원래 게시판 URL로 forward
			if (!"BBST02".equals(bdMstr.getBbsTyCode())) {
				return "forward:/cop/bbs/updateBoardArticle.do";
			}

			BoardVO bdvo = bbsMngService.selectBoardArticle(boardVO);

			model.addAttribute("result", bdvo);
			model.addAttribute("bdMstr", bmvo);
			model.addAttribute("anonymous", "true");

			return "cop/bbs/EgovNoticeUpdt";
		}

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

		board.setLastUpdusrId("ANONYMOUS");

		// 익명게시판 관련
		board.setNtcrNm(board.getNtcrNm());
		board.setPassword(EgovFileScrty.encryptPassword(board.getPassword(), board.getBbsId()));
		board.setNttCn(unscript(board.getNttCn())); // XSS 방지
		bbsMngService.updateBoardArticle(board);

		return "forward:/cop/bbs/anonymous/selectBoardList.do";
	}

	/**
	 * 익명게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/anonymous/addReplyBoardArticle.do")
	public String addAnonymousReplyBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		BoardMasterVO vo = new BoardMasterVO();
		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId("ANONYMOUS");

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

		// 익명게시판이 아니면.. 원래 게시판 URL로 forward
		if (!"BBST02".equals(master.getBbsTyCode())) {
			return "forward:/cop/bbs/addReplyBoardArticle.do";
		}

		model.addAttribute("bdMstr", master);
		model.addAttribute("result", boardVO);

		// 기본 BBS template 지정
		if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
			master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", master);
		model.addAttribute("anonymous", "true");

		return "cop/bbs/EgovNoticeReply";
	}

	/**
	 * 익명게시물에 대한 답변을 등록한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/anonymous/replyBoardArticle.do")
	public String replyAnonymousBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
			@ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			BoardMasterVO vo = new BoardMasterVO();
			vo.setBbsId(boardVO.getBbsId());
			vo.setUniqId("ANONYMOUS");

			BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

			// 익명게시판이 아니면.. 원래 게시판 URL로 forward
			if (!"BBST02".equals(master.getBbsTyCode())) {
				return "forward:/cop/bbs/replyBoardArticle.do";
			}

			model.addAttribute("bdMstr", master);
			model.addAttribute("result", boardVO);

			// 기본 BBS template 지정
			if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
				master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
			}

			model.addAttribute("brdMstrVO", master);
			model.addAttribute("anonymous", "true");

			return "cop/bbs/EgovNoticeReply";
		}

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		String atchFileId = "";

		if (!files.isEmpty()) {
			List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		}

		board.setAtchFileId(atchFileId);
		board.setReplyAt("Y");
		board.setFrstRegisterId("ANONYMOUS");
		board.setBbsId(board.getBbsId());
		board.setParnts(Long.toString(boardVO.getNttId()));
		board.setSortOrdr(boardVO.getSortOrdr());
		board.setReplyLc(Integer.toString(Integer.parseInt(boardVO.getReplyLc()) + 1));

		// 익명게시판 관련
		board.setNtcrNm(board.getNtcrNm());
		board.setPassword(EgovFileScrty.encryptPassword(board.getPassword(), board.getBbsId()));
		board.setNttCn(unscript(board.getNttCn())); // XSS 방지
		bbsMngService.insertBoardArticle(board);

		return "forward:/cop/bbs/anonymous/selectBoardList.do";
	}

	/**
	 * 템플릿에 대한 미리보기용 게시물 목록을 조회한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/previewBoardList.do")
	public String previewBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		String template = boardVO.getSearchWrd(); // 템플릿 URL

		BoardMasterVO master = new BoardMasterVO();

		master.setBbsNm("미리보기 게시판");

		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<BoardVO> list = new ArrayList<BoardVO>();

		BoardVO target = new BoardVO();
		target.setNttSj("게시판 기능 설명");
		target.setFrstRegisterId("ID");
		target.setFrstRegisterNm("관리자");
		target.setFrstRegisterPnttm("2009-01-01");
		target.setInqireCo(7);
		target.setParnts("0");
		target.setReplyAt("N");
		target.setReplyLc("0");
		target.setUseAt("Y");

		list.add(target);

		target = new BoardVO();
		target.setNttSj("게시판 부가 기능 설명");
		target.setFrstRegisterId("ID");
		target.setFrstRegisterNm("관리자");
		target.setFrstRegisterPnttm("2009-01-01");
		target.setInqireCo(7);
		target.setParnts("0");
		target.setReplyAt("N");
		target.setReplyLc("0");
		target.setUseAt("Y");

		list.add(target);

		boardVO.setSearchWrd("");

		int totCnt = list.size();

		paginationInfo.setTotalRecordCount(totCnt);

		master.setTmplatCours(template);

		model.addAttribute("resultList", list);
		model.addAttribute("resultCnt", Integer.toString(totCnt));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("preview", "true");

		return "cop/bbs/EgovNoticeList";
	}
	
	/**
	 * 게시물에 대한 목록을 조회한다.
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping("/cop/bbs/cont/selectBoardList.do")
	public String selectContBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("menuNo", "3000000");
		
		LoginVO user;
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		} else {
			user = new LoginVO();
			user.setUniqId("anonymous");
		}
		
		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());
		
		BoardMasterVO vo = new BoardMasterVO();
		
		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		
		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
		
		// 방명록이면 방명록 URL로 forward
		if ("BBST04".equals(master.getBbsTyCode())) {
			return "forward:/cop/bbs/selectGuestList.do";
		}

		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		// 기본 BBS template 지정
		if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
			master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "cop/bbs/EgovNoticeList";
	}

	/**
	 * 공모전 신청서접수
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/apfrRcip.do")
	public String getContestApfrRcipPage(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "2000000");
		request.getSession().setAttribute("activeMenuNo", "2010000");

		LoginVO user;
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		} else {
			user = new LoginVO();
			user.setUniqId("anonymous");
		}

		boardVO.setBbsId("BBSMSTR_BBBBBBBBBBBB");
		boardVO.setFrstRegisterId(user.getUniqId());

		BoardMasterVO vo = new BoardMasterVO();

		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

		// 방명록이면 방명록 URL로 forward
		if ("BBST04".equals(master.getBbsTyCode())) {
			return "forward:/cop/bbs/selectGuestList.do";
		}

		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));
		boardVO.setUseAt("Y");

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		// 기본 BBS template 지정
		if (master.getTmplatCours() == null || master.getTmplatCours().isEmpty()) {
			master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);

		return "main/contest/ApfrRcipView";
	}

	/**
	 * 공모전 신청서 등록 및 수정
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/apfrRcipUpdt.do")
	public String getContestApfrRcipUpdtPage(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		boardVO.setFrstRegisterId(user.getUniqId());

		BoardMasterVO vo = new BoardMasterVO();

		vo.setBbsId("BBSMSTR_BBBBBBBBBBBB");
		vo.setUniqId(user.getUniqId());
		BoardMasterVO bdMstr = bbsAttrbService.selectBBSMasterInf(vo);
		model.addAttribute("bdMstr", bdMstr);

		BoardVO bdvo = bbsMngService.selectBoardArticle(boardVO);
		model.addAttribute("result", bdvo);

		// 기본 BBS template 지정
		if (bdMstr.getTmplatCours() == null || bdMstr.getTmplatCours().isEmpty()) {
			bdMstr.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bdMstr);

		return "main/contest/ApfrRcipUpdtView";
	}

	/**
	 * 공모전 신청서 상세
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param boardVO boardVO
	 * @param model model
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/apfrRcipDetail.do")
	public String getContestApfrRcipDetailPage(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		LoginVO user = new LoginVO();
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		}
		// 조회수 증가 여부 지정
		boardVO.setPlusCount(true);

		if (boardVO.getSubPageIndex() != null && !boardVO.getSubPageIndex().isEmpty()) {
			boardVO.setPlusCount(false);
		}

		boardVO.setLastUpdusrId(user.getUniqId());
		BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

		model.addAttribute("result", vo);
		model.addAttribute("sessionUniqId", user.getUniqId());
		// template 처리 (기본 BBS template 지정  포함)
		BoardMasterVO master = new BoardMasterVO();

		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

		if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().isEmpty()) {
			masterVo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", masterVo);

		return "main/contest/ApfrRcipDetailView";
	}


}