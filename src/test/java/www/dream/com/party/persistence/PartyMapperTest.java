package www.dream.com.party.persistence;

import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import www.dream.com.party.model.ContactPointTypeVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml",
	"file:src\\main\\webapp\\WEB-INF\\spring\\security-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PartyMapperTest {
	@Autowired
	private PasswordEncoder pwEncoder;
	@Autowired
	private PartyMapper partyMapper;

	//@Test
	public void test100GetList() {
		assertNotNull(partyMapper);
		try {
			partyMapper.getList().forEach(p->{System.out.println(p);});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void test200FindContact() {
		try {
			List<ContactPointTypeVO> listContact = partyMapper.getCPTypeList();
			assertNotNull(listContact);
			System.out.println(listContact);
			listContact.forEach(cp->{
				System.out.println(cp);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void test440SetPwd() {
		try {
			partyMapper.getList().forEach(p->{
				p.setUserPwd(pwEncoder.encode("1234"));
				System.out.println(p.getUserPwd());
				partyMapper.setPwd(p);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
