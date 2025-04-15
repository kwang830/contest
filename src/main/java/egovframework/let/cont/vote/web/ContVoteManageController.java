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

	/**
	 * 게시물에 대한 내용을 수정한다.
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
}