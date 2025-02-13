package egovframework.com.custom.menu.service;

import java.io.Serializable;
import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class MenuManage implements Serializable {


	public String getMenuDc() {
		return menuDc;
	}
	public void setMenuDc(String menuDc) {
		this.menuDc = menuDc;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public int getMenuOrdr() {
		return menuOrdr;
	}
	public void setMenuOrdr(int menuOrdr) {
		this.menuOrdr = menuOrdr;
	}
	public String getProgrmFileNm() {
		return progrmFileNm;
	}
	public void setProgrmFileNm(String progrmFileNm) {
		this.progrmFileNm = progrmFileNm;
	}
	public String getRelateImageNm() {
		return relateImageNm;
	}
	public void setRelateImageNm(String relateImageNm) {
		this.relateImageNm = relateImageNm;
	}
	public String getRelateImagePath() {
		return relateImagePath;
	}
	public void setRelateImagePath(String relateImagePath) {
		this.relateImagePath = relateImagePath;
	}
	public int getUpperMenuId() {
		return upperMenuId;
	}
	public void setUpperMenuId(int upperMenuId) {
		this.upperMenuId = upperMenuId;
	}
	/**
	 * 메뉴설명
	 */
	private String menuDc;	
	/**
	 * 메뉴명
	 */
	private String menuNm;
	/**
	 * 메뉴번호
	 */
	private int menuNo;
	/**
	 * 메뉴순서
	 */
	private int menuOrdr;
	/**
	 * 프로그램파일명
	 */
	private String progrmFileNm;
	/**
	 * 관련이미지명
	 */
	private String relateImageNm;
	/**
	 * 관련이미지경로
	 */
	private String relateImagePath;
	/**
	 * 상위메뉴번호
	 */
	private int upperMenuId;
	
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}