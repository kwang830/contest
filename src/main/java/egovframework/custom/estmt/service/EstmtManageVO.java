package egovframework.custom.estmt.service;

public class EstmtManageVO extends EstmtDefaultVO{

	private static final long serialVersionUID = 3640820362821490939L;

	private String dmlType = ""; // 입력타입
	private String manageNo = ""; // 관리번호
	private String manageSn = ""; // 관리순번
	
	private String docNo = ""; // 문서번호
	private String docSj = ""; // 문서제목
	private String registDe = ""; // 등록일자
	private String cntrctDe = ""; // 계약일자
	private String progrsSttus = ""; //	진행상태
	
	private String subSn = ""; // 거래처순번
	private String bcncNm = ""; // 거래처명칭
	private String bcncCode = ""; // 거래처코드
	private String bcncCharger = ""; //	거래처담당자
	private String cttpc = ""; // 연락처
	private String email = ""; // 이메일
	private String jobCharger = ""; // 업무담당자
	private String adres = ""; // 주소
	private String memo = ""; // 메모
	private String mainYn = ""; // 대표정보
		
	private String prdlstSubSn = ""; // 품목순번
	private String prdlstDirectYn = ""; // 직접입력여부
	private String prdlstJhno = ""; // jhno
	private String prdlstNm = ""; // 품목
	private String prdlstNoSe = ""; // 번호구분
	private String prdlstSubNo = ""; //	Sub품번
	private String prdlstModel = ""; //	model
	private String prdlstMaker = ""; // maker
	private String prdlstPart = ""; // part
	private String prdlstShim = ""; // shim
	private String prdlstUntpc = ""; // 단가
	private String prdlstProfitRt = ""; // 이익률
	private String prdlstQy = ""; // 수량
	private String prdlstAmount = ""; // 금액
	private String totAmount = ""; // 금액
	
	private String estmtMemo = ""; // 메모
	
	private String searchBcncNm = ""; // 검색 거래처명칭
	private String searchBcncCode = ""; // 검색 거래처코드
	private String cmbCharger = ""; // combo 담당자
	private String searchCharger = ""; // 검색 담당자
	private String cmbDe = ""; // combo 날짜
	private String searchFromDe = ""; // 검색 날짜 From
	private String searchToDe = ""; // 검색 날짜 To
	private String cmbNo = ""; // combo 번호
	private String searchNo = ""; // 검색 번호
	
	/** 첨부파일ID */
	private String atchFileId;

	public String getSearchBcncNm() {
		return searchBcncNm;
	}

	public void setSearchBcncNm(String searchBcncNm) {
		this.searchBcncNm = searchBcncNm;
	}

	public String getSearchBcncCode() {
		return searchBcncCode;
	}

	public void setSearchBcncCode(String searchBcncCode) {
		this.searchBcncCode = searchBcncCode;
	}

	public String getCmbCharger() {
		return cmbCharger;
	}

	public void setCmbCharger(String cmbCharger) {
		this.cmbCharger = cmbCharger;
	}

	public String getSearchCharger() {
		return searchCharger;
	}

	public void setSearchCharger(String searchCharger) {
		this.searchCharger = searchCharger;
	}

	public String getCmbDe() {
		return cmbDe;
	}

	public void setCmbDe(String cmbDe) {
		this.cmbDe = cmbDe;
	}

	public String getSearchFromDe() {
		return searchFromDe;
	}

	public void setSearchFromDe(String searchFromDe) {
		this.searchFromDe = searchFromDe;
	}

	public String getSearchToDe() {
		return searchToDe;
	}

	public void setSearchToDe(String searchToDe) {
		this.searchToDe = searchToDe;
	}

	public String getCmbNo() {
		return cmbNo;
	}

	public void setCmbNo(String cmbNo) {
		this.cmbNo = cmbNo;
	}

	public String getSearchNo() {
		return searchNo;
	}

	public void setSearchNo(String searchNo) {
		this.searchNo = searchNo;
	}

	/** sub 삭제대상 */
	private String chkDelAll = "";
	private String chkDelPrdlstAll = "";	
	

	
	public String getChkDelAll() {
		return chkDelAll;
	}

	public void setChkDelAll(String chkDelAll) {
		this.chkDelAll = chkDelAll;
	}

	public String getChkDelPrdlstAll() {
		return chkDelPrdlstAll;
	}

	public void setChkDelPrdlstAll(String chkDelPrdlstAll) {
		this.chkDelPrdlstAll = chkDelPrdlstAll;
	}

	public String getDmlType() {
		return dmlType;
	}

	public void setDmlType(String dmlType) {
		this.dmlType = dmlType;
	}

	public String getManageNo() {
		return manageNo;
	}

	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}

	public String getManageSn() {
		return manageSn;
	}

	public void setManageSn(String manageSn) {
		this.manageSn = manageSn;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getDocSj() {
		return docSj;
	}

	public void setDocSj(String docSj) {
		this.docSj = docSj;
	}

	public String getRegistDe() {
		return registDe;
	}

	public void setRegistDe(String registDe) {
		this.registDe = registDe;
	}

	public String getCntrctDe() {
		return cntrctDe;
	}

	public void setCntrctDe(String cntrctDe) {
		this.cntrctDe = cntrctDe;
	}

	public String getProgrsSttus() {
		return progrsSttus;
	}

	public void setProgrsSttus(String progrsSttus) {
		this.progrsSttus = progrsSttus;
	}

	public String getSubSn() {
		return subSn;
	}

	public void setSubSn(String subSn) {
		this.subSn = subSn;
	}

	public String getBcncNm() {
		return bcncNm;
	}

	public void setBcncNm(String bcncNm) {
		this.bcncNm = bcncNm;
	}

	public String getBcncCode() {
		return bcncCode;
	}

	public void setBcncCode(String bcncCode) {
		this.bcncCode = bcncCode;
	}

	public String getBcncCharger() {
		return bcncCharger;
	}

	public void setBcncCharger(String bcncCharger) {
		this.bcncCharger = bcncCharger;
	}

	public String getCttpc() {
		return cttpc;
	}

	public void setCttpc(String cttpc) {
		this.cttpc = cttpc;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJobCharger() {
		return jobCharger;
	}

	public void setJobCharger(String jobCharger) {
		this.jobCharger = jobCharger;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getMainYn() {
		return mainYn;
	}

	public void setMainYn(String mainYn) {
		this.mainYn = mainYn;
	}

	public String getPrdlstSubSn() {
		return prdlstSubSn;
	}

	public void setPrdlstSubSn(String prdlstSubSn) {
		this.prdlstSubSn = prdlstSubSn;
	}

	public String getPrdlstDirectYn() {
		return prdlstDirectYn;
	}

	public void setPrdlstDirectYn(String prdlstDirectYn) {
		this.prdlstDirectYn = prdlstDirectYn;
	}

	public String getPrdlstJhno() {
		return prdlstJhno;
	}

	public void setPrdlstJhno(String prdlstJhno) {
		this.prdlstJhno = prdlstJhno;
	}

	public String getPrdlstNm() {
		return prdlstNm;
	}

	public void setPrdlstNm(String prdlstNm) {
		this.prdlstNm = prdlstNm;
	}

	public String getPrdlstNoSe() {
		return prdlstNoSe;
	}

	public void setPrdlstNoSe(String prdlstNoSe) {
		this.prdlstNoSe = prdlstNoSe;
	}

	public String getPrdlstSubNo() {
		return prdlstSubNo;
	}

	public void setPrdlstSubNo(String prdlstSubNo) {
		this.prdlstSubNo = prdlstSubNo;
	}

	public String getPrdlstModel() {
		return prdlstModel;
	}

	public void setPrdlstModel(String prdlstModel) {
		this.prdlstModel = prdlstModel;
	}

	public String getPrdlstMaker() {
		return prdlstMaker;
	}

	public void setPrdlstMaker(String prdlstMaker) {
		this.prdlstMaker = prdlstMaker;
	}

	public String getPrdlstPart() {
		return prdlstPart;
	}

	public void setPrdlstPart(String prdlstPart) {
		this.prdlstPart = prdlstPart;
	}

	public String getPrdlstShim() {
		return prdlstShim;
	}

	public void setPrdlstShim(String prdlstShim) {
		this.prdlstShim = prdlstShim;
	}

	public String getPrdlstUntpc() {
		return prdlstUntpc;
	}

	public void setPrdlstUntpc(String prdlstUntpc) {
		this.prdlstUntpc = prdlstUntpc;
	}

	public String getPrdlstProfitRt() {
		return prdlstProfitRt;
	}

	public void setPrdlstProfitRt(String prdlstProfitRt) {
		this.prdlstProfitRt = prdlstProfitRt;
	}

	public String getPrdlstQy() {
		return prdlstQy;
	}

	public void setPrdlstQy(String prdlstQy) {
		this.prdlstQy = prdlstQy;
	}

	public String getPrdlstAmount() {
		return prdlstAmount;
	}

	public void setPrdlstAmount(String prdlstAmount) {
		this.prdlstAmount = prdlstAmount;
	}



	public String getTotAmount() {
		return totAmount;
	}

	public void setTotAmount(String totAmount) {
		this.totAmount = totAmount;
	}

	public String getEstmtMemo() {
		return estmtMemo;
	}

	public void setEstmtMemo(String estmtMemo) {
		this.estmtMemo = estmtMemo;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	

}