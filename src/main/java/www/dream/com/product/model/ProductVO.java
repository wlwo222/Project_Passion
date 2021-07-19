package www.dream.com.product.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductVO {
	private	String productId;
	private int    categoryId;
	private int	   quantity;
	private String productName;
	private int	   price;
	private String productSize;	
}

