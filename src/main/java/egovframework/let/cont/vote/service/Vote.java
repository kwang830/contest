package egovframework.let.cont.vote.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;


@SuppressWarnings("serial")
public class Vote implements Serializable {

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
	 * 평가자
	 */
	private String exmnId = "";
	/**
	 * 평가자명
	 */
	private String exmnNm = "";
	/**
	 * 평가관리제목
	 */
	private String valtMngmTtl = "";
	/**
	 * 평가관리번호
	 */
	private String valtMngmNo = "";
	/**
	 * 평가문항관리번호
	 */
	private String valtQsitMnno = "";
	/**
	 * 문항번호
	 */
	private String qsitNo = "";
	/**
	 * 평가점수
	 */
	private String valtScr = "";

	/**
	 * 평가문항전송문자열
	 */
	private String valtQsitSendStr = "";

	/**
	 * 평가점수 (별점)
	 */
	private String score = "";

	/**
	 * 평가수 (별점)
	 */
	private String scoreCnt = "";

	/**
	 * 평가의견
	 */
	private String valtOpnn = "";

	/**
	 * 평가점수합계
	 */
	private String sumScr = "";

	/**
	 * 평균점수
	 */
	private String avgScr = "";

	/**
	 * 평가점수합계
	 */
	private String valtCnt = "";

	/**
	 * 합계점수순위
	 */
	private String totScrRank = "";

	/**
	 * 평균점수순위
	 */
	private String avgScrRank = "";

	/**
	 * 팀명
	 */
	private String teamNm = "";

	/**
	 * 선택이미지
	 */
	private String selectImg = "";

	/**
	 * 이미지경로
	 */
	private String imgUrl = "";
	
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
	 * exmnNm attribute를 리턴한다.
	 * @return the exmnNm
	 */
	public String getExmnNm() {
		return exmnNm;
	}

	/**
	 * exmnNm attribute 값을 설정한다.
	 * @param exmnNm the exmnNm to set
	 */
	public void setExmnNm(String exmnNm) {
		this.exmnNm = exmnNm;
	}

	/**
	 * valtMngmTtl attribute를 리턴한다.
	 * @return the valtMngmTtl
	 */
	public String getValtMngmTtl() {
		return valtMngmTtl;
	}

	/**
	 * valtMngmTtl attribute 값을 설정한다.
	 * @param valtMngmTtl the valtMngmTtl to set
	 */
	public void setValtMngmTtl(String valtMngmTtl) {
		this.valtMngmTtl = valtMngmTtl;
	}

	/**
	 * valtMngmNo attribute를 리턴한다.
	 * @return the valtMngmNo
	 */
	public String getValtMngmNo() {
		return valtMngmNo;
	}

	/**
	 * valtMngmNo attribute 값을 설정한다.
	 * @param valtMngmNo the valtMngmNo to set
	 */
	public void setValtMngmNo(String valtMngmNo) {
		this.valtMngmNo = valtMngmNo;
	}

	/**
	 * valtQsitMnno attribute를 리턴한다.
	 * @return the valtQsitMnno
	 */
	public String getValtQsitMnno() {
		return valtQsitMnno;
	}

	/**
	 * valtQsitMnno attribute 값을 설정한다.
	 * @param valtQsitMnno the valtQsitMnno to set
	 */
	public void setValtQsitMnno(String valtQsitMnno) {
		this.valtQsitMnno = valtQsitMnno;
	}

	/**
	 * qsitNo attribute를 리턴한다.
	 * @return the qsitNo
	 */
	public String getQsitNo() {
		return qsitNo;
	}

	/**
	 * qsitNo attribute 값을 설정한다.
	 * @param qsitNo the qsitNo to set
	 */
	public void setQsitNo(String qsitNo) {
		this.qsitNo = qsitNo;
	}

	/**
	 * valtScr attribute를 리턴한다.
	 * @return the valtScr
	 */
	public String getValtScr() {
		return valtScr;
	}

	/**
	 * valtScr attribute 값을 설정한다.
	 * @param valtScr the valtScr to set
	 */
	public void setValtScr(String valtScr) {
		this.valtScr = valtScr;
	}

	/**
	 * valtQsitSendStr attribute를 리턴한다.
	 * @return the valtQsitSendStr
	 */
	public String getValtQsitSendStr() {
		return valtQsitSendStr;
	}

	/**
	 * valtQsitSendStr attribute 값을 설정한다.
	 * @param valtQsitSendStr the valtQsitSendStr to set
	 */
	public void setValtQsitSendStr(String valtQsitSendStr) {
		this.valtQsitSendStr = valtQsitSendStr;
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
	 * valtOpnn attribute를 리턴한다.
	 * @return the valtOpnn
	 */
	public String getValtOpnn() {
		return valtOpnn;
	}

	/**
	 * valtOpnn attribute 값을 설정한다.
	 * @param valtOpnn the valtOpnn to set
	 */
	public void setValtOpnn(String valtOpnn) {
		this.valtOpnn = valtOpnn;
	}

	/**
	 * sumScr attribute를 리턴한다.
	 * @return the sumScr
	 */
	public String getSumScr() {
		return sumScr;
	}

	/**
	 * sumScr attribute 값을 설정한다.
	 * @param sumScr the sumScr to set
	 */
	public void setSumScr(String sumScr) {
		this.sumScr = sumScr;
	}

	/**
	 * avgScr attribute를 리턴한다.
	 * @return the avgScr
	 */
	public String getAvgScr() {
		return avgScr;
	}

	/**
	 * avgScr attribute 값을 설정한다.
	 * @param avgScr the avgScr to set
	 */
	public void setAvgScr(String avgScr) {
		this.avgScr = avgScr;
	}

	/**
	 * valtCnt attribute를 리턴한다.
	 * @return the valtCnt
	 */
	public String getValtCnt() {
		return valtCnt;
	}

	/**
	 * valtCnt attribute 값을 설정한다.
	 * @param valtCnt the valtCnt to set
	 */
	public void setValtCnt(String valtCnt) {
		this.valtCnt = valtCnt;
	}

	/**
	 * totScrRank attribute를 리턴한다.
	 * @return the totScrRank
	 */
	public String getTotScrRank() {
		return totScrRank;
	}

	/**
	 * totScrRank attribute 값을 설정한다.
	 * @param totScrRank the totScrRank to set
	 */
	public void setTotScrRank(String totScrRank) {
		this.totScrRank = totScrRank;
	}

	/**
	 * avgScrRank attribute를 리턴한다.
	 * @return the avgScrRank
	 */
	public String getAvgScrRank() {
		return avgScrRank;
	}

	/**
	 * avgScrRank attribute 값을 설정한다.
	 * @param avgScrRank the avgScrRank to set
	 */
	public void setAvgScrRank(String avgScrRank) {
		this.avgScrRank = avgScrRank;
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

}