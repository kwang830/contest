package egovframework.com.custom.menu.service;

import java.util.Map;

import egovframework.rte.fdl.cmmn.exception.FdlException;

public interface MenuMasterService {

	Map<String, Object> selectNotUsedBdMstrList(MenuMasterVO MenuMasterVO);

	void deleteBBSMasterInf(MenuMaster MenuMaster);

	void updateBBSMasterInf(MenuMaster MenuMaster);

	MenuMasterVO selectBBSMasterInf(MenuMasterVO MenuMasterVO) throws Exception;

	Map<String, Object> selectBBSMasterInfs(MenuMasterVO MenuMasterVO);

	void insertBBSMasterInf(MenuMaster MenuMaster) throws FdlException;


}
