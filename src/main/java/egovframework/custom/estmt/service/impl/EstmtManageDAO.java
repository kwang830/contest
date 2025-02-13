package egovframework.custom.estmt.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.custom.estmt.service.EstmtManageVO;
import egovframework.custom.estmt.service.EstmtPrdlstVO;
import egovframework.custom.estmt.service.EstmtBcncVO;

import org.springframework.stereotype.Repository;


@Repository("EstmtManageDAO")
public class EstmtManageDAO extends EgovComAbstractDAO{


	public List<?> selectBcncList(EstmtBcncVO estmtBcncVO) {
		return list("Estmt.selectBcncList", estmtBcncVO);
	}

	public int selectBcncListCnt(EstmtBcncVO estmtBcncVO) {
		return (Integer)selectOne("Estmt.selectBcncListCnt", estmtBcncVO);
	}

	public List<?> selectPrdlstList(EstmtPrdlstVO estmtPrdlstVO) {
		return list("Estmt.selectPrdlstList", estmtPrdlstVO);
	}

	public int selectPrdlstListCnt(EstmtPrdlstVO estmtPrdlstVO) {
		return (Integer)selectOne("Estmt.selectPrdlstListCnt", estmtPrdlstVO);
	}

	public void insertEstmt(EstmtManageVO estmtManageVO) {
		insert("Estmt.insertEstmt", estmtManageVO);
	}

	public void updateEstmt(EstmtManageVO estmtManageVO) {
		update("Estmt.updateEstmt", estmtManageVO);
	}

	public void insertEstmtBcnc(EstmtManageVO estmtManageVO) {
		insert("Estmt.insertEstmtBcnc", estmtManageVO);
	}

	public void updateEstmtBcnc(EstmtManageVO estmtManageVO) {
		update("Estmt.updateEstmtBcnc", estmtManageVO);
	}

	public void insertEstmtPrdlst(EstmtManageVO estmtManageVO) {
		insert("Estmt.insertEstmtPrdlst", estmtManageVO);
	}

	public void updateEstmtPrdlst(EstmtManageVO estmtManageVO) {
		update("Estmt.updateEstmtPrdlst", estmtManageVO);
	}

	public String checkEstmtManageNo(EstmtManageVO estmtManageVO) {
		return selectOne("Estmt.checkEstmtManageNo", estmtManageVO);
	}

	public EstmtManageVO selectEstmtDetail(EstmtManageVO estmtManageVO) {
		return (EstmtManageVO) selectOne("Estmt.selectEstmtDetail", estmtManageVO);
	}

	public List<?> selectEstmtBcncDetail(EstmtManageVO estmtManageVO) {
		return list("Estmt.selectEstmtBcncDetail", estmtManageVO);
	}

	public int selectEstmtBcncDetailCnt(EstmtManageVO estmtManageVO) {
		return (Integer)selectOne("Estmt.selectEstmtBcncDetailCnt", estmtManageVO);
	}

	public List<?> selectEstmtPrdlstDetail(EstmtManageVO estmtManageVO) {
		return list("Estmt.selectEstmtPrdlstDetail", estmtManageVO);
	}

	public int selectEstmtPrdlstDetailCnt(EstmtManageVO estmtManageVO) {
		return (Integer)selectOne("Estmt.selectEstmtPrdlstDetailCnt", estmtManageVO);
	}

	public void deleteEstmtSub(EstmtManageVO estmtManageVO) {
		update("Estmt.deleteEstmtSub", estmtManageVO);
	}

	public void deletePrdlstSub(EstmtManageVO estmtManageVO) {
		update("Estmt.deletePrdlstSub", estmtManageVO);
	}

	public List<?> selectEstmtList(EstmtManageVO estmtManageVO) {
		return list("Estmt.selectEstmtList", estmtManageVO);
	}

	public int selectEstmtListCnt(EstmtManageVO estmtManageVO) {
		return (Integer)selectOne("Estmt.selectEstmtListCnt", estmtManageVO);
	}





}