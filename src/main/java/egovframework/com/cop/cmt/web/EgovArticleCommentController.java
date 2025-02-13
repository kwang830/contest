package egovframework.com.cop.cmt.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.cmt.service.Comment;
import egovframework.com.cop.cmt.service.CommentVO;
import egovframework.com.cop.cmt.service.EgovArticleCommentService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovArticleCommentController {

	@Resource(name = "EgovArticleCommentService")
    protected EgovArticleCommentService egovArticleCommentService;
    
    @Resource(name="propertiesService")
    protected EgovPropertyService propertyService;
    
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;    
    
    @Autowired
    private DefaultBeanValidator beanValidator;
    
    //protected Logger log = Logger.getLogger(this.getClass());
    
    /**
     * 댓글관리 목록 조회를 제공한다.
     * 
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/selectArticleCommentList.do")
    public String selectArticleCommentList(@ModelAttribute("searchVO") CommentVO commentVO, ModelMap model) throws Exception {

    	CommentVO articleCommentVO = new CommentVO();
    	
		// 수정 처리된 후 댓글 등록 화면으로 처리되기 위한 구현
		if (commentVO.isModified()) {
		    commentVO.setCommentNo("");
		    commentVO.setCommentCn("");
		    commentVO.setScoreNum(0);
		    commentVO.setPicksAt("N");
		}
		
		// 수정을 위한 처리
		if (!commentVO.getCommentNo().equals("")) {
		    return "forward:/cop/cmt/updateArticleCommentView.do";
		}
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		model.addAttribute("sessionUniqId", user.getUniqId());
		model.addAttribute("sessionUserSe", user.getUserSe());
		
		commentVO.setWrterNm(user.getName());
		commentVO.setWrterId(user.getUniqId());
		
		//System.out.println("### getUniqId : "+user.getUniqId());
		
//		commentVO.setSubPageUnit(propertyService.getInt("pageUnit"));
//		commentVO.setSubPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(commentVO.getSubPageIndex());
		paginationInfo.setRecordCountPerPage(commentVO.getSubPageUnit());
		paginationInfo.setPageSize(commentVO.getSubPageSize());
	
		commentVO.setSubFirstIndex(paginationInfo.getFirstRecordIndex());
		commentVO.setSubLastIndex(paginationInfo.getLastRecordIndex());
		commentVO.setSubRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = egovArticleCommentService.selectArticleCommentList(commentVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("writeCnt", map.get("writeCnt"));
		model.addAttribute("teamCnt", map.get("teamCnt"));
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("type", "body");	// 댓글 페이지 body import용
		
		model.addAttribute("articleCommentVO", articleCommentVO);	// validator 용도 
		
		//공통코드 일정종류
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
	   	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("SCO001");
    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("score_result", listComCode);		
		
		commentVO.setCommentCn("");	// 등록 후 댓글 내용 처리
		commentVO.setScoreNum(0); // 등록 후 댓글 점수 내용 처리
		commentVO.setPicksAt("N");
	
		return "egovframework/com/cop/cmt/EgovArticleCommentList";
    }
    
    
    /**
     * 댓글을 등록한다.
     * 
     * @param commentVO
     * @param comment
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/insertArticleComment.do")
    public String insertArticleComment(@ModelAttribute("searchVO") CommentVO commentVO, @ModelAttribute("comment") Comment comment, 
	    BindingResult bindingResult, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(comment, bindingResult);
		if (bindingResult.hasErrors()) {
		    model.addAttribute("msg", "댓글내용은 필수 입력값입니다.");
		    
		    return "forward:/cop/bbs/selectArticleDetail.do";
		}
	
		if (isAuthenticated) {
		    comment.setFrstRegisterId(user.getUniqId());
		    comment.setWrterId(user.getUniqId());
		    comment.setWrterNm(user.getName());

		    commentVO.setWrterId(user.getUniqId());
		    
		    //System.out.println("### commentVO.getPicksAt:"+commentVO.getPicksAt());
		    //System.out.println("### commentVO.getScoreNum:"+commentVO.getScoreNum());
		    //System.out.println("### commentVO.getBbsId:"+commentVO.getBbsId());
		    //System.out.println("### commentVO.getCommentNo:"+commentVO.getCommentNo());
		    //System.out.println("### commentVO.getNttId:"+commentVO.getNttId());
		    //System.out.println("### commentVO.getWrterId:"+commentVO.getWrterId());
		    
		    // 중복 댓글 방지를 위해 값을 체크 한 후 결과가 있으면 리턴 - 접수게시판 에서만
		    //System.out.println();
		    if(commentVO.getBbsId().equals("BBSMSTR_000000000001")){
		    	int commentNo = egovArticleCommentService.checkArticleCommentNo(commentVO);
		    	if(commentNo>0){
		    		comment.setCommentNo(String.valueOf(commentNo));
		    		//System.out.println("###### comment."+comment.getCommentNo());
				    model.addAttribute("msg", "fail.request.msg");
				    
				    return "forward:/cop/bbs/selectArticleDetail.do";
		    	}
		    };
		    
		    egovArticleCommentService.insertArticleComment(comment);
		    
		    commentVO.setCommentCn("");
		    commentVO.setCommentNo("");
		    commentVO.setScoreNum(0);
		}
	
		return "forward:/cop/bbs/selectArticleDetail.do";
    }
    
    
    /**
     * 댓글을 삭제한다.
     * 
     * @param commentVO
     * @param comment
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/deleteArticleComment.do")
    public String deleteArticleComment(@ModelAttribute("searchVO") CommentVO commentVO, @ModelAttribute("comment") Comment comment, ModelMap model) throws Exception {
		@SuppressWarnings("unused")
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (isAuthenticated) {
		    egovArticleCommentService.deleteArticleComment(commentVO);
		}
		
		commentVO.setCommentCn("");
		commentVO.setCommentNo("");
		commentVO.setScoreNum(0);
		
		return "forward:/cop/bbs/selectArticleDetail.do";
    }
    
    
    /**
     * 댓글 수정 페이지로 이동한다.
     * 
     * @param commentVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/updateArticleCommentView.do")
    public String updateArticleCommentView(@ModelAttribute("searchVO") CommentVO commentVO, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	CommentVO articleCommentVO = new CommentVO();
	
	commentVO.setWrterNm(user.getName());

	commentVO.setSubPageUnit(propertyService.getInt("pageUnit"));
	commentVO.setSubPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(commentVO.getSubPageIndex());
	paginationInfo.setRecordCountPerPage(commentVO.getSubPageUnit());
	paginationInfo.setPageSize(commentVO.getSubPageSize());

	commentVO.setSubFirstIndex(paginationInfo.getFirstRecordIndex());
	commentVO.setSubLastIndex(paginationInfo.getLastRecordIndex());
	commentVO.setSubRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = egovArticleCommentService.selectArticleCommentList(commentVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("paginationInfo", paginationInfo);
	model.addAttribute("type", "body");	// body import
	
	articleCommentVO = egovArticleCommentService.selectArticleCommentDetail(commentVO);
	
	model.addAttribute("articleCommentVO", articleCommentVO);
	
	//공통코드 일정종류
	ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
   	voComCode = new ComDefaultCodeVO();
	voComCode.setCodeId("SCO001");
	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
	model.addAttribute("score_result", listComCode);
	
	return "egovframework/com/cop/cmt/EgovArticleCommentList";
    }
    
    
    /**
     * 댓글을 수정한다.
     * 
     * @param commentVO
     * @param comment
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/updateArticleComment.do")
    public String updateArticleComment(@ModelAttribute("searchVO") CommentVO commentVO, @ModelAttribute("comment") Comment comment, 
	    BindingResult bindingResult, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(comment, bindingResult);
		if (bindingResult.hasErrors()) {
		    model.addAttribute("msg", "내용은 필수 입력 값입니다.");
		    
		    return "forward:/cop/bbs/selectArticleDetail.do";
		}
		
	    //System.out.println("### commentVO.get:"+commentVO.getPicksAt());		
	
		if (isAuthenticated) {
		    comment.setLastUpdusrId(user.getUniqId());
		    
		    egovArticleCommentService.updateArticleComment(comment);
		    
		    commentVO.setCommentCn("");
		    commentVO.setCommentNo("");
		    commentVO.setScoreNum(0);
		}
	
		return "forward:/cop/bbs/selectArticleDetail.do";
    }
    
	
}
