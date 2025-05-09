package egovframework.let.cont.vote.service;

import java.util.Map;

public interface ContVoteManageService {

	/**
	 * 조건에 맞는 평가그룹 목록을 조회 한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectContVoteAdminGroupList(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 조건에 맞는 평가게시물 목록을 조회 한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectContVoteAdminBBSList(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 조건에 맞는 평가점수 목록을 조회 한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectAdminVotesAjax(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 조건에 맞는 평가결과 목록을 조회 한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectAdminVoteRsltsAjax(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 평가항목을 등록 한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @exception Exception Exception
	 */
	public int insertAdminVotes(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 평가점수(별점)을 등록 한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @exception Exception Exception
	 */
	public int insertVoteScore(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 평가점수(별점)을 조회 한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @exception Exception Exception
	 */
	public int selectVoteScore(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 평가항목을 등록 한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @exception Exception Exception
	 */
	public int insertAdminValtSta(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 평가 의견을 조회 한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @exception Exception Exception
	 */
	public String selectVoteValtOpnn(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 조건에 맞는 평가순위 목록을 조회 한다.
	 *
	 * @param contVoteVO contVoteVO
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectContVoteRankList(ContVoteVO contVoteVO)
			throws Exception;
}