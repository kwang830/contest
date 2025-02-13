package egovframework.com.cop.bbs.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.fdl.cmmn.exception.FdlException;

public interface EgovArticleService {

	Map<String, Object> selectArticleList(BoardVO boardVO);
	
	Map<String, Object> selectArticleListPicks(BoardVO boardVO);
	
	Map<String, Object> selectArticleListScore(BoardVO boardVO);
	
	Map<String, Object> selectArticleListBoard(BoardVO boardVO);
	
	Map<String, Object> selectDeptLoginList(BoardVO boardVO);
	
	Map<String, Object> selectDeptBbsList(BoardVO boardVO);
	
	Map<String, Object> selectUserLoginList(BoardVO boardVO);

	BoardVO selectArticleDetail(BoardVO boardVO);

	void insertArticle(Board board) throws FdlException;
	
	void insertArticleLog(Board board) throws FdlException;

	void updateArticle(Board board);

	void deleteArticle(Board board) throws Exception;

	List<BoardVO> selectNoticeArticleList(BoardVO boardVO);

	Map<String, Object> selectGuestArticleList(BoardVO vo);

}
