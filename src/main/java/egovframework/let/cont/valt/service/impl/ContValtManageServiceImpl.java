package egovframework.let.cont.valt.service.impl;

import egovframework.let.cont.valt.service.ContUserVO;
import egovframework.let.cont.valt.service.ContValtManageService;
import egovframework.let.cont.valt.service.ContValtVO;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.impl.BBSManageDAO;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("ContValtManageService")
public class ContValtManageServiceImpl extends EgovAbstractServiceImpl implements ContValtManageService {

    @Resource(name = "ContValtManageDAO")
    private ContValtManageDAO contValtManageDAO;

    @Resource(name = "BBSManageDAO")
    private BBSManageDAO bbsManageDAO;

    /**
     * 공모전 목록을 조회한다.
     *
     */
    @Override
    public List<ContValtVO> selectContValtList(ContValtVO contSearchVO) throws Exception {
        return contValtManageDAO.selectContValtList(contSearchVO);
    }

    /**
     * 목록조회 카운트를 반환한다.
     *
     */
    @Override
    public int selectContValtListTotCnt(ContValtVO contSearchVO) throws Exception {
        return contValtManageDAO.selectContValtListCnt(contSearchVO);
    }

    /**
     * 선택된 공모전 관리를 삭제한다.
     *
     *
     *
     */
    @Override
    public int deleteContValt(ContValtVO contdeleteVO) throws Exception {

        String[] delList = contdeleteVO.getValtMngmNos().split(";");
        int count = 0;
        if (delList.length > 0) {
            for (String target : delList) {
                contdeleteVO.setValtMngmNo(target);
                contValtManageDAO.deleteContValt(contdeleteVO);
                count++;
            }
            return count;
        }

        return 1;
    }

    /**
     * 평가관리문항번호 목록을 조회한다.
     *
     *
     *
     */
    @Override
    public List<ContValtVO> selectValtQsitMnnoList(ContValtVO contSearchVO) throws Exception {
        return contValtManageDAO.selectValtQsitMnnoList(contSearchVO);
    }

    /**
     * 평가해야하는 게시글을 조회 한다.
     *
     *
     *
     */
    @Override
    public List<BoardVO> selectBbsByValtAjax(ContValtVO contValtVO) throws Exception {
        return bbsManageDAO.selectBbsByValtAjax(contValtVO);
    }
    @Override
    public int selectBbsByValtTotCntAjax(ContValtVO contValtVO) throws Exception {
        return bbsManageDAO.selectBbsByValtTotCntAjax(contValtVO);
    }

    /**
     * 공모전 평가 관리를 등록한다.
     *
     *
     *
     */
    @Override
    public int insertContestValt(ContValtVO contValtVO) throws Exception {
        return contValtManageDAO.insertContestValt(contValtVO);
    }

    @Override
    public int updateContValt(ContValtVO contSearchVO) throws Exception {
        return contValtManageDAO.updateContValt(contSearchVO);
    }

    @Override
    public int deleteContValtBbs(ContValtVO contValtVO) throws Exception {
        String[] delList = contValtVO.getNttIds().split(";");
        int count = 0;
        if (delList.length > 0) {
            for (String target : delList) {
                contValtVO.setNttId(target);
                //contValtManageDAO.deleteContValtScrBbs(contValtVO);
                contValtManageDAO.deleteContValtBbs(contValtVO);
                count++;
            }
            return count;
        }

        return 1;
    }

    @Override
    public int deleteContValtUser(ContValtVO contValtVO) throws Exception {
        String[] delList = contValtVO.getExmnIds().split(";");
        int count = 0;
        if (delList.length > 0) {
            for (String target : delList) {
                contValtVO.setExmnId(target);
                contValtManageDAO.deleteContValtUser(contValtVO);
                count++;
            }
            return count;
        }
        return 1;
    }

    @Override
    public List<BoardVO> selectContValtBbsList(ContValtVO contValtVO) throws Exception {
        return contValtManageDAO.selectContValtBbsList(contValtVO);
    }

    @Override
    public int selectContValtBbsListTotCnt(ContValtVO contValtVO) throws Exception {
        return contValtManageDAO.selectContValtBbsListTotCnt(contValtVO);
    }

    @Override
    public int insertContestValtBbs(ContValtVO contValtVO) throws Exception {
        String[] insertList = contValtVO.getNttIds().split(";");
        int count = 0;
        if (insertList.length > 0) {
            for (String target : insertList) {
                contValtVO.setNttId(target);
                contValtManageDAO.insertContValtBbs(contValtVO);
                count++;
            }
            return count;
        }
        return 1;
    }

    @Override
    public List<ContUserVO> selectUesrByValtAjax(ContValtVO contValtVO) throws Exception {
        return contValtManageDAO.selectUesrByValtAjax(contValtVO);
    }

    @Override
    public List<ContUserVO> selectContValtUserList(ContValtVO contValtVO) throws Exception {
        return contValtManageDAO.selectContValtUserList(contValtVO);
    }

    @Override
    public int selectContValtUserListTotCnt(ContValtVO contValtVO) throws Exception {
        return contValtManageDAO.selectContValtUserListTotCnt(contValtVO);
    }

    @Override
    public int insertContestValtUser(ContValtVO contValtVO) throws Exception {
        String[] insertList = contValtVO.getExmnIds().split(";");
        int count = 0;
        if (insertList.length > 0) {
            for (String target : insertList) {
                contValtVO.setExmnId(target);
                contValtManageDAO.insertContValtUser(contValtVO);
                count++;
            }
            return count;
        }
        return 1;
    }

    @Override
    public ContValtVO selectContValtDetail(ContValtVO contSearchVO) throws Exception {
        return contValtManageDAO.selectContValtDetail(contSearchVO);
    }
}
