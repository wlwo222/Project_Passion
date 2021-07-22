package www.dream.com.product.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.common.model.CommonMngVO;

@Data
@NoArgsConstructor
public class ProductVO extends CommonMngVO{
	private	String productId;
	private int    categoryId;
	private int	   quantity;
	private String productName;
	private int	   price;
	private String productSize;
	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", categoryId=" + categoryId + ", quantity=" + quantity
				+ ", productName=" + productName + ", price=" + price + ", productSize=" + productSize + ", toString()="
				+ super.toString() + "]";
	}	
	
}

