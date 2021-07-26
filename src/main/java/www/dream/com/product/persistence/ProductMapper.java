package www.dream.com.product.persistence;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import www.dream.com.common.category.model.Category;
import www.dream.com.product.model.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> getList();
	
	public List<Category> getCategories();
	
	public List<ProductVO> getProductByDetailCat(Category cate);
	
	public int updateProduct(ProductVO product); 

	public ProductVO findProductById(String id);
	
	public int registerProduct(ProductVO product);
	
	public int deleteProductById(String ProductId);
}
