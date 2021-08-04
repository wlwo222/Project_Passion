package www.dream.com.framework.springSecurityAdapter;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import www.dream.com.party.model.Party;


/*
 * 파티가 유저디테일인터페이스를 상속하는걸 포기하고 시도하는 부분	csrf공격을 방지할겸.. 권한부여
 * 본 시스템 아키텍쳐는 스프링의 시큐리티 모듈을 활용하여 사용자 인증 및 권한을 처리 중입니다.
 * 하지만 이  아키텍처 선택을 바꿀 때 변경을 최소화 하기 위하여 Party Class와 연계 클래스를 정의함
 * Adapter : 브릿지, 연계 , 연결
 */
public class CustomUser extends User {
	private Party party;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(Party party) {
		this(party.getUserId(), party.getUserPwd(), party.getAuthorityList());
		this.party = party;
	}
	
	public Party getCurUser() {
		return party;
	}
}
