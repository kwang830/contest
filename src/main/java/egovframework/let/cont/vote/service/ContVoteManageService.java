package egovframework.let.cont.vote.service;

import egovframework.let.cont.vote.service.ContVoteVO;

import java.util.Map;

public interface ContVoteManageService {

	/**
	 * 조건에 맞는 평가그룹 목록을 조회 한다.
	 * @return
	 *
	 * @param contVoteVO
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectContVoteAdminGroupList(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 조건에 맞는 평가게시물 목록을 조회 한다.
	 * @return
	 *
	 * @param contVoteVO
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectContVoteAdminBBSList(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 조건에 맞는 평가점수 목록을 조회 한다.
	 * @return
	 *
	 * @param contVoteVO
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectAdminVotesAjax(ContVoteVO contVoteVO)
			throws Exception;

	/**
	 * 평가항목을 등록 한다.
	 *
	 * @param contVoteVO
	 * @exception Exception Exception
	 */
	public int insertAdminVotes(ContVoteVO contVoteVO)
			throws Exception;
}