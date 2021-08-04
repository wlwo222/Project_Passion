package www.dream.com.party.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import www.dream.com.framework.springSecurityAdapter.CustomUser;
import www.dream.com.party.model.ContactPointTypeVO;
import www.dream.com.party.model.Member;
import www.dream.com.party.model.Party;
import www.dream.com.party.persistence.PartyMapper;

@Service
@NoArgsConstructor
@AllArgsConstructor
public class PartyService implements UserDetailsService {
	@Autowired
	private PartyMapper partyMapper;
	
	public List<Party> getList() {
		return partyMapper.getList();
	}
	
	public Party findPartyByUserId(String userId) {
		return partyMapper.findPartyByUserId(userId);
	}

	//연락처 유형 목록 조회
	public List<ContactPointTypeVO> getCPTypeList() {
		return partyMapper.getCPTypeList();
	}
	//회원가입
	public int joinMember(Member party) {
		return partyMapper.joinMember(party);
	}
	//회원정보 수정
	public int updateMember(Member party) {
		return partyMapper.updateMember(party);
	}
	//회원 탈퇴
	public int resignMember(String userId) {
		return partyMapper.resignMember(userId);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Party loginParty =  partyMapper.findPartyByUserId(username);
		return loginParty == null ? null : new CustomUser(loginParty);	//데이터베이스에서 받은녀석을 집어넣자
	}
}
