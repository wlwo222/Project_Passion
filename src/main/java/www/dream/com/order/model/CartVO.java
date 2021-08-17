package www.dream.com.order.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.product.model.ProductAdditionalInfo;
import www.dream.com.product.model.ProductVO;

@Data
@NoArgsConstructor
public class CartVO extends OrderVO {
	
	public static final String DESCRIM4CART = "cart";
	private String	 customerId;
	private List<ProductVO> products;
	private int	 productCount;
	
	//private List<ProductAdditionalInfo> pdAddInfo;
	
	//productId와 Quantity를 Map으로 묶어주고 List를 만들어서 Cart 데이터를 관리합니다. 
	//private List<Map<ProductVO, String>> pdtQuantityMapList = new ArrayList<>();
	
	public CartVO(String customerId) {
		this.customerId = customerId;
	}
}
