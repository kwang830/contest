package egovframework.let.sym.log.clg.web;

import java.util.HashMap;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.sym.log.clg.service.EgovLoginLogService;
import egovframework.let.sym.log.clg.service.LoginLog;


import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Class Name : EgovLoginLogController.java
 * @Description : 접속로그정보를 관리하기 위한 컨트롤러 클래스
 * @Modification Information
 *
 *    수정일       수정자         수정내용
 *    -------      -------     -------------------
 *    2009. 3. 11. 이삼섭        최초생성
 *    2011. 7. 01. 이기하        패키지 분리(sym.log -> sym.log.clg)
 *    2011.8.26	정진오			IncludedInfo annotation 추가
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 3. 11.
 * @version
 * @see
 *
 */

@Controller
public class EgovLoginLogController {

	@Resource(name="EgovLoginLogService")
	private EgovLoginLogService loginLogService;

	@Resource(name="propertiesService")
	protected EgovPropertyService propertyService;

	/** EgovMessageSource */
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;

	/**
	 * 로그인 로그 목록 조회
	 *
	 * @param loginLog
	 * @return sym/log/clg/EgovLoginLogList
	 * @throws Exception Exception
	 */
	@IncludedInfo(name="접속로그관리", order = 1080 ,gid = 60)
	@RequestMapping(value="/sym/log/clg/SelectLoginLogList.do")
	public String selectLoginLogInf(@ModelAttribute("searchVO") LoginLog loginLog,
			ModelMap model) throws Exception{

		loginLog.setPageUnit(propertyService.getInt("pageUnit"));
		loginLog.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(loginLog.getPageIndex());
		paginationInfo.setRecordCountPerPage(loginLog.getPageUnit());
		paginationInfo.setPageSize(loginLog.getPageSize());

		loginLog.setFirstIndex(paginationInfo.getFirstRecordIndex());
		loginLog.setLastIndex(paginationInfo.getLastRecordIndex());
		loginLog.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		HashMap<?, ?> _map = (HashMap<?, ?>)loginLogService.selectLoginLogInf(loginLog);
		int totCnt = Integer.parseInt((String)_map.get("resultCnt"));

		model.addAttribute("resultList", _map.get("resultList"));
		model.addAttribute("resultCnt", _map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sym/log/clg/EgovLoginLogList";

	}

	/**
	 * 로그인 로그 상세 조회
	 *
	 * @param loginLog
	 * @param model
	 * @return sym/log/clg/EgovLoginLogInqire
	 * @throws Exception Exception
	 */
	@RequestMapping(value="/sym/log/clg/SelectLoginLogDetail.do")
	public String selectLoginLog(@ModelAttribute("searchVO") LoginLog loginLog,
			@RequestParam("logId") String logId,
			ModelMap model) throws Exception{
		

		loginLog.setLogId(logId.trim());

		LoginLog vo = loginLogService.selectLoginLog(loginLog);
		model.addAttribute("result", vo);
		return "sym/log/clg/EgovLoginLogDetail";
	}

	/**
	 * 로그인 로그 목록 조회
	 *
	 * @param loginLog
	 * @return sym/log/clg/EgovLoginLogList
	 * @throws Exception Exception
	 */
	@IncludedInfo(name="접속로그관리", order = 1080 ,gid = 60)
	@RequestMapping(value="/sym/log/clg/userLgnHsty.do")
	public String selectUserLgnHstyInf(@ModelAttribute("searchVO") LoginLog loginLog,
									ModelMap model, HttpServletRequest request) throws Exception{
		// 메뉴 갱신
		request.getSession().setAttribute("menuNo", "6000000");
		request.getSession().setAttribute("activeMenuNo", "6020000");

		loginLog.setPageUnit(propertyService.getInt("pageUnit"));
		loginLog.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(loginLog.getPageIndex());
		paginationInfo.setRecordCountPerPage(loginLog.getPageUnit());
		paginationInfo.setPageSize(loginLog.getPageSize());

		loginLog.setFirstIndex(paginationInfo.getFirstRecordIndex());
		loginLog.setLastIndex(paginationInfo.getLastRecordIndex());
		loginLog.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

//		System.out.println("-----------------------------");
//		System.out.println(loginLog.getSearchBgnDe()+"//");
//		System.out.println(loginLog.getSearchEndDe()+"//");
//		System.out.println(loginLog.getSearchCnd()+"//");
//		System.out.println(loginLog.getSearchWrd()+"//");
//		System.out.println("-----------------------------");

		HashMap<?, ?> _map = (HashMap<?, ?>)loginLogService.selectLoginLogInf(loginLog);
		int totCnt = Integer.parseInt((String)_map.get("resultCnt"));

		model.addAttribute("resultList", _map.get("resultList"));
		model.addAttribute("resultCnt", _map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sym/log/clg/UserLgnHstyList";

	}
}
