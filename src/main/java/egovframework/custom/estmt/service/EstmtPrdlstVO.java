package egovframework.custom.estmt.service;

public class EstmtPrdlstVO extends EstmtDefaultVO{

	private static final long serialVersionUID = 3640820362821490939L;

	private String srcPrdlstCode = ""; //
	private String srcPart = ""; // 
	private String srcMaker = ""; // 
	private String srcPrdlstNo = ""; // 
	private String srcModel = ""; //
	private String srcUseSe = "";
	
	/** 검색 ------------------ */
	/** 품목코드 */	
	
	public String getSrcPrdlstCode() {
		return srcPrdlstCode;
	}
	public void setSrcPrdlstCode(String srcPrdlstCode) {
		this.srcPrdlstCode = srcPrdlstCode;
	}
	public String getSrcPart() {
		return srcPart;
	}
	public void setSrcPart(String srcPart) {
		this.srcPart = srcPart;
	}
	public String getSrcMaker() {
		return srcMaker;
	}
	public void setSrcMaker(String srcMaker) {
		this.srcMaker = srcMaker;
	}
	public String getSrcPrdlstNo() {
		return srcPrdlstNo;
	}
	public void setSrcPrdlstNo(String srcPrdlstNo) {
		this.srcPrdlstNo = srcPrdlstNo;
	}
	public String getSrcModel() {
		return srcModel;
	}
	public void setSrcModel(String srcModel) {
		this.srcModel = srcModel;
	}
	public String getSrcUseSe() {
		return srcUseSe;
	}
	public void setSrcUseSe(String srcUseSe) {
		this.srcUseSe = srcUseSe;
	}

	

}