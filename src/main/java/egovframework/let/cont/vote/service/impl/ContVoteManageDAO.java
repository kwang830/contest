package egovframework.let.cont.vote.service.impl;

import egovframework.let.cont.vote.service.ContVoteVO;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ContVoteManageDAO")
public class ContVoteManageDAO extends EgovAbstractMapper {

    /**
     * 조건에 맞는 평가그룹 목록을 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    @SuppressWarnings("unchecked")
    public List<ContVoteVO> selectContVoteAdminGroupList(ContVoteVO contVoteVO) throws Exception {
	    //return (List<ContVoteVO>) list("ContVoteManageDAO.selectContVoteAdminGroupList", contVoteVO);
        return selectList("ContVoteManageDAO.selectContVoteAdminGroupList", contVoteVO);
    }

    /**
     * 조건에 맞는 평가그룹 목록에 대한 전체 건수를 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int selectContVoteAdminGroupListCnt(ContVoteVO contVoteVO) throws Exception {
        return (Integer)selectOne("ContVoteManageDAO.selectContVoteAdminGroupListCnt", contVoteVO);
    }

    /**
     * 조건에 맞는 평가게시물 목록을 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    @SuppressWarnings("unchecked")
    public List<ContVoteVO> selectContVoteAdminBBSList(ContVoteVO contVoteVO) throws Exception {
        return selectList("ContVoteManageDAO.selectContVoteAdminBBSList", contVoteVO);
    }

    /**
     * 조건에 맞는 평가게시물 목록에 대한 전체 건수를 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int selectContVoteAdminBBSListCnt(ContVoteVO contVoteVO) throws Exception {
        return (Integer)selectOne("ContVoteManageDAO.selectContVoteAdminBBSListCnt", contVoteVO);
    }

    /**
     * 조건에 맞는 평가점수 목록을 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    @SuppressWarnings("unchecked")
    public List<ContVoteVO> selectAdminVotesList(ContVoteVO contVoteVO) throws Exception {
        return selectList("ContVoteManageDAO.selectAdminVotesList", contVoteVO);
    }

    /**
     * 조건에 맞는 평가점수 목록에 대한 전체 건수를 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int selectAdminVotesCnt(ContVoteVO contVoteVO) throws Exception {
        return (Integer)selectOne("ContVoteManageDAO.selectAdminVotesCnt", contVoteVO);
    }

    /**
     * 조건에 맞는 평가결과 목록을 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    @SuppressWarnings("unchecked")
    public List<ContVoteVO> selectAdminVoteRsltsList(ContVoteVO contVoteVO) throws Exception {
        return selectList("ContVoteManageDAO.selectAdminVoteRsltsList", contVoteVO);
    }

    /**
     * 조건에 맞는 평가결과 목록에 대한 전체 건수를 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int selectAdminVoteRsltsCnt(ContVoteVO contVoteVO) throws Exception {
        return (Integer)selectOne("ContVoteManageDAO.selectAdminVoteRsltsCnt", contVoteVO);
    }

    /**
     * 평가항목 카운트를 조회한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int selectAdminVoteCnt(ContVoteVO contVoteVO) throws Exception {
        return (Integer)selectOne("ContVoteManageDAO.selectAdminVoteCnt", contVoteVO);
    }

    /**
     * 평가항목을 등록 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int insertAdminVote(ContVoteVO contVoteVO) throws Exception {
        return insert("ContVoteManageDAO.insertAdminVote", contVoteVO);
    }

    /**
     * 평가항목을 수정 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int updateAdminVote(ContVoteVO contVoteVO) throws Exception {
        return update("ContVoteManageDAO.updateAdminVote", contVoteVO);
    }

    /**
     * 평가점수(별점)을 등록 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int insertVoteScore(ContVoteVO contVoteVO) throws Exception {
        return insert("ContVoteManageDAO.insertVoteScore", contVoteVO);
    }

    /**
     * 평가점수(별점)을 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int selectVoteScore(ContVoteVO contVoteVO) throws Exception {
        return (Integer)selectOne("ContVoteManageDAO.selectVoteScore", contVoteVO);
    }

    /**
     * 평가항목을 등록 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int insertAdminValtSta(ContVoteVO contVoteVO) throws Exception {
        return insert("ContVoteManageDAO.insertAdminValtSta", contVoteVO);
    }

    /**
     * 평가 의견을 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public String selectVoteValtOpnn(ContVoteVO contVoteVO) throws Exception {
        return (String)selectOne("ContVoteManageDAO.selectVoteValtOpnn", contVoteVO);
    }

    /**
     * 조건에 맞는 평가순위 목록을 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    @SuppressWarnings("unchecked")
    public List<ContVoteVO> selectContVoteRankList(ContVoteVO contVoteVO) throws Exception {
        return selectList("ContVoteManageDAO.selectContVoteRankList", contVoteVO);
    }

    /**
     * 조건에 맞는 평가순위 목록에 대한 전체 건수를 조회 한다.
     *
     * @param contVoteVO contVoteVO
     * @throws Exception Exception
     */
    public int selectContVoteRankListCnt(ContVoteVO contVoteVO) throws Exception {
        return (Integer)selectOne("ContVoteManageDAO.selectContVoteRankListCnt", contVoteVO);
    }
}
