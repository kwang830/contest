package egovframework.let.cop.bbs.api;

import egovframework.com.cmm.LoginVO;
import egovframework.let.cop.bbs.service.*;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class EgovBBSManageApiController {

	@Resource(name = "EgovBBSManageService")
	private EgovBBSManageService bbsMngService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	/**
	 * 게시물에 대한 상세 정보를 조회한다.
	 *
	 * @param boardVO boardVO
	 * @throws Exception Exception
	 */
	@PostMapping(value = "/cop/bbs/selectBoardArticleAjax.do", consumes = "application/json", produces = "application/json")
	public Map<String, Object> selectBoardArticleAjax(@RequestBody BoardVO boardVO) throws Exception {

		LoginVO user = new LoginVO();
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		}
		// 조회수 증가 여부 지정
		boardVO.setPlusCount(true);

		if (!boardVO.getSubPageIndex().isEmpty()) {
			boardVO.setPlusCount(false);
		}

		boardVO.setLastUpdusrId(user.getUniqId());
		BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

		String noticeTitle = "";
		String noticeContents = "";
		if (vo.getNttSj() != null || !vo.getNttSj().isEmpty()) {
			noticeTitle = vo.getNttSj();
		}
		if (vo.getNttCn() != null || !vo.getNttCn().isEmpty()) {
			noticeContents = vo.getNttCn();
		}

		Map<String, Object> result = new HashMap<>();
		result.put("noticeTitle", noticeTitle);
		result.put("noticeContents", noticeContents);
		result.put("result", "success");
		result.put("msg", "처리 완료!");
		return result;
	}

}