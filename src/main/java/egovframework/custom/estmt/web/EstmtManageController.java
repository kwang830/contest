package egovframework.custom.estmt.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.smt.sim.service.EgovIndvdlSchdulManageService;
import egovframework.com.cop.smt.sim.service.IndvdlSchdulManageVO;
import egovframework.custom.estmt.service.EstmtDefaultVO;
import egovframework.custom.estmt.service.EstmtManageService;
import egovframework.custom.estmt.service.EstmtManageVO;
import egovframework.custom.estmt.service.EstmtPrdlstVO;
import egovframework.custom.excel.MakeExcel;
import egovframework.custom.prdlst.service.PrdlstManageVO;
import egovframework.custom.estmt.service.EstmtBcncVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

@Controller
public class EstmtManageController {

	/** userManageService */
	@Resource(name = "EstmtManageService")
	private EstmtManageService estmtManageService;
	
	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;		

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;	

    @Autowired
    private DefaultBeanValidator beanValidator;	

	@Resource(name = "egovIndvdlSchdulManageService")
	private EgovIndvdlSchdulManageService egovIndvdlSchdulManageService;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;    
    
	/**
	 * 견적서등록을 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "견적서등록", order = 460, gid = 50)
	@RequestMapping(value = "/custom/estmt/EstmtRegist.do")
	public String selectEstmtRegist(@ModelAttribute("estmtManageVO") EstmtManageVO estmtManageVO, ModelMap model) throws Exception {
		//System.out.println("chk >>> EstmtRegist.do");
		
		ComDefaultCodeVO comDefaultCodeVO = new ComDefaultCodeVO();
		//진행상태 코드
		comDefaultCodeVO.setCodeId("JHB005");
		List<?> useYnCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("progrsSttus_result", useYnCode_result);		
		//품목 코드
		comDefaultCodeVO.setCodeId("JHB004");
		List<?> prdlstCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("prdlstCode_result", prdlstCode_result);
		//파트 코드
		comDefaultCodeVO.setCodeId("JHB001");
		List<?> partCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("partCode_result", partCode_result);
		//메이커 코드
		comDefaultCodeVO.setCodeId("JHB002");
		List<?> makerCode_result = cmmUseService.selectCmmCodeDetailOrderByCodeNm(comDefaultCodeVO);
		model.addAttribute("makerCode_result", makerCode_result);

		String manageNo = estmtManageVO.getManageNo();
		if(!manageNo.equals("")){
			// 조회 계약정보
			EstmtManageVO vo = estmtManageService.selectEstmtDetail(estmtManageVO);
			model.addAttribute("estmtManageVO", vo);	
			
			// 조회 거래처 정보
			Map<String, Object> map = estmtManageService.selectEstmtBcncDetail(estmtManageVO);
			int totCnt = Integer.parseInt((String)map.get("resultCnt"));
			//System.out.println("totCnt:"+totCnt);		
			
			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultCnt", totCnt);
			
			// 조회 품목 리스트
			Map<String, Object> map2 = estmtManageService.selectEstmtPrdlstDetail(estmtManageVO);
			int totCnt2 = Integer.parseInt((String)map2.get("resultCnt"));
			//System.out.println("totCnt2:"+totCnt2);		
			
			model.addAttribute("resultList2", map2.get("resultList"));
			model.addAttribute("resultCnt2", totCnt2);			
		}
		return "custom/estmt/EstmtRegist";
	}
	
	/**
	 * 견적서등록을 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "견적서상세정보", order = 460, gid = 50)
	@RequestMapping(value = "/custom/estmt/EstmtDetail.do")
	public String selectEstmtDetail(@ModelAttribute("estmtManageVO") EstmtManageVO estmtManageVO, ModelMap model) throws Exception {
		//System.out.println("chk >>> EstmtDetail.do");
		
		ComDefaultCodeVO comDefaultCodeVO = new ComDefaultCodeVO();
		//진행상태 코드
		comDefaultCodeVO.setCodeId("JHB005");
		List<?> useYnCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("progrsSttus_result", useYnCode_result);		
		//품목 코드
		comDefaultCodeVO.setCodeId("JHB004");
		List<?> prdlstCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("prdlstCode_result", prdlstCode_result);
		//파트 코드
		comDefaultCodeVO.setCodeId("JHB001");
		List<?> partCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("partCode_result", partCode_result);
		//메이커 코드
		comDefaultCodeVO.setCodeId("JHB002");
		List<?> makerCode_result = cmmUseService.selectCmmCodeDetailOrderByCodeNm(comDefaultCodeVO);
		model.addAttribute("makerCode_result", makerCode_result);

		String manageNo = estmtManageVO.getManageNo();
		if(!manageNo.equals("")){
			// 조회 계약정보
			EstmtManageVO vo = estmtManageService.selectEstmtDetail(estmtManageVO);
			model.addAttribute("estmtManageVO", vo);	
			
			// 조회 거래처 정보
			Map<String, Object> map = estmtManageService.selectEstmtBcncDetail(estmtManageVO);
			int totCnt = Integer.parseInt((String)map.get("resultCnt"));
			//System.out.println("totCnt:"+totCnt);		
			
			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultCnt", totCnt);
			
			// 조회 품목 리스트
			Map<String, Object> map2 = estmtManageService.selectEstmtPrdlstDetail(estmtManageVO);
			int totCnt2 = Integer.parseInt((String)map2.get("resultCnt"));
			//System.out.println("totCnt2:"+totCnt2);		
			
			model.addAttribute("resultList2", map2.get("resultList"));
			model.addAttribute("resultCnt2", totCnt2);			
		}
		return "custom/estmt/EstmtDetail";
	}	
	
	/**
	 * 입력한 관리번호의 중복여부를 체크하여 사용가능여부를 확인
	 * @param commandMap 파라메터전달용 commandMap
	 * @param model 화면모델
	 * @return uss/umt/EgovIdDplctCnfirm
	 * @throws Exception
	 */
    @RequestMapping("/custom/estmt/selectBcncListAjax.do")
    public ModelAndView selectBcncList(@RequestParam Map<String, Object> commandMap) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();
    	
    	try{
        	
        	modelAndView.setViewName("jsonView");

    		String checkId = (String) commandMap.get("checkId");
    		//checkId = new String(checkId.getBytes("ISO-8859-1"), "UTF-8");
    		
    		EstmtBcncVO estmtBcncVO = new EstmtBcncVO();
    		estmtBcncVO.setBcncNm(checkId);
    		
    		Map<String, Object> map = estmtManageService.selectBcncList(estmtBcncVO);
    		int totCnt = Integer.parseInt((String)map.get("resultCnt"));		
    		
    		modelAndView.addObject("resultList", map.get("resultList"));
    		modelAndView.addObject("resultCnt", totCnt);
    		modelAndView.addObject("checkId", checkId);
    	}catch (Exception e){
    		//System.out.println("/custom/estmt/selectBcncListAjax.do Exception:"+e);
    		modelAndView.addObject("resultCnt", 0);
    	}

		return modelAndView;
    }	
    
	/**
	 * 입력한 관리번호의 중복여부를 체크하여 사용가능여부를 확인
	 * @param commandMap 파라메터전달용 commandMap
	 * @param model 화면모델
	 * @return uss/umt/EgovIdDplctCnfirm
	 * @throws Exception
	 */
    @RequestMapping("/custom/estmt/selectPrdlstListAjax.do")
    public ModelAndView selectPrdlstList(@RequestParam Map<String, Object> commandMap) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();
    	
    	try{        	
        	modelAndView.setViewName("jsonView");

    		String srcPrdlstCode = (String) commandMap.get("srcPrdlstCode");
    		String srcPart = (String) commandMap.get("srcPart");
    		String srcMaker = (String) commandMap.get("srcMaker");
    		String srcPrdlstNo = (String) commandMap.get("srcPrdlstNo");
    		String srcModel = (String) commandMap.get("srcModel");
    		int srcFirstIndex = Integer.valueOf((String) commandMap.get("srcFirstIndex"));
    		
    		EstmtPrdlstVO estmtPrdlstVO = new EstmtPrdlstVO();
    		estmtPrdlstVO.setSrcPrdlstCode(srcPrdlstCode);
    		estmtPrdlstVO.setSrcPart(srcPart);
    		estmtPrdlstVO.setSrcMaker(srcMaker);
    		estmtPrdlstVO.setSrcPrdlstNo(srcPrdlstNo);
    		estmtPrdlstVO.setSrcModel(srcModel);
    		estmtPrdlstVO.setPageIndex(srcFirstIndex);

    		estmtPrdlstVO.setPageUnit(propertyService.getInt("pageUnit"));
    		estmtPrdlstVO.setPageSize(propertyService.getInt("pageSize"));
    	
    		PaginationInfo paginationInfo = new PaginationInfo();			
    		paginationInfo.setCurrentPageNo(estmtPrdlstVO.getPageIndex());
    		paginationInfo.setRecordCountPerPage(estmtPrdlstVO.getPageUnit());
    		paginationInfo.setPageSize(estmtPrdlstVO.getPageSize());
    	
    		estmtPrdlstVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    		estmtPrdlstVO.setLastIndex(paginationInfo.getLastRecordIndex());
    		estmtPrdlstVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    		    		
    		Map<String, Object> map = estmtManageService.selectPrdlstList(estmtPrdlstVO);
    		int totCnt = Integer.parseInt((String)map.get("resultCnt"));		
    		
    		modelAndView.addObject("resultList", map.get("resultList"));
    		modelAndView.addObject("resultCnt", totCnt);
    		
    	}catch (Exception e){
    		//System.out.println("/custom/estmt/selectBcncListAjax.do Exception:"+e);
    		modelAndView.addObject("resultCnt", 0);
    	}

		return modelAndView;
    }    

	/**
	 * 거래처별조회를 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "거래처별조회", order = 460, gid = 50)
	@RequestMapping(value = "/custom/estmt/EstmtBcncInqire.do")
	public String selectEstmtBcncInqire(@ModelAttribute("estmtManageVO") EstmtManageVO estmtManageVO, ModelMap model) throws Exception {
		//System.out.println("chk >>> EstmtBcncInqire.do");
		
		try{
			ComDefaultCodeVO comDefaultCodeVO = new ComDefaultCodeVO();		
			//진행상태 코드
			comDefaultCodeVO.setCodeId("JHB005");
			List<?> useYnCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
			model.addAttribute("progrsSttus_result", useYnCode_result);
			
			estmtManageVO.setPageUnit(propertyService.getInt("pageUnit"));
			estmtManageVO.setPageSize(propertyService.getInt("pageSize"));
    	
    		PaginationInfo paginationInfo = new PaginationInfo();			
    		paginationInfo.setCurrentPageNo(estmtManageVO.getPageIndex());
    		paginationInfo.setRecordCountPerPage(estmtManageVO.getPageUnit());
    		paginationInfo.setPageSize(estmtManageVO.getPageSize());
    	
    		estmtManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    		estmtManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
    		estmtManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());			
			
			// 조회 품목 리스트
			Map<String, Object> map = estmtManageService.selectEstmtList(estmtManageVO);
			int totCnt = Integer.parseInt((String)map.get("resultCnt"));
			//System.out.println("totCnt:"+totCnt);
			paginationInfo.setTotalRecordCount(totCnt);
			
			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultCnt", totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
		}catch (Exception e){
			//System.out.println("/custom/estmt/EstmtBcncInqire.do Exception:"+e);
		}
			
		
		return "custom/estmt/EstmtBcncInqire";
	}

	/**
	 * 년도별조회를 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "년도별조회", order = 460, gid = 50)
	@RequestMapping(value = "/custom/estmt/EstmtYearInqire.do")
	public String selectEstmtYearInqire(@ModelAttribute("estmtManageVO") EstmtManageVO estmtManageVO, ModelMap model) throws Exception {
		//System.out.println("chk >>> EstmtYearInqire.do");
		return "custom/estmt/EstmtYearInqire";
	}
	
	/**
	 * 거래처관리를 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "거래처관리", order = 460, gid = 50)
	@RequestMapping(value = "/custom/estmt/BcncManage.do")
	public String selectBcncManage(@ModelAttribute("estimateSearchVO") EstmtDefaultVO estmtSearchVO, ModelMap model) throws Exception {
		//System.out.println("chk >>> BcncManage.do");
		return "custom/estmt/BcncManage";
	}
	
    /**
     * 신규 견적서 정보를 등록한다.
     * 
     * @param boardMasterVO
     * @param boardMaster
     * @param status
     * @return
     * @throws Exception
     */
    @RequestMapping("/custom/estmt/insertEstmt.do")
    public String insertPrdlst(@ModelAttribute("estmtManageVO") EstmtManageVO estmtManageVO,
    	@RequestParam(value="subSn",required=false) String[] strSubSn,
    	@RequestParam(value="bcncCharger",required=false) String[] strBcncCharger,
    	@RequestParam(value="cttpc",required=false) String[] strCttpc,
    	@RequestParam(value="email",required=false) String[] strEmail,
    	@RequestParam(value="jobCharger",required=false) String[] strJobCharger,
    	@RequestParam(value="mainYn",required=false) String[] strMainYn,
    	@RequestParam(value="adres",required=false) String[] strAdres,
    	@RequestParam(value="memo",required=false) String[] strMemo,
    	//
    	@RequestParam(value="prdlstSubSn",required=false) String[] strPrdlstSubSn,   	
    	@RequestParam(value="prdlstDirectYn",required=false) String[] strPrdlstDirectYn,    	
    	@RequestParam(value="prdlstJhno",required=false) String[] strPrdlstJhno,    	
    	@RequestParam(value="prdlstNoSe",required=false) String[] strPrdlstNoSe,    	
    	@RequestParam(value="prdlstSubNo",required=false) String[] strPrdlstSubNo,    	
    	@RequestParam(value="prdlstModel",required=false) String[] strPrdlstModel,    	    	
    	@RequestParam(value="prdlstPart",required=false) String[] strPrdlstPart,    	    	
    	@RequestParam(value="prdlstShim",required=false) String[] strPrdlstShim,    	
    	@RequestParam(value="prdlstUntpc",required=false) String[] strPrdlstUntpc,    	
    	@RequestParam(value="prdlstProfitRt",required=false) String[] strPrdlstProfitRt,    	
    	@RequestParam(value="prdlstQy",required=false) String[] strPrdlstQy,    	
    	@RequestParam(value="prdlstAmount",required=false) String[] strPrdlstAmount,    	
	    BindingResult bindingResult, ModelMap model) throws Exception {   	
    	
        try {
        	//System.out.println(">>>>> insertEstmt.do ");
    		
        	//로그인 객체 선언         	
        	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
        	beanValidator.validate(estmtManageVO, bindingResult);

		if (bindingResult.hasErrors()) {		    
		    return "custom/estmt/EstmtRegist";
		}
		
		//System.out.println("isAuthenticated:"+isAuthenticated);
		if (isAuthenticated) {
			estmtManageVO.setFrstRegisterId(user.getUniqId());
			estmtManageVO.setLastUpdusrId(user.getUniqId());
			//System.out.println(">>>> user.getUniqId():"+user.getUniqId());
		}
		
		//System.out.println("estmtManageVO.getManageNo():"+estmtManageVO.getManageNo());
		
		if(estmtManageVO.getDmlType().equals("insert")){
			//estmtManageVO.setManageNo(manageNo);
			estmtManageService.insertEstmt(estmtManageVO);
			//System.out.println("insert");
			
			IndvdlSchdulManageVO indvdlSchdulManageVO = new IndvdlSchdulManageVO();
    		indvdlSchdulManageVO.setFrstRegisterId(user.getUniqId());
    		//indvdlSchdulManageVO.setLastUpdusrId(user.getUniqId());
    		indvdlSchdulManageVO.setSchdulChargerId(user.getUniqId());    		
    		//현재년월일 셋팅
    		//java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
    		//String sTodate = formatter.format(new java.util.Date());    		
    		
    		indvdlSchdulManageVO.setSchdulDeptId("ORGNZT_0000000000000"); //
    		 
    		indvdlSchdulManageVO.setSchdulCn(estmtManageVO.getEstmtMemo());  
    		indvdlSchdulManageVO.setSchdulIpcrCode("A");
    		indvdlSchdulManageVO.setReptitSeCode("1");
    		indvdlSchdulManageVO.setSchdulKindCode("1");
    		
    		if(!estmtManageVO.getRegistDe().equals("")){
    			indvdlSchdulManageVO.setSchdulSe("7"); // 종류
        		indvdlSchdulManageVO.setSchdulId(estmtManageVO.getManageNo()+"_1");
        		indvdlSchdulManageVO.setSchdulNm("[등록]"+estmtManageVO.getDocSj());
        		indvdlSchdulManageVO.setSchdulBgnde(estmtManageVO.getRegistDe().replaceAll("-", "")+"0000");
        		indvdlSchdulManageVO.setSchdulEndde(estmtManageVO.getRegistDe().replaceAll("-", "")+"0000");
            	egovIndvdlSchdulManageService.insertIndvdlSchdulManage(indvdlSchdulManageVO);
    		}
    		
    		if(!estmtManageVO.getCntrctDe().equals("")){
    			indvdlSchdulManageVO.setSchdulSe("8"); // 종류
        		indvdlSchdulManageVO.setSchdulId(estmtManageVO.getManageNo()+"_2");
        		indvdlSchdulManageVO.setSchdulNm("[계약]"+estmtManageVO.getDocSj());
        		indvdlSchdulManageVO.setSchdulBgnde(estmtManageVO.getCntrctDe().replaceAll("-", "")+"0000");
        		indvdlSchdulManageVO.setSchdulEndde(estmtManageVO.getCntrctDe().replaceAll("-", "")+"0000");
            	egovIndvdlSchdulManageService.insertIndvdlSchdulManage(indvdlSchdulManageVO);
    		}    		
			
        }else{
        	estmtManageService.updateEstmt(estmtManageVO);
        	//System.out.println("update");
        	
			IndvdlSchdulManageVO indvdlSchdulManageVO = new IndvdlSchdulManageVO();
    		//indvdlSchdulManageVO.setFrstRegisterId(user.getUniqId());
    		indvdlSchdulManageVO.setLastUpdusrId(user.getUniqId());
    		indvdlSchdulManageVO.setSchdulChargerId(user.getUniqId());    		
    		//현재년월일 셋팅
    		//java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
    		//String sTodate = formatter.format(new java.util.Date());    		
    		
    		indvdlSchdulManageVO.setSchdulDeptId("ORGNZT_0000000000000"); //
    		 
    		indvdlSchdulManageVO.setSchdulCn(estmtManageVO.getEstmtMemo());  
    		indvdlSchdulManageVO.setSchdulIpcrCode("A");
    		indvdlSchdulManageVO.setReptitSeCode("1");
    		indvdlSchdulManageVO.setSchdulKindCode("1");
    		
    		if(!estmtManageVO.getRegistDe().equals("")){
    			indvdlSchdulManageVO.setSchdulSe("8"); // 종류
        		indvdlSchdulManageVO.setSchdulId(estmtManageVO.getManageNo()+"_1");
        		indvdlSchdulManageVO.setSchdulNm("[등록]"+estmtManageVO.getDocSj());
        		indvdlSchdulManageVO.setSchdulBgnde(estmtManageVO.getRegistDe().replaceAll("-", "")+"0000");
        		indvdlSchdulManageVO.setSchdulEndde(estmtManageVO.getRegistDe().replaceAll("-", "")+"0000");
            	egovIndvdlSchdulManageService.updateIndvdlSchdulManage(indvdlSchdulManageVO);
    		}
    		
    		if(!estmtManageVO.getCntrctDe().equals("")){
    			indvdlSchdulManageVO.setSchdulSe("7"); // 종류
        		indvdlSchdulManageVO.setSchdulId(estmtManageVO.getManageNo()+"_2");
        		indvdlSchdulManageVO.setSchdulNm("[계약]"+estmtManageVO.getDocSj());
        		indvdlSchdulManageVO.setSchdulBgnde(estmtManageVO.getCntrctDe().replaceAll("-", "")+"0000");
        		indvdlSchdulManageVO.setSchdulEndde(estmtManageVO.getCntrctDe().replaceAll("-", "")+"0000");
            	egovIndvdlSchdulManageService.updateIndvdlSchdulManage(indvdlSchdulManageVO);
    		}          	
        }
		
		if(strSubSn!=null){
    		//System.out.println("----------------------------");
    		//System.out.println("----------------------------");
    		//System.out.println("------------strSubSn.length:"+strSubSn.length+" ---------------");
    		
    		String chkDellAll = estmtManageVO.getChkDelAll();
    		//System.out.println("chkDellAll:"+chkDellAll);
    		String [] strchkDellAll = chkDellAll.split(",", -1);
    		
        	for(int i=0; i<strchkDellAll.length;i++) {
        		estmtManageVO.setSubSn(strchkDellAll[i]!=null?strchkDellAll[i]:"");   
        		estmtManageService.deleteEstmtSub(estmtManageVO);
        	}     		
    		
			// 거래처 저장
			for(int i=0; i<strSubSn.length;i++) {
				//System.out.println("strSubSn[i]:"+strSubSn[i]);
				//System.out.println("strBcncCharger[i]:"+strBcncCharger[i]);
				//System.out.println("strCttpc[i]:"+strCttpc[i]);
				//System.out.println("strEmail[i]:"+strEmail[i]);
				//System.out.println("strJobCharger[i]:"+strJobCharger[i]);
				//System.out.println("strMainYn[i]:"+strMainYn[i]);
				//System.out.println("strAdres[i]:"+strAdres[i]);
				//System.out.println("strMemo[i]:"+strMemo[i]);
				
				estmtManageVO.setSubSn(strSubSn[i]!=null?strSubSn[i]:"");
				estmtManageVO.setBcncCharger(strBcncCharger[i]!=null?strBcncCharger[i]:"");
				estmtManageVO.setCttpc(strCttpc[i]!=null?strCttpc[i]:"");
				estmtManageVO.setEmail(strEmail[i]!=null?strEmail[i]:"");
				estmtManageVO.setJobCharger(strJobCharger[i]!=null?strJobCharger[i]:"");
				estmtManageVO.setMainYn(strMainYn[i]!=null?strMainYn[i]:"");
				estmtManageVO.setAdres(strAdres[i]!=null?strAdres[i]:"");
				estmtManageVO.setMemo(strMemo[i]!=null?strMemo[i]:"");
				if(estmtManageVO.getDmlType().equals("insert")){
					estmtManageService.insertEstmtBcnc(estmtManageVO);
				}else{
					if(strSubSn[i].equals("N"))
						estmtManageService.insertEstmtBcnc(estmtManageVO);
					else if(strSubSn[i].equals("X"))
						;
					else 
						estmtManageService.updateEstmtBcnc(estmtManageVO);
				}
			}
						
		}
    	
    	
    	if(strPrdlstSubSn!=null){
    		//System.out.println("----------------------------");
    		//System.out.println("----------------------------");
    		//System.out.println("------------strPrdlstSubSn.length:"+strPrdlstSubSn.length+" ---------------");

    		String chkDelPrdlstAll = estmtManageVO.getChkDelPrdlstAll();
    		//System.out.println("chkDelPrdlstAll:"+chkDelPrdlstAll);
    		String [] strchkDellAll = chkDelPrdlstAll.split(",", -1);
    		
        	for(int i=0; i<strchkDellAll.length;i++) {
        		estmtManageVO.setSubSn(strchkDellAll[i]!=null?strchkDellAll[i]:"");   
        		estmtManageService.deletePrdlstSub(estmtManageVO);
        	} 
    		
    		// 품목리스트 저장
    		for(int i=0; i<strPrdlstSubSn.length;i++) {
    			estmtManageVO.setPrdlstSubSn(strPrdlstSubSn[i]!=null?strPrdlstSubSn[i]:"");
    			estmtManageVO.setPrdlstDirectYn(strPrdlstDirectYn[i]!=null?strPrdlstDirectYn[i]:"");
    			estmtManageVO.setPrdlstJhno(strPrdlstJhno[i]!=null?strPrdlstJhno[i]:"");
    			estmtManageVO.setPrdlstNoSe(strPrdlstNoSe[i]!=null?strPrdlstNoSe[i]:"");
    			estmtManageVO.setPrdlstSubNo(strPrdlstSubNo[i]!=null?strPrdlstSubNo[i]:"");
    			estmtManageVO.setPrdlstModel(strPrdlstModel[i]!=null?strPrdlstModel[i]:"");
    			estmtManageVO.setPrdlstPart(strPrdlstPart[i]!=null?strPrdlstPart[i]:"");
    			estmtManageVO.setPrdlstShim(strPrdlstShim[i]!=null?strPrdlstShim[i]:"");
    			estmtManageVO.setPrdlstUntpc(strPrdlstUntpc[i]!=null?strPrdlstUntpc[i]:"");
    			estmtManageVO.setPrdlstProfitRt(strPrdlstProfitRt[i]!=null?strPrdlstProfitRt[i]:"");
    			estmtManageVO.setPrdlstQy(strPrdlstQy[i]!=null?strPrdlstQy[i]:"");
    			estmtManageVO.setPrdlstAmount(strPrdlstAmount[i]!=null?strPrdlstAmount[i]:"");
    			
    			if(estmtManageVO.getDmlType().equals("insert")){
    				estmtManageService.insertEstmtPrdlst(estmtManageVO);
    			}else{
        			if(strPrdlstSubSn[i].equals("N"))
        				estmtManageService.insertEstmtPrdlst(estmtManageVO);
        			else if(strPrdlstSubSn[i].equals("X"))
        				;
        			else 
        				estmtManageService.updateEstmtPrdlst(estmtManageVO);
    			}
    		}
    		
	    		
    	}
    	
    	model.addAttribute("estmtManageVO", estmtManageVO);
    	model.addAttribute("tManageNo", estmtManageVO.getManageNo());
		model.addAttribute("resultMsg", "success.common.insert");
		
        } catch (Exception e) {
        	//System.out.println("Exception e:"+e);
        	model.addAttribute("resultMsg", "fail.request.msg");	
        }

		return "forward:/custom/estmt/EstmtRegist.do";	
    }
    
	/**
	 * 입력한 관리번호의 중복여부를 체크하여 사용가능여부를 확인
	 * @param commandMap 파라메터전달용 commandMap
	 * @param model 화면모델
	 * @return uss/umt/EgovIdDplctCnfirm
	 * @throws Exception
	 */
    @RequestMapping("/custom/estmt/checkEstmtManageNoAjax.do")
    public ModelAndView checkKeyJhno(@RequestParam Map<String, Object> commandMap) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setViewName("jsonView");

		EstmtManageVO estmtManageVO = new EstmtManageVO();	
		
		String manageNo = estmtManageService.checkEstmtManageNo(estmtManageVO);		
		modelAndView.addObject("manageNo", manageNo);

		return modelAndView;
    }
    
    @RequestMapping(value = "/custom/estmt/downExcel.do")
    public void listExcel(
    		@RequestParam Map<String, Object> commandMap,
    		HttpServletRequest request,
            HttpServletResponse response,
            @ModelAttribute("estmtManageVO") EstmtManageVO estmtManageVO,
            ModelMap modelMap) throws Exception, Exception {

    		//System.out.println("/custom/estmt/downExcel.do");
    		
    		String manageNo = (String) commandMap.get("manageNo");
    		String xlsType = (String) commandMap.get("xlsType"); 
    		
    		estmtManageVO.setManageNo(manageNo);
    		//System.out.println(">>> manageNo:"+manageNo);
    		
    		String xlsx_file_nm = "견적서";
    		
	        // 받은 데이터를 맵에 담는다.
	        Map<String, Object> beans = new HashMap<String, Object>();    		
    		if(!manageNo.equals("")){
    			// 조회 계약정보
    			EstmtManageVO vo = estmtManageService.selectEstmtDetail(estmtManageVO);
    			if(vo!=null){
    	    		if(!vo.getBcncNm().equals("")) xlsx_file_nm += "_"+vo.getBcncNm();
    	    		if(!vo.getDocNo().equals("")) xlsx_file_nm += "_"+vo.getDocNo();    				
    				
    				beans.put("estmtManageVO", vo);
    			}    			

    			// 조회 거래처 정보
    			Map<String, Object> map = estmtManageService.selectEstmtBcncDetail(estmtManageVO);
    			int totCnt = Integer.parseInt((String)map.get("resultCnt"));
    			//System.out.println("totCnt:"+totCnt);
    			beans.put("resultList", map.get("resultList"));
    			beans.put("resultCnt", totCnt);

    			// 조회 품목 리스트
    			Map<String, Object> map2 = estmtManageService.selectEstmtPrdlstDetail(estmtManageVO);
    			int totCnt2 = Integer.parseInt((String)map2.get("resultCnt"));
    			//System.out.println("totCnt2:"+totCnt2);
    			beans.put("resultList2", map2.get("resultList"));
    			beans.put("resultCnt2", totCnt2);
    					
    		}    		
    		
    		
        // 엑셀 다운로드 메소드가 담겨 있는 객체
        MakeExcel me = new MakeExcel();    		
        if(xlsType.equals("1")){
        	me.download(request, response, beans, xlsx_file_nm+".xlsx", "tmp1.xlsx");
        }else if(xlsType.equals("2")){
        	xlsx_file_nm += "(Eng)";
        	me.download(request, response, beans, xlsx_file_nm+".xlsx", "tmp2.xlsx");
        }else if(xlsType.equals("3")){
        	xlsx_file_nm += "(List)";
        	me.download(request, response, beans, xlsx_file_nm+".xlsx", "tmp3.xlsx");
        }
    }


}
