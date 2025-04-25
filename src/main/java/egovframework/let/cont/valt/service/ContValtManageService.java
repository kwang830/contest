package egovframework.let.cont.valt.service;

import egovframework.let.cop.bbs.service.BoardVO;

import java.util.List;

public interface ContValtManageService {
    /**
     * 공모전 목록을 조회한다.
     *
     * @param contSearchVO ContValtVO
     * @return List<ContValtVO>
     * @throws Exception
     */
    List<ContValtVO> selectContValtList(ContValtVO contSearchVO) throws Exception;

    /**
     * 목록조회 카운트를 반환한다.
     *
     * @param contSearchVO ContValtVO
     * @return int
     * @throws Exception
     */
    int selectContValtListTotCnt(ContValtVO contSearchVO) throws Exception;

    /**
     * 선택된 공모전 관리를 삭제한다.
     *
     * @param contdeleteVO ContValtVO
     * @return int
     * @throws Exception
     */
    int deleteContValt(ContValtVO contdeleteVO) throws Exception;

    /**
     * 평가관리문항번호 목록을 조회한다.
     *
     * @param contSearchVO ContValtVO
     * @return List<ContValtVO>
     * @throws Exception
     */
    List<ContValtVO> selectValtQsitMnnoList(ContValtVO contSearchVO) throws Exception;

    /**
     * 평가해야하는 게시글을 조회 한다.
     *
     * @param contValtVO ContValtVO
     * @return List<BoardVO>
     * @throws Exception
     */
    List<BoardVO> selectBbsByValtAjax(ContValtVO contValtVO) throws Exception;
    int selectBbsByValtTotCntAjax(ContValtVO contValtVO) throws Exception;
    /**
     * 공모전 평가 관리를 등록한다.
     *
     * @param contValtVO ContValtVO
     * @return int
     * @throws Exception
     */
    int insertContestValt(ContValtVO contValtVO) throws Exception;

    int updateContValt(ContValtVO contSearchVO) throws Exception;

    int deleteContValtBbs(ContValtVO contValtVO) throws Exception;

    int deleteContValtUser(ContValtVO contValtVO) throws Exception;

    List<BoardVO> selectContValtBbsList(ContValtVO contValtVO) throws Exception;

    int selectContValtBbsListTotCnt(ContValtVO contValtVO) throws Exception;

    int insertContestValtBbs(ContValtVO contValtVO) throws Exception;

    List<ContUserVO> selectUesrByValtAjax(ContValtVO contValtVO) throws Exception;

    List<ContUserVO> selectContValtUserList(ContValtVO contValtVO) throws Exception;

    int selectContValtUserListTotCnt(ContValtVO contValtVO) throws Exception;

    int insertContestValtUser(ContValtVO contValtVO) throws Exception;

    ContValtVO selectContValtDetail(ContValtVO contSearchVO) throws Exception;
}
