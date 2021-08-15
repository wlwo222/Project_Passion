package www.dream.com.common.category.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.product.model.ProductVO;

@Data
@NoArgsConstructor
public class Category {
	
	private String categoryId;
	private String categoryName;
	
	private List<ProductVO> productList = new ArrayList<>();	

	public Category(String catId) {
		this.categoryId = catId;
	}
	
}
