package egovframework.let.uss.olh.qna.service;

import java.util.List;

/**
 *
 * Q&A를 처리하는 서비스 클래스
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
public interface EgovQnaManageService {

    /**
	 * Q&A 글을 조회한다.
	 */
	QnaManageVO selectQnaListDetail(QnaManageVO vo) throws Exception;

	/**
	 * Q&A 조회수를 수정한다.
	 */
    void updateQnaInqireCo(QnaManageVO vo) throws Exception;

    /**
	 * Q&A 글 목록을 조회한다.
	 */
	List<?> selectQnaList(QnaManageDefaultVO searchVO) throws Exception;

    /**
	 * Q&A 글 총 갯수를 조회한다.
	 */
    int selectQnaListTotCnt(QnaManageDefaultVO searchVO);

	/**
	 * Q&A 글을 등록한다.
	 */
    void insertQnaCn(QnaManageVO vo) throws Exception;

    /**
	 * Q&A  작성비밀번호를 확인한다.
	 */
    int selectQnaPasswordConfirmCnt(QnaManageVO vo);

	/**
	 * Q&A 글을 수정한다.
	 */
    void updateQnaCn(QnaManageVO vo) throws Exception;

	/**
	 * Q&A 글을 삭제한다.
	 */
    void deleteQnaCn(QnaManageVO vo) throws Exception;


    /**
	 * Q&A 답변 글을 조회한다.
	 */
	QnaManageVO selectQnaAnswerListDetail(QnaManageVO vo) throws Exception;


    /**
	 * Q&A 답변 글 목록을 조회한다.
	 */
	List<?> selectQnaAnswerList(QnaManageDefaultVO searchVO) throws Exception;

    /**
	 * Q&A 답변 글 총 갯수를 조회한다.
	 */
    int selectQnaAnswerListTotCnt(QnaManageDefaultVO searchVO);

	/**
	 * Q&A 답변 글을 수정한다.
	 */
    void updateQnaCnAnswer(QnaManageVO vo) throws Exception;


}

