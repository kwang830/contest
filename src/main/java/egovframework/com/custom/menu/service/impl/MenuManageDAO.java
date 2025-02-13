package egovframework.com.custom.menu.service.impl;

import java.util.List;

import egovframework.com.custom.menu.service.MenuManageVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository("menuManageDAO")
public class MenuManageDAO extends EgovComAbstractDAO{

	public List<?> selectMainMenuHead(MenuManageVO vo) throws Exception{
		return list("MenuManage.selectMainMenuHead", vo);
	}

	public List<?> selectMainMenuLeft(MenuManageVO vo) throws Exception{
		return list("MenuManage.selectMainMenuLeft", vo);
	}

	public String selectLastMenuURL(MenuManageVO vo) throws Exception{
		return (String)selectOne("MenuManage.selectLastMenuURL", vo);
	}

	public int selectLastMenuNo(MenuManageVO vo) throws Exception{
		return (Integer)selectOne("MenuManage.selectLastMenuNo", vo);
	}

	public int selectLastMenuNoCnt(MenuManageVO vo) throws Exception{
		return (Integer)selectOne("MenuManage.selectLastMenuNoCnt", vo);
	}

	public List<?> selectMainMenuHeadByAuthor(MenuManageVO vo) throws Exception{
		return list("MenuManage.selectMainMenuHeadByAuthor", vo);
	}

	public List<?> selectMainMenuLeftByAuthor(MenuManageVO vo) throws Exception{
		return list("MenuManage.selectMainMenuLeftByAuthor", vo);
	}

}