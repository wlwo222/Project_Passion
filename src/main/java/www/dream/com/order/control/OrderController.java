package www.dream.com.order.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import www.dream.com.product.model.ProductAdditionalInfo;
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
	 * 
	 */

	@PreAuthorize("isAuthenticated()") // 사용자의 로그인 처리
	@ResponseBody
	@GetMapping(value = "addToCart/{customerId}/{productId}/{quantity}", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })

	public ResponseEntity<String> addToCart(@PathVariable("customerId") String customerId,
			@PathVariable("productId") String productId, @PathVariable("quantity") String quantity) {

		/**
		 * Cart가 ProductVO를 리스트 형태로 받기 때문에, 이렇게 받은 데이터를 통해서 List로 넣는 과정 Map 구조를 통해
		 * productId와 quantity를 묶어줌. 카트에 넣을 데이터를 미리 준비
		 */
		Map<String, String> pdtQuantityMap = new HashMap<>();
		CartVO usercart = orderService.getCartByUserId(customerId);

		pdtQuantityMap.put(productId, quantity);

		// CustomerId를 이용하여 Cart데이터가 있는지 확인
		if (usercart == null) {
			CartVO newcart = new CartVO(customerId);
			orderService.putpdtinCart(newcart, productId, quantity);
			return new ResponseEntity<>("새로운 카트에 담기 성공",HttpStatus.OK);
		} else {
			/**
			 * Cart가 있는 경우 데이터를 조사해서 이미 있는 상품과 비교하여 insert할 ProductId와 Update할 ProductId들을
			 * 나눔.
			 */
			List<String> ExistingProductIds = new ArrayList<>();
			List<String> NewProductIdsForCart = new ArrayList<>();

			usercart.getProducts().iterator().forEachRemaining(Existingproduct -> {

				if (pdtQuantityMap.containsKey(Existingproduct.getProductId())) {
					// Cart안의 상품인 경우
					ExistingProductIds.add(Existingproduct.getProductId());
				} else {
					// 새로운 상품인 경우
					NewProductIdsForCart.add(Existingproduct.getProductId());
				}
			});

			// 나눈 후에, OrderService에게 DB 저장을 시켜줍니다.
			orderService.updateCart(usercart, ExistingProductIds, NewProductIdsForCart);
			return new ResponseEntity<>("기존 카트에 담기 성공",HttpStatus.OK);
		}
		
	}

	/**
	 * 카트가 이미 존재하는 경우, 기존카트를 불러와 productId를 담습니다. 이때는 Insert 쿼리문과 Update쿼리문 둘 다 이용하여
	 * 정보를 주입합니다.
	 */
	/*
	 * if(orderService.isCartExist(customerId) == 1) { CartVO cart =
	 * orderService.getCartByUserId(customerId); piList.add(productAddInfo);
	 * 
	 * singleProduct.setPdAddInfo(piList); product.add(singleProduct);
	 * cart.setProducts(product); System.out.println(cart); //카트 안에 상품 담기
	 * orderService.updateCart(cart); return new
	 * ResponseEntity<>("카트담기성공",HttpStatus.OK); }
	 * 
	 *//**
		 * 카트가 없는 경우, 새 CartVO를 생성합니다. 이때는 Insert쿼리문을 이용하여 정보를 주입합니다.
		 *//*
			 * else { // 카트가 존재하지 않는다면 새로운 카트를 만들어서 넣어줍니다. CartVO cart = new
			 * CartVO(customerId);
			 * // 상품 부가정보의 정보 중 quantity를 정의, 수량을 ajax를 통해 받음
		ProductAdditionalInfo productAddInfo = new ProductAdditionalInfo("quantity", quantity, productId);
		ProductVO singleProduct = productMapper.findProductById(productId);
		singleProduct.getPdAddInfo().set(2, productAddInfo);
			 * product.add(productMapper.findProductById(productId));
			 * cart.setProducts(product); System.out.println(cart);
			 * orderService.updateCart(cart); return new
			 * ResponseEntity<>("새로운카트담기성공",HttpStatus.OK); }
			 */

}
