package  egovframework.com.custom.menu.service;

import java.util.Map;

public interface EgovMenuManageService {

	Map<String, Object> selectMainMenuHead(MenuManageVO vo) throws Exception;

	Map<String, Object> selectMainMenuLeft(MenuManageVO vo) throws Exception;

	String selectLastMenuURL(int iMenuNo, String sUniqId) throws Exception;

	Map<String, Object> selectMainMenuHeadByAuthor(MenuManageVO vo) throws Exception;

	Map<String, Object> selectMainMenuLeftByAuthor(MenuManageVO vo) throws Exception;

}