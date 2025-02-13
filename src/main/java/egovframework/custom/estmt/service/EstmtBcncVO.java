package egovframework.custom.estmt.service;

public class EstmtBcncVO {

	private static final long serialVersionUID = 3640820362821490939L;

	private String bcncNm = ""; //	거래처명칭
	private String bcncCharger = ""; //	거래처담당자
	private String cttpc = ""; //	연락처
	private String email = ""; //	이메일
	private String jobCharger = ""; //	업무담당자
	private String adres = ""; //	주소
	private String memo = ""; //	메모
	private String registDe = ""; //	등록일자
	private String cntrctDe = ""; //	계약일자
	private String progrsSttus = ""; //	진행상태	
	
	public String getBcncNm() {
		return bcncNm;
	}
	public void setBcncNm(String bcncNm) {
		this.bcncNm = bcncNm;
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
	
	

}