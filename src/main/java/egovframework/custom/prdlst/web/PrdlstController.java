package egovframework.custom.prdlst.web;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.custom.prdlst.service.PrdlstDefaultVO;
import egovframework.custom.prdlst.service.PrdlstManageVO;
import egovframework.custom.prdlst.service.PrdlstManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.fdl.string.EgovStringUtil;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

@Controller
public class PrdlstController {

	/** userManageService */
	@Resource(name = "PrdlstManageService")
	private PrdlstManageService prdlstManageService;

    @Autowired
    private DefaultBeanValidator beanValidator;	
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;	
    
	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;	
	
	// 첨부파일 관련
	@Resource(name="EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;	
	
	/**
	 * 품목등록 페이지 호출. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "품목등록", order = 460, gid = 50)
	@RequestMapping(value = "/custom/prdlst/PrdlstRegist.do")
	public String selectPrdlstRegist(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO
			, @ModelAttribute("prdlstManageVO") PrdlstManageVO prdlstManageVO, ModelMap model) throws Exception {
		//System.out.println("chk >>> EstmtRegist.do");
		
		ComDefaultCodeVO comDefaultCodeVO = new ComDefaultCodeVO();
		//사용구분 코드
		comDefaultCodeVO.setCodeId("COM045");
		List<?> useYnCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("useYnCode_result", useYnCode_result);
		//YN 코드
		comDefaultCodeVO.setCodeId("COM038");
		List<?> ynCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("ynCode_result", ynCode_result);		
		//파트 코드
		comDefaultCodeVO.setCodeId("JHB001");
		List<?> partCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("partCode_result", partCode_result);
		//메이커 코드
		comDefaultCodeVO.setCodeId("JHB002");
		List<?> makerCode_result = cmmUseService.selectCmmCodeDetailOrderByCodeNm(comDefaultCodeVO);
		model.addAttribute("makerCode_result", makerCode_result);
		//SUB번호 코드
		comDefaultCodeVO.setCodeId("JHB003");
		List<?> subNoSeCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("subNoSeCode_result", subNoSeCode_result);
		//품목 코드
		comDefaultCodeVO.setCodeId("JHB004");
		List<?> prdlstCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("prdlstCode_result", prdlstCode_result);
		
		model.addAttribute("userSearchVO", userSearchVO);		
		model.addAttribute("prdlstManageVO", prdlstManageVO);
		
		
		return "custom/prdlst/PrdlstRegist";
	}

	/**
	 * 품목조회 페이지 호출. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "품목조회", order = 460, gid = 50)
	@RequestMapping(value = "/custom/prdlst/PrdlstInqire.do")
	public String selectPrdlstInqire(@ModelAttribute("prdlstManageVO") PrdlstManageVO prdlstManageVO,
			 ModelMap model) throws Exception {
		
		ComDefaultCodeVO comDefaultCodeVO = new ComDefaultCodeVO();
		//사용구분 코드
		comDefaultCodeVO.setCodeId("COM045");
		List<?> useYnCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("useYnCode_result", useYnCode_result);		
		//파트 코드
		comDefaultCodeVO.setCodeId("JHB001");
		List<?> partCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("partCode_result", partCode_result);
		//메이커 코드
		comDefaultCodeVO.setCodeId("JHB002");
		List<?> makerCode_result = cmmUseService.selectCmmCodeDetailOrderByCodeNm(comDefaultCodeVO);
		model.addAttribute("makerCode_result", makerCode_result);
		//품목 코드
		comDefaultCodeVO.setCodeId("JHB004");
		List<?> prdlstCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("prdlstCode_result", prdlstCode_result);
		
		model.addAttribute("prdlstManageVO", prdlstManageVO);
		
		/** EgovPropertyService */
		prdlstManageVO.setPageUnit(propertiesService.getInt("pageUnit"));
		prdlstManageVO.setPageSize(propertiesService.getInt("pageSize"));

		//System.out.println("prdlstManageVO.getPageIndex():"+prdlstManageVO.getPageIndex());
		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(prdlstManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(prdlstManageVO.getPageUnit());
		paginationInfo.setPageSize(prdlstManageVO.getPageSize());

		prdlstManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		prdlstManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		prdlstManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		try{
			Map<String, Object> map = prdlstManageService.selectPrdlstInqireList(prdlstManageVO);
			int totCnt = Integer.parseInt((String)map.get("resultCnt"));
			//System.out.println("totCnt:"+totCnt);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);			
			
			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultCnt", totCnt);

        } catch (Exception e) {
        	//System.out.println("Exception e:"+e);
        	model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));	
        }		
		
