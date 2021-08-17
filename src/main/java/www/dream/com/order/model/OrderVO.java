package www.dream.com.order.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.common.model.CommonMngVO;

@Data
@NoArgsConstructor
public class OrderVO extends CommonMngVO{
	
	public static final String DESCRIM4ORDER = "orders";
	
	private String customerId;
	private String orderStatus;
	private String customerAddr;
	private String orderId;
	private String customerName;
	private String customerPhnum;
	private String productId;
	private int    totalPrice;
	
}
