package www.dream.com.order.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import www.dream.com.order.model.CartVO;
import www.dream.com.order.model.OrderVO;
import www.dream.com.order.persistence.OrderMapper;
import www.dream.com.product.model.ProductVO;

@Service
@NoArgsConstructor
@AllArgsConstructor
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	public List<OrderVO> getOrdersByUserId(String userId){
		return orderMapper.getOrdersByUserId(userId);
	}
	
	
	public int isCartExist(String customerId) {
		return orderMapper.isCartExist(customerId);
	}
	
	
	public CartVO getCartByUserId(String userId) {
		return orderMapper.getCartByUserId(userId);
	}
	
	public int updateCart(String customerId, Map<String, String> newProductIdsAndQ) throws NullPointerException{
		CartVO cart = orderMapper.getCartByUserId(customerId);
		//카트가 비어있는 경우 모두 다 넣어줍니다.
		if(cart == null) {
			CartVO newCart = new CartVO(customerId);
			return orderMapper.putpdtinCart(newCart, newProductIdsAndQ);
		}
		//기존에 있던 Cart의 ProductId를 기억할 Map 입니다. Update구문을 따로 날려줘야 하기 때문에.
		
		Map<String, String> existingproductsAndQ = new HashMap<>();
		
		cart.getProducts().forEach(Existingproduct->{
			//자주 사용하는 값을 변수로 지정합니다. (코드 간소화 및 직관성, 약간의 성능)
			String productId = Existingproduct.getProductId();
			if(newProductIdsAndQ.containsKey(productId)) {
		//만약 새로 추가하는 상품이 Cart안에 이미 있던 것이라면..newProductIdsAndQ의 키와 값을 existingproductsAndQ에 넣은다음 제거합니다.(중복제거)  
				existingproductsAndQ.put(productId, newProductIdsAndQ.get(productId));
				newProductIdsAndQ.remove(productId);
			}
		});
		
		return orderMapper.updateCart(cart, existingproductsAndQ, newProductIdsAndQ);
	}
	/**
	 * 
	 * @param productId : 찾으려는 ProductId
	 * @param customerId : 검사하는 카트의 고객ID
	 * @return
	 */
	public ProductVO findProductInCart(String productId, String customerId) {
		return orderMapper.findProductInCart(productId, customerId);
	}

	public int putpdtinCart(CartVO newcart, Map<String, String> newProductIdsAndQ) {
		return orderMapper.putpdtinCart(newcart, newProductIdsAndQ);
	}
}

