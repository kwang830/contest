package egovframework.let.uss.sam.ipm.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.sam.ipm.service.IndvdlInfoPolicy;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;

import org.springframework.stereotype.Repository;

/**
 * 개인정보보호정책를 처리하는 Dao Class 구현
 * @author 공통서비스 장동한
 * @since 2009.07.03
 * @version 1.0
 * @see
 * "<pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.07.03  장동한          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>"
 */
@Repository("onlineIndvdlInfoPolicyDao")
public class IndvdlInfoPolicyDao extends EgovAbstractMapper {

    /**
     * 개인정보보호정책를(을) 목록을 한다.
     * @param searchVO  조회할 정보가 담긴 VO
     * @return List
     * @throws Exception Exception
     */
	public List<?> selectIndvdlInfoPolicyList(ComDefaultVO searchVO) throws Exception {
        return selectList("IndvdlInfoPolicy.selectIndvdlInfoPolicy", searchVO);
    }

    /**
     * 개인정보보호정책를(을) 목록 전체 건수를(을) 조회한다.
     * @param searchVO  조회할 정보가 담긴 VO
     * @return int
     * @throws Exception Exception
     */
    public int selectIndvdlInfoPolicyListCnt(ComDefaultVO searchVO) throws Exception {
        return (Integer)selectOne("IndvdlInfoPolicy.selectIndvdlInfoPolicyCnt");
    }

    /**
     * 개인정보보호정책를(을) 상세조회 한다.
     * @param indvdlInfoPolicy  개인정보보호정책 정보가 담김 VO
     * @return IndvdlInfoPolicy
     * @throws Exception Exception
     */
    public IndvdlInfoPolicy selectIndvdlInfoPolicyDetail(IndvdlInfoPolicy indvdlInfoPolicy) throws Exception {
        return (IndvdlInfoPolicy)selectOne("IndvdlInfoPolicy.selectIndvdlInfoPolicyDetail", indvdlInfoPolicy);
    }

    /**
     * 개인정보보호정책를(을) 등록한다.
     * @param indvdlInfoPolicy  개인정보보호정책 정보가 담김 VO
     * @throws Exception Exception
     */
    public void insertIndvdlInfoPolicy(IndvdlInfoPolicy indvdlInfoPolicy) throws Exception {
        insert("IndvdlInfoPolicy.insertIndvdlInfoPolicy", indvdlInfoPolicy);
    }

    /**
     * 개인정보보호정책를(을) 수정한다.
     * @param indvdlInfoPolicy  개인정보보호정책 정보가 담김 VO
     * @throws Exception Exception
     */
    public void updateIndvdlInfoPolicy(IndvdlInfoPolicy indvdlInfoPolicy) throws Exception {
        update("IndvdlInfoPolicy.updateIndvdlInfoPolicy", indvdlInfoPolicy);
    }

    /**
     * 개인정보보호정책를(을) 삭제한다.
     * @param indvdlInfoPolicy  개인정보보호정책 정보가 담김 VO
     * @throws Exception Exception
     */
    public void deleteIndvdlInfoPolicy(IndvdlInfoPolicy indvdlInfoPolicy) throws Exception {
        delete("IndvdlInfoPolicy.deleteIndvdlInfoPolicy", indvdlInfoPolicy);
    }

}
