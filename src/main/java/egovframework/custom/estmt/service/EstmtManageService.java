package egovframework.custom.estmt.service;
import java.util.Map;


public interface EstmtManageService  {

	public Map<String, Object> selectBcncList(EstmtBcncVO estmtBcncVO);

	public Map<String, Object> selectPrdlstList(EstmtPrdlstVO estmtPrdlstVO);

	public void insertEstmt(EstmtManageVO estmtManageVO);

	public void updateEstmt(EstmtManageVO estmtManageVO);

	public void insertEstmtBcnc(EstmtManageVO estmtManageVO);

	public void updateEstmtBcnc(EstmtManageVO estmtManageVO);

	public void insertEstmtPrdlst(EstmtManageVO estmtManageVO);

	public void updateEstmtPrdlst(EstmtManageVO estmtManageVO);

	String checkEstmtManageNo(EstmtManageVO estmtManageVO);

	public EstmtManageVO selectEstmtDetail(EstmtManageVO estmtManageVO);

	public Map<String, Object> selectEstmtBcncDetail(EstmtManageVO estmtManageVO);

	public Map<String, Object> selectEstmtPrdlstDetail(EstmtManageVO estmtManageVO);

	public void deleteEstmtSub(EstmtManageVO estmtManageVO);

	public void deletePrdlstSub(EstmtManageVO estmtManageVO);

	public Map<String, Object> selectEstmtList(EstmtManageVO estmtManageVO);
	


}