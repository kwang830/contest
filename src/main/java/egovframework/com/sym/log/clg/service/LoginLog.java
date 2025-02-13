package egovframework.com.sym.log.clg.service;

import java.io.Serializable;

public class LoginLog implements Serializable {

	private static final long serialVersionUID = 3492444929272088373L;

	/** 로그ID */
	private String logId;

	/** 사용자ID */
	private String loginId;

	/** 사용자명 */
	private String loginNm;

	/** 접속IP */
	private String loginIp;
	
	/** 사용자 유형 */
	private String userSe;	

	/** 접속방식 */
	private String loginMthd;

	/** 에러발생여부 */
	private String errOccrrAt;

	/** 에러코드 */
	private String errorCode;

	/** 생성일시 */
	private String creatDt;

	/** 사용자 PC정보 */
	private String chkMobile;
	
	/** 사용자 Browser정보 */
	private String chkBrowser;
	
	
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
	 * 검색시작일
	 */
	private String searchBgnDe = "";
	/**
	 * 검색조건
	 */
	private String searchCnd = "";
	/**
	 * 검색종료일
	 */
	private String searchEndDe = "";
	/**
	 * 검색단어
	 */
	private String searchWrd = "";
	/**
	 * 정렬순서(DESC,ASC)
	 */
	private String sortOrdr = "";

	/** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;

    /** rowNo  */
	private int rowNo = 0;

	/**
	 * 검색시작일_화면용
	 */
	private String searchBgnDeView = "";//2011.09.14

	/**
	 * 검색종료일_화면용
	 */
	private String searchEndDeView = "";//2011.09.14

	public String getSearchEndDeView() {
		return searchEndDeView;
	}
	public void setSearchEndDeView(String searchEndDeView) {
		this.searchEndDeView = searchEndDeView;
	}
	public String getSearchBgnDeView() {
		return searchBgnDeView;
	}
	public void setSearchBgnDeView(String searchBgnDeView) {
		this.searchBgnDeView = searchBgnDeView;
	}

	public String getLogId() {
		return logId;
	}

	public void setLogId(String logId) {
		this.logId = logId;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	
	public String getUserSe() {
		return userSe;
	}

	public void setUserSe(String userSe) {
		this.userSe = userSe;
	}	

	public String getLoginMthd() {
		return loginMthd;
	}

	public void setLoginMthd(String loginMthd) {
		this.loginMthd = loginMthd;
	}

	public String getErrOccrrAt() {
		return errOccrrAt;
	}

	public void setErrOccrrAt(String errOccrrAt) {
		this.errOccrrAt = errOccrrAt;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getCreatDt() {
		return creatDt;
	}

	public void setCreatDt(String creatDt) {
		this.creatDt = creatDt;
	}

	public String getSearchBgnDe() {
		return searchBgnDe;
	}

	public void setSearchBgnDe(String searchBgnDe) {
		this.searchBgnDe = searchBgnDe;
	}

	public String getSearchCnd() {
		return searchCnd;
	}

	public void setSearchCnd(String searchCnd) {
		this.searchCnd = searchCnd;
	}

	public String getSearchEndDe() {
		return searchEndDe;
	}

	public void setSearchEndDe(String searchEndDe) {
		this.searchEndDe = searchEndDe;
	}

	public String getSearchWrd() {
		return searchWrd;
	}

	public void setSearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
	}

	public String getSortOrdr() {
		return sortOrdr;
	}

	public void setSortOrdr(String sortOrdr) {
		this.sortOrdr = sortOrdr;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getRowNo() {
		return rowNo;
	}

	public void setRowNo(int rowNo) {
		this.rowNo = rowNo;
	}

	public String getLoginNm() {
		return loginNm;
	}

	public void setLoginNm(String loginNm) {
		this.loginNm = loginNm;
	}

	/**
	 * @return the chkMobile
	 */
	public String getChkMobile() {
		return chkMobile;
	}
	/**
	 * @param chkMobile the chkMobile to set
	 */
	public void setChkMobile(String chkMobile) {
		this.chkMobile = chkMobile;
	}
	/**
	 * @return the chkBrowser
	 */
	public String getChkBrowser() {
		return chkBrowser;
	}
	/**
	 * @param chkBrowser the chkBrowser to set
	 */
	public void setChkBrowser(String chkBrowser) {
		this.chkBrowser = chkBrowser;
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
}
