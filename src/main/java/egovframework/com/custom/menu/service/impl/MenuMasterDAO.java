package egovframework.com.custom.menu.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.custom.menu.service.MenuMaster;
import egovframework.com.custom.menu.service.MenuMasterVO;

@Repository("MenuMasterDAO")
public class MenuMasterDAO extends EgovComAbstractDAO {

	public List<?> selectMenuMasterInfs(MenuMasterVO menuMasterVO) {
		return list("MenuMaster.selectMenuMasterList", menuMasterVO);
	}

	public int selectMenuMasterInfsCnt(MenuMasterVO menuMasterVO) {
		return (Integer)selectOne("MenuMaster.selectMenuMasterListTotCnt", menuMasterVO);
	}

	public MenuMasterVO selectMenuMasterDetail(MenuMasterVO menuMasterVO) {
		return (MenuMasterVO) selectOne("MenuMaster.selectMenuMasterDetail", menuMasterVO);
	}

	public void insertMenuMasterInf(MenuMaster menuMaster) {
		insert("MenuMaster.insertMenuMaster", menuMaster);
	}

	public void updateMenuMaster(MenuMaster menuMaster) {
		update("MenuMaster.updateMenuMaster", menuMaster);
	}

	public void deleteMenuMaster(MenuMaster menuMaster) {
		update("MenuMaster.deleteMenuMaster", menuMaster);
	}

}
