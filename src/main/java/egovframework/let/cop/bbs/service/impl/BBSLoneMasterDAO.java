package egovframework.let.cop.bbs.service.impl;
import java.util.List;

import egovframework.let.cop.bbs.service.BoardMaster;
import egovframework.let.cop.bbs.service.BoardMasterVO;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;

import org.springframework.stereotype.Repository;

/**
 * 게시판 속성정보 관리를 위한 데이터 접근 클래스
 * @author 공통 서비스 개발팀 한성곤
 * @since 2009.08.25
 * @version 1.0
 * @see
 *
 * "<pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.08.25  한성곤          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>"
 */
@Repository("BBSLoneMasterDAO")
public class BBSLoneMasterDAO extends EgovAbstractMapper {

    /**
     * 등록된 게시판 속성정보를 삭제한다.
     *
     */
    public void deleteMaster(BoardMaster boardMaster) throws Exception {
	update("BBSLoneMasterDAO.deleteMaster", boardMaster);
    }

    /**
     * 신규 게시판 속성정보를 등록한다.
     *
     */
    public int insertMaster(BoardMaster boardMaster) throws Exception {
	return insert("BBSLoneMasterDAO.insertMaster", boardMaster);
    }

    /**
     * 게시판 속성정보 한 건을 상세조회 한다.
     *
     */
    public BoardMasterVO selectMaster(BoardMaster vo) throws Exception {
	return (BoardMasterVO)selectOne("BBSLoneMasterDAO.selectMaster", vo);
    }

    /**
     * 게시판 속성정보 목록을 조회한다.
     *
     */
    @SuppressWarnings("unchecked")
    public List<BoardMasterVO> selectMasterList(BoardMasterVO vo) throws Exception {
        return selectList("BBSLoneMasterDAO.selectMasterList", vo);
    }

    /**
     * 게시판 속성정보 목록 숫자를 조회한다
     *
     */
    public int selectMasterListCnt(BoardMasterVO vo) throws Exception {
	return (Integer)selectOne("BBSLoneMasterDAO.selectMasterListCnt", vo);
    }

    /**
     * 게시판 속성정보를 수정한다.
     *
     */
    public void updateMaster(BoardMaster boardMaster) throws Exception {
	update("BBSLoneMasterDAO.updateMaster", boardMaster);
    }
}
