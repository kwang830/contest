package egovframework.let.uss.olp.qtm.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.olp.qtm.service.QustnrTmplatManageVO;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;

import org.springframework.stereotype.Repository;
/**
 * 설문템플릿 Dao Class 구현
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
@Repository("qustnrTmplatManageDao")
public class QustnrTmplatManageDao extends EgovAbstractMapper {

    /**
	 * 템플릿파일명을 조회한다.
	 */
	public Map<?, ?> selectQustnrTmplatManageTmplatImagepathnm(QustnrTmplatManageVO qustnrTmplatManageVO){
		return (Map<?, ?>)selectOne("QustnrTmplatManage.selectQustnrTmplatManageTmplatImagepathnm", qustnrTmplatManageVO);
	}


	/**
	 * 설문템플릿 목록을 조회한다.
	 */
	public List<?> selectQustnrTmplatManageList(ComDefaultVO searchVO){
		return selectList("QustnrTmplatManage.selectQustnrTmplatManage", searchVO);
	}

    /**
	 * 설문템플릿를(을) 상세조회 한다.
	 */
	public List<?> selectQustnrTmplatManageDetail(QustnrTmplatManageVO qustnrTmplatManageVO){
		return selectList("QustnrTmplatManage.selectQustnrTmplatManageDetail", qustnrTmplatManageVO);
	}

    /**
	 * 설문템플릿를(을) 목록 전체 건수를(을) 조회한다.
	 */
	public int selectQustnrTmplatManageListCnt(ComDefaultVO searchVO){
		return (Integer)selectOne("QustnrTmplatManage.selectQustnrTmplatManageCnt", searchVO);
	}

    /**
	 * 설문템플릿를(을) 등록한다.
	 */
	public void insertQustnrTmplatManage(QustnrTmplatManageVO qustnrTmplatManageVO){
		insert("QustnrTmplatManage.insertQustnrTmplatManage", qustnrTmplatManageVO);
	}

    /**
	 * 설문템플릿를(을) 수정한다.
	 */
	public void updateQustnrTmplatManage(QustnrTmplatManageVO qustnrTmplatManageVO){
		insert("QustnrTmplatManage.updateQustnrTmplatManage", qustnrTmplatManageVO);
	}

    /**
	 * 설문템플릿를(을) 삭제한다.
	 */
	public void deleteQustnrTmplatManage(QustnrTmplatManageVO qustnrTmplatManageVO){
		//설문응답자 삭제
		delete("QustnrTmplatManage.deleteQustnrRespondManage", qustnrTmplatManageVO);
		//설문조사(설문결과) 삭제
		delete("QustnrTmplatManage.deleteQustnrRespondInfo", qustnrTmplatManageVO);
		//설문항목 삭제
		delete("QustnrTmplatManage.deleteQustnrItemManage", qustnrTmplatManageVO);
		//설문문항 삭제
		delete("QustnrTmplatManage.deleteQustnrQestnManage", qustnrTmplatManageVO);
		//설문관리 삭제
		delete("QustnrTmplatManage.deleteQustnrManage", qustnrTmplatManageVO);

		//설문템플릿삭제
		delete("QustnrTmplatManage.deleteQustnrTmplatManage", qustnrTmplatManageVO);
	}
}
