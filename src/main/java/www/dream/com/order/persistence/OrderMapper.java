package www.dream.com.order.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import www.dream.com.order.model.CartVO;
import www.dream.com.order.model.OrderVO;
import www.dream.com.product.model.ProductVO;

public interface OrderMapper {
	
	/* Cart */
	// public List<CartVO> getCartList(); 
	
	public int isCartExist(String customerId);
	
	public CartVO getCartByUserId(String userId);
	
	public int updateCart(@Param("cart")CartVO cart, @Param("existingProductIdAndQ")Map<String, String> existingProductIdAndQ, @Param("newProductIdsAndQ")Map<String, String> newProductIdsAndQ);
	
	public ProductVO findProductInCart(@Param("productId")String productId, @Param("customerId")String customerId);

	public int putpdtinCart(@Param("cart") CartVO cart, @Param("quantityNpIds")Map<String, String> quantityNpIds);
	
	/* Order */
	
	public List<OrderVO> getOrdersByUserId(String userId);
	
}
