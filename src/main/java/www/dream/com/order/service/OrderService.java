package www.dream.com.order.service;



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
	
	public int updateCart(CartVO cart, Map<String, String> existingProductIdAndQ, Map<String, String> newProductIdsAndQ) {
		return orderMapper.updateCart(cart, existingProductIdAndQ, newProductIdsAndQ);
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


	public int putpdtinCart(CartVO cart, Map<String, String> quantityNpIds) {
        return orderMapper.putpdtinCart(cart, quantityNpIds);
    }
}

