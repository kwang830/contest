package egovframework.let.uss.sam.stp.service.impl;

import java.util.List;

import egovframework.let.uss.sam.stp.service.EgovStplatManageService;
import egovframework.let.uss.sam.stp.service.StplatManageDefaultVO;
import egovframework.let.uss.sam.stp.service.StplatManageVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



/**
 *
 * 약관내용을 처리하는 서비스 구현 클래스
 * @author 공통서비스 개발팀 박정규
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * "<pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  박정규          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>"
 */
@Service("StplatManageService")
public class EgovStplatManageServiceImpl extends EgovAbstractServiceImpl implements
        EgovStplatManageService {

    @Resource(name="StplatManageDAO")
    private StplatManageDAO stplatManageDAO;

    /** ID Generation */
	@Resource(name="egovStplatManageIdGnrService")
	private EgovIdGnrService idgenService;


    /**
	 * 글을 조회한다.
	 */
    @Override
	public StplatManageVO selectStplatDetail(StplatManageVO vo) throws Exception {
        StplatManageVO resultVO = stplatManageDAO.selectStplatDetail(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * 약관정보 글 목록을 조회한다.
	 */
	@Override
	public List<?> selectStplatList(StplatManageDefaultVO searchVO) throws Exception {
        return stplatManageDAO.selectStplatList(searchVO);
    }

    /**
	 * 약관정보 글 총 갯수를 조회한다.
	 */
    @Override
	public int selectStplatListTotCnt(StplatManageDefaultVO searchVO) {
		return stplatManageDAO.selectStplatListTotCnt(searchVO);
	}

	/**
	 * 약관정보 글을 등록한다.
	 */
    @Override
	public void insertStplatCn(StplatManageVO vo) throws Exception {

		String	useStplatId = idgenService.getNextStringId();

		vo.setUseStplatId(useStplatId);

    	stplatManageDAO.insertStplatCn(vo);
    }

	/**
	 * 약관정보 글을 수정한다.
	 */
    @Override
	public void updateStplatCn(StplatManageVO vo) throws Exception {

    	stplatManageDAO.updateStplatCn(vo);
    }

	/**
	 * 약관정보 글을 삭제한다.
	 */
    @Override
	public void deleteStplatCn(StplatManageVO vo) throws Exception {

    	stplatManageDAO.deleteStplatCn(vo);
    }

}
