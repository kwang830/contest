package egovframework.let.cont.valt.service.impl;

import egovframework.let.cont.valt.service.ContUserVO;
import egovframework.let.cont.valt.service.ContValtVO;
import egovframework.let.cop.bbs.service.BoardVO;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ContValtManageDAO")
public class ContValtManageDAO extends EgovAbstractMapper {
    /**
     * 조건에 맞는 공모전 관리 목록을 조회 한다.
     *
     * @param contValtVO
     * @return list
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ContValtVO> selectContValtList(ContValtVO contValtVO) throws Exception {
        return (List<ContValtVO>) list("ContValtManageDAO.selectContValtList", contValtVO);
    }

    /**
     * 조건에 맞는 공모전 관리 목록에 대한 전체 건수를 조회 한다.
     *
     * @param contValtVO
     * @return int
     * @throws Exception
     */
    public int selectContValtListCnt(ContValtVO contValtVO) throws Exception {
        return (Integer)selectOne("ContValtManageDAO.selectContValtListCnt", contValtVO);
    }

    /**
     * 선택된 공모전 관리의 상태를 비활성화 한다.
     *
     * @param contValtVO
     * @return int
     * @throws Exception
     */
    public int deleteContValt(ContValtVO contValtVO) throws Exception {
        return (Integer)update("ContValtManageDAO.deleteContValt", contValtVO);
    }

    /**
     * 선택된 공모전 관리를 수정한다.
     *
     * @param contValtVO
     * @return int
     * @throws Exception
     */
    public int updateContValt(ContValtVO contSearchVO) {
        return (Integer)update("ContValtManageDAO.updateContValt", contSearchVO);
    }

    /**
     * 평가 문항 관리 번호 목록을 조회한다.
     *
     * @param contValtVO
     * @return list
     * @throws Exception
     */
    public List<ContValtVO> selectValtQsitMnnoList(ContValtVO contValtVO) throws Exception {
        return (List<ContValtVO>) list("ContValtManageDAO.selectValtQsitMnnoList", contValtVO);
    }

    /**
     * 공모전 평가 관리를 등록한다.
     *
     * @param contValtVO
     * @return int
     * @throws Exception
     */
    public int insertContestValt(ContValtVO contValtVO) throws Exception {
        return (Integer) insert("ContValtManageDAO.insertContestValt", contValtVO);
    }

    public int deleteContValtScrBbs(ContValtVO contValtVO) throws Exception {
        return (Integer)delete("ContValtManageDAO.deleteContValtScrBbs", contValtVO);
    }

    public int deleteContValtBbs(ContValtVO contValtVO) throws Exception {
        return (Integer)delete("ContValtManageDAO.deleteContValtBbs", contValtVO);
    }

    public int deleteContValtUser(ContValtVO contValtVO) throws Exception {
        return (Integer)delete("ContValtManageDAO.deleteContValtUser", contValtVO);
    }

    public List<BoardVO> selectContValtBbsList(ContValtVO contValtVO) throws Exception {
        return (List<BoardVO>) list("ContValtManageDAO.selectContValtBbsList", contValtVO);
    }

    public int selectContValtBbsListTotCnt(ContValtVO contValtVO) throws Exception {
        return (Integer)selectOne("ContValtManageDAO.selectContValtBbsListTotCnt", contValtVO);
    }

    public int insertContValtBbs(ContValtVO contValtVO) throws Exception {
        return (Integer) insert("ContValtManageDAO.insertContValtBbs", contValtVO);
    }

    public List<ContUserVO> selectUesrByValtAjax(ContValtVO contValtVO) throws Exception {
        return (List<ContUserVO>) list("ContValtManageDAO.selectUesrByValtAjax", contValtVO);
    }

    public List<ContUserVO> selectContValtUserList(ContValtVO contValtVO) throws Exception {
        return (List<ContUserVO>) list("ContValtManageDAO.selectContValtUserList", contValtVO);
    }

    public int selectContValtUserListTotCnt(ContValtVO contValtVO) throws Exception {
        return (Integer) selectOne("ContValtManageDAO.selectContValtUserListTotCnt", contValtVO);
    }

    public int insertContValtUser(ContValtVO contValtVO) throws Exception {
        return (Integer) insert("ContValtManageDAO.insertContValtUser", contValtVO);
    }

    public ContValtVO selectContValtDetail(ContValtVO contSearchVO) throws  Exception {
        return (ContValtVO) selectOne("ContValtManageDAO.selectContValtDetail", contSearchVO);
    }
}
