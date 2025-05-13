package egovframework.let.cop.bbs.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.let.cop.bbs.service.Board;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSManageService;
import egovframework.let.utl.fcc.service.EgovDateUtil;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 게시물 관리를 위한 서비스 구현 클래스
 * @author 공통 서비스 개발팀 한성곤
 * @since 2009.03.19
 * @version 1.0
 */
@Service("EgovBBSManageService")
public class EgovBBSManageServiceImpl extends EgovAbstractServiceImpl implements EgovBBSManageService {

	@Resource(name = "BBSManageDAO")
	private BBSManageDAO bbsMngDAO;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	/**
	 * 게시물 한 건을 삭제 한다.
	 *
	 */
	public void deleteBoardArticle(Board board) throws Exception {
		FileVO fvo = new FileVO();

		fvo.setAtchFileId(board.getAtchFileId());

		board.setNttSj("이 글은 작성자에 의해서 삭제되었습니다.");

		bbsMngDAO.deleteBoardArticle(board);

		if (!"".equals(fvo.getAtchFileId()) || fvo.getAtchFileId() != null) {
			fileService.deleteAllFileInf(fvo);
		}
	}

	/**
	 * 게시판에 게시물 또는 답변 게시물을 등록 한다.
	 *
	 */
	public void insertBoardArticle(Board board) throws Exception {
		// SORT_ORDR는 부모글의 소트 오더와 같게, NTT_NO는 순서대로 부여

		if ("Y".equals(board.getReplyAt())) {
			// 답글인 경우 1. Parnts를 세팅, 2.Parnts의 sortOrdr을 현재글의 sortOrdr로 가져오도록, 3.nttNo는 현재 게시판의 순서대로
			// replyLc는 부모글의 ReplyLc + 1

			@SuppressWarnings("unused")
			long tmpNttId = 0L; // 답글 게시물 ID

			tmpNttId = bbsMngDAO.replyBoardArticle(board);

		} else {
			// 답글이 아닌경우 Parnts = 0, replyLc는 = 0, sortOrdr = nttNo(Query에서 처리)
			board.setParnts("0");
			board.setReplyLc("0");
			board.setReplyAt("N");

			bbsMngDAO.insertBoardArticle(board);
		}
	}

	/**
	 * 게시물 대하여 상세 내용을 조회 한다.
	 *
	 */
	public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception {
		if (boardVO.isPlusCount()) {
			int iniqireCo = bbsMngDAO.selectMaxInqireCo(boardVO);

			boardVO.setInqireCo(iniqireCo);
			bbsMngDAO.updateInqireCo(boardVO);
		}

		return bbsMngDAO.selectBoardArticle(boardVO);
	}

	/**
	 * 게시물 대하여 상세 내용을 조회 한다.
	 *
	 */
	public BoardVO selectBoardVoteArticle(BoardVO boardVO) throws Exception {
		if (boardVO.isPlusCount()) {
			int iniqireCo = bbsMngDAO.selectMaxInqireCo(boardVO);

			boardVO.setInqireCo(iniqireCo);
			bbsMngDAO.updateInqireCo(boardVO);
		}

		return bbsMngDAO.selectBoardVoteArticle(boardVO);
	}

