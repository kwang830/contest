package egovframework.custom.estmt.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.custom.estmt.service.EstmtManageService;
import egovframework.custom.estmt.service.EstmtManageVO;
import egovframework.custom.estmt.service.EstmtPrdlstVO;
import egovframework.custom.estmt.service.EstmtBcncVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 사용자관리에 관한 비지니스 클래스를 정의한다.
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
 *   2014.12.08	 이기하			암호화방식 변경(EgovFileScrty.encryptPassword)
 *
 * </pre>
 */
@Service("EstmtManageService")
public class EstmtManageServiceImpl extends EgovAbstractServiceImpl implements EstmtManageService {

	/** EstmtManageDAO */
	@Resource(name="EstmtManageDAO")
	private EstmtManageDAO estmtManageDAO;


	@Override
	public Map<String, Object> selectBcncList(EstmtBcncVO estmtBcncVO) {
		List<?> result = estmtManageDAO.selectBcncList(estmtBcncVO);
		int cnt = estmtManageDAO.selectBcncListCnt(estmtBcncVO);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectPrdlstList(EstmtPrdlstVO estmtPrdlstVO) {
		List<?> result = estmtManageDAO.selectPrdlstList(estmtPrdlstVO);
		int cnt = estmtManageDAO.selectPrdlstListCnt(estmtPrdlstVO);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public void insertEstmt(EstmtManageVO estmtManageVO) {
		estmtManageDAO.insertEstmt(estmtManageVO);
		
	}

	@Override
	public void updateEstmt(EstmtManageVO estmtManageVO) {
		estmtManageDAO.updateEstmt(estmtManageVO);
		
	}

	@Override
	public void insertEstmtBcnc(EstmtManageVO estmtManageVO) {
		estmtManageDAO.insertEstmtBcnc(estmtManageVO);
		
	}

	@Override
	public void updateEstmtBcnc(EstmtManageVO estmtManageVO) {
		estmtManageDAO.updateEstmtBcnc(estmtManageVO);
	}

	@Override
	public void insertEstmtPrdlst(EstmtManageVO estmtManageVO) {
		estmtManageDAO.insertEstmtPrdlst(estmtManageVO);
	}

	@Override
	public void updateEstmtPrdlst(EstmtManageVO estmtManageVO) {
		estmtManageDAO.updateEstmtPrdlst(estmtManageVO);
	}

	@Override
	public String checkEstmtManageNo(EstmtManageVO estmtManageVO) {
		String manageNo = estmtManageDAO.checkEstmtManageNo(estmtManageVO);
		return manageNo;
	}

	@Override
	public EstmtManageVO selectEstmtDetail(EstmtManageVO estmtManageVO) {
		return estmtManageDAO.selectEstmtDetail(estmtManageVO);
	}

	@Override
	public Map<String, Object> selectEstmtBcncDetail(EstmtManageVO estmtManageVO) {
		List<?> result = estmtManageDAO.selectEstmtBcncDetail(estmtManageVO);
		int cnt = estmtManageDAO.selectEstmtBcncDetailCnt(estmtManageVO);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectEstmtPrdlstDetail(EstmtManageVO estmtManageVO) {
		List<?> result = estmtManageDAO.selectEstmtPrdlstDetail(estmtManageVO);
		int cnt = estmtManageDAO.selectEstmtPrdlstDetailCnt(estmtManageVO);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public void deleteEstmtSub(EstmtManageVO estmtManageVO) {
		estmtManageDAO.deleteEstmtSub(estmtManageVO);
	}

	@Override
	public void deletePrdlstSub(EstmtManageVO estmtManageVO) {
		estmtManageDAO.deletePrdlstSub(estmtManageVO);
	}

	@Override
	public Map<String, Object> selectEstmtList(EstmtManageVO estmtManageVO) {
		List<?> result = estmtManageDAO.selectEstmtList(estmtManageVO);
		int cnt = estmtManageDAO.selectEstmtListCnt(estmtManageVO);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}





}