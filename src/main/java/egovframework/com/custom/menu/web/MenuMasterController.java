package egovframework.com.custom.menu.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.EgovBBSMasterService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


/**
 * 게시판 속성관리를 위한 컨트롤러  클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2009.3.12  이삼섭          최초 생성
 *   2009.06.26	한성곤		    2단계 기능 추가 (댓글관리, 만족도조사)
 *	 2011.07.21 안민정          커뮤니티 관련 메소드 분리 (->EgovBBSAttributeManageController)
 *	 2011.8.26	정진오			IncludedInfo annotation 추가
 *   2011.09.15 서준식           2단계 기능 추가 (댓글관리, 만족도조사) 적용방법 변경
 *   2016.06.13 김연호          표준프레임워크 v3.6 개선
 * </pre>
 */

@Controller
public class MenuMasterController {

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;   

    @Autowired
    private DefaultBeanValidator beanValidator;

    //Logger log = Logger.getLogger(this.getClass());
    
    /**
     * 신규 게시판 마스터 등록을 위한 등록페이지로 이동한다.
     * 
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/insertBBSMasterView2.do")
    public String insertBBSMasterView2(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, ModelMap model) throws Exception {
		BoardMasterVO boardMaster = new BoardMasterVO();
	
		//공통코드(게시판유형)
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM101");
		List<?> codeResult = cmmUseService.selectCmmCodeDetail(vo);
		
		model.addAttribute("bbsTyCode", codeResult);
		model.addAttribute("boardMasterVO", boardMaster);
	
	
		return "egovframework/com/cop/bbs/EgovBBSMasterRegist";
    }


    
}