		return "custom/prdlst/PrdlstInqire";
	}
	
	/**
	 * 품목조회 페이지 호출. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "품목조회", order = 460, gid = 50)
	@RequestMapping(value = "/custom/prdlst/PrdlstInqireSelectOnly.do")
	public String selectOnlyPrdlstInqire(@ModelAttribute("prdlstManageVO") PrdlstManageVO prdlstManageVO,
			 ModelMap model) throws Exception {
		
		ComDefaultCodeVO comDefaultCodeVO = new ComDefaultCodeVO();
		//사용구분 코드
		comDefaultCodeVO.setCodeId("COM045");
		List<?> useYnCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("useYnCode_result", useYnCode_result);		
		//파트 코드
		comDefaultCodeVO.setCodeId("JHB001");
		List<?> partCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("partCode_result", partCode_result);
		//메이커 코드
		comDefaultCodeVO.setCodeId("JHB002");
		List<?> makerCode_result = cmmUseService.selectCmmCodeDetailOrderByCodeNm(comDefaultCodeVO);
		model.addAttribute("makerCode_result", makerCode_result);
		//품목 코드
		comDefaultCodeVO.setCodeId("JHB004");
		List<?> prdlstCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("prdlstCode_result", prdlstCode_result);
		
		model.addAttribute("prdlstManageVO", prdlstManageVO);
		
		/** EgovPropertyService */
		prdlstManageVO.setPageUnit(propertiesService.getInt("pageUnit"));
		prdlstManageVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(prdlstManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(prdlstManageVO.getPageUnit());
		paginationInfo.setPageSize(prdlstManageVO.getPageSize());

		prdlstManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		prdlstManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		prdlstManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		try{
			Map<String, Object> map = prdlstManageService.selectPrdlstInqireList(prdlstManageVO);
			int totCnt = Integer.parseInt((String)map.get("resultCnt"));

			paginationInfo.setTotalRecordCount(totCnt);
			prdlstManageVO.setSelectOnly("Y");
			
			model.addAttribute("paginationInfo", paginationInfo);			
			
			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultCnt", totCnt);

        } catch (Exception e) {
        	//System.out.println("Exception e:"+e);
        	model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));	
        }		
		
		return "custom/prdlst/PrdlstInqire";
	}	
	
	/**
	 * 품목조회 페이지 호출. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "품목조회", order = 460, gid = 50)
	@RequestMapping(value = "/custom/prdlst/selectPrdlstInqireList.do")
	public String selectPrdlstInqireList(@ModelAttribute("prdlstManageVO") PrdlstManageVO prdlstManageVO, ModelMap model) throws Exception {
		//System.out.println("chk >>> selectPrdlstInqireList.do");		
		//System.out.println("prdlstManageVO.getSrcPrdlstCode():"+prdlstManageVO.getSrcPrdlstCode());
		
		try{
			Map<String, Object> map = prdlstManageService.selectPrdlstInqireList(prdlstManageVO);
			int totCnt = Integer.parseInt((String)map.get("resultCnt"));
			//System.out.println("totCnt:"+totCnt);
			
			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultCnt", totCnt);
			model.addAttribute("prdlstManageVO", prdlstManageVO);			
        } catch (Exception e) {
        	//System.out.println("Exception e:"+e);
        	model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));	
        }

		return "custom/prdlst/PrdlstInqire";
	}
	
	

	/**
	 * 품목코드 등록 페이지 호출. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "품목코드 등록", order = 460, gid = 50)
	@RequestMapping(value = "/custom/prdlst/PrdlstCodeRegist.do")
	public String selectPrdlstCodeRegist(@ModelAttribute("prdlstManageVO") PrdlstManageVO prdlstManageVO,
			@RequestParam(value="subSn",required=false) String[] strSubSn,
			@RequestParam(value="codeId",required=false) String[] strCodeId,
	    	@RequestParam(value="code",required=false) String[] strCode,
	    	@RequestParam(value="codeNm",required=false) String[] strCodeNm,
	    	@RequestParam(value="codeDc",required=false) String[] strCodeDc,
	    	@RequestParam(value="orderBy",required=false) String[] strOrderBy,
	    	@RequestParam(value="useAt",required=false) String[] strUseAt,
			ModelMap model) throws Exception {
		
		try{
	        
	    	if(strCodeId!=null&&prdlstManageVO.getDmlType().equals("update")){
	    		
				LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
				Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
				
				//System.out.println("isAuthenticated:"+isAuthenticated);
				if (isAuthenticated) {
					prdlstManageVO.setFrstRegisterId(user.getUniqId());
					prdlstManageVO.setLastUpdusrId(user.getUniqId());
					//System.out.println(">>>> user.getUniqId():"+user.getUniqId());
				}
				
	    		String chkDellAll = prdlstManageVO.getChkDelAll();
	    		if(chkDellAll!=null&&!chkDellAll.equals("")){
	    			//System.out.println("chkDellAll:"+chkDellAll);
		    		String [] strchkDellAll = chkDellAll.split(",", -1);
		    		//System.out.println("strchkDellAll.length:"+strchkDellAll.length);
		        	for(int i=0; i<strchkDellAll.length;i++) {
		        		//System.out.println("strchkDellAll[i]:"+strchkDellAll[i]);
		        		prdlstManageVO.setSubSn(strchkDellAll[i]!=null?strchkDellAll[i]:"");   
		        		prdlstManageService.deletePrdlstCode(prdlstManageVO);
		        	}
	    		}				
				
	        	for(int i=0; i<strSubSn.length;i++) {
	        		//System.out.println("strSubSn[i]:"+strSubSn[i]);
	        		//System.out.println("strCodeId[i]:"+strCodeId[i]);
	        		//System.out.println("strCode[i]:"+strCode[i]);
	        		//System.out.println("strCodeNm[i]:"+strCodeNm[i]);
	        		//System.out.println("strCodeDc[i]:"+strCodeDc[i]);
	        		//System.out.println("strOrderBy[i]:"+strOrderBy[i]);
	        		//System.out.println("strUseAt[i]:"+strUseAt[i]);
	        		prdlstManageVO.setSubSn(strSubSn[i]!=null?strSubSn[i]:"");
	        		prdlstManageVO.setCodeId(strCodeId[i]!=null?strCodeId[i]:"");
	        		prdlstManageVO.setCode(strCode[i]!=null?strCode[i]:"");
	        		prdlstManageVO.setCodeNm(strCodeNm[i]!=null?strCodeNm[i]:"");
	        		prdlstManageVO.setCodeDc(strCodeDc[i]!=null?strCodeDc[i]:"");
	        		prdlstManageVO.setOrderBy(strOrderBy[i]!=null?strOrderBy[i]:"");
	        		prdlstManageVO.setUseAt(strUseAt[i]!=null?strUseAt[i]:"");    		
	        			
	        		if(strSubSn[i].equals("N"))
	        			prdlstManageService.insertPrdlstCode(prdlstManageVO);
	        		else if(strSubSn[i].equals("X"))
	        			;
	        		else 
	        			prdlstManageService.updatePrdlstCode(prdlstManageVO);
	        	}
	        	
	        	model.addAttribute("resultMsg", "success.common.insert");
	    	} 	   
			ComDefaultCodeVO comDefaultCodeVO = new ComDefaultCodeVO();
			//사용구분 코드
			comDefaultCodeVO.setCodeId("COM045");
			List<?> useYnCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
			model.addAttribute("useYnCode_result", useYnCode_result);			
			
			//System.out.println("--------------");
			//System.out.println("prdlstManageVO.getSearchCondition():"+prdlstManageVO.getSearchCondition());
			
			if(prdlstManageVO.getSearchCondition() == ""){
				prdlstManageVO.setSearchCondition("JHB004");
			}	    	
			
			Map<String, Object> map = prdlstManageService.selectPrdlstCodeList(prdlstManageVO);
			int totCnt = Integer.parseInt((String)map.get("resultCnt"));		
			
			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultCnt", totCnt);		
		
			model.addAttribute("prdlstManageVO", prdlstManageVO);
		
    	} catch (Exception e) {
    		//System.out.println("Exception e:"+e);
    		model.addAttribute("resultMsg", "fail.request.msg");
    	}
		return "custom/prdlst/PrdlstCodeRegist";
	}
	
	
    /**
     * 신규 품목 정보를 등록한다.
     * 
     * @param boardMasterVO
     * @param boardMaster
     * @param status
     * @return
     * @throws Exception
     */
    @RequestMapping("/custom/prdlst/insertPrdlst.do")
    public String insertPrdlst(@ModelAttribute("prdlstManageVO") PrdlstManageVO prdlstManageVO,
    	@RequestParam(value="subSn",required=false) String[] strSubSn,
    	@RequestParam(value="subMaker",required=false) String[] strSubMaker,
    	@RequestParam(value="subModel",required=false) String[] strSubModel,
    	@RequestParam(value="subPart",required=false) String[] strSubPart,
    	@RequestParam(value="subYear",required=false) String[] strSubYear,
    	@RequestParam(value="subApplication",required=false) String[] strSubApplication,
    	@RequestParam(value="subNoSe",required=false) String[] strSubNoSe,
    	@RequestParam(value="subNo",required=false) String[] strSubNo,
    	final MultipartHttpServletRequest multiRequest,
    	@RequestParam Map<?, ?> commandMap,
	    BindingResult bindingResult, ModelMap model) throws Exception {   	
    	
        try {
    	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(prdlstManageVO, bindingResult);

		if (bindingResult.hasErrors()) {		    
		    return "custom/prdlst/PrdlstRegist";
		}
		
		if (isAuthenticated) {
			prdlstManageVO.setFrstRegisterId(user.getUniqId());
			prdlstManageVO.setLastUpdusrId(user.getUniqId());
		}
		
		if(prdlstManageVO.getPkKey().equals("")){
			
        	// 첨부파일 관련 첨부파일ID 생성
    		List<FileVO> _result = null;
    		String _atchFileId = "";

    		final Map<String, MultipartFile> files = multiRequest.getFileMap();

    		if(!files.isEmpty()){
    			_result = fileUtil.parseFileInf(files, "PRDL_", 0, "", "");
    			_atchFileId = fileMngService.insertFileInfs(_result);  //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
    		}

        	// 리턴받은 첨부파일ID를 셋팅한다..
    		prdlstManageVO.setAtchFileId(_atchFileId);			// 첨부파일 ID			
			
    		prdlstManageService.insertPrdlst(prdlstManageVO);
        }else{
        	
    		String _atchFileId = prdlstManageVO.getAtchFileId();
    		final Map<String, MultipartFile> files = multiRequest.getFileMap();

    		if(!files.isEmpty()){
    			String atchFileAt = commandMap.get("atchFileAt") == null ? "" : (String)commandMap.get("atchFileAt");
    			if("N".equals(atchFileAt)){
    				List<FileVO> _result = fileUtil.parseFileInf(files, "PRDL_", 0, _atchFileId, "");
    				_atchFileId = fileMngService.insertFileInfs(_result);

    				// 첨부파일 ID 셋팅
    				prdlstManageVO.setAtchFileId(_atchFileId);    	// 첨부파일 ID

    			}else{
    				FileVO fvo = new FileVO();
    				fvo.setAtchFileId(_atchFileId);
    				int _cnt = fileMngService.getMaxFileSN(fvo);
    				List<FileVO> _result = fileUtil.parseFileInf(files, "PRDL_", _cnt, _atchFileId, "");
    				fileMngService.updateFileInfs(_result);
    			}
    		}        	
        	
        	prdlstManageService.updatePrdlst(prdlstManageVO);
        }
			
        	for(int i=0; i<strSubSn.length;i++) {
        		prdlstManageVO.setSubSn(strSubSn[i]!=null?strSubSn[i]:"");
        		prdlstManageVO.setSubMaker(strSubMaker[i]!=null?strSubMaker[i]:"");
        		prdlstManageVO.setSubModel(strSubModel[i]!=null?strSubModel[i]:"");
        		prdlstManageVO.setSubPart(strSubPart[i]!=null?strSubPart[i]:"");
        		prdlstManageVO.setSubYear(strSubYear[i]!=null?strSubYear[i]:"");
        		prdlstManageVO.setSubApplication(strSubApplication[i]!=null?strSubApplication[i]:"");
        		prdlstManageVO.setSubNoSe(strSubNoSe[i]!=null?strSubNoSe[i]:"");
        		prdlstManageVO.setSubNo(strSubNo[i]!=null?strSubNo[i]:"");    		
        			
        		if(strSubSn[i].equals("N"))
        			prdlstManageService.insertPrdlstSub(prdlstManageVO);
        		else if(strSubSn[i].equals("X"))
        			;
        		else 
        			prdlstManageService.updatePrdlstSub(prdlstManageVO);
        	}
        	
    		String chkDellAll = prdlstManageVO.getChkDelAll();
    		//System.out.println("chkDellAll:"+chkDellAll);
    		String [] strchkDellAll = chkDellAll.split(",", -1);
    		
        	for(int i=0; i<strchkDellAll.length;i++) {
        		prdlstManageVO.setSubSn(strchkDellAll[i]!=null?strchkDellAll[i]:"");   
        		prdlstManageService.deletePrdlstSub(prdlstManageVO);
        	}        	
        	
    		model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
         } catch (Exception e) {
        	//System.out.println("Exception e:"+e);
        	model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));	
         }

		//return "forward:/custom/prdlst/PrdlstRegist.do";
		return "forward:/custom/prdlst/selectPrdlstDetail.do";	
    }
    
    /**
     * 저장 후 게시물에 대한 상세 정보를 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/custom/prdlst/selectPrdlstDetail.do")
    public String selectPrdlstDetail(@ModelAttribute("prdlstManageVO") PrdlstManageVO prdlstManageVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		try{
		//System.out.println("getJhNo:"+prdlstManageVO.getJhNo());
		//System.out.println("getSelectOnly:"+prdlstManageVO.getSelectOnly());
		
		PrdlstManageVO vo = prdlstManageService.selectPrdlstDetail(prdlstManageVO);
		vo.setPkKey(vo.getJhNo());
		
		model.addAttribute("prdlstManageVO", vo);
		model.addAttribute("sessionUniqId", user.getUniqId());
		
		ComDefaultCodeVO comDefaultCodeVO = new ComDefaultCodeVO();
		//사용구분 코드
		comDefaultCodeVO.setCodeId("COM045");
		List<?> useYnCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("useYnCode_result", useYnCode_result);
		//YN 코드
		comDefaultCodeVO.setCodeId("COM038");
		List<?> ynCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("ynCode_result", ynCode_result);		
		//파트 코드
		comDefaultCodeVO.setCodeId("JHB001");
		List<?> partCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("partCode_result", partCode_result);
		//메이커 코드
		comDefaultCodeVO.setCodeId("JHB002");
		List<?> makerCode_result = cmmUseService.selectCmmCodeDetailOrderByCodeNm(comDefaultCodeVO);
		model.addAttribute("makerCode_result", makerCode_result);
		//SUB번호 코드
		comDefaultCodeVO.setCodeId("JHB003");
		List<?> subNoSeCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("subNoSeCode_result", subNoSeCode_result);
		//품목 코드
		comDefaultCodeVO.setCodeId("JHB004");
		List<?> prdlstCode_result = cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
		model.addAttribute("prdlstCode_result", prdlstCode_result);		
	
		//
		Map<String, Object> map = prdlstManageService.selectPrdlstSub(prdlstManageVO);
		//int totCnt = Integer.parseInt((String)map.get("resultCnt"));		
		model.addAttribute("resultList", map.get("resultList"));
		
		model.addAttribute("selectOnly", prdlstManageVO.getSelectOnly());
    	} catch (Exception e) {
    		//System.out.println("Exception e:"+e);
    		model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));	
    	}
    	return "custom/prdlst/PrdlstRegist";
    }
    
	/**
	 * 입력한 관리번호의 중복여부를 체크하여 사용가능여부를 확인
	 * @param commandMap 파라메터전달용 commandMap
	 * @param model 화면모델
	 * @return uss/umt/EgovIdDplctCnfirm
	 * @throws Exception
	 */
    @RequestMapping("/custom/prdlst/checkKeyCnfirmAjax.do")
    public ModelAndView checkKeyJhno(@RequestParam Map<String, Object> commandMap) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setViewName("jsonView");

		String checkId = (String) commandMap.get("checkId");
		//checkId = new String(checkId.getBytes("ISO-8859-1"), "UTF-8");

		//int usedCnt = userManageService.checkIdDplct(checkId);
		int usedCnt = prdlstManageService.checkKeyJhno(checkId);
		
		modelAndView.addObject("usedCnt", usedCnt);
		modelAndView.addObject("checkId", checkId);

		return modelAndView;
    }
    
}
