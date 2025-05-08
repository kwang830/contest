package egovframework.let.cont.vote.service.impl;

import egovframework.com.cmm.service.EgovFileMngService;

import egovframework.let.cont.vote.service.ContVoteManageService;
import egovframework.let.cont.vote.service.ContVoteVO;
import egovframework.let.cop.bbs.service.Board;
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

        List<ContVoteVO> result = contVoteManageDAO.selectAdminVotesList(contVoteVO);
        int cnt = contVoteManageDAO.selectAdminVotesCnt(contVoteVO);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    /**
     * 조건에 맞는 평가결과 목록을 조회 한다.
     *
     */
    public Map<String, Object> selectAdminVoteRsltsAjax(ContVoteVO contVoteVO) throws Exception {

        List<ContVoteVO> result = contVoteManageDAO.selectAdminVoteRsltsList(contVoteVO);
        int cnt = contVoteManageDAO.selectAdminVoteRsltsCnt(contVoteVO);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    /**
     * 평가항목을 등록 한다.
     */
    public int insertAdminVotes(ContVoteVO contVoteVO) throws Exception {
        return contVoteManageDAO.insertAdminVote(contVoteVO);
    }

    /**
     * 평가점수(별점)을 등록 한다.
     */
    public int insertVoteScore(ContVoteVO contVoteVO) throws Exception {
        return contVoteManageDAO.insertVoteScore(contVoteVO);
    }

    /**
     * 평가점수(별점)을 조회 한다.
     */
    public int selectVoteScore(ContVoteVO contVoteVO) throws Exception {
        return contVoteManageDAO.selectVoteScore(contVoteVO);
    }

    /**
     * 평가항목을 등록 한다.
     */
    public int insertAdminValtSta(ContVoteVO contVoteVO) throws Exception {
        return contVoteManageDAO.insertAdminValtSta(contVoteVO);
    }

    /**
     * 평가 의견을 조회 한다.
     */
    public String selectVoteValtOpnn(ContVoteVO contVoteVO) throws Exception {
        return contVoteManageDAO.selectVoteValtOpnn(contVoteVO);
    }

    /**
     * 조건에 맞는 평가순위 목록을 조회 한다.
     *
     */
    public Map<String, Object> selectContVoteRankList(ContVoteVO contVoteVO) throws Exception {

        List<ContVoteVO> result = contVoteManageDAO.selectContVoteRankList(contVoteVO);
        int cnt = contVoteManageDAO.selectContVoteRankListCnt(contVoteVO);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }
}
