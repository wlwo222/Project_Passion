package www.dream.com.party.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.common.model.CommonMngVO;
import www.dream.com.framework.langPosAnalyzer.HashTarget;
import www.dream.com.framework.printer.ClassPrintTarget;
import www.dream.com.framework.printer.PrintTarget;
import www.dream.com.hashTag.model.IHashTagOpponent;
/**
 * 모든 행위자 정보의 공통적인 상위 정보를 담고 있는 추상적인 클래스
 * @author ivarBae
 */
@Data
@NoArgsConstructor
@ClassPrintTarget
public abstract class Party extends CommonMngVO implements IHashTagOpponent {
	private String userId;		//로그인 ID
	private String userPwd;		//암호, 암호화는 나중에
	@HashTarget
	@PrintTarget(order=250, caption="작성자")
	private String name;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthDate;		//생일 년월일
	private boolean male;		//boolean 값이었지만 DB테이블과 형식을 맞춰주었음.
	private String enabled;	//가입중... 탈퇴 시 false male
	
	//1 : N 관계에 대한 속성
	@HashTarget
	private List<ContactPoint> listContactPoint = new ArrayList<>();

	public Party(String userId) {
		this.userId = userId;
	}

	public String getId() {
		return userId;
	}
	
	public String getType() {
		return "Party";
	}
	
	public void addContactPoint(ContactPoint cp) {
		listContactPoint.add(cp);
	}

	public abstract List<AuthorityVO> getAuthorityList();
	
	@Override
	public String toString() {
		return "Party [userId=" + userId + ", userPwd=" + userPwd + ", name=" + name + ", birthDate=" + birthDate
				+ ", male=" + male + ", enabled=" + enabled + ", listContactPoint=" + listContactPoint + ", toString()=" + super.toString() + "]";
	}


}
