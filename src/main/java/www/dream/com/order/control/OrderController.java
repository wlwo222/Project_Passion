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
	 * 
	 */

	@PreAuthorize("isAuthenticated()") // 사용자의 로그인 처리
    @ResponseBody
    @GetMapping(value = "addToCart/{customerId}/{productId}/{quantity}")
    public ResponseEntity<Map<String, String>> addToCart(@PathVariable("customerId") String customerId, @PathVariable("productId") String productId, 
    		@PathVariable("quantity") String quantity) {
		
        /**
         * Cart가 ProductVO를 리스트 형태로 받기 때문에, 이렇게 받은 데이터를 통해서 List로 넣는 과정 Map 구조를 통해
         * productId와 quantity를 묶어줌. 카트에 넣을 데이터를 미리 준비
         */
		
        //새로운 ProductId와 Quantity를 담을 Map
        Map<String, String> NewProductIdsAndQ = new HashMap<>();
        //기존의 ProductId와 Quantity를 담을 Map
        Map<String, String> ExistingProductIdAndQ = new HashMap<>();
        
        CartVO usercart = orderService.getCartByUserId(customerId);

        NewProductIdsAndQ.put(productId, quantity);

        // CustomerId를 이용하여 Cart데이터가 있는지 확인
        if (usercart == null) {
            CartVO newcart = new CartVO(customerId);
            NewProductIdsAndQ.put(productId, quantity);
            orderService.putpdtinCart(newcart, NewProductIdsAndQ);
            NewProductIdsAndQ.put("success", "새로운 카트에 성공적으로 담겼습니다.");
            return new ResponseEntity<>(NewProductIdsAndQ, HttpStatus.OK);
        } else {
            /**
             * Cart가 있는 경우 데이터를 조사해서 이미 있는 상품과 비교하여 insert할 ProductId와 Update할 ProductId들을
             * 나눔.
             */

            usercart.getProducts().iterator().forEachRemaining(Existingproduct -> {
                // 지금상태의 NewProductIdsAndQ는 ajax를 통해 받은 ProductId와 Quantity를 모두 담은 상태입니다. 
                if (NewProductIdsAndQ.containsKey(Existingproduct.getProductId())) {
                    //새로 데이터를 넣으려는데 이미 Cart안에 상품이 있는 경우
                    ExistingProductIdAndQ.put(Existingproduct.getProductId(), NewProductIdsAndQ.get(Existingproduct.getProductId()));
                    NewProductIdsAndQ.remove(Existingproduct.getProductId());
                }
            });
            // 나눈 후에, OrderService에게 DB 저장을 시켜줍니다.
            orderService.updateCart(usercart, ExistingProductIdAndQ, NewProductIdsAndQ);
            NewProductIdsAndQ.put("success", "기존의 카트에 성공적으로 담겼습니다.");
            return new ResponseEntity<>(NewProductIdsAndQ, HttpStatus.OK);
        }
    }
	
	@GetMapping(value = "getProductsByCategoryId/{categoryId}")
	@ResponseBody
	public ResponseEntity<List<ProductVO>> getProductsByCategoryId(@PathVariable("categoryId") String categoryId) {
		List<ProductVO> products = new ArrayList<>();
		products = productService.getProductByDetailCat(categoryId);		
		
		return new ResponseEntity<>(products, HttpStatus.OK);
	}
}
