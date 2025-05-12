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
	 * 평가에 대한 상세 정보를 조회한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @throws Exception Exception 조회 중 발생할 수 있는 모든 예외
	 */
	@PostMapping(value = "/cont/vote/selectAdminVotesAjax.do", consumes = "application/json", produces = "application/json")
	public Map<String, Object> selectAdminVotesAjax(@RequestBody ContVoteVO contVoteVO) throws Exception {

		LoginVO user = new LoginVO();
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		}

		if (contVoteVO.getExmnId() == null || contVoteVO.getExmnId().trim().isEmpty()) {
			contVoteVO.setExmnId(user.getId());
		}

		Map<String, Object> map = contVoteManageService.selectAdminVotesAjax(contVoteVO);
		Map<String, Object> result = new HashMap<>();

		String valtOpnn = contVoteManageService.selectVoteValtOpnn(contVoteVO);

		result.put("contVoteAdminGroupList", map.get("resultList"));
		result.put("valtOpnn", valtOpnn != null ? valtOpnn : "");
		result.put("result", "success");
		result.put("msg", "처리 완료!");
		return result;
	}

	/**
	 * 평가결과 대한 상세 정보를 조회한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @throws Exception Exception 조회 중 발생할 수 있는 모든 예외
	 */
	@PostMapping(value = "/cont/vote/selectAdminVoteRsltsAjax.do", consumes = "application/json", produces = "application/json")
	public Map<String, Object> selectAdminVoteRsltsAjax(@RequestBody ContVoteVO contVoteVO) throws Exception {

		LoginVO user = new LoginVO();
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		}

		contVoteVO.setExmnId(user.getId());

		Map<String, Object> map = contVoteManageService.selectAdminVoteRsltsAjax(contVoteVO);
		Map<String, Object> result = new HashMap<>();

		result.put("contVoteRsltList", map.get("resultList"));
		result.put("result", "success");
		result.put("msg", "처리 완료!");
		return result;
	}
}