package egovframework.let.cop.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 게시물에 대한 데이터 처리 모델 클래스
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009.03.06
 * @version 1.0
 *
 *
 *   개정이력(Modification Information)
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  이삼섭          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
 *  
 *
 */
@SuppressWarnings("serial")
public class Board implements Serializable {

	/**
	 * 게시물 첨부파일 아이디
	 */
	private String atchFileId = "";
	/**
	 * 게시판 아이디
	 */
	private String bbsId = "";
	/**
	 * 최초등록자 아이디
	 */
	private String frstRegisterId = "";
	/**
	 * 최초등록시점
	 */
	private String frstRegisterPnttm = "";
	/**
	 * 최종수정자 아이디
	 */
	private String lastUpdusrId = "";
	/**
	 * 최종수정시점
	 */
	private String lastUpdusrPnttm = "";
	/**
	 * 게시시작일
	 */
	private String ntceBgnde = "";
	/**
	 * 게시종료일
	 */
	private String ntceEndde = "";
	/**
	 * 게시자 아이디
	 */
	private String ntcrId = "";
	/**
	 * 게시자명
	 */
	private String ntcrNm = "";
	/**
	 * 게시물 내용
	 */
	private String nttCn = "";
	/**
	 * 게시물 아이디
	 */
	private long nttId = 0L;
	/**
	 * 게시물 번호
	 */
	private long nttNo = 0L;
	/**
	 * 게시물 제목
	 */
	private String nttSj = "";
	/**
	 * 부모글번호
	 */
	private String parnts = "0";
	/**
	 * 패스워드
	 */
	private String password = "";
	/**
	 * 조회수
	 */
	private int inqireCo = 0;
	/**
	 * 답장여부
	 */
	private String replyAt = "";
	/**
	 * 답장위치
	 */
	private String replyLc = "0";
	/**
	 * 정렬순서
	 */
	private long sortOrdr = 0L;
	/**
	 * 사용여부
	 */
	private String useAt = "";
	/**
	 * 게시 종료일
	 */
	private String ntceEnddeView = ""; 
	/**
	 * 게시 시작일
	 */
	private String ntceBgndeView = "";

	/**
	 * 비밀글 여부
	 */
	private String secretAt = "";

	/**
	 * 공지사항 여부
	 */
	private String noticeAt = "";

	/**
	 * 제목 Bold 여부
	 */
	private String sjBoldAt = "";
	/**
	 * 부서코드
	 */
	private String deptCode = "";
	/**
	 * 호칭 코드
	 */
	private String titleCode = "";
	/**
	 * 직책코드
	 */
	private String positionCode = "";
	/**
	 * 직급코드
	 */
	private String rankCode = "";
	/**
	 * 부서명 Full
	 */
	private String deptNmF = "";
	/**
	 * 부서명 Single
	 */
	private String deptNmS = "";
	/**
	 * 호칭
	 */
	private String titleNm = "";
	/**
	 * 직책
	 */
	private String positionNm = "";
	/**
	 * 직급
	 */
	private String rankNm = "";
	/**
	 * 추천수
	 */
	private String picksCo = "";
	/**
	 * 합계점수
	 */
	private String scoreS = "";
	/**
	 * 평점점수
	 */
	private String scoreA = "";
	/**
	 * 팀명
	 */
	private String teamNm = "";
	/**
	 * 이미지경로
	 */
	private String imgUrl = "";
	/**
	 * 선택이미지
	 */
	private String selectImg = "";

	/**
	 * 평가점수
	 */
	private String score = "";
	/**
	 * 평가수
	 */
	private String scoreCnt = "";
	/**
	 * 댓글수
	 */
	private String commentCnt = "";
	/**
	 * 평가자
	 */
	private String exmnId = "";
	/**
	 * 댓글번호
	 */
	private long answerNo = 0L;
	/**
	 * 평가댓글
	 */
	private String answer = "";
	

	/**
	 * atchFileId attribute를 리턴한다.
	 * @return the atchFileId
	 */
	public String getAtchFileId() {
		return atchFileId;
	}

	/**
	 * atchFileId attribute 값을 설정한다.
	 * @param atchFileId the atchFileId to set
	 */
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	/**
	 * bbsId attribute를 리턴한다.
	 * @return the bbsId
	 */
	public String getBbsId() {
		return bbsId;
	}

	/**
	 * bbsId attribute 값을 설정한다.
	 * @param bbsId the bbsId to set
	 */
	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	/**
	 * frstRegisterId attribute를 리턴한다.
	 * @return the frstRegisterId
	 */
	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	/**
	 * frstRegisterId attribute 값을 설정한다.
	 * @param frstRegisterId the frstRegisterId to set
	 */
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	/**
	 * frstRegisterPnttm attribute를 리턴한다.
	 * @return the frstRegisterPnttm
	 */
	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	/**
	 * frstRegisterPnttm attribute 값을 설정한다.
	 * @param frstRegisterPnttm the frstRegisterPnttm to set
	 */
	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}

	/**
	 * lastUpdusrId attribute를 리턴한다.
	 * @return the lastUpdusrId
	 */
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	/**
	 * lastUpdusrId attribute 값을 설정한다.
	 * @param lastUpdusrId the lastUpdusrId to set
	 */
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	/**
	 * lastUpdusrPnttm attribute를 리턴한다.
	 * @return the lastUpdusrPnttm
	 */
	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}

	/**
	 * lastUpdusrPnttm attribute 값을 설정한다.
	 * @param lastUpdusrPnttm the lastUpdusrPnttm to set
	 */
	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}

	/**
	 * ntceBgnde attribute를 리턴한다.
	 * @return the ntceBgnde
	 */
	public String getNtceBgnde() {
		return ntceBgnde;
	}

	/**
	 * ntceBgnde attribute 값을 설정한다.
	 * @param ntceBgnde the ntceBgnde to set
	 */
	public void setNtceBgnde(String ntceBgnde) {
		this.ntceBgnde = ntceBgnde;
	}

	/**
	 * ntceEndde attribute를 리턴한다.
	 * @return the ntceEndde
	 */
	public String getNtceEndde() {
		return ntceEndde;
	}

	/**
	 * ntceEndde attribute 값을 설정한다.
	 * @param ntceEndde the ntceEndde to set
	 */
	public void setNtceEndde(String ntceEndde) {
		this.ntceEndde = ntceEndde;
	}

	/**
	 * ntcrId attribute를 리턴한다.
	 * @return the ntcrId
	 */
	public String getNtcrId() {
		return ntcrId;
	}

	/**
	 * ntcrId attribute 값을 설정한다.
	 * @param ntcrId the ntcrId to set
	 */
	public void setNtcrId(String ntcrId) {
		this.ntcrId = ntcrId;
	}

	/**
	 * ntcrNm attribute를 리턴한다.
	 * @return the ntcrNm
	 */
	public String getNtcrNm() {
		return ntcrNm;
	}

	/**
	 * ntcrNm attribute 값을 설정한다.
	 * @param ntcrNm the ntcrNm to set
	 */
	public void setNtcrNm(String ntcrNm) {
		this.ntcrNm = ntcrNm;
	}

	/**
	 * nttCn attribute를 리턴한다.
	 * @return the nttCn
	 */
	public String getNttCn() {
		return nttCn;
	}

	/**
	 * nttCn attribute 값을 설정한다.
	 * @param nttCn the nttCn to set
	 */
	public void setNttCn(String nttCn) {
		this.nttCn = nttCn;
	}

	/**
	 * nttId attribute를 리턴한다.
	 * @return the nttId
	 */
	public long getNttId() {
		return nttId;
	}

	/**
	 * nttId attribute 값을 설정한다.
	 * @param nttId the nttId to set
	 */
	public void setNttId(long nttId) {
		this.nttId = nttId;
	}

	/**
	 * nttNo attribute를 리턴한다.
	 * @return the nttNo
	 */
	public long getNttNo() {
		return nttNo;
	}

	/**
	 * nttNo attribute 값을 설정한다.
	 * @param nttNo the nttNo to set
	 */
	public void setNttNo(long nttNo) {
		this.nttNo = nttNo;
	}

	/**
	 * nttSj attribute를 리턴한다.
	 * @return the nttSj
	 */
	public String getNttSj() {
		return nttSj;
	}

	/**
	 * nttSj attribute 값을 설정한다.
	 * @param nttSj the nttSj to set
	 */
	public void setNttSj(String nttSj) {
		this.nttSj = nttSj;
	}

	/**
	 * parnts attribute를 리턴한다.
	 * @return the parnts
	 */
	public String getParnts() {
		return parnts;
	}

	/**
	 * parnts attribute 값을 설정한다.
	 * @param parnts the parnts to set
	 */
	public void setParnts(String parnts) {
		this.parnts = parnts;
	}

	/**
	 * password attribute를 리턴한다.
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * password attribute 값을 설정한다.
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * inqireCo attribute를 리턴한다.
	 * @return the inqireCo
	 */
	public int getInqireCo() {
		return inqireCo;
	}

	/**
	 * inqireCo attribute 값을 설정한다.
	 * @param inqireCo the inqireCo to set
	 */
	public void setInqireCo(int inqireCo) {
		this.inqireCo = inqireCo;
	}

	/**
	 * replyAt attribute를 리턴한다.
	 * @return the replyAt
	 */
	public String getReplyAt() {
		return replyAt;
	}

	/**
	 * replyAt attribute 값을 설정한다.
	 * @param replyAt the replyAt to set
	 */
	public void setReplyAt(String replyAt) {
		this.replyAt = replyAt;
	}

	/**
	 * replyLc attribute를 리턴한다.
	 * @return the replyLc
	 */
	public String getReplyLc() {
		return replyLc;
	}

	/**
	 * replyLc attribute 값을 설정한다.
	 * @param replyLc the replyLc to set
	 */
	public void setReplyLc(String replyLc) {
		this.replyLc = replyLc;
	}

	/**
	 * sortOrdr attribute를 리턴한다.
	 * @return the sortOrdr
	 */
	public long getSortOrdr() {
		return sortOrdr;
	}

	/**
	 * sortOrdr attribute 값을 설정한다.
	 * @param sortOrdr the sortOrdr to set
	 */
	public void setSortOrdr(long sortOrdr) {
		this.sortOrdr = sortOrdr;
	}

	/**
	 * useAt attribute를 리턴한다.
	 * @return the useAt
	 */
	public String getUseAt() {
		return useAt;
	}

	/**
	 * useAt attribute 값을 설정한다.
	 * @param useAt the useAt to set
	 */
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	/**
	 * ntceEnddeView attribute를 리턴한다.
	 * @return the ntceEnddeView
	 */
	public String getNtceEnddeView() {
		return ntceEnddeView;
	}

	/**
	 * ntceEnddeView attribute 값을 설정한다.
	 * @param ntceEnddeView the ntceEnddeView to set
	 */
	public void setNtceEnddeView(String ntceEnddeView) {
		this.ntceEnddeView = ntceEnddeView;
	}

	/**
	 * ntceBgndeView attribute를 리턴한다.
	 * @return the ntceBgndeView
	 */
	public String getNtceBgndeView() {
		return ntceBgndeView;
	}

	/**
	 * ntceBgndeView attribute 값을 설정한다.
	 * @param ntceBgndeView the ntceBgndeView to set
	 */
	public void setNtceBgndeView(String ntceBgndeView) {
		this.ntceBgndeView = ntceBgndeView;
	}

	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

	/**
	 * secretAt attribute를 리턴한다.
	 * @return the secretAt
	 */
	public String getSecretAt() {
		return secretAt;
	}

	/**
	 * secretAt attribute 값을 설정한다.
	 * @param secretAt the secretAt to set
	 */
	public void setSecretAt(String secretAt) {
		this.secretAt = secretAt;
	}

	/**
	 * noticeAt attribute를 리턴한다.
	 * @return the noticeAt
	 */
	public String getNoticeAt() {
		return noticeAt;
	}

	/**
	 * noticeAt attribute 값을 설정한다.
	 * @param noticeAt the noticeAt to set
	 */
	public void setNoticeAt(String noticeAt) {
		this.noticeAt = noticeAt;
	}


	/**
	 * sjBoldAt attribute를 리턴한다.
	 * @return the sjBoldAt
	 */
	public String getSjBoldAt() {
		return sjBoldAt;
	}

	/**
	 * sjBoldAt attribute 값을 설정한다.
	 * @param sjBoldAt the sjBoldAt to set
	 */
	public void setSjBoldAt(String sjBoldAt) {
		this.sjBoldAt = sjBoldAt;
	}

	/**
	 * deptCode attribute를 리턴한다.
	 * @return the deptCode
	 */
	public String getDeptCode() {
		return deptCode;
	}

	/**
	 * deptCode attribute 값을 설정한다.
	 * @param deptCode the deptCode to set
	 */
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	/**
	 * titleCode attribute를 리턴한다.
	 * @return the titleCode
	 */
	public String getTitleCode() {
		return titleCode;
	}

	/**
	 * titleCode attribute 값을 설정한다.
	 * @param titleCode the titleCode to set
	 */
	public void setTitleCode(String titleCode) {
		this.titleCode = titleCode;
	}

	/**
	 * positionCode attribute를 리턴한다.
	 * @return the positionCode
	 */
	public String getPositionCode() {
		return positionCode;
	}

	/**
	 * positionCode attribute 값을 설정한다.
	 * @param positionCode the positionCode to set
	 */
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	/**
	 * rankCode attribute를 리턴한다.
	 * @return the rankCode
	 */
	public String getRankCode() {
		return rankCode;
	}

	/**
	 * rankCode attribute 값을 설정한다.
	 * @param rankCode the rankCode to set
	 */
	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}

	/**
	 * deptNmF attribute를 리턴한다.
	 * @return the deptNmF
	 */
	public String getDeptNmF() {
		return deptNmF;
	}

	/**
	 * deptNmF attribute 값을 설정한다.
	 * @param deptNmF the deptNmF to set
	 */
	public void setDeptNmF(String deptNmF) {
		this.deptNmF = deptNmF;
	}

	/**
	 * deptNmS attribute를 리턴한다.
	 * @return the deptNmS
	 */
	public String getDeptNmS() {
		return deptNmS;
	}

	/**
	 * deptNmS attribute 값을 설정한다.
	 * @param deptNmS the deptNmS to set
	 */
	public void setDeptNmS(String deptNmS) {
		this.deptNmS = deptNmS;
	}

	/**
	 * titleNm attribute를 리턴한다.
	 * @return the titleNm
	 */
	public String getTitleNm() {
		return titleNm;
	}

	/**
	 * titleNm attribute 값을 설정한다.
	 * @param titleNm the titleNm to set
	 */
	public void setTitleNm(String titleNm) {
		this.titleNm = titleNm;
	}

	/**
	 * positionNm attribute를 리턴한다.
	 * @return the positionNm
	 */
	public String getPositionNm() {
		return positionNm;
	}

	/**
	 * positionNm attribute 값을 설정한다.
	 * @param positionNm the positionNm to set
	 */
	public void setPositionNm(String positionNm) {
		this.positionNm = positionNm;
	}

	/**
	 * rankNm attribute를 리턴한다.
	 * @return the rankNm
	 */
	public String getRankNm() {
		return rankNm;
	}

	/**
	 * rankNm attribute 값을 설정한다.
	 * @param rankNm the rankNm to set
	 */
	public void setRankNm(String rankNm) {
		this.rankNm = rankNm;
	}

	/**
	 * picksCo attribute를 리턴한다.
	 * @return the picksCo
	 */
	public String getPicksCo() {
		return picksCo;
	}

	/**
	 * picksCo attribute 값을 설정한다.
	 * @param picksCo the picksCo to set
	 */
	public void setPicksCO(String picksCo) {
		this.picksCo = picksCo;
	}

	/**
	 * scoreS attribute를 리턴한다.
	 * @return the scoreS
	 */
	public String getScoreS() {
		return scoreS;
	}

	/**
	 * scoreS attribute 값을 설정한다.
	 * @param scoreS the scoreS to set
	 */
	public void setScoreS(String scoreS) {
		this.scoreS = scoreS;
	}

	/**
	 * scoreA attribute를 리턴한다.
	 * @return the scoreA
	 */
	public String getScoreA() {
		return scoreA;
	}

	/**
	 * scoreA attribute 값을 설정한다.
	 * @param scoreA the scoreA to set
	 */
	public void setScoreA(String scoreA) {
		this.scoreA = scoreA;
	}

	/**
	 * teamNm attribute를 리턴한다.
	 * @return the teamNm
	 */
	public String getTeamNm() {
		return teamNm;
	}

	/**
	 * teamNm attribute 값을 설정한다.
	 * @param teamNm the teamNm to set
	 */
	public void setTeamNm(String teamNm) {
		this.teamNm = teamNm;
	}

	/**
	 * imgUrl attribute를 리턴한다.
	 * @return the imgUrl
	 */
	public String getImgUrl() {
		return imgUrl;
	}

	/**
	 * imgUrl attribute 값을 설정한다.
	 * @param imgUrl the imgUrl to set
	 */
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	/**
	 * selectImg attribute를 리턴한다.
	 * @return the selectImg
	 */
	public String getSelectImg() {
		return selectImg;
	}

	/**
	 * selectImg attribute 값을 설정한다.
	 * @param selectImg the selectImg to set
	 */
	public void setSelectImg(String selectImg) {
		this.selectImg = selectImg;
	}

	/**
	 * score attribute를 리턴한다.
	 * @return the score
	 */
	public String getScore() {
		return score;
	}

	/**
	 * score attribute 값을 설정한다.
	 * @param score the score to set
	 */
	public void setScore(String score) {
		this.score = score;
	}

	/**
	 * scoreCnt attribute를 리턴한다.
	 * @return the scoreCnt
	 */
	public String getScoreCnt() {
		return scoreCnt;
	}

	/**
	 * scoreCnt attribute 값을 설정한다.
	 * @param scoreCnt the scoreCnt to set
	 */
	public void setScoreCnt(String scoreCnt) {
		this.scoreCnt = scoreCnt;
	}

	/**
	 * commentCnt attribute를 리턴한다.
	 * @return the commentCnt
	 */
	public String getCommentCnt() {
		return commentCnt;
	}

	/**
	 * commentCnt attribute 값을 설정한다.
	 * @param commentCnt the commentCnt to set
	 */
	public void setCommentCnt(String commentCnt) {
		this.commentCnt = commentCnt;
	}

	/**
	 * exmnId attribute를 리턴한다.
	 * @return the exmnId
	 */
	public String getExmnId() {
		return exmnId;
	}

	/**
	 * exmnId attribute 값을 설정한다.
	 * @param exmnId the exmnId to set
	 */
	public void setExmnId(String exmnId) {
		this.exmnId = exmnId;
	}

	/**
	 * answerNo attribute를 리턴한다.
	 * @return the answerNo
	 */
	public long getAnswerNo() {
		return answerNo;
	}

	/**
	 * answerNo attribute 값을 설정한다.
	 * @param answerNo the answerNo to set
	 */
	public void setAnswerNo(long answerNo) {
		this.answerNo = answerNo;
	}

	/**
	 * answer attribute를 리턴한다.
	 * @return the answer
	 */
	public String getAnswer() {
		return answer;
	}

	/**
	 * answer attribute 값을 설정한다.
	 * @param answer the answer to set
	 */
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
