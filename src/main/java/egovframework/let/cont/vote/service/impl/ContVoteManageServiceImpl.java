package egovframework.let.cont.vote.service.impl;

import egovframework.com.cmm.service.EgovFileMngService;

import egovframework.let.cont.vote.service.ContVoteManageService;
import egovframework.let.cont.vote.service.ContVoteVO;
import egovframework.let.utl.fcc.service.EgovDateUtil;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service("ContVoteManageService")
public class ContVoteManageServiceImpl extends EgovAbstractServiceImpl implements ContVoteManageService {

    @Resource(name = "ContVoteManageDAO")
    private ContVoteManageDAO contVoteManageDAO;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;



	/**
     * 조건에 맞는 평가그룹 목록을 조회 한다.
     * 
     */
    public Map<String, Object> selectContVoteAdminGroupList(ContVoteVO contVoteVO) throws Exception {

        System.out.println("selectContVoteGroupList >>> ");
    
        List<ContVoteVO> result = contVoteManageDAO.selectContVoteAdminGroupList(contVoteVO);
        int cnt = contVoteManageDAO.selectContVoteAdminGroupListCnt(contVoteVO);
    
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));
    
        return map;
    }

    /**
     * 조건에 맞는 평가게시물 목록을 조회 한다.
     *
     */
    public Map<String, Object> selectContVoteAdminBBSList(ContVoteVO contVoteVO) throws Exception {

        System.out.println("selectContVoteBBSList >>> ");

        List<ContVoteVO> result = contVoteManageDAO.selectContVoteAdminBBSList(contVoteVO);
        int cnt = contVoteManageDAO.selectContVoteAdminBBSListCnt(contVoteVO);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    /**
     * 조건에 맞는 평가점수 목록을 조회 한다.
     *
     */
    public Map<String, Object> selectAdminVotesAjax(ContVoteVO contVoteVO) throws Exception {

        System.out.println("selectAdminVotesAjax >>> ");

        List<ContVoteVO> result = contVoteManageDAO.selectAdminVotesList(contVoteVO);
        int cnt = contVoteManageDAO.selectAdminVotesCnt(contVoteVO);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    /**
     * 평가항목을 등록 한다.
     */
    public int insertAdminVotes(ContVoteVO contVoteVO) throws Exception {

        System.out.println("insertAdminVotes >>> ");

//        int result = contVoteManageDAO.selectAdminVoteCnt(contVoteVO);
//        if(result > 0){
//            return contVoteManageDAO.updateAdminVote(contVoteVO);
//        }else{
//            return contVoteManageDAO.insertAdminVote(contVoteVO);
//        }

        return contVoteManageDAO.insertAdminVote(contVoteVO);
    }
}
