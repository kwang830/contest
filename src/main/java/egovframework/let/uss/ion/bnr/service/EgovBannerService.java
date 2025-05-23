package egovframework.let.uss.ion.bnr.service;

import java.util.List;
/**
 * 배너에 대한 Service Interface를 정의한다.
 * 배너에 대한 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * 배너의 조회기능은 목록조회, 상세조회로 구분된다.
 * @author 공통서비스개발팀 lee.m.j
 * @since 2009.08.03
 * @version 1.0
 * @see
 *
 * "<pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.08.03  lee.m.j        최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
 *
 * </pre>"
 */
public interface EgovBannerService {

	/**
	 * 배너를 관리하기 위해 등록된 배너목록을 조회한다.
	 */
	public List<BannerVO> selectBannerList(BannerVO bannerVO) throws Exception;

	/**
	 * 배너목록 총 갯수를 조회한다.
	 */
	public int selectBannerListTotCnt(BannerVO bannerVO) throws Exception;
	
	/**
	 * 등록된 배너의 상세정보를 조회한다.
	 */
	public BannerVO selectBanner(BannerVO bannerVO) throws Exception;

	/**
	 * 배너정보를 신규로 등록한다.
	 */
	public BannerVO insertBanner(Banner banner, BannerVO bannerVO) throws Exception;

	/**
	 * 기 등록된 배너정보를 수정한다.
	 */
	public void updateBanner(Banner banner) throws Exception;

	/**
	 * 기 등록된 배너정보를 삭제한다.
	 */
	public void deleteBanner(Banner banner) throws Exception;

	/**
	 * 기 등록된 배너정보의 이미지파일을 삭제한다.
	 */
	public void deleteBannerFile(Banner banner) throws Exception;

	/**
	 * 배너가 특정화면에 반영된 결과를 조회한다.
	 */
	public List<BannerVO> selectBannerResult(BannerVO bannerVO) throws Exception;
}
