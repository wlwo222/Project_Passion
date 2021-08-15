package www.dream.com.order.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.dream.com.order.model.CartVO;
import www.dream.com.product.model.ProductVO;

public interface OrderMapper {
	
	/* Cart */
	// public List<CartVO> getCartList(); 
	
	public int isCartExist(String customerId);
	
	public CartVO getCartByUserId(String userId);
	
	public int updateCart(@Param("cart")CartVO cart, @Param("existingProductIds")List<String> existingProductIds, @Param("newProductIdsForCart")List<String> newProductIdsForCart);
	
	public ProductVO findProductInCart(@Param("productId")String productId, @Param("customerId")String customerId);

	public int putpdtinCart(@Param("cart") CartVO cart, @Param("selectedProductId")String selectedProductId, @Param("quantity")String quantity);
	
	/* Order */
	
}
