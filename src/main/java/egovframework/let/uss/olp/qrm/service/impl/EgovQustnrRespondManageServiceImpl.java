package egovframework.let.uss.olp.qrm.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.olp.qrm.service.EgovQustnrRespondManageService;
import egovframework.let.uss.olp.qrm.service.QustnrRespondManageVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
/**
 * 설문응답자관리 ServiceImpl Class 구현
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
@Service("egovQustnrRespondManageService")
public class EgovQustnrRespondManageServiceImpl extends EgovAbstractServiceImpl implements EgovQustnrRespondManageService{


	@Resource(name="qustnrRespondManageDao")
	private QustnrRespondManageDao dao;


	@Resource(name="qustnrRespondManageIdGnrService")
	private EgovIdGnrService idgenService;

    /**
	 * 응답자정보 목록을 조회한다.
	 */
	@Override
	public List<?> selectQustnrRespondManageList(ComDefaultVO searchVO) throws Exception{
		return dao.selectQustnrRespondManageList(searchVO);
	}

    /**
	 * 응답자정보를(을) 상세조회 한다.
	 */
	@Override
	public List<?> selectQustnrRespondManageDetail(QustnrRespondManageVO qustnrRespondManageVO) throws Exception{
		return dao.selectQustnrRespondManageDetail(qustnrRespondManageVO);
	}

    /**
	 * 응답자정보를(을) 목록 전체 건수를(을) 조회한다.
	 */
	@Override
	public int selectQustnrRespondManageListCnt(ComDefaultVO searchVO) throws Exception{
		return dao.selectQustnrRespondManageListCnt(searchVO);
	}

    /**
	 * 응답자정보를(을) 등록한다.
	 */
	@Override
	public void insertQustnrRespondManage(QustnrRespondManageVO qustnrRespondManageVO) throws Exception {
		String sMakeId = idgenService.getNextStringId();

		qustnrRespondManageVO.setQestnrRespondId(sMakeId);

		dao.insertQustnrRespondManage(qustnrRespondManageVO);
	}

    /**
	 * 응답자정보를(을) 수정한다.
	 */
	@Override
	public void updateQustnrRespondManage(QustnrRespondManageVO qustnrRespondManageVO) throws Exception{
		dao.updateQustnrRespondManage(qustnrRespondManageVO);
	}

    /**
	 * 응답자정보를(을) 삭제한다.
	 */
	@Override
	public void deleteQustnrRespondManage(QustnrRespondManageVO qustnrRespondManageVO) throws Exception{
		dao.deleteQustnrRespondManage(qustnrRespondManageVO);
	}
}
