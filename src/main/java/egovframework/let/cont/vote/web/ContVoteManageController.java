package egovframework.let.cont.vote.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.let.cont.vote.service.ContVoteManageService;
import egovframework.let.cont.vote.service.ContVoteVO;
import egovframework.let.cop.bbs.service.*;
import egovframework.let.utl.sim.service.EgovFileScrty;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ContVoteManageController {

	@Resource(name = "ContVoteManageService")
	private ContVoteManageService contVoteManageService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "EgovBBSAttributeManageService")
	private EgovBBSAttributeManageService bbsAttrbService;

	@Resource(name = "EgovBBSManageService")
	private EgovBBSManageService bbsMngService;

	/**
	 * 공모전 투표
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestVote.do")
	public String getContestVotePage(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request)
			throws Exception{

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "3000000");
		request.getSession().setAttribute("activeMenuNo", "3010000");

		LoginVO user;
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		} else {
			user = new LoginVO();
			user.setUniqId("anonymous");
		}

		boardVO.setBbsId("BBSMSTR_BBBBBBBBBBBB");
		boardVO.setFrstRegisterId(user.getUniqId());
		boardVO.setExmnId(user.getId());

		BoardMasterVO vo = new BoardMasterVO();

		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

		//-------------------------------
		// 방명록이면 방명록 URL로 forward
		//-------------------------------
		if (master.getBbsTyCode().equals("BBST04")) {
			return "forward:/cop/bbs/selectGuestList.do";
		}
		////-----------------------------

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

		Map<String, Object> map = bbsMngService.selectBoardVoteArticles(boardVO, vo.getBbsAttrbCode());
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		//-------------------------------
		// 기본 BBS template 지정
		//-------------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
			master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}
		////-----------------------------

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);

		return "main/contest/ContestVoteView";
	}

	/**
	 * 공모전 투표 상세
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestVoteDetail.do")
	public String getContestVoteDetailPage(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request)
			throws Exception{

		LoginVO user = new LoginVO();
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		}
		// 조회수 증가 여부 지정
		boardVO.setPlusCount(true);

		if (!boardVO.getSubPageIndex().equals("")) {
			boardVO.setPlusCount(false);
		}

		boardVO.setLastUpdusrId(user.getUniqId());
		boardVO.setExmnId(user.getId());

		BoardVO vo = bbsMngService.selectBoardVoteArticle(boardVO);

		model.addAttribute("result", vo);
		model.addAttribute("sessionUniqId", user.getUniqId());
		//----------------------------
		// template 처리 (기본 BBS template 지정  포함)
		//----------------------------
		BoardMasterVO master = new BoardMasterVO();

		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

		if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
			masterVo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", masterVo);
		
		// 댓글 10개 가져오기

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

		Map<String, Object> map = bbsMngService.selectBoardComments(boardVO);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));


		return "main/contest/ContestVoteDetailView";
	}

	/**
	 * 공모전 투표 점수 업데이트
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestVoteScoreUpdt.do")
	public String getContestVoteScoreUpdt(@ModelAttribute("searchVO") ContVoteVO contVoteVO, ModelMap model, HttpServletRequest request)
			throws Exception{
		System.out.println("/cmm/contest/contestVoteScoreUpdt.do >>>>");

		LoginVO user = new LoginVO();
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		}

		String aaa = contVoteVO.getScore();
		System.out.println("score:" + aaa);


		contVoteVO.setExmnId(user.getId());
		contVoteVO.setUseAt("Y");
		contVoteVO.setFrstRegisterId(user.getUniqId());
		contVoteVO.setLastUpdusrId(user.getUniqId());
		contVoteManageService.insertVoteScore(contVoteVO);

		//return "forward:/cmm/contest/contestVote.do";
		return "forward:/cmm/contest/contestVoteDetail.do";
	}

	/**
	 * 공모전 댓글 등록
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/insertContestCmt.do")
	public String insertContestCmt(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request)
			throws Exception{
		System.out.println("/cmm/contest/insertContestCmt.do >>>>");

		LoginVO user = new LoginVO();
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		}

		boardVO.setExmnId(user.getId());
		boardVO.setFrstRegisterId(user.getUniqId());
		boardVO.setLastUpdusrId(user.getUniqId());

		if (boardVO.getAnswerNo() != 0L) {
			bbsMngService.updateBoardComment(boardVO);
		}else{
			boardVO.setUseAt("Y");
			bbsMngService.insertBoardComment(boardVO);
		}

		//return "forward:/cmm/contest/contestVote.do";
		return "forward:/cmm/contest/contestVoteDetail.do";
	}

	/**
	 * 공모전 투표 댓글 불러오기
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestVoteCmt.do")
	public String getContestVoteCmtPage(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request)
			throws Exception{

		System.out.println("/cmm/contest/contestVoteCmt.do >>>>");
		System.out.println("boardVO.getNttId():" + boardVO.getNttId());
		System.out.println("boardVO.getBbsId():" + boardVO.getBbsId());
		System.out.println("boardVO.getAnswerNo():" + boardVO.getAnswerNo());

		Map<String, Object> map = bbsMngService.selectBoardCommentMore(boardVO);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));

		return "main/contest/ContestVoteCmtView";
	}

	/**
	 * 공모전 투표결과
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestVoteRslt.do")
	public String getContestVoteRsltPage(HttpServletRequest request, ModelMap model)
			throws Exception{

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "3000000");
		request.getSession().setAttribute("activeMenuNo", "3011000");

		return "main/contest/ContestVoteRsltView";
	}

	/**
	 * 공모전 심사
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestAdminVote.do")
	public String getContestAdminVotePage(HttpServletRequest request, ModelMap model)
			throws Exception{

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		LoginVO user;
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			System.out.println("user.getId():"+user.getId());
		} else {
			user = new LoginVO();
			user.setId("anonymous");
		}

		// 공모전 심사자가 평가할 대상 리스트 조회
		ContVoteVO vo = new ContVoteVO();
		vo.setExmnId(user.getId());

		Map<String, Object> map = contVoteManageService.selectContVoteAdminGroupList(vo);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));
		System.out.println("totCnt:"+totCnt);
		model.addAttribute("contVoteAdminGroupList", map.get("resultList"));
		model.addAttribute("contVoteAdminGroupListCnt", map.get("resultCnt"));

		// 리스트가 있을 때 - 첫 번째 리스트에 대상자 조회
		List<ContVoteVO> resultList = (List<ContVoteVO>) map.get("resultList");
		if (resultList != null && !resultList.isEmpty()) {
			ContVoteVO firstItem = resultList.get(0);
			String valtMngmNo = firstItem.getValtMngmNo(); // ← getter 사용
			System.out.println("첫 번째 행의 valtMngmNo 값: " + valtMngmNo);
			vo.setValtMngmNo(valtMngmNo);
		}

		Map<String, Object> map2 = contVoteManageService.selectContVoteAdminBBSList(vo);
		int totCnt2 = Integer.parseInt((String) map2.get("resultCnt"));
		System.out.println("totCnt2:"+totCnt2);
		model.addAttribute("contVoteAdminBBSList", map2.get("resultList"));
		model.addAttribute("contVoteAdminBBSListCnt", map2.get("resultCnt"));

		model.addAttribute("valtOpnn", "평가 의견을 입력하세요!");


		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "3000000");
		request.getSession().setAttribute("activeMenuNo", "3020000");

		// 평가기준 및 평가 항목 조회 (현재 하드코딩)

		return "main/contest/ContestAdminVoteView";
	}

	/**
	 * 공모전 심사에 대한 내용을 수정한다.
	 *
	 * @param contVoteVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cmm/contest/updateContestAdminVote.do")
	public String updateContestAdminVote(@ModelAttribute("vote") ContVoteVO contVoteVO, ModelMap model) throws Exception {

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		LoginVO user;
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			System.out.println("user.getId():"+user.getId());
		} else {
			user = new LoginVO();
			user.setId("anonymous");
		}

//		System.out.println("contVoteVO:"+contVoteVO);
//		System.out.println("contVoteVO.getValtMngmNo():"+contVoteVO.getValtMngmNo());
//		System.out.println("contVoteVO.getValtQsitMnno():"+contVoteVO.getValtQsitMnno());
//		System.out.println("contVoteVO.getBbsId():"+contVoteVO.getBbsId());
//		System.out.println("contVoteVO.getNttId():"+contVoteVO.getNttId());
		contVoteVO.setExmnId(user.getId());
//		System.out.println("contVoteVO.getExmnId():"+contVoteVO.getExmnId());
//		System.out.println("contVoteVO.getValtQsitSendStr():"+contVoteVO.getValtQsitSendStr());
		contVoteVO.setFrstRegisterId(user.getId());

		String resultMsg = "";
		try {

			String valtQsitSendStr = contVoteVO.getValtQsitSendStr(); // 예: "sel_101|6@sel_102|8@sel_103|10..."
			String[] pairs = valtQsitSendStr.split("@");

			for (String pair : pairs) {
				String[] parts = pair.split("\\|"); // |는 정규식에서 특수문자이므로 \\로 escape 필요
				if (parts.length == 2) {
					String sel_name = parts[0].replace("sel_", "");
					String sel_value = parts[1];

					System.out.println("sel_name: " + sel_name + ", sel_value: " + sel_value);

					contVoteVO.setUseAt("Y");
					contVoteVO.setQsitNo(sel_name);
					contVoteVO.setValtScr(sel_value);

					int chkCnt = contVoteManageService.insertAdminVotes(contVoteVO);
					System.out.println("chkCnt:" + chkCnt);
				} else {
					System.out.println("잘못된 형식의 데이터: " + pair);
				}
			}
			resultMsg = "success.common.insert";
		}catch (Exception e) {
			resultMsg = "fail.request.msg";
		}

		model.addAttribute("resultMsg", resultMsg);

		return "forward:/cmm/contest/contestAdminVote.do";
	}

	/**
	 * 공모전 심사결과
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/contest/contestAdminVoteRslt.do")
	public String getContestAdminVoteRsltPage(HttpServletRequest request, ModelMap model)
			throws Exception{

		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "3000000");
		request.getSession().setAttribute("activeMenuNo", "3021000");


		return "main/contest/ContestAdminVoteRsltView";
	}
}