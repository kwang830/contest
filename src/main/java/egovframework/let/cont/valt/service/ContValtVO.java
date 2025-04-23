package egovframework.let.cont.valt.service;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ContValtVO implements Serializable {
    /** 검색시작일 */
    private String searchBgnDe = "";

    /** 검색조건 */
    private String searchCnd = "";

    /** 검색종료일 */
    private String searchEndDe = "";

    /** 검색단어 */
    private String searchWrd = "";

    /** 정렬순서(DESC,ASC) */
    private long sortOrdr = 0L;

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

    /** 레코드 번호 */
    private int rowNo = 0;
    /**
     * 최초등록자 아이디
     */
    private String frstRegisterId = "";
    /**
     * 최초등록시점
     */
    private String frstRegistPnttm = "";
    /**
     * 최종수정자 아이디
     */
    private String lastUpdusrId = "";
    /**
     * 최종수정시점
     */
    private String lastUpdtPnttm = "";
    /**
     * 평가관리번호
     */
    private String valtMngmNo = "";
    /**
     * 평가관리번호들
     */
    private String valtMngmNos = "";
    /**
     * 평가문항관리번호
     */
    private String valtQsitMnno = "";
    /**
     * 기준년
     */
    private String baseYy = "";
    /**
     * 차수
     */
    private String sqn = "";
    /**
     * 평가관리제목
     */
    private String valtMngmTtl = "";
    /**
     * 평가관리설명
     */
    private String valtMngmDesc = "";
    /**
     * 사용여부
     */
    private String useAt = "";

    private String exmnId = "";

    private String exmnIds = "";

    /**
     * 게시글 아이디
     */
    private String nttId = "";

    /**
     * 게시글 아이디
     */
    private String nttIds = "";

    /**
     * nttId attribute를 리턴한다.
     *
     * @return the nttId
     */
    public String getNttId() {
        return nttId;
    }

    /**
     * nttId attribute를 설정한다.
     *
     * @param nttId the nttId to set
     */
    public void setNttId(String nttId) {
        this.nttId = nttId;
    }

    /**
     * nttIds attribute를 리턴한다.
     *
     * @return the nttIds
     */
    public String getNttIds() {
        return nttIds;
    }

    /**
     * nttIds attribute를 설정한다.
     *
     * @param nttIds the nttIds to set
     */
    public void setNttIds(String nttIds) {
        this.nttIds = nttIds;
    }

    /**
     * searchBgnDe attribute를 리턴한다.
     *
     * @return the searchBgnDe
     */
    public String getSearchBgnDe() {
        return searchBgnDe;
    }

    /**
     * searchBgnDe attribute를 설정한다.
     *
     * @param searchBgnDe the searchBgnDe to set
     */
    public void setSearchBgnDe(String searchBgnDe) {
        this.searchBgnDe = searchBgnDe;
    }

    /**
     * searchCnd attribute를 리턴한다.
     *
     * @return the searchCnd
     */
    public String getSearchCnd() {
        return searchCnd;
    }

    /**
     * searchCnd attribute를 설정한다.
     *
     * @param searchCnd the searchCnd to set
     */
    public void setSearchCnd(String searchCnd) {
        this.searchCnd = searchCnd;
    }

    /**
     * searchEndDe attribute를 리턴한다.
     *
     * @return the searchEndDe
     */
    public String getSearchEndDe() {
        return searchEndDe;
    }

    /**
     * searchEndDe attribute를 설정한다.
     *
     * @param searchEndDe the searchEndDe to set
     */
    public void setSearchEndDe(String searchEndDe) {
        this.searchEndDe = searchEndDe;
    }

    /**
     * searchWrd attribute를 리턴한다.
     *
     * @return the searchWrd
     */
    public String getSearchWrd() {
        return searchWrd;
    }

    /**
     * searchWrd attribute를 설정한다.
     *
     * @param searchWrd the searchWrd to set
     */
    public void setSearchWrd(String searchWrd) {
        this.searchWrd = searchWrd;
    }

    /**
     * sortOrdr attribute를 리턴한다.
     *
     * @return the sortOrdr
     */
    public long getSortOrdr() {
        return sortOrdr;
    }

    /**
     * sortOrdr attribute를 설정한다.
     *
     * @param sortOrdr the sortOrdr to set
     */
    public void setSortOrdr(long sortOrdr) {
        this.sortOrdr = sortOrdr;
    }

    /**
     * searchUseYn attribute를 리턴한다.
     *
     * @return the searchUseYn
     */
    public String getSearchUseYn() {
        return searchUseYn;
    }

    /**
     * searchUseYn attribute를 설정한다.
     *
     * @param searchUseYn the searchUseYn to set
     */
    public void setSearchUseYn(String searchUseYn) {
        this.searchUseYn = searchUseYn;
    }

    /**
     * pageIndex attribute를 리턴한다.
     *
     * @return the pageIndex
     */
    public int getPageIndex() {
        return pageIndex;
    }

    /**
     * pageIndex attribute를 설정한다.
     *
     * @param pageIndex the pageIndex to set
     */
    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    /**
     * pageUnit attribute를 리턴한다.
     *
     * @return the pageUnit
     */
    public int getPageUnit() {
        return pageUnit;
    }

    /**
     * pageUnit attribute를 설정한다.
     *
     * @param pageUnit the pageUnit to set
     */
    public void setPageUnit(int pageUnit) {
        this.pageUnit = pageUnit;
    }

    /**
     * pageSize attribute를 리턴한다.
     *
     * @return the pageSize
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * pageSize attribute를 설정한다.
     *
     * @param pageSize the pageSize to set
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * firstIndex attribute를 리턴한다.
     *
     * @return the firstIndex
     */
    public int getFirstIndex() {
        return firstIndex;
    }

    /**
     * firstIndex attribute를 설정한다.
     *
     * @param firstIndex the firstIndex to set
     */
    public void setFirstIndex(int firstIndex) {
        this.firstIndex = firstIndex;
    }

    /**
     * lastIndex attribute를 리턴한다.
     *
     * @return the lastIndex
     */
    public int getLastIndex() {
        return lastIndex;
    }

    /**
     * lastIndex attribute를 설정한다.
     *
     * @param lastIndex the lastIndex to set
     */
    public void setLastIndex(int lastIndex) {
        this.lastIndex = lastIndex;
    }

    /**
     * recordCountPerPage attribute를 리턴한다.
     *
     * @return the recordCountPerPage
     */
    public int getRecordCountPerPage() {
        return recordCountPerPage;
    }

    /**
     * recordCountPerPage attribute를 설정한다.
     *
     * @param recordCountPerPage the recordCountPerPage to set
     */
    public void setRecordCountPerPage(int recordCountPerPage) {
        this.recordCountPerPage = recordCountPerPage;
    }

    /**
     * rowNo attribute를 리턴한다.
     *
     * @return the rowNo
     */
    public int getRowNo() {
        return rowNo;
    }

    /**
     * rowNo attribute를 설정한다.
     *
     * @param rowNo the rowNo to set
     */
    public void setRowNo(int rowNo) {
        this.rowNo = rowNo;
    }

    /**
     * frstRegisterId attribute를 리턴한다.
     *
     * @return the frstRegisterId
     */
    public String getFrstRegisterId() {
        return frstRegisterId;
    }

    /**
     * frstRegisterId attribute를 설정한다.
     *
     * @param frstRegisterId the frstRegisterId to set
     */
    public void setFrstRegisterId(String frstRegisterId) {
        this.frstRegisterId = frstRegisterId;
    }

    /**
     * frstRegistPnttm attribute를 리턴한다.
     *
     * @return the frstRegistPnttm
     */
    public String getFrstRegistPnttm() {
        return frstRegistPnttm;
    }

    /**
     * frstRegistPnttm attribute를 설정한다.
     *
     * @param frstRegistPnttm the frstRegistPnttm to set
     */
    public void setFrstRegistPnttm(String frstRegistPnttm) {
        this.frstRegistPnttm = frstRegistPnttm;
    }

    /**
     * lastUpdusrId attribute를 리턴한다.
     *
     * @return the lastUpdusrId
     */
    public String getLastUpdusrId() {
        return lastUpdusrId;
    }

    /**
     * lastUpdusrId attribute를 설정한다.
     *
     * @param lastUpdusrId the lastUpdusrId to set
     */
    public void setLastUpdusrId(String lastUpdusrId) {
        this.lastUpdusrId = lastUpdusrId;
    }

    /**
     * lastUpdtPnttm attribute를 리턴한다.
     *
     * @return the lastUpdtPnttm
     */
    public String getLastUpdtPnttm() {
        return lastUpdtPnttm;
    }

    /**
     * lastUpdtPnttm attribute를 설정한다.
     *
     * @param lastUpdtPnttm the lastUpdtPnttm to set
     */
    public void setLastUpdtPnttm(String lastUpdtPnttm) {
        this.lastUpdtPnttm = lastUpdtPnttm;
    }

    /**
     * valtMngmNo attribute를 리턴한다.
     *
     * @return the valtMngmNo
     */
    public String getValtMngmNo() {
        return valtMngmNo;
    }

    /**
     * valtMngmNo attribute를 설정한다.
     *
     * @param valtMngmNo the valtMngmNo to set
     */
    public void setValtMngmNo(String valtMngmNo) {
        this.valtMngmNo = valtMngmNo;
    }

    /**
     * valtQsitMnno attribute를 리턴한다.
     *
     * @return the valtQsitMnno
     */
    public String getValtQsitMnno() {
        return valtQsitMnno;
    }

    /**
     * valtQsitMnno attribute를 설정한다.
     *
     * @param valtQsitMnno the valtQsitMnno to set
     */
    public void setValtQsitMnno(String valtQsitMnno) {
        this.valtQsitMnno = valtQsitMnno;
    }

    /**
     * baseYy attribute를 리턴한다.
     *
     * @return the baseYy
     */
    public String getBaseYy() {
        return baseYy;
    }

    /**
     * baseYy attribute를 설정한다.
     *
     * @param baseYy the baseYy to set
     */
    public void setBaseYy(String baseYy) {
        this.baseYy = baseYy;
    }

    /**
     * sqn attribute를 리턴한다.
     *
     * @return the sqn
     */
    public String getSqn() {
        return sqn;
    }

    /**
     * sqn attribute를 설정한다.
     *
     * @param sqn the sqn to set
     */
    public void setSqn(String sqn) {
        this.sqn = sqn;
    }

    /**
     * valtMngmTtl attribute를 리턴한다.
     *
     * @return the valtMngmTtl
     */
    public String getValtMngmTtl() {
        return valtMngmTtl;
    }

    /**
     * valtMngmTtl attribute를 설정한다.
     *
     * @param valtMngmTtl the valtMngmTtl to set
     */
    public void setValtMngmTtl(String valtMngmTtl) {
        this.valtMngmTtl = valtMngmTtl;
    }

    /**
     * valtMngmDesc attribute를 리턴한다.
     *
     * @return the valtMngmDesc
     */
    public String getValtMngmDesc() {
        return valtMngmDesc;
    }

    /**
     * valtMngmDesc attribute를 설정한다.
     *
     * @param valtMngmDesc the valtMngmDesc to set
     */
    public void setValtMngmDesc(String valtMngmDesc) {
        this.valtMngmDesc = valtMngmDesc;
    }

    /**
     * useAt attribute를 리턴한다.
     *
     * @return the useAt
     */
    public String getUseAt() {
        return useAt;
    }

    /**
     * useAt attribute를 설정한다.
     *
     * @param useAt the useAt to set
     */
    public void setUseAt(String useAt) {
        this.useAt = useAt;
    }

    /**
     * valtMngmNos attribute를 리턴한다.
     *
     * @return the valtMngmNos
     */
    public String getValtMngmNos() {
        return valtMngmNos;
    }

    /**
     * valtMngmNos attribute를 설정한다.
     *
     * @param valtMngmNos the valtMngmNos to set
     */
    public void setValtMngmNos(String valtMngmNos) {
        this.valtMngmNos = valtMngmNos;
    }

    /**
     * exmnId attribute를 리턴한다.
     *
     * @return the exmnId
     */
    public String getExmnId() {
        return exmnId;
    }

    /**
     * exmnId attribute를 설정한다.
     *
     * @param exmnId the exmnId to set
     */
    public void setExmnId(String exmnId) {
        this.exmnId = exmnId;
    }

    /**
     * exmnIds attribute를 리턴한다.
     *
     * @return the exmnIds
     */
    public String getExmnIds() {
        return exmnIds;
    }

    /**
     * exmnIds attribute를 설정한다.
     *
     * @param exmnIds the exmnIds to set
     */
    public void setExmnIds(String exmnIds) {
        this.exmnIds = exmnIds;
    }
}
