package egovframework.let.main.service;

import java.io.Serializable;

/**
 * 템플릿 메인화면 작업 List 항목 VO(Sample 소스)
 * @author 실행환경 개발팀 JJY
 * @since 2011.08.31
 * @version 1.0
 * @see
 *
 * "<pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.08.31  JJY            최초 생성
 *
 * </pre>"
 */
public class EgovMainContentsVO implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -2202175699511921484L;
	/**
	 * 작업항목 이름
	 */
	private String workItemName;
	/**
	 * To-Do List 항목 별 업무화면 URL
	 */
	private String workItemURL;

	public EgovMainContentsVO(){

	}

	/**
	 * 
	 * @exception Throwable Throwable
	 */
	public void finalize()
	  throws Throwable{

	}

	/**
	 * getItemCount 항목 개수 getter
	 */
	public int getItemCount(){
		return 0;
	}

	/**
	 * getWorkItemName To-Do List 항목 명 getter
	 * @return To-Do List 항목 명
	 */
	public String getWorkItemName(){
		return workItemName;
	}

	/**
	 * getWorkItemURL 업무화면 URL getter
	 * @return 업무화면 URL
	 */
	public String getWorkItemURL(){
		return workItemURL;
	}

	/**
	 * setItemCount 항목 개수 setter
	 * 
	 * @param itemCount    itemCount
	 */
	public void setItemCount(int itemCount){

	}

	/**
	 * setWorkItemName To-Do List 항목 명 Setter
	 * 
	 * @param workItemName    To-Do List 항목 명
	 */
	public void setWorkItemName(String workItemName){

	}

	/**
	 * setWorkItemURL 업무화면 URL setter
	 * 
	 * @param workItemURL    업무화면 URL
	 */
	public void setWorkItemURL(String workItemURL){

	}

}