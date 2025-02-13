package egovframework.com.custom.menu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cop.adb.service.AddressBookUserVO;
import egovframework.com.custom.menu.service.EgovMenuManageService;
import egovframework.com.custom.menu.service.MenuManageVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("meunManageService")
public class EgovMenuManageServiceImpl extends EgovAbstractServiceImpl implements EgovMenuManageService{

	@Resource(name="menuManageDAO")
    private MenuManageDAO menuManageDAO;

	@Override
	public Map<String, Object> selectMainMenuHead(MenuManageVO vo) throws Exception {  		
		List<?> result = menuManageDAO.selectMainMenuHead(vo);
		//int cnt = menuManageDAO.selectMainMenuHeadCnt(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		//map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectMainMenuLeft(MenuManageVO vo) throws Exception {   		
		List<?> result = menuManageDAO.selectMainMenuLeft(vo);
		//int cnt = menuManageDAO.selectMainMenuHeadCnt(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		//map.put("resultCnt", Integer.toString(cnt));

		return map;   		
	}

	@Override
	public String selectLastMenuURL(int iMenuNo, String sUniqId) throws Exception {
		MenuManageVO vo = new MenuManageVO();
		vo.setMenuNo(selectLastMenuNo(iMenuNo, sUniqId)) ;
   		return menuManageDAO.selectLastMenuURL(vo);
	}

	private int selectLastMenuNo(int iMenuNo, String sUniqId) throws Exception {
		int chkMenuNo = iMenuNo;
		int cntMenuNo = 0;
		for(;chkMenuNo > -1;){
			chkMenuNo = selectLastMenuNoChk(chkMenuNo, sUniqId);
			if(chkMenuNo > 0){
				cntMenuNo = chkMenuNo;
			}
		}
   		return cntMenuNo;
	}

	private int selectLastMenuNoChk(int iMenuNo, String sUniqId) throws Exception {
		MenuManageVO vo = new MenuManageVO();
		vo.setMenuNo(iMenuNo);
		vo.setTempValue(sUniqId) ;
		int chkMenuNo = 0;
		int cntMenuNo = 0;
		cntMenuNo = menuManageDAO.selectLastMenuNoCnt(vo);
		if(cntMenuNo>0){
			chkMenuNo = menuManageDAO.selectLastMenuNo(vo);
		}else{
			chkMenuNo = -1;
		}
		return  chkMenuNo;
	}

	/**
	 * MainMenu Head Menu 조회
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	@Override
	public Map<String, Object> selectMainMenuHeadByAuthor(MenuManageVO vo) throws Exception {
		List<?> result = menuManageDAO.selectMainMenuHeadByAuthor(vo);
		//int cnt = menuManageDAO.selectMainMenuHeadCnt(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		//map.put("resultCnt", Integer.toString(cnt));

		return map;   		
	}

	/**
	 * MainMenu Head Left 조회
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	@Override
	public Map<String, Object> selectMainMenuLeftByAuthor(MenuManageVO vo) throws Exception {
		List<?> result = menuManageDAO.selectMainMenuLeftByAuthor(vo);
		//int cnt = menuManageDAO.selectMainMenuHeadCnt(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		//map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

}