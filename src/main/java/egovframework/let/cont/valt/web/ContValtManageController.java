package egovframework.let.cont.valt.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.let.cont.valt.service.ContValtManageService;
import egovframework.let.cont.valt.service.ContValtVO;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ContValtManageController {
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "ContValtManageService")
    private ContValtManageService contValtManageService;

    @Resource(name="egovContValtIdGnrService")
    private EgovIdGnrService egovContValtIdGnrService;

    /**
     * 공모전 평가 관리 페이지
     * @return 공모전 평가 관리 정보 Map [key : 항목명]
     *
     * @param request
     * @param model
     * @exception Exception Exception
     */
    @RequestMapping(value = "/cmm/contest/valt/contestValtMngm.do")
    public String getContestValtMngmPage(@ModelAttribute("contSearchVO") ContValtVO contSearchVO, HttpServletRequest request, ModelMap model)
            throws Exception{

        // 메뉴 갱신
        request.getSession().setAttribute("menuNo", "6000000");
        request.getSession().setAttribute("activeMenuNo", "6060000");

        // 미인증 사용자에 대한 보안처리
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if(!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "uat/uia/EgovLoginUsr";
        }

        /** EgovPropertyService */
        //contSearchVO.setPageUnit(propertyService.getInt("pageUnit"));
        //contSearchVO.setPageSize(propertyService.getInt("pageSize"));
        contSearchVO.setPageUnit(5);
        contSearchVO.setPageSize(5);

        /** pageing */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(contSearchVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(contSearchVO.getPageUnit());
        paginationInfo.setPageSize(contSearchVO.getPageSize());

        contSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        contSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
        contSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("contValtList", contValtManageService.selectContValtList(contSearchVO));

        int totCnt = contValtManageService.selectContValtListTotCnt(contSearchVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "main/contest/ContestValtMngmView";
    }

    @RequestMapping(value = "/cmm/contest/valt/deleteContestValt.do")
    public String deleteContestValt(@ModelAttribute("contSearchVO") ContValtVO contSearchVO, HttpServletRequest request, ModelMap model)
            throws Exception{

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if(!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "uat/uia/EgovLoginUsr";
        }

        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        contSearchVO.setLastUpdusrId(user.getUniqId());

        contValtManageService.deleteContValt(contSearchVO);

        model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        return "forward:/cmm/contest/valt/contestValtMngm.do";
    }

    @RequestMapping(value = "/cmm/contest/valt/updateContestValtPopup.do")
    public String updateContValtPage(@ModelAttribute("contValtVO") ContValtVO contSearchVO, HttpServletRequest request, ModelMap model) throws Exception {
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if(!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "uat/uia/EgovLoginUsr";
        }

        String valtMngmNo = (String) request.getAttribute("valtMngmNo");
        if (valtMngmNo != null && !valtMngmNo.isEmpty()) {
            contSearchVO.setValtMngmNo(valtMngmNo);
        }
        contSearchVO.setUseAt("Y");
        model.addAttribute("contValt",contValtManageService.selectContValtDetail(contSearchVO));
        model.addAttribute("qsitList", contValtManageService.selectValtQsitMnnoList(contSearchVO));
        return "main/contest/ContestValtUpdate";
    }

    @RequestMapping(value = "/cmm/contest/valt/updateContestValt.do")
    public String updateContestValt(@ModelAttribute("contSearchVO") ContValtVO contSearchVO, HttpServletRequest request, ModelMap model)
            throws Exception{

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if(!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "uat/uia/EgovLoginUsr";
        }

        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        contSearchVO.setLastUpdusrId(user.getUniqId());

        contValtManageService.updateContValt(contSearchVO);

        model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        return "forward:/cmm/contest/valt/contestValtMngm.do";
    }

    @RequestMapping(value = "/cmm/contest/valt/insertContestValtPopup.do")
    public String insertContestValtPage(@ModelAttribute("contSearchVO") ContValtVO contSearchVO, ModelMap model) throws Exception {
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if(!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "uat/uia/EgovLoginUsr";
        }
        contSearchVO.setUseAt("Y");
        model.addAttribute("qsitList", contValtManageService.selectValtQsitMnnoList(contSearchVO));
        return "main/contest/ContestValtRegist";
    }

    @RequestMapping(value = "/cmm/contest/valt/insertContestValt.do")
    public String insertContestValt(@ModelAttribute ContValtVO contValtVO, ModelMap model) throws Exception {
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if(!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "uat/uia/EgovLoginUsr";
        }
        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        contValtVO.setValtMngmNo(egovContValtIdGnrService.getNextStringId());
        contValtVO.setFrstRegisterId(user.getUniqId());
        contValtVO.setUseAt("Y");

        contValtManageService.insertContestValt(contValtVO);
        return "forward:/cmm/contest/valt/contestValtMngm.do";
    }

    @RequestMapping(value = "/cmm/contest/valt/deleteContestValtBbs.do")
    public String deleteContValtBbs(@ModelAttribute("contValtVO") ContValtVO contValtVO, HttpServletRequest request, ModelMap model)
            throws Exception{

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if(!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "uat/uia/EgovLoginUsr";
        }
        contValtManageService.deleteContValtBbs(contValtVO);

        model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        return "forward:/cmm/contest/valt/contestValtMngm.do";
    }

    @RequestMapping(value = "/cmm/contest/valt/deleteContestValtUser.do")
    public String deleteContValtUser(@ModelAttribute("contValtVO") ContValtVO contValtVO, HttpServletRequest request, ModelMap model)
            throws Exception{

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if(!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "uat/uia/EgovLoginUsr";
        }

        contValtManageService.deleteContValtUser(contValtVO);

        model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        return "forward:/cmm/contest/valt/contestValtMngm.do";
    }

    @RequestMapping(value="/cmm/contest/valt/selectContValtBbsList.do")
    public String selectContValtBbsList(@ModelAttribute("contValtVO") ContValtVO contValtVO,
                                        ModelMap model) throws Exception {
        /** paging */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(contValtVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(contValtVO.getPageUnit());
        paginationInfo.setPageSize(contValtVO.getPageSize());

        contValtVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        contValtVO.setLastIndex(paginationInfo.getLastRecordIndex());
        contValtVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("boardList", contValtManageService.selectContValtBbsList(contValtVO));
        int totCnt = contValtManageService.selectContValtBbsListTotCnt(contValtVO);

        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "/main/contest/ContestValtBbsSearch";
    }

    @RequestMapping(value = "/cmm/contest/valt/insertContestValtBbs.do")
    public String insertContestValtBbs(@ModelAttribute ContValtVO contValtVO, ModelMap model) throws Exception {
        System.out.println("contvaltvo.getNttIds : " + contValtVO.getNttIds());
        System.out.println("contvaltvo.getValtMngmNo : " + contValtVO.getValtMngmNo());
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if(!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "uat/uia/EgovLoginUsr";
        }
        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        contValtVO.setFrstRegisterId(user.getUniqId());
        contValtVO.setUseAt("Y");

        contValtManageService.insertContestValtBbs(contValtVO);
        return "forward:/cmm/contest/valt/contestValtMngm.do";
    }

    @RequestMapping(value="/cmm/contest/valt/selectContValtUserList.do")
    public String selectContValtUserList(@ModelAttribute("contValtVO") ContValtVO contValtVO, HttpServletRequest request,
                                        ModelMap model) throws Exception {
        /** paging */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(contValtVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(contValtVO.getPageUnit());
        paginationInfo.setPageSize(contValtVO.getPageSize());

        contValtVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        contValtVO.setLastIndex(paginationInfo.getLastRecordIndex());
        contValtVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        String valtMngmNo = (String) request.getAttribute("valtMngmNo");
        if (valtMngmNo != null && !valtMngmNo.isEmpty()) {
            contValtVO.setValtMngmNo(valtMngmNo);
        }
        model.addAttribute("userList", contValtManageService.selectContValtUserList(contValtVO));
        int totCnt = contValtManageService.selectContValtUserListTotCnt(contValtVO);

        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "/main/contest/ContestValtUserSearch";
    }

    @RequestMapping(value = "/cmm/contest/valt/insertContestValtUser.do")
    public String insertContestValtUser(@ModelAttribute ContValtVO contValtVO, ModelMap model) throws Exception {
        System.out.println("contvaltvo.getValtMngmNo : " + contValtVO.getValtMngmNo());
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if(!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "uat/uia/EgovLoginUsr";
        }
        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        contValtVO.setFrstRegisterId(user.getUniqId());
        contValtVO.setUseAt("Y");

        contValtManageService.insertContestValtUser(contValtVO);
        return "forward:/cmm/contest/valt/contestValtMngm.do";
    }
}
