package egovframework.let.cont.valt.service;

import egovframework.com.cmm.LoginVO;
import java.io.Serializable;

@SuppressWarnings("serial")
public class ContUserVO extends LoginVO implements Serializable {
    private String userId;
    private String userNm;

    /**
     * userId attribute를 리턴한다.
     *
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * userId attribute를 설정한다.
     *
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * userNm attribute를 리턴한다.
     *
     * @return the userNm
     */
    public String getUserNm() {
        return userNm;
    }

    /**
     * userNm attribute를 설정한다.
     *
     * @param userNm the userNm to set
     */
    public void setUserNm(String userNm) {
        this.userNm = userNm;
    }
}
