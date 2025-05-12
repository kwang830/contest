package egovframework.let.uss.umt.service;

/**
 * 일반회원VO클래스로서 일반회원관리 비지니스로직 처리용 항목을 구성한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * "<pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  JJY            최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
 *
 * </pre>"
 */
public class MberManageVO extends UserDefaultVO{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/** 이전비밀번호 - 비밀번호 변경시 사용*/
    private String oldPassword = "";
    
    /**
	 * 사용자고유아이디
	 */
	private String uniqId="";
	/**
	 * 사용자 유형
	 */
	private String userTy;
	/**
	 * 주소
	 */
	private String adres;
	/**
	 * 상세주소
	 */
	private String detailAdres;
	/**
	 * 끝전화번호
	 */
	private String endTelno;
	/**
	 * 팩스번호
	 */
	private String mberFxnum;
	/**
	 * 그룹 ID
	 */
	private String groupId;
	/**
	 * 주민등록번호
	 */
	private String ihidnum;
	/**
	 * 성별코드
	 */
	private String sexdstnCode;
	/**
	 * 회원 ID
	 */
	private String mberId;
	/**
	 * 회원명
	 */
	private String mberNm;
	/**
	 * 회원상태
	 */
	private String mberSttus;
	/**
	 * 지역번호
	 */
	private String areaNo;
	/**
	 * 중간전화번호
	 */
	private String middleTelno;
	/**
	 * 핸드폰번호
	 */
	private String moblphonNo;
	/**
	 * 비밀번호
	 */
	private String password;
	/**
	 * 비밀번호 정답
	 */
	private String passwordCnsr;
	/**
	 * 비밀번호 힌트
	 */
	private String passwordHint;
	/**
	 * 가입 일자
	 */
	private String sbscrbDe;
	/**
	 * 우편번호
	 */
	private String zip;
	/**
	 * 이메일주소
	 */
	private String mberEmailAdres;

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
	 * 임시비밀번호여부
	 */
	private String tempPwdYn = "";
	/**
	 * 프로필경로
	 */
	private String imgUrl = "";
	/**
	 * 잠김여부
	 */
	private String lockYn = "";
	/**
	 * 잠김횟수
	 */
	private long lockCnt = 0L;


	/**
	 * oldPassword attribute 값을  리턴한다.
	 * @return String
	 */
	public String getOldPassword() {
		return oldPassword;
	}
	/**
	 * oldPassword attribute 값을 설정한다.
	 * @param oldPassword String
	 */
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	/**
	 * uniqId attribute 값을  리턴한다.
	 * @return String
	 */
	public String getUniqId() {
		return uniqId;
	}
	/**
	 * uniqId attribute 값을 설정한다.
	 * @param uniqId String
	 */
	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}
	/**
	 * userTy attribute 값을  리턴한다.
	 * @return String
	 */
	public String getUserTy() {
		return userTy;
	}
	/**
	 * userTy attribute 값을 설정한다.
	 * @param userTy String
	 */
	public void setUserTy(String userTy) {
		this.userTy = userTy;
	}
	/**
	 * adres attribute 값을  리턴한다.
	 * @return String
	 */
	public String getAdres() {
		return adres;
	}
	/**
	 * adres attribute 값을 설정한다.
	 * @param adres String
	 */
	public void setAdres(String adres) {
		this.adres = adres;
	}
	/**
	 * detailAdres attribute 값을  리턴한다.
	 * @return String
	 */
	public String getDetailAdres() {
		return detailAdres;
	}
	/**
	 * detailAdres attribute 값을 설정한다.
	 * @param detailAdres String
	 */
	public void setDetailAdres(String detailAdres) {
		this.detailAdres = detailAdres;
	}
	/**
	 * endTelno attribute 값을  리턴한다.
	 * @return String
	 */
	public String getEndTelno() {
		return endTelno;
	}
	/**
	 * endTelno attribute 값을 설정한다.
	 * @param endTelno String
	 */
	public void setEndTelno(String endTelno) {
		this.endTelno = endTelno;
	}
	/**
	 * mberFxnum attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMberFxnum() {
		return mberFxnum;
	}
	/**
	 * mberFxnum attribute 값을 설정한다.
	 * @param mberFxnum String
	 */
	public void setMberFxnum(String mberFxnum) {
		this.mberFxnum = mberFxnum;
	}
	/**
	 * groupId attribute 값을  리턴한다.
	 * @return String
	 */
	public String getGroupId() {
		return groupId;
	}
	/**
	 * groupId attribute 값을 설정한다.
	 * @param groupId String
	 */
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	/**
	 * ihidnum attribute 값을  리턴한다.
	 * @return String
	 */
	public String getIhidnum() {
		return ihidnum;
	}
	/**
	 * ihidnum attribute 값을 설정한다.
	 * @param ihidnum String
	 */
	public void setIhidnum(String ihidnum) {
		this.ihidnum = ihidnum;
	}
	/**
	 * sexdstnCode attribute 값을  리턴한다.
	 * @return String
	 */
	public String getSexdstnCode() {
		return sexdstnCode;
	}
	/**
	 * sexdstnCode attribute 값을 설정한다.
	 * @param sexdstnCode String
	 */
	public void setSexdstnCode(String sexdstnCode) {
		this.sexdstnCode = sexdstnCode;
	}
	/**
	 * mberId attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMberId() {
		return mberId;
	}
	/**
	 * mberId attribute 값을 설정한다.
	 * @param mberId String
	 */
	public void setMberId(String mberId) {
		this.mberId = mberId;
	}
	/**
	 * mberNm attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMberNm() {
		return mberNm;
	}
	/**
	 * mberNm attribute 값을 설정한다.
	 * @param mberNm String
	 */
	public void setMberNm(String mberNm) {
		this.mberNm = mberNm;
	}
	/**
	 * mberSttus attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMberSttus() {
		return mberSttus;
	}
	/**
	 * mberSttus attribute 값을 설정한다.
	 * @param mberSttus String
	 */
	public void setMberSttus(String mberSttus) {
		this.mberSttus = mberSttus;
	}
	/**
	 * areaNo attribute 값을  리턴한다.
	 * @return String
	 */
	public String getAreaNo() {
		return areaNo;
	}
	/**
	 * areaNo attribute 값을 설정한다.
	 * @param areaNo String
	 */
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}
	/**
	 * middleTelno attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMiddleTelno() {
		return middleTelno;
	}
	/**
	 * middleTelno attribute 값을 설정한다.
	 * @param middleTelno String
	 */
	public void setMiddleTelno(String middleTelno) {
		this.middleTelno = middleTelno;
	}
	/**
	 * moblphonNo attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMoblphonNo() {
		return moblphonNo;
	}
	/**
	 * moblphonNo attribute 값을 설정한다.
	 * @param moblphonNo String
	 */
	public void setMoblphonNo(String moblphonNo) {
		this.moblphonNo = moblphonNo;
	}
	/**
	 * password attribute 값을  리턴한다.
	 * @return String
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * password attribute 값을 설정한다.
	 * @param password String
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * passwordCnsr attribute 값을  리턴한다.
	 * @return String
	 */
	public String getPasswordCnsr() {
		return passwordCnsr;
	}
	/**
	 * passwordCnsr attribute 값을 설정한다.
	 * @param passwordCnsr String
	 */
	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}
	/**
	 * passwordHint attribute 값을  리턴한다.
	 * @return String
	 */
	public String getPasswordHint() {
		return passwordHint;
	}
	/**
	 * passwordHint attribute 값을 설정한다.
	 * @param passwordHint String
	 */
	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}
	/**
	 * sbscrbDe attribute 값을  리턴한다.
	 * @return String
	 */
	public String getSbscrbDe() {
		return sbscrbDe;
	}
	/**
	 * sbscrbDe attribute 값을 설정한다.
	 * @param sbscrbDe String
	 */
	public void setSbscrbDe(String sbscrbDe) {
		this.sbscrbDe = sbscrbDe;
	}
	/**
	 * zip attribute 값을  리턴한다.
	 * @return String
	 */
	public String getZip() {
		return zip;
	}
	/**
	 * zip attribute 값을 설정한다.
	 * @param zip String
	 */
	public void setZip(String zip) {
		this.zip = zip;
	}
	/**
	 * mberEmailAdres attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMberEmailAdres() {
		return mberEmailAdres;
	}
	/**
	 * mberEmailAdres attribute 값을 설정한다.
	 * @param mberEmailAdres String
	 */
	public void setMberEmailAdres(String mberEmailAdres) {
		this.mberEmailAdres = mberEmailAdres;
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
	 * tempPwdYn attribute를 리턴한다.
	 * @return the tempPwdYn
	 */
	public String getTempPwdYn() {
		return tempPwdYn;
	}

	/**
	 * tempPwdYn attribute 값을 설정한다.
	 * @param tempPwdYn the tempPwdYn to set
	 */
	public void setTempPwdYn(String tempPwdYn) {
		this.tempPwdYn = tempPwdYn;
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
	 * lockYn attribute를 리턴한다.
	 * @return the lockYn
	 */
	public String getLockYn() {
		return lockYn;
	}

	/**
	 * lockYn attribute 값을 설정한다.
	 * @param lockYn the lockYn to set
	 */
	public void setLockYn(String lockYn) {
		this.lockYn = lockYn;
	}

	/**
	 * lockCnt attribute를 리턴한다.
	 * @return the lockCnt
	 */
	public long getLockCnt() {
		return lockCnt;
	}

	/**
	 * lockCnt attribute 값을 설정한다.
	 * @param lockCnt the lockCnt to set
	 */
	public void setLockCnt(long lockCnt) {
		this.lockCnt = lockCnt;
	}
}