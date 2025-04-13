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
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/cop/bbs/selectBoardArticleAjax.do", consumes = "application/json", produces = "application/json")
	public Map<String, Object> selectBoardArticleAjax(@RequestBody BoardVO boardVO) throws Exception {
		System.out.println("------------ selectBoardArticleAjax start -------------");
		System.out.println("------------ boardVO.getBbsId():"+boardVO.getBbsId());
		System.out.println("------------ boardVO.getNttId():"+boardVO.getNttId());

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
		BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

		String noticeTitle = "";
		String noticeCotents = "";
		if (vo.getNttSj() != null || !vo.getNttSj().equals("")) {
			noticeTitle = vo.getNttSj();
		}
		if (vo.getNttCn() != null || !vo.getNttCn().equals("")) {
			noticeCotents = vo.getNttCn();
		}

		Map<String, Object> result = new HashMap<>();
		result.put("noticeTitle", noticeTitle);
		result.put("noticeCotents", noticeCotents);
		result.put("result", "success");
		result.put("msg", "처리 완료!");
		return result;
	}

}