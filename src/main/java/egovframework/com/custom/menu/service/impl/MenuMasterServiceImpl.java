package egovframework.com.custom.menu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.custom.menu.service.MenuMaster;
import egovframework.com.custom.menu.service.MenuMasterVO;
import egovframework.com.custom.menu.service.MenuMasterService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("MenuMasterService")
public class MenuMasterServiceImpl extends EgovAbstractServiceImpl implements MenuMasterService {

	@Resource(name = "MenuMasterDAO")
    private MenuMasterDAO menuMasterDao;

    @Resource(name = "egovBBSMstrIdGnrService")
    private EgovIdGnrService idgenService2;
	
	@Override
	public Map<String, Object> selectNotUsedBdMstrList(MenuMasterVO MenuMasterVO) {
		return null;
	}

	@Override
	public void deleteBBSMasterInf(MenuMaster MenuMaster) {
		menuMasterDao.deleteMenuMaster(MenuMaster);	
	}

	@Override
	public void updateBBSMasterInf(MenuMaster MenuMaster) {
		menuMasterDao.updateMenuMaster(MenuMaster);
	}

	@Override
	public MenuMasterVO selectBBSMasterInf(MenuMasterVO MenuMasterVO) throws Exception {
		MenuMasterVO resultVO = menuMasterDao.selectMenuMasterDetail(MenuMasterVO);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
	}

	@Override
	public Map<String, Object> selectBBSMasterInfs(MenuMasterVO MenuMasterVO) {
		List<?> result = menuMasterDao.selectMenuMasterInfs(MenuMasterVO);
		int cnt = menuMasterDao.selectMenuMasterInfsCnt(MenuMasterVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public void insertBBSMasterInf(MenuMaster MenuMaster) throws FdlException {
		
		//게시판 ID 채번
		String bbsId = idgenService2.getNextStringId();
		MenuMaster.setBbsId(bbsId);
		
		menuMasterDao.insertMenuMasterInf(MenuMaster);
	}

}
