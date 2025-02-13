package egovframework.com.cop.cmt.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.cmt.service.Comment;
import egovframework.com.cop.cmt.service.CommentVO;
import egovframework.custom.estmt.service.EstmtManageVO;

@Repository("EgovArticleCommentDAO")
public class EgovArticleCommentDAO extends EgovComAbstractDAO{

	public List<?> selectArticleCommentList(CommentVO commentVO) {
		return list("ArticleComment.selectArticleCommentList", commentVO);
	}

	public int selectArticleCommentListCnt(CommentVO commentVO) {
		return (Integer)selectOne("ArticleComment.selectArticleCommentListCnt", commentVO);
	}
	
	public int selectArticleCommentListCntW(CommentVO commentVO) {
		return (Integer)selectOne("ArticleComment.selectArticleCommentListCntW", commentVO);
	}
	
	public int selectArticleCommentListCntT(CommentVO commentVO) {
		return (Integer)selectOne("ArticleComment.selectArticleCommentListCntT", commentVO);
	}	

	public void insertArticleComment(Comment comment) {
		insert("ArticleComment.insertArticleComment", comment);
	}

	public void deleteArticleComment(CommentVO commentVO) {
		update("ArticleComment.deleteArticleComment", commentVO);
	}

	public CommentVO selectArticleCommentDetail(CommentVO commentVO) {
		return (CommentVO) selectOne("ArticleComment.selectArticleCommentDetail", commentVO);
	}

	public void updateArticleComment(Comment comment) {
		update("ArticleComment.updateArticleComment", comment);
	}	
	
	public int checkArticleCommentNo(CommentVO commentVO) {		
		return (Integer)selectOne("ArticleComment.checkArticleCommentNo", commentVO);
	}	
	
}
