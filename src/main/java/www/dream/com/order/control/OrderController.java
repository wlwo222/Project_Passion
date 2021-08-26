package www.dream.com.order.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import www.dream.com.order.model.CartVO;
import www.dream.com.order.service.OrderService;
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

	@PreAuthorize("isAuthenticated()") // 사용자의 로그인 처리
	@ResponseBody
	@GetMapping(value = "addToCart/{customerId}/{productId}/{quantity}")
	public ResponseEntity<String> addToCart(@PathVariable("customerId") String customerId,
			@PathVariable("productId") String productId, @PathVariable("quantity") String quantity) {
		
		//새로운 ProductId와 Quantity를 담을 Map
		Map<String, String> NewProductIdsAndQ = new HashMap<>();

		NewProductIdsAndQ.put(productId, quantity);
		
		orderService.updateCart(customerId, NewProductIdsAndQ);
		
		return new ResponseEntity<>("장바구니에 성공적으로 담았습니다.",HttpStatus.OK);
	}
	
	@GetMapping(value = "getProductsByCategoryId/{categoryId}")
	@ResponseBody
	public ResponseEntity<List<ProductVO>> getProductsByCategoryId(@PathVariable("categoryId") String categoryId) {
		List<ProductVO> products = new ArrayList<>();
		products = productService.getProductByDetailCat(categoryId);		
		
		return new ResponseEntity<>(products, HttpStatus.OK);
	}
}
