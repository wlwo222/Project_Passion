package www.dream.com.product.persistence;

import java.util.List;

import www.dream.com.common.category.Category;
import www.dream.com.product.model.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> getList();
	
	public List<Category> getCategories();
	
	public List<ProductVO> getDetailCategory(Category cate);
	
	

}
