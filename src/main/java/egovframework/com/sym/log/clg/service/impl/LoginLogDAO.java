package egovframework.com.sym.log.clg.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sym.log.clg.service.LoginLog;

import org.springframework.stereotype.Repository;


@Repository("loginLogDAO")
public class LoginLogDAO extends EgovComAbstractDAO {

	/**
	 * 접속로그를 기록한다.
	 *
	 * @param LoginLog
	 * @return
	 * @throws Exception
	 */
	public void logInsertLoginLog(LoginLog loginLog) throws Exception{
		insert("UserLog.logInsertLoginLog", loginLog);
	}

	/**
	 * 접속로그를 조회한다.
	 *
	 * @param loginLog
	 * @return loginLog
	 * @throws Exception
	 */
	public LoginLog selectLoginLog(LoginLog loginLog) throws Exception{

		return (LoginLog) selectOne("UserLog.selectLoginLog", loginLog);
	}

	/**
	 * 접속로그를 목록을 조회한다.
	 *
	 * @param loginLog
	 * @return
	 * @throws Exception
	 */
	public List<?> selectLoginLogInf(LoginLog loginLog) throws Exception{
		return list("UserLog.selectLoginLogInf", loginLog);
	}

	/**
	 * 접속로그 목록의 숫자를 조회한다.
	 * @param loginLog
	 * @return
	 * @throws Exception
	 */
	public int selectLoginLogInfCnt(LoginLog loginLog) throws Exception{

		return (Integer)selectOne("UserLog.selectLoginLogInfCnt", loginLog);
	}

}
