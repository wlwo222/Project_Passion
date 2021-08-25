package www.dream.com.order.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.common.category.model.Category;
import www.dream.com.common.model.CommonMngVO;
import www.dream.com.product.model.ProductVO;
import www.dream.com.product.persistence.ProductMapper;

@Data
@NoArgsConstructor
public class OrderVO extends CommonMngVO{
	
	public static final String DESCRIM4ORDER = "order";
	private String customerId;
	private String orderStatus;
	private String customerAddr;
	private String orderId;
	private String customerName;
	private String customerPhnum;
	private String productId;
	private int    totalPrice;
	private int    quantity;
	
	//orderVO를 끌어오면 안에 Product를 조회하여 한꺼번에 보여지도록합니다.
	private ProductVO product;

	@Override
	public String toString() {
		return "OrderVO [customerId=" + customerId + ", orderStatus=" + orderStatus
				+ ", customerAddr=" + customerAddr + ", orderId=" + orderId + ", customerName=" + customerName
				+ ", customerPhnum=" + customerPhnum + ", productId=" + productId + ", totalPrice=" + totalPrice
				+ ", product=" + product + ", toString()=" + super.toString() + "]";
	}
	
}
