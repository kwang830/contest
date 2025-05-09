package egovframework.let.cop.bbs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.bbs.service.Board;
import egovframework.let.cop.bbs.service.BoardVO;

@Repository("EgovArticleDAO")
public class EgovArticleDAO extends EgovComAbstractDAO {

	public List<?> selectArticleList(BoardVO boardVO) {
		return list("BBSArticle.selectArticleList", boardVO);
	}

	public int selectArticleListCnt(BoardVO boardVO) {
		return (Integer)selectOne("BBSArticle.selectArticleListCnt", boardVO);
	}

	public List<?> selectArticleListPicks(BoardVO boardVO) {
		return list("BBSArticle.selectArticleListPicks", boardVO);
	}

	public int selectArticleListPicksCnt(BoardVO boardVO) {
		return (Integer)selectOne("BBSArticle.selectArticleListPicksCnt", boardVO);
	}

	public List<?> selectArticleListScore(BoardVO boardVO) {
		return list("BBSArticle.selectArticleListScore", boardVO);
	}

	public int selectArticleListScoreCnt(BoardVO boardVO) {
		return (Integer)selectOne("BBSArticle.selectArticleListScoreCnt", boardVO);
	}

	public List<?> selectArticleListBoard(BoardVO boardVO) {
		return list("BBSArticle.selectArticleListBoard", boardVO);
	}

	public List<?> selectDeptLoginList(BoardVO boardVO) {
		return list("BBSArticle.selectDeptLoginList", boardVO);
	}

	public List<?> selectDeptBbsList(BoardVO boardVO) {
		return list("BBSArticle.selectDeptBbsList", boardVO);
	}

	public List<?> selectUserLoginList(BoardVO boardVO) {
		return list("BBSArticle.selectUserLoginList", boardVO);
	}

	public int selectMaxInqireCo(BoardVO boardVO) {
		return (Integer)selectOne("BBSArticle.selectMaxInqireCo", boardVO);
	}

	public void updateInqireCo(BoardVO boardVO) {
		update("BBSArticle.updateInqireCo", boardVO);
	}

	public BoardVO selectArticleDetail(BoardVO boardVO) {
		return (BoardVO) selectOne("BBSArticle.selectArticleDetail", boardVO);
	}

	public void replyArticle(Board board) {
		insert("BBSArticle.replyArticle", board);
	}

	public void insertArticle(Board board) {
		insert("BBSArticle.insertArticle", board);
	}

	public void insertArticleLog(Board board) {
		insert("BBSArticle.insertArticleLog", board);
	}

	public void updateArticle(Board board) {
		update("BBSArticle.updateArticle", board);
	}

	public void deleteArticle(Board board) {
		update("BBSArticle.deleteArticle", board);

	}

	public List<BoardVO> selectNoticeArticleList(BoardVO boardVO) {
		return (List<BoardVO>) list("BBSArticle.selectNoticeArticleList", boardVO);
	}

	public List<?> selectGuestArticleList(BoardVO vo) {
		return list("BBSArticle.selectGuestArticleList", vo);
	}

	public int selectGuestArticleListCnt(BoardVO vo) {
		return (Integer)selectOne("BBSArticle.selectGuestArticleListCnt", vo);
	}

}
