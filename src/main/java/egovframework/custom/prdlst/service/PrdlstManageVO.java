package egovframework.custom.prdlst.service;

/**
 * 업무사용자VO클래스로서 업무사용자관리 비지니스로직 처리용 항목을 구성한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *
 * </pre>
 */
public class PrdlstManageVO extends PrdlstDefaultVO{

	private static final long serialVersionUID = 3640820362821490939L;

	/** PK_KEY */
	private String pkKey = "";
	public String getPkKey() {
		return pkKey;
	}
	public void setPkKey(String pkKey) {
		this.pkKey = pkKey;
	}
	/** 진흥번호 */
	private String jhNo = "";	
	/** 메이커 */
	private String maker = "";
	/** 모델 */
	private String model = "";
	/** 파트 */
	private String part = "";
	/** emark */
	private String emark = "";
	/** 도면출처 */
	private String drwOrigin = "";
	/** 제작가능여부 */
	private String mnfctPosblAt = "";
	/** BP신규개발여부 */
	private String newDevlopAt = "";	
	/** 박스수량 */
	private String boxQy = "";
	/** 무게 */
	private String wt = "";
	/** 사이즈 */
	private String size = "";
	/** 외부박스사이즈 */
	private String outboxSize = "";	
	public String getOutboxSize() {
		return outboxSize;
	}
	public void setOutboxSize(String outboxSize) {
		this.outboxSize = outboxSize;
	}
	public String getPrdlstCode() {
		return prdlstCode;
	}
	public void setPrdlstCode(String prdlstCode) {
		this.prdlstCode = prdlstCode;
	}
	/** 제조원가(유심 */
	private String mnfcturPrmpcShim = "";
	/** 제조원가(무심 */
	private String mnfcturPrmpc = "";
	/** 메모 */
	private String memo = "";
	/** 사용구분 */
	private String useSe = "";
	/** 품목코드 */
	private String prdlstCode = "";	

	/** SUB ------------------ */
	/** 순번 */
	private String subSn = "";
	/** 메이커 */
	private String subMaker = "";
	/** 모델 */
	private String subModel = "";
	/** 파트 */
	private String subPart = "";
	/** 년도 */
	private String subYear = "";
	/** Application */
	private String subApplication = "";
	/** 번호구분 */
	private String subNoSe = "";
	/** sub_품번 */
	private String subNo = "";
	/** sub_품번 코드 */
	private String subNoSeCode = "";	
	/** sub 삭제대상 */
	private String chkDelAll = "";	
	
	/** 검색 ------------------ */
	/** 품목코드 */
	private String srcPrdlstCode = "";
	private String srcPrdlstNo = "";
	private String srcUseSe = "";
	private String srcMaker = "";
	private String srcModel = "";
	private String srcPart = "";
		
	/** 첨부파일ID */
	private String atchFileId;

	private String selectOnly = "";
	public String getDmlType() {
		return dmlType;
	}
	public void setDmlType(String dmlType) {
		this.dmlType = dmlType;
	}
	private String dmlType = "";
	
	
	
	public String getSelectOnly() {
		return selectOnly;
	}
	public void setSelectOnly(String selectOnly) {
		this.selectOnly = selectOnly;
	}
	public String getSrcPrdlstCode() {
		return srcPrdlstCode;
	}
	public void setSrcPrdlstCode(String srcPrdlstCode) {
		this.srcPrdlstCode = srcPrdlstCode;
	}
	public String getSrcPrdlstNo() {
		return srcPrdlstNo;
	}
	public void setSrcPrdlstNo(String srcPrdlstNo) {
		this.srcPrdlstNo = srcPrdlstNo;
	}
	public String getSrcUseSe() {
		return srcUseSe;
	}
	public void setSrcUseSe(String srcUseSe) {
		this.srcUseSe = srcUseSe;
	}
	public String getSrcMaker() {
		return srcMaker;
	}
	public void setSrcMaker(String srcMaker) {
		this.srcMaker = srcMaker;
	}
	public String getSrcModel() {
		return srcModel;
	}
	public void setSrcModel(String srcModel) {
		this.srcModel = srcModel;
	}
	public String getSrcPart() {
		return srcPart;
	}
	public void setSrcPart(String srcPart) {
		this.srcPart = srcPart;
	}
	public String getChkDelAll() {
		return chkDelAll;
	}
	public void setChkDelAll(String chkDelAll) {
		this.chkDelAll = chkDelAll;
	}
	public String getSubNoSeCode() {
		return subNoSeCode;
	}
	public void setSubNoSeCode(String subNoSeCode) {
		this.subNoSeCode = subNoSeCode;
	}
	/** 코드 ------------------ */
	/**
	 * 성별코드
	 */
	private String sexdstnCode;    
	/*
	 * 코드ID
	 */
    private String codeId = "";

    /*
     * 코드ID명
     */
    private String codeIdNm = "";

    /*
     * 코드
     */
	private String code = "";

	/*
	 * 코드명
	 */
    private String codeNm = "";

    /*
     * 코드설명
     */
    private String codeDc = "";
	/*
	 * 코드명
	 */
    private String codeGroup = "";
    /*
     * 사용여부
     */
    private String useAt = "";

    /*
     * 정렬
     */
    private String orderBy = "";
    
    public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	/*
     * 최초등록자ID
     */
    private String frstRegisterId = "";

    /*
     * 최종수정자ID
     */
    private String lastUpdusrId   = "";
	
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCodeIdNm() {
		return codeIdNm;
	}
	public void setCodeIdNm(String codeIdNm) {
		this.codeIdNm = codeIdNm;
	}
	public String getCodeDc() {
		return codeDc;
	}
	public void setCodeDc(String codeDc) {
		this.codeDc = codeDc;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	public String getFrstRegisterId() {
		return frstRegisterId;
	}
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	public String getSexdstnCode() {
		return sexdstnCode;
	}

	public void setSexdstnCode(String sexdstnCode) {
		this.sexdstnCode = sexdstnCode;
	}	
	
	public String getJhNo() {
		return jhNo;
	}
	public void setJhNo(String jhNo) {
		this.jhNo = jhNo;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getEmark() {
		return emark;
	}
	public void setEmark(String emark) {
		this.emark = emark;
	}
	public String getDrwOrigin() {
		return drwOrigin;
	}
	public void setDrwOrigin(String drwOrigin) {
		this.drwOrigin = drwOrigin;
	}
	public String getMnfctPosblAt() {
		return mnfctPosblAt;
	}
	public void setMnfctPosblAt(String mnfctPosblAt) {
		this.mnfctPosblAt = mnfctPosblAt;
	}
	public String getNewDevlopAt() {
		return newDevlopAt;
	}
	public void setNewDevlopAt(String newDevlopAt) {
		this.newDevlopAt = newDevlopAt;
	}
	public String getBoxQy() {
		return boxQy;
	}
	public void setBoxQy(String boxQy) {
		this.boxQy = boxQy;
	}
	public String getWt() {
		return wt;
	}
	public void setWt(String wt) {
		this.wt = wt;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getMnfcturPrmpcShim() {
		return mnfcturPrmpcShim;
	}
	public void setMnfcturPrmpcShim(String mnfcturPrmpcShim) {
		this.mnfcturPrmpcShim = mnfcturPrmpcShim;
	}
	public String getMnfcturPrmpc() {
		return mnfcturPrmpc;
	}
	public void setMnfcturPrmpc(String mnfcturPrmpc) {
		this.mnfcturPrmpc = mnfcturPrmpc;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getUseSe() {
		return useSe;
	}
	public void setUseSe(String useSe) {
		this.useSe = useSe;
	}
	public String getSubSn() {
		return subSn;
	}
	public void setSubSn(String subSn) {
		this.subSn = subSn;
	}
	public String getSubMaker() {
		return subMaker;
	}
	public void setSubMaker(String subMaker) {
		this.subMaker = subMaker;
	}
	public String getSubModel() {
		return subModel;
	}
	public void setSubModel(String subModel) {
		this.subModel = subModel;
	}
	public String getSubPart() {
		return subPart;
	}
	public void setSubPart(String subPart) {
		this.subPart = subPart;
	}
	public String getSubYear() {
		return subYear;
	}
	public void setSubYear(String subYear) {
		this.subYear = subYear;
	}
	public String getSubApplication() {
		return subApplication;
	}
	public void setSubApplication(String subApplication) {
		this.subApplication = subApplication;
	}
	public String getSubNoSe() {
		return subNoSe;
	}
	public void setSubNoSe(String subNoSe) {
		this.subNoSe = subNoSe;
	}
	public String getSubNo() {
		return subNo;
	}
	public void setSubNo(String subNo) {
		this.subNo = subNo;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getCodeGroup() {
		return codeGroup;
	}
	public void setCodeGroup(String codeGroup) {
		this.codeGroup = codeGroup;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	
	
	

}