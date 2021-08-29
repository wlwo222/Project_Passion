package www.dream.com.order.control;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import www.dream.com.framework.springSecurityAdapter.CustomUser;
import www.dream.com.order.model.CartVO;
import www.dream.com.order.service.OrderService;
import www.dream.com.party.model.Party;
import www.dream.com.product.model.ProductVO;
import www.dream.com.product.persistence.ProductMapper;
import www.dream.com.product.service.ProductService;

@RestController
@RequestMapping("/order/*")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private ProductService productService;

	@Autowired
	ProductMapper productMapper;

	/*
	 * @GetMapping(value="count/{replyId}") public ResponseEntity<Integer>
	 * getCountOfReply(@PathVariable("replyId") String replyId) { return new
	 * ResponseEntity<>(replyService.getCountOfReply(replyId), HttpStatus.OK); }
	 */
	@GetMapping(value = "isCartExist/{customerId}")
	@ResponseBody
	public ResponseEntity<Map<Object, Object>> isCartExist(@PathVariable("customerId") String customerId) {
		int cnt = 0;
		// JSON 객체와 통신할 값를 담을 map
		Map<Object, Object> map = new HashMap<>();
		// 아이디 중복일시 1 아닐시 0
		cnt = orderService.isCartExist(customerId);
		map.put("cnt", cnt);
		System.out.println(map + " " + cnt + customerId);
		return new ResponseEntity<>(HttpStatus.OK);

	}

	/*
	 * 아이디에 종속된 카트가 있는지 검사합니다. 1은 카트존재, 0은 카트없음입니다. 만약 아이디에 종속된 카트가 있다면 사용자 아이디를
	 * 통하여서 종속된 카트를 호출합니다. 그리고 상품 아이디를 받아와 카트의 List<String> productIds에 add 합니다. 만약
	 * 아이디에 종속된 카트가 없다면 사용자 아이디를 통하여서 새로운 카트리스트를 생성합니다. 그리고 상품 아이디를 받아와 카트의
	 * List<String> productIds에 add 합니다.
	 *  order/orderForm에 구매 페이지 틀이 있습니다.
	 */

	 @PreAuthorize("isAuthenticated()") //현 사용자가 로그인 처리 했습니까?
		@PostMapping(value="putProductInCart")
	    @ResponseBody
		public String putProductInCart(@AuthenticationPrincipal Principal principal,
				@RequestBody ProductVO product) {
			//로그인한 사용자로 작성자 연동
			UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
			CustomUser cu = (CustomUser) upat.getPrincipal();
			Party writer = cu.getCurUser();
			String userName = writer.getName();
			//수량은 7로 고정했슴니다.
			String quantity = "7";
			String productId = product.getProductId()+ "";
			
			//Cart 생성
			Map<String, String> productIdAndQ = new HashMap<>();
			productIdAndQ.put(productId, quantity);
			
			orderService.updateCart(userName, productIdAndQ);
			Map<Object, Object> resultMap = new HashMap<>();
			String successMassage = "성공적으로 장바구니에 담았습니다.";
			resultMap.put("successMassage",successMassage);
			return successMassage;
		}
	
	@GetMapping(value = "getProductsByCategoryId/{categoryId}")
	@ResponseBody
	public ResponseEntity<List<ProductVO>> getProductsByCategoryId(@PathVariable("categoryId") String categoryId) {
		List<ProductVO> products = new ArrayList<>();
		products = productService.getProductByDetailCat(categoryId);		
		
		return new ResponseEntity<>(products, HttpStatus.OK);
	}
}
