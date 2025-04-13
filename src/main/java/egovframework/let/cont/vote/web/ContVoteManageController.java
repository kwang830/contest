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

		// 평가기준 및 평가 항목 조회 (현재 하드코딩)

		return "main/contest/ContestAdminVoteView";
	}
}