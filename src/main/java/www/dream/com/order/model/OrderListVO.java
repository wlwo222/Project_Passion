package www.dream.com.order.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderListVO {
	private String orderId;
	private int quantity;
	private String productId;
	private int totalPrice;
}
