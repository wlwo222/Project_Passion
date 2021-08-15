package www.dream.com.order.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import www.dream.com.order.model.CartVO;
import www.dream.com.order.persistence.OrderMapper;
import www.dream.com.product.model.ProductVO;

@Service
@NoArgsConstructor
@AllArgsConstructor
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	
	public int isCartExist(String customerId) {
		return orderMapper.isCartExist(customerId);
	}
	
	
	public CartVO getCartByUserId(String userId) {
		return orderMapper.getCartByUserId(userId);
	}
	
	public int updateCart(CartVO cart, List<String> existingProductIds, List<String> newProductIdsForCart) {
		return orderMapper.updateCart(cart, existingProductIds, newProductIdsForCart);
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


	public int putpdtinCart(CartVO cart, String selectedProductId, String quantity) {
		return orderMapper.putpdtinCart(cart, selectedProductId, quantity);
	}
}

