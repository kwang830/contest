package egovframework.let.cont.vote.api;

import egovframework.com.cmm.LoginVO;
import egovframework.let.cont.vote.service.ContVoteVO;
import egovframework.let.cont.vote.service.ContVoteManageService;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ContVoteManageApiController {

	@Resource(name = "ContVoteManageService")
	private ContVoteManageService contVoteManageService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	/**
	 * 게시물에 대한 상세 정보를 조회한다.
	 *
	 * @param contVoteVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/cont/vote/selectAdminVotesAjax.do", consumes = "application/json", produces = "application/json")
	public Map<String, Object> selectAdminVotesAjax(@RequestBody ContVoteVO contVoteVO) throws Exception {
		System.out.println("------------ selectVotesAjax start -------------");
		System.out.println("------------ contVoteVO.getBbsId():"+contVoteVO.getBbsId());
		System.out.println("------------ contVoteVO.getNttId():"+contVoteVO.getNttId());
		System.out.println("------------ contVoteVO.getValtMngmNo():"+contVoteVO.getValtMngmNo());

		LoginVO user = new LoginVO();
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		}

		System.out.println("------------ user.getId():"+user.getId());
		System.out.println("------------ user.getUniqId():"+user.getUniqId());

		contVoteVO.setExmnId(user.getId());

		Map<String, Object> map = contVoteManageService.selectAdminVotesAjax(contVoteVO);
		Map<String, Object> result = new HashMap<>();

		result.put("contVoteAdminGroupList", map.get("resultList"));
		result.put("result", "success");
		result.put("msg", "처리 완료!");
		return result;
	}

}