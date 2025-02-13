package egovframework.custom.prdlst.service;
import java.util.List;
import java.util.Map;

import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;

/**
 * 사용자관리에 관한 인터페이스클래스를 정의한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *
 * </pre>
 */
public interface PrdlstManageService  {

	public void insertPrdlst(PrdlstManageVO prdlstManageVO) throws FdlException;

	public void insertPrdlstSub(PrdlstManageVO prdlstManageVO);

	public void updatePrdlstSub(PrdlstManageVO prdlstManageVO) throws Exception;

	public PrdlstManageVO selectPrdlstDetail(PrdlstManageVO prdlstManageVO);

	public void updatePrdlst(PrdlstManageVO prdlstManageVO);

	public Map<String, Object> selectPrdlstSub(PrdlstManageVO prdlstManageVO);
	
	public int checkKeyJhno(String checkId) throws Exception;

	public void deletePrdlstSub(PrdlstManageVO prdlstManageVO);

	public Map<String, Object> selectPrdlstInqireList(PrdlstManageVO prdlstManageVO);

	public Map<String, Object> selectPrdlstCodeList(PrdlstManageVO prdlstManageVO);

	public void insertPrdlstCode(PrdlstManageVO prdlstManageVO);

	public void updatePrdlstCode(PrdlstManageVO prdlstManageVO) throws Exception;

	public void deletePrdlstCode(PrdlstManageVO prdlstManageVO);	
}