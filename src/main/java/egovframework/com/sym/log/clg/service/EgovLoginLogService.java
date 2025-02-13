package egovframework.com.sym.log.clg.service;
import java.util.Map;

public interface EgovLoginLogService {

	/**
	 * 접속로그를 기록한다.
	 *
	 * @param LoginLog
	 */
	public void logInsertLoginLog(LoginLog loinLog) throws Exception;

	/**
	 * 접속로그를 조회한다.
	 *
	 * @param loginLog
	 * @return loginLog
	 * @throws Exception
	 */
	public LoginLog selectLoginLog(LoginLog loginLog) throws Exception;

	/**
	 * 접속로그 목록을 조회한다.
	 *
	 * @param LoginLog
	 */
	public Map<?, ?> selectLoginLogInf(LoginLog loinLog) throws Exception;

}
