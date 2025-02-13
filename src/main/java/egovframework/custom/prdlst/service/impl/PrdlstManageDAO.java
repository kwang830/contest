package egovframework.custom.prdlst.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.custom.prdlst.service.PrdlstManageVO;

@Repository("prdlstManageDAO")
public class PrdlstManageDAO extends EgovComAbstractDAO{

	public void insertPrdlst(PrdlstManageVO prdlstManageVO) {
		insert("Prdlst.insertPrdlst", prdlstManageVO);
	}

	public void insertPrdlstSub(PrdlstManageVO prdlstManageVO) {
		update("Prdlst.insertPrdlstSub", prdlstManageVO);		
	}

	public void updatePrdlstSub(PrdlstManageVO prdlstManageVO) {
		update("Prdlst.updatePrdlstSub", prdlstManageVO);
	}

	public PrdlstManageVO selectPrdlstDetail(PrdlstManageVO prdlstManageVO) {
		return (PrdlstManageVO) selectOne("Prdlst.selectPrdlstDetail", prdlstManageVO);
	}

	public void updatePrdlst(PrdlstManageVO prdlstManageVO) {
		update("Prdlst.updatePrdlst", prdlstManageVO);
	}

	public List<?> selectPrdlstSub(PrdlstManageVO prdlstManageVO) {
		return list("Prdlst.selectPrdlstSub", prdlstManageVO);
	}

	public int selectPrdlstSubCnt(PrdlstManageVO prdlstManageVO) {
		return (Integer)selectOne("Prdlst.selectPrdlstSubCnt", prdlstManageVO);
	}

    public int checkKeyJhno(String checkId){
        return (Integer)selectOne("Prdlst.checkKeyJhno_S", checkId);
    }

	public void deletePrdlstSub(PrdlstManageVO prdlstManageVO) {
		update("Prdlst.deletePrdlstSub", prdlstManageVO);
	}

	public List<?> selectPrdlstInqireList(PrdlstManageVO prdlstManageVO) {
		return list("Prdlst.selectPrdlstInqireList", prdlstManageVO);
	}

	public int selectPrdlstInqireListCnt(PrdlstManageVO prdlstManageVO) {
		return (Integer)selectOne("Prdlst.selectPrdlstInqireListCnt", prdlstManageVO);
	}

	public List<?> selectPrdlstCodeList(PrdlstManageVO prdlstManageVO) {
		return list("Prdlst.selectPrdlstCodeList", prdlstManageVO);
	}

	public int selectPrdlstCodeListCnt(PrdlstManageVO prdlstManageVO) {
		return (Integer)selectOne("Prdlst.selectPrdlstCodeListCnt", prdlstManageVO);
	}

	public void insertPrdlstCode(PrdlstManageVO prdlstManageVO) {
		update("Prdlst.insertPrdlstCode", prdlstManageVO);		
	}

	public void updatePrdlstCode(PrdlstManageVO prdlstManageVO) {
		update("Prdlst.updatePrdlstCode", prdlstManageVO);
	}

	public void deletePrdlstCode(PrdlstManageVO prdlstManageVO) {
		update("Prdlst.deletePrdlstCode", prdlstManageVO);
	}	
}