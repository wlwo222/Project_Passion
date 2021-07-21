package www.dream.com.party.persistence;

import java.util.List;

import www.dream.com.party.model.ContactPointTypeVO;
import www.dream.com.party.model.Member;
import www.dream.com.party.model.Party;

/**
 * MYBATIS를 활용하여 Party 종류의 객체를 관리하는 인터페이스
 * @author ivarBae
 */
public interface PartyMapper {
	//함수 정의 순서 LRCUD
	//목록 조회
	public List<Party> getList();
	//개별 객체 조회
	public Party findPartyByUserId(String userId);
	//Insert
	public int joinMember(Member party);
	//update
	public int setPwd(Party p) ;
	public int updateMember(Member party);
	//Delete
	public int resignMember(String userId);
	/** 연락처 관련 정의 영역  */
	public List<ContactPointTypeVO> getCPTypeList();
}
