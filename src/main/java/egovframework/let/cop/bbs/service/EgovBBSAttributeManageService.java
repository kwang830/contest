package egovframework.let.cop.bbs.service;

import java.util.List;
import java.util.Map;

/**
 * 게시판 속성관리를 위한 서비스 인터페이스 클래스
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009.03.12
 * @version 1.0
 * @see
 *  
 * "<pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.12  이삼섭          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
 *  
 *  </pre>"
 */
public interface EgovBBSAttributeManageService {

	/**
	 * 등록된 게시판 속성정보를 삭제한다.
	 *
	 * @param boardMaster boardMaster
	 * @exception Exception Exception
	 */
	public void deleteBBSMasterInf(BoardMaster boardMaster)
	  throws Exception;

	/**
	 * 신규 게시판 속성정보를 생성한다.
	 *
	 * @param boardMaster boardMaster
	 * @exception Exception Exception
	 */
	public String insertBBSMastetInf(BoardMaster boardMaster)
	  throws Exception;

	/**
	 * 유효한 게시판 마스터 정보를 호출한다.
	 *
	 * @param boardMasterVO boardMasterVO
	 * @exception Exception Exception
	 */
	public List<BoardMasterVO> selectAllBBSMasteInf(BoardMasterVO boardMasterVO)
	  throws Exception;

	/**
	 * 커뮤니티, 동호회에서 사용중인 게시판 속성 정보의 목록을 전체조회 한다.
	 * @return
	 * 
	 * @param boardMasterVO boardMasterVO
	 * @exception Exception Exception
	 */
	public List<BoardMasterVO> selectAllBdMstrByTrget(BoardMasterVO boardMasterVO)
	  throws Exception;

	/**
	 * 게시판 속성정보 한 건을 상세조회한다.
	 *
	 * @param boardMaster boardMaster
	 * @exception Exception Exception
	 */
	public BoardMasterVO selectBBSMasterInf(BoardMaster boardMaster)
	  throws Exception;

	/**
	 * 게시판 속성 정보의 목록을 조회 한다.
	 *
	 * @param boardMaster boardMaster
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectBBSMasterInfs(BoardMasterVO boardMaster)
	  throws Exception;

	/**
	 * 사용중인 게시판 속성 정보의 목록을 조회 한다.
	 *
	 * @param boardMaster boardMaster
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectBdMstrListByTrget(BoardMasterVO boardMaster)
	  throws Exception;

	/**
	 * 사용중이지 않은 게시판 속성 정보의 목록을 조회 한다.
	 *
	 * @param boardMaster boardMaster
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectNotUsedBdMstrList(BoardMasterVO boardMaster)
	  throws Exception;

	/**
	 * 게시판 속성정보를 수정한다.
	 *
	 * @param boardMaster boardMaster
	 * @exception Exception Exception
	 */
	public void updateBBSMasterInf(BoardMaster boardMaster)
	  throws Exception;

	/**
	 * 템플릿의 유효여부를 점검한다.
	 *
	 * @param searchVO searchVO
	 * @exception Exception Exception
	 */
	public void validateTemplate(BoardMasterVO searchVO)
	  throws Exception;

}