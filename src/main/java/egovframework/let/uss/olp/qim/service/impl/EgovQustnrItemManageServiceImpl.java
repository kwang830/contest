package egovframework.let.uss.olp.qim.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.olp.qim.service.EgovQustnrItemManageService;
import egovframework.let.uss.olp.qim.service.QustnrItemManageVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
/**
 * 설문항목관리를 처리하는 ServiceImpl Class 구현
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
@Service("egovQustnrItemManageService")
public class EgovQustnrItemManageServiceImpl extends EgovAbstractServiceImpl implements EgovQustnrItemManageService{

	@Resource(name="qustnrItemManageDao")
	private QustnrItemManageDao dao;

	@Resource(name="egovQustnrItemManageIdGnrService")
	private EgovIdGnrService idgenService;

    /**
	 * 설문템플릿(을)를  목록을 조회한다.
	 */
	@Override
	public List<?> selectQustnrTmplatManageList(QustnrItemManageVO qustnrItemManageVO) throws Exception{
		return dao.selectQustnrTmplatManageList(qustnrItemManageVO);
	}


    /**
	 * 설문항목 목록을 조회한다.
	 */
	@Override
	public List<?> selectQustnrItemManageList(ComDefaultVO searchVO) throws Exception{
		return dao.selectQustnrItemManageList(searchVO);
	}

    /**
	 * 설문항목를(을) 상세조회 한다.
	 */
	@Override
	public List<?> selectQustnrItemManageDetail(QustnrItemManageVO qustnrItemManageVO) throws Exception{
		return dao.selectQustnrItemManageDetail(qustnrItemManageVO);
	}

    /**
	 * 설문항목를(을) 목록 전체 건수를(을) 조회한다.
	 */
	@Override
	public int selectQustnrItemManageListCnt(ComDefaultVO searchVO) throws Exception{
		return dao.selectQustnrItemManageListCnt(searchVO);
	}

    /**
	 * 설문항목를(을) 등록한다.
	 */
	@Override
	public void insertQustnrItemManage(QustnrItemManageVO qustnrItemManageVO) throws Exception {
		String sMakeId = idgenService.getNextStringId();

		qustnrItemManageVO.setQustnrIemId(sMakeId);

		dao.insertQustnrItemManage(qustnrItemManageVO);
	}

    /**
	 * 설문항목를(을) 수정한다.
	 */
	@Override
	public void updateQustnrItemManage(QustnrItemManageVO qustnrItemManageVO) throws Exception{
		dao.updateQustnrItemManage(qustnrItemManageVO);
	}

    /**
	 * 설문항목를(을) 삭제한다.
	 */
	@Override
	public void deleteQustnrItemManage(QustnrItemManageVO qustnrItemManageVO) throws Exception{
		dao.deleteQustnrItemManage(qustnrItemManageVO);
	}
}
