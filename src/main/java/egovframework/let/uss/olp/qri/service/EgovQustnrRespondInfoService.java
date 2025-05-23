package egovframework.let.uss.olp.qri.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
/**
 * 설문조사 Service Class 구현
 * @author 공통서비스 장동한
 * @since 2009.03.20
 * @version 1.0
 * @see
 *
 * "<pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  장동한          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>"
 */
public interface EgovQustnrRespondInfoService {

    /**
	 * 설문템플릿을 조회한다.
	 */
	public List<?> selectQustnrTmplatManage(Map<?, ?> map) throws Exception;

    /**
	 * 객관식 통계를 조회 조회한다.
	 */
	public List<?> selectQustnrRespondInfoManageStatistics1(Map<?, ?> map) throws Exception;
    /**
	 * 주관식 통계를 조회 조회한다.
	 */
	public List<?> selectQustnrRespondInfoManageStatistics2(Map<?, ?> map) throws Exception;
    /**
	 * 회원정보를 조회한다.
	 */
	public Map<?, ?> selectQustnrRespondInfoManageEmplyrinfo(Map<?, ?> map) throws Exception;

    /**
	 * 설문정보를 조회한다.
	 */
	public List<?> selectQustnrRespondInfoManageComtnqestnrinfo(Map<?, ?> map) throws Exception;
    /**
	 * 문항정보를 조회한다.
	 */
	public List<?> selectQustnrRespondInfoManageComtnqustnrqesitm(Map<?, ?> map) throws Exception;
    /**
	 * 항목정보를 조회한다.
	 */
	public List<?> selectQustnrRespondInfoManageComtnqustnriem(Map<?, ?> map) throws Exception;

    /**
	 * 설문조사(설문등록)를(을) 목록을 조회한다.
	 */
	public List<?> selectQustnrRespondInfoManageList(ComDefaultVO searchVO) throws Exception;

    /**
	 * 설문조사(설문등록)를(을) 목록 전체 건수를(을) 조회한다.
	 */
	public int selectQustnrRespondInfoManageListCnt(ComDefaultVO searchVO) throws Exception;

    /**
	 * 응답자결과(설문조사) 목록을 조회한다.
	 */
	public List<?> selectQustnrRespondInfoList(ComDefaultVO searchVO) throws Exception;

    /**
	 * 응답자결과(설문조사)를(을) 상세조회 한다.
	 */
	public List<?> selectQustnrRespondInfoDetail(QustnrRespondInfoVO qustnrRespondInfoVO) throws Exception;

    /**
	 * 응답자결과(설문조사)를(을) 목록 전체 건수를(을) 조회한다.
	 */
	public int selectQustnrRespondInfoListCnt(ComDefaultVO searchVO) throws Exception;

    /**
	 * 응답자결과(설문조사)를(을) 등록한다.
	 */
	void  insertQustnrRespondInfo(QustnrRespondInfoVO qustnrRespondInfoVO) throws Exception;

    /**
	 * 응답자결과(설문조사)를(을) 수정한다.
	 */
	void  updateQustnrRespondInfo(QustnrRespondInfoVO qustnrRespondInfoVO) throws Exception;

    /**
	 * 응답자결과(설문조사)를(을) 삭제한다.
	 */
	void  deleteQustnrRespondInfo(QustnrRespondInfoVO qustnrRespondInfoVO) throws Exception;


}
