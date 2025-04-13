package egovframework.let.cont.vote.service.impl;

import egovframework.let.cont.vote.service.ContVoteVO;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import java.util.Iterator;
import java.util.List;

@Repository("ContVoteManageDAO")
public class ContVoteManageDAO extends EgovAbstractMapper {



    /**
     * 조건에 맞는 평가그룹 목록을 조회 한다.
     *
     * @param contVoteVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ContVoteVO> selectContVoteAdminGroupList(ContVoteVO contVoteVO) throws Exception {
	return (List<ContVoteVO>) list("ContVoteManageDAO.selectContVoteAdminGroupList", contVoteVO);
    }

    /**
     * 조건에 맞는 평가그룹 목록에 대한 전체 건수를 조회 한다.
     *
     * @param contVoteVO
     * @return
     * @throws Exception
     */
    public int selectContVoteAdminGroupListCnt(ContVoteVO contVoteVO) throws Exception {
        return (Integer)selectOne("ContVoteManageDAO.selectContVoteAdminGroupListCnt", contVoteVO);
    }

    /**
     * 조건에 맞는 평가게시물 목록을 조회 한다.
     *
     * @param contVoteVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ContVoteVO> selectContVoteAdminBBSList(ContVoteVO contVoteVO) throws Exception {
        return (List<ContVoteVO>) list("ContVoteManageDAO.selectContVoteAdminBBSList", contVoteVO);
    }

    /**
     * 조건에 맞는 평가게시물 목록에 대한 전체 건수를 조회 한다.
     *
     * @param contVoteVO
     * @return
     * @throws Exception
     */
    public int selectContVoteAdminBBSListCnt(ContVoteVO contVoteVO) throws Exception {
        return (Integer)selectOne("ContVoteManageDAO.selectContVoteAdminBBSListCnt", contVoteVO);
    }

    /**
     * 조건에 맞는 평가점수 목록을 조회 한다.
     *
     * @param contVoteVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ContVoteVO> selectAdminVotesList(ContVoteVO contVoteVO) throws Exception {
        return (List<ContVoteVO>) list("ContVoteManageDAO.selectAdminVotesList", contVoteVO);
    }

    /**
     * 조건에 맞는 평가점수 목록에 대한 전체 건수를 조회 한다.
     *
     * @param contVoteVO
     * @return
     * @throws Exception
     */
    public int selectAdminVotesCnt(ContVoteVO contVoteVO) throws Exception {
        return (Integer)selectOne("ContVoteManageDAO.selectAdminVotesCnt", contVoteVO);
    }
}
