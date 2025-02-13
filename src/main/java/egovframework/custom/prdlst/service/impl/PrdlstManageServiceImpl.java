package egovframework.custom.prdlst.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.custom.prdlst.service.PrdlstManageService;
import egovframework.custom.prdlst.service.PrdlstManageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("PrdlstManageService")
public class PrdlstManageServiceImpl extends EgovAbstractServiceImpl implements PrdlstManageService {

	/** PrdlstManageDAO */
	@Resource(name="prdlstManageDAO")
	private PrdlstManageDAO prdlstManageDAO;

	@Override
	public void insertPrdlst(PrdlstManageVO prdlstManageVO) {
		prdlstManageDAO.insertPrdlst(prdlstManageVO);
	}

	@Override
	public void insertPrdlstSub(PrdlstManageVO prdlstManageVO) {
		prdlstManageDAO.insertPrdlstSub(prdlstManageVO);
	}

	@Override
	public void updatePrdlstSub(PrdlstManageVO prdlstManageVO) throws Exception {
		prdlstManageDAO.updatePrdlstSub(prdlstManageVO);
	}

	@Override
	public PrdlstManageVO selectPrdlstDetail(PrdlstManageVO prdlstManageVO) {
		return prdlstManageDAO.selectPrdlstDetail(prdlstManageVO);
	}

	@Override
	public void updatePrdlst(PrdlstManageVO prdlstManageVO) {
		prdlstManageDAO.updatePrdlst(prdlstManageVO);
	}

	@Override
	public Map<String, Object> selectPrdlstSub(PrdlstManageVO prdlstManageVO) {
		List<?> result = prdlstManageDAO.selectPrdlstSub(prdlstManageVO);
		//int cnt = prdlstManageDAO.selectPrdlstSubCnt(prdlstManageVO);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("resultList", result);
		//map.put("resultCnt", Integer.toString(cnt));

		return map;
	}
	
	@Override
	public int checkKeyJhno(String checkId) {
		return prdlstManageDAO.checkKeyJhno(checkId);
	}

	@Override
	public void deletePrdlstSub(PrdlstManageVO prdlstManageVO) {
		prdlstManageDAO.deletePrdlstSub(prdlstManageVO);
	}

	@Override
	public Map<String, Object> selectPrdlstInqireList(PrdlstManageVO prdlstManageVO) {
		List<?> result = prdlstManageDAO.selectPrdlstInqireList(prdlstManageVO);
		int cnt = prdlstManageDAO.selectPrdlstInqireListCnt(prdlstManageVO);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectPrdlstCodeList(PrdlstManageVO prdlstManageVO) {
		List<?> result = prdlstManageDAO.selectPrdlstCodeList(prdlstManageVO);
		int cnt = prdlstManageDAO.selectPrdlstCodeListCnt(prdlstManageVO);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public void insertPrdlstCode(PrdlstManageVO prdlstManageVO) {
		prdlstManageDAO.insertPrdlstCode(prdlstManageVO);
	}

	@Override
	public void updatePrdlstCode(PrdlstManageVO prdlstManageVO) throws Exception {
		prdlstManageDAO.updatePrdlstCode(prdlstManageVO);
	}

	@Override
	public void deletePrdlstCode(PrdlstManageVO prdlstManageVO) {
		prdlstManageDAO.deletePrdlstCode(prdlstManageVO);
		
	}	

}