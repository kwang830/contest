package egovframework.let.cont.valt.api;

import egovframework.let.cont.valt.service.ContUserVO;
import egovframework.let.cont.valt.service.ContValtManageService;
import egovframework.let.cont.valt.service.ContValtVO;
import egovframework.let.cop.bbs.service.BoardVO;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ContValtManageApiController {

	@Resource(name = "ContValtManageService")
	private ContValtManageService contValtManageService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	/**
	 * 게시물에 대한 상세 정보를 조회한다.
	 *
	 * @param contValtVO 조회 조건이 담긴 VO 객체
	 * @return Map
	 * @throws Exception Exception 조회 중 발생할 수 있는 모든 예외
	 */
	@PostMapping(value = "/cont/valt/selectBbsByValtAjax.do", consumes = "application/json", produces = "application/json")
	public Map<String, Object> selectBbsByValtAjax(@RequestBody ContValtVO contValtVO) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return new HashMap<>();
		}

		contValtVO.setUseAt("Y");

		List<BoardVO> boardList = contValtManageService.selectBbsByValtAjax(contValtVO);
		int boardListCnt = contValtManageService.selectBbsByValtTotCntAjax(contValtVO);
		Map<String, Object> result = new HashMap<>();

		result.put("boardList", boardList);
		result.put("result", "success");
		result.put("msg", "처리 완료!");
		return result;
	}

	@PostMapping(value = "/cont/valt/selectUserByValtAjax.do", consumes = "application/json", produces = "application/json")
	public Map<String, Object> selectUserByValtAjax(@RequestBody ContValtVO contValtVO) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return new HashMap<>();
		}
		List<ContUserVO> userList = contValtManageService.selectUesrByValtAjax(contValtVO);

		Map<String, Object> result = new HashMap<>();
		result.put("userList", userList);
		result.put("result", "success");
		result.put("msg", "처리 완료!");
		return result;
	}
}