package egovframework.let.uat.uia.service.impl;
import egovframework.com.cmm.LoginVO;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;

import org.springframework.stereotype.Repository;
/**
 * 일반 로그인을 처리하는 DAO 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * "<pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Repository("loginDAO")
public class LoginDAO extends EgovAbstractMapper {

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception Exception
	 */
    public LoginVO actionLogin(LoginVO vo) throws Exception {
    	return (LoginVO)selectOne("loginDAO.actionLogin", vo);
    }

    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception Exception
	 */
    public LoginVO searchId(LoginVO vo) throws Exception {

    	return (LoginVO)selectOne("loginDAO.searchId", vo);
    }

    /**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception Exception
	 */
    public LoginVO searchPassword(LoginVO vo) throws Exception {

    	return (LoginVO)selectOne("loginDAO.searchPassword", vo);
    }

    /**
	 * 변경된 비밀번호를 저장한다.
	 * @param vo LoginVO
	 * @exception Exception Exception
	 */
    public void updatePassword(LoginVO vo) throws Exception {
    	update("loginDAO.updatePassword", vo);
    }

	/**
	 * 비밀번호 실패시 카운트를 저장한다. 5회 이상시 계정을 잠금한다.
	 * @param vo LoginVO
	 * @exception Exception Exception
	 */
	public void updateLoginFailCount(LoginVO vo) throws Exception {
		update("loginDAO.updateLoginFailCount", vo);
	}

	/**
	 * 아이디 잠김여부를 조회한다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception Exception
	 */
	public LoginVO actionLoginLockYn(LoginVO vo) throws Exception {

		return (LoginVO)selectOne("loginDAO.actionLoginLockYn", vo);
	}

	/**
	 * Lock_cnt 를 초기화 한다.
	 * @param vo LoginVO
	 * @exception Exception Exception
	 */
	public void actionLoginLockCntReset(LoginVO vo) throws Exception {

		update("loginDAO.updateLoginLockCntReset", vo);
	}
}
