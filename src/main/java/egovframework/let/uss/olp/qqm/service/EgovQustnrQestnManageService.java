package egovframework.let.uss.olp.qqm.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
/**
 * 설문문항을 처리하는 Service Class 구현
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
public interface EgovQustnrQestnManageService {

    /**
	 * 설문조사 응답자답변내용결과/기타답변내용결과 통계를 조회한다.
	 */
	public List<?> selectQustnrManageStatistics2(Map<?, ?> map) throws Exception;

    /**
	 * 설문조사 통계를 조회한다.
	 */
	public List<?> selectQustnrManageStatistics(Map<?, ?> map) throws Exception;

    /**
	 * 설문지정보 설문제목을 조회한다.
	 */
	public Map<?, ?> selectQustnrManageQestnrSj(Map<?, ?> map) throws Exception;

    /**
	 * 설문문항 목록을 조회한다.
	 */
	public List<?> selectQustnrQestnManageList(ComDefaultVO searchVO) throws Exception;

    /**
	 * 설문문항를(을) 상세조회 한다.
	 */
	public List<?> selectQustnrQestnManageDetail(QustnrQestnManageVO qustnrQestnManageVO) throws Exception;

    /**
	 * 설문문항를(을) 목록 전체 건수를(을) 조회한다.
	 */
	public int selectQustnrQestnManageListCnt(ComDefaultVO searchVO) throws Exception;

    /**
	 * 설문문항를(을) 등록한다.
	 */
	void  insertQustnrQestnManage(QustnrQestnManageVO qustnrQestnManageVO) throws Exception;

    /**
	 * 설문문항를(을) 수정한다.
	 */
	void  updateQustnrQestnManage(QustnrQestnManageVO qustnrQestnManageVO) throws Exception;

    /**
	 * 설문문항를(을) 삭제한다.
	 */
	void  deleteQustnrQestnManage(QustnrQestnManageVO qustnrQestnManageVO) throws Exception;


}
