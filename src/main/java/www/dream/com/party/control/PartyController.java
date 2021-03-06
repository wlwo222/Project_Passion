package www.dream.com.party.control;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import www.dream.com.order.model.OrderVO;
import www.dream.com.order.service.OrderService;
import www.dream.com.party.model.Member;
import www.dream.com.party.model.Party;
import www.dream.com.party.service.PartyService;
import www.dream.com.product.persistence.ProductMapper;
import www.dream.com.product.service.ProductService;

@Controller
@RequestMapping("/party/*")
public class PartyController implements AuthenticationSuccessHandler, AccessDeniedHandler {
	@Autowired
	private PasswordEncoder pwEncoder;
	
	@Autowired
	private PartyService partyService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	

	// /party/list
	@GetMapping(value="list")
	public void getList(Model model) {
		model.addAttribute("listParty", partyService.getList());
	}
	
	@ResponseBody
	@PostMapping(value="passChk")
	public int passChk(Member member) {
		int result = partyService.passChk(member);
		return result;
	}

	@GetMapping("customLogin")
	public void loginInput(String error, String logout, Model model) {
		if (error != null) {
			model.addAttribute("error", "????????? ??????. ????????? ????????????.");
		}
		if (logout != null) {
			model.addAttribute("logout", "????????? ?????????!");
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
	
	@GetMapping("idCheck")
	@ResponseBody
	public ResponseEntity<Map<Object, Object> > idCheck(@RequestParam("userId") String userId) {
		
		// ????????? ???????????? 1 ????????? 0
		int cnt = 0;
		// JSON ????????? ????????? ?????? ?????? map
		Map<Object, Object> map = new HashMap<>();
		// ????????? ???????????? 1 ????????? 0
		cnt = partyService.idCheck(userId);
		// 
		map.put("cnt", cnt);
		if(userId == null || userId.length() == 0) {
			return new ResponseEntity<>(map, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map, HttpStatus.OK);
	
	}
		
	@GetMapping("joinMember")
	public void joinMember(Model model) {
		List<String> UserIdList = new ArrayList<>();
		partyService.getList().forEach(p->{
			String pp = p.getUserId();
			UserIdList.add("'"+ pp +"'");
		});
		model.addAttribute("listCpType", partyService.getCPTypeList());
		model.addAttribute("UserIdList", UserIdList);
	}
	
	@PostMapping("joinMember")
	public void joinMember(Member newBie) {
		newBie.setUserPwd(pwEncoder.encode(newBie.getUserPwd()));
		partyService.joinMember(newBie);
		System.out.println(newBie.getId());
	}
	
	@GetMapping("updateMember")
	public void updateMember(Model model) {
		model.addAttribute("listCpType", partyService.getCPTypeList());
	}
	
	@PostMapping("updateMember")
	public String updateMember(Member newBie) {
		System.out.println(newBie);
		partyService.updateMember(newBie);
		return "redirect:/homes/index";
	}
	
	@GetMapping("resignMember")
	public void resignMember() {
	}
	
	@PostMapping("resignMember")
	public String resignMember(String userId, String userPwd) {
		System.out.println(userId + " " + userPwd);
		Party member = partyService.findPartyByUserId(userId);
		String encodedPwd = member.getUserPwd();
		if (pwEncoder.matches(userPwd ,encodedPwd)) {
			partyService.resignMember(userId);
			return "redirect:/party/joinMember";
		} else {
			return "redirect:/";
		}
	}
	
	/**
	 * ????????? ?????? ??? ??? ???????????? ?????? ????????? ?????? ???????????? ????????? ?????? ???????????? ?????? ????????? ???????????? ?????? ?????????.
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
	
	//security-context.xml?????? customAccessController??????
	//AccessDeniedHandler??? ????????? ??????
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		response.sendRedirect("/party/accessError");
	}
	
	
    @GetMapping(value="myPage")
    public void myPage(Model model, Principal principal) {
    	List<OrderVO> orders = orderService.getOrdersByUserId("admin");
		orders.forEach(order->{
			order.setProduct(productService.getAddInfoOfProduct(order.getProduct()));
		});
		
		model.addAttribute("orders", orders);
    }
}