	/**
	 * 조건에 맞는 게시물 목록을 조회 한다.
	 *
	 */
	public Map<String, Object> selectBoardArticles(BoardVO boardVO, String attrbFlag) throws Exception {

		List<BoardVO> list = bbsMngDAO.selectBoardArticleList(boardVO);
		List<BoardVO> result = new ArrayList<BoardVO>();

		if ("BBSA01".equals(attrbFlag)) {
			// 유효게시판 임
			String today = EgovDateUtil.getToday();

			BoardVO vo;
			Iterator<BoardVO> iter = list.iterator();
			while (iter.hasNext()) {
				vo = (BoardVO)iter.next();

				if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
					if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
						// 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
						vo.setIsExpired("Y");
					}
				}
				result.add(vo);
			}
		} else {
			result = list;
		}

		int cnt = bbsMngDAO.selectBoardArticleListCnt(boardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 조건에 맞는 게시물 목록을 조회 한다.
	 *
	 */
	public Map<String, Object> selectBoardVoteArticles(BoardVO boardVO, String attrbFlag) throws Exception {

		List<BoardVO> list = bbsMngDAO.selectBoardVoteArticleList(boardVO);
		List<BoardVO> result = new ArrayList<BoardVO>();

		if ("BBSA01".equals(attrbFlag)) {
			// 유효게시판 임
			String today = EgovDateUtil.getToday();

			BoardVO vo;
			Iterator<BoardVO> iter = list.iterator();
			while (iter.hasNext()) {
				vo = (BoardVO)iter.next();

				if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
					if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
						// 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
						vo.setIsExpired("Y");
					}
				}
				result.add(vo);
			}
		} else {
			result = list;
		}

		int cnt = bbsMngDAO.selectBoardArticleListCnt(boardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 게시물 한 건의 내용을 수정 한다.
	 *
	 */
	public void updateBoardArticle(Board board) throws Exception {
		bbsMngDAO.updateBoardArticle(board);
	}

	/**
	 * 방명록 내용을 삭제 한다.
	 *
	 */
	public void deleteGuestList(BoardVO boardVO) throws Exception {
		bbsMngDAO.deleteGuestList(boardVO);
	}

	/**
	 * 방명록에 대한 목록을 조회 한다.
	 *
	 */
	public Map<String, Object> selectGuestList(BoardVO boardVO) throws Exception {
		List<BoardVO> result = bbsMngDAO.selectGuestList(boardVO);
		int cnt = bbsMngDAO.selectGuestListCnt(boardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 방명록에 대한 패스워드를 조회 한다.
	 *
	 * @param board board
	 * @throws Exception Exception
	 */
	public String getPasswordInf(Board board) throws Exception {
		return bbsMngDAO.getPasswordInf(board);
	}

	/**
	 * 첨부파일 조회수를 조회 한다.
	 *
	 * @param board board
	 * @throws Exception Exception
	 */
	public String selectBoardArticleFileRdcnt(Board board) throws Exception {
		return bbsMngDAO.selectBoardArticleFileRdcnt(board);
	}

	/**
	 * 홈페이지 방문수를 조회 한다.
	 *
	 * @param board board
	 * @throws Exception Exception
	 */
	public String selectBoardArticleVisitRdcnt(Board board) throws Exception {
		return bbsMngDAO.selectBoardArticleVisitRdcnt(board);
	}

	/**
	 * 게시판에 댓글을 등록 한다.
	 *
	 * @param board board
	 * @throws Exception Exception
	 */
	public void insertBoardComment(Board board) throws Exception {
		bbsMngDAO.insertBoardComment(board);
	}

	/**
	 * 게시판에 댓글을 수정 한다.
	 *
	 * @param board board
	 * @throws Exception Exception
	 */
	public void updateBoardComment(Board board) throws Exception {
		bbsMngDAO.updateBoardComment(board);
	}

	/**
	 * 댓글 목록을 조회 한다.
	 *
	 * @param boardVO boardVO
	 * @throws Exception Exception
	 */
	public Map<String, Object> selectBoardComments(BoardVO boardVO) throws Exception {

		List<BoardVO> result = bbsMngDAO.selectBoardCommentList(boardVO);
		int cnt = bbsMngDAO.selectBoardCommentCnt(boardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 댓글 목록을 조회 한다.
	 *
	 * @param boardVO boardVO
	 * @throws Exception Exception
	 */
	public Map<String, Object> selectBoardCommentMore(BoardVO boardVO) throws Exception {

		List<BoardVO> result = bbsMngDAO.selectBoardCommentMoreList(boardVO);
		int cnt = bbsMngDAO.selectBoardCommentMoreCnt(boardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 평점 집계 목록을 조회 한다.
	 *
	 * @param boardVO boardVO
	 * @throws Exception Exception
	 */
	public Map<String, Object> selectBoardScores(BoardVO boardVO) throws Exception {

		List<BoardVO> result = bbsMngDAO.selectBoardScoreList(boardVO);
		int cnt = bbsMngDAO.selectBoardScoreCnt(boardVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));
		return map;
	}
}
