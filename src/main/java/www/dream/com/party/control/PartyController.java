package www.dream.com.party.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import www.dream.com.party.model.Member;
import www.dream.com.party.model.Party;
import www.dream.com.party.service.PartyService;

@Controller
@RequestMapping("/party/*")
public class PartyController implements AuthenticationSuccessHandler, AccessDeniedHandler {
	@Autowired
	private PasswordEncoder pwEncoder;
	@Autowired
	private PartyService partyService;

	@GetMapping(value="list")
	public void getList(Model model) {
		model.addAttribute("listParty", partyService.getList());
	}

	@GetMapping("customLogin")
	public void loginInput(String error, String logout, Model model) {
		if (error != null) {
			model.addAttribute("error", "로그인 실패. 재시도 바랍니다.");
		}
		
		if (logout != null) {
			model.addAttribute("logout", "안녕히 가세요!");
		}
	}
	
	@GetMapping("customLogout")
	public void processLogout() {
	}
	
	@PostMapping("customLogout")
	public void processLogoutPost() {
	}
	
	
	@GetMapping("showCurUser")
	public void showCurUser() {
	}
		
	@GetMapping("joinMember")
	public void joinMember(Model model) {
		model.addAttribute("listCpType", partyService.getCPTypeList());
	}
	
	@PostMapping("joinMember")
	public void joinMember(Member newBie) {
		newBie.setUserPwd(pwEncoder.encode(newBie.getUserPwd()));
		partyService.joinMember(newBie);
	}
	
	@GetMapping("updateMember")
	public void updateMember(Model model) {
		model.addAttribute("listCpType", partyService.getCPTypeList());
	}
	
	@PostMapping("updateMember")
	public void updateMember(Member newBie) {
		System.out.println(newBie);
		
		partyService.updateMember(newBie);
	}
	
	
	@GetMapping("resignMember")
	public void resignMember() {
			}
	
	@PostMapping("resignMember")
	public void resignMember(String UserId) {
		System.out.println(UserId);
		partyService.resignMember(UserId);
			}
	
	/**
	 * 로그인 성공 시 각 사용자의 권한 유형에 따라 개인화된 화면을 연동 시켜주기 위한 기능을 이곳에서 개발 합니다.
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		if (roleNames.contains("manager")) {
			response.sendRedirect("/party/showCurUser");
			return;
		}		
		if (roleNames.contains("admin")) {
			response.sendRedirect("/post/listBySearch?boardId=1");
			return;
		}
		if (roleNames.contains("manager")) {
			response.sendRedirect("/post/listBySearch?boardId=2");
			return;
		}
		response.sendRedirect("/post/listBySearch?boardId=3");
	}
	
	//security-context.xml에서 customAccessController부분
	//AccessDeniedHandler의 함수를 구현
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		response.sendRedirect("/party/accessError");
	}


}
