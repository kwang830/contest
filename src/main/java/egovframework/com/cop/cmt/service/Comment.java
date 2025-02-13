package egovframework.com.cop.cmt.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 댓글관리 서비스 데이터 처리 모델
 * @author 공통컴포넌트개발팀 한성곤
 * @since 2009.06.29
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.06.29  한성곤          최초 생성
 *	
 * </pre>
 */
@SuppressWarnings("serial")
public class Comment implements Serializable {
    /** 댓글번호 */
    private String commentNo = "";
    
    /** 게시판 ID */
    private String bbsId = "";
    
    /** 게시물 번호 */
    private long nttId = 0L;
    
    /** 작성자 ID */
    private String wrterId = "";
    
    /** 작성자명 */
    private String wrterNm = "";
    
    /** 패스워드 */
    private String commentPassword = "";
    
    /** 댓글 내용 */
    private String commentCn = "";
    
    /** 댓글 입력점수 */
    private int scoreNum = 0;    
    
    /** 사용 여부 */
    private String useAt = "";
    
    /** 추천 여부 */
    private String picksAt = "";    

    /** 최초등록자 아이디 */
    private String frstRegisterId = "";
    
    /** 최초 등록자명 */
    private String frstRegisterNm = "";
    
    /** 최초등록시점 */
    private String frstRegisterPnttm = "";
    
    /** 최종수정자 아이디 */
    private String lastUpdusrId = "";
    
    /** 최종수정시점 */
    private String lastUpdusrPnttm = "";
    
    /** 확인 패스워드 */
    private String confirmPassword = "";
    
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
     * commentNo attribute를 리턴한다.
     * @return the commentNo
     */
    public String getCommentNo() {
        return commentNo;
    }

    /**
     * commentNo attribute 값을 설정한다.
     * @param commentNo the commentNo to set
     */
    public void setCommentNo(String commentNo) {
        this.commentNo = commentNo;
    }

    /**
     * bbsId attribute를 리턴한다.
     * @return the bbsId
     */
    public String getBbsId() {
        return bbsId;
    }

    /**
     * bbsId attribute 값을 설정한다.
     * @param bbsId the bbsId to set
     */
    public void setBbsId(String bbsId) {
        this.bbsId = bbsId;
    }

    /**
     * nttId attribute를 리턴한다.
     * @return the nttId
     */
    public long getNttId() {
        return nttId;
    }

    /**
     * nttId attribute 값을 설정한다.
     * @param nttId the nttId to set
     */
    public void setNttId(long nttId) {
        this.nttId = nttId;
    }

    /**
     * wrterId attribute를 리턴한다.
     * @return the wrterId
     */
    public String getWrterId() {
        return wrterId;
    }

    /**
     * wrterId attribute 값을 설정한다.
     * @param wrterId the wrterId to set
     */
    public void setWrterId(String wrterId) {
        this.wrterId = wrterId;
    }

    /**
     * wrterNm attribute를 리턴한다.
     * @return the wrterNm
     */
    public String getWrterNm() {
        return wrterNm;
    }

    /**
     * wrterNm attribute 값을 설정한다.
     * @param wrterNm the wrterNm to set
     */
    public void setWrterNm(String wrterNm) {
        this.wrterNm = wrterNm;
    }

    /**
     * commentPassword attribute를 리턴한다.
     * @return the commentPassword
     */
    public String getCommentPassword() {
        return commentPassword;
    }

    /**
     * commentPassword attribute 값을 설정한다.
     * @param commentPassword the commentPassword to set
     */
    public void setCommentPassword(String commentPassword) {
        this.commentPassword = commentPassword;
    }

    /**
     * commentCn attribute를 리턴한다.
     * @return the commentCn
     */
    public String getCommentCn() {
        return commentCn;
    }

    /**
     * commentCn attribute 값을 설정한다.
     * @param commentCn the commentCn to set
     */
    public void setCommentCn(String commentCn) {
        this.commentCn = commentCn;
    }
        
    /**
     * scoreNum attribute를 리턴한다.
     * @return the scoreNum
     */
    public int getScoreNum() {
        return scoreNum;
    }

    /**
     * scoreNum attribute 값을 설정한다.
     * @param scoreNum the scoreNum to set
     */
    public void setScoreNum(int scoreNum) {
        this.scoreNum = scoreNum;
    }    

    /**
     * useAt attribute를 리턴한다.
     * @return the useAt
     */
    public String getUseAt() {
        return useAt;
    }

    /**
     * useAt attribute 값을 설정한다.
     * @param useAt the useAt to set
     */
    public void setUseAt(String useAt) {
        this.useAt = useAt;
    }

    /**
    * picksAt attribute를 리턴한다.
    * @return the picksAt
    */
   public String getPicksAt() {
       return picksAt;
   }

   /**
    * picksAt attribute 값을 설정한다.
    * @param picksAt the picksAt to set
    */
   public void setPicksAt(String picksAt) {
       this.picksAt = picksAt;
   }    

    /**
     * frstRegisterId attribute를 리턴한다.
     * @return the frstRegisterId
     */
    public String getFrstRegisterId() {
        return frstRegisterId;
    }

    /**
     * frstRegisterId attribute 값을 설정한다.
     * @param frstRegisterId the frstRegisterId to set
     */
    public void setFrstRegisterId(String frstRegisterId) {
        this.frstRegisterId = frstRegisterId;
    }

    /**
     * frstRegisterPnttm attribute를 리턴한다.
     * @return the frstRegisterPnttm
     */
    public String getFrstRegisterPnttm() {
        return frstRegisterPnttm;
    }

    /**
     * frstRegisterPnttm attribute 값을 설정한다.
     * @param frstRegisterPnttm the frstRegisterPnttm to set
     */
    public void setFrstRegisterPnttm(String frstRegisterPnttm) {
        this.frstRegisterPnttm = frstRegisterPnttm;
    }

    /**
     * lastUpdusrId attribute를 리턴한다.
     * @return the lastUpdusrId
     */
    public String getLastUpdusrId() {
        return lastUpdusrId;
    }

    /**
     * lastUpdusrId attribute 값을 설정한다.
     * @param lastUpdusrId the lastUpdusrId to set
     */
    public void setLastUpdusrId(String lastUpdusrId) {
        this.lastUpdusrId = lastUpdusrId;
    }

    /**
     * lastUpdusrPnttm attribute를 리턴한다.
     * @return the lastUpdusrPnttm
     */
    public String getLastUpdusrPnttm() {
        return lastUpdusrPnttm;
    }

    /**
     * lastUpdusrPnttm attribute 값을 설정한다.
     * @param lastUpdusrPnttm the lastUpdusrPnttm to set
     */
    public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
        this.lastUpdusrPnttm = lastUpdusrPnttm;
    }
    
    /**
     * frstRegisterNm attribute를 리턴한다.
     * @return the frstRegisterNm
     */
    public String getFrstRegisterNm() {
        return frstRegisterNm;
    }

    /**
     * frstRegisterNm attribute 값을 설정한다.
     * @param frstRegisterNm the frstRegisterNm to set
     */
    public void setFrstRegisterNm(String frstRegisterNm) {
        this.frstRegisterNm = frstRegisterNm;
    }

    /**
     * confirmPassword attribute를 리턴한다.
     * @return the confirmPassword
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * confirmPassword attribute 값을 설정한다.
     * @param confirmPassword the confirmPassword to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    /**
     * toString 메소드를 대치한다.
     */
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
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
