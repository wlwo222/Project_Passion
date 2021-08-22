package www.dream.com.product.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.dream.com.common.category.model.Category;
import www.dream.com.common.dto.Criteria;
import www.dream.com.product.model.ProductVO;

public interface ProductMapper {
	
	public long getTotalCount();
	
	public List<ProductVO> getList();
	
	public List<ProductVO> getAddInfoeachProducts(@Param("products")List<ProductVO> products);
	
	public List<ProductVO> getListByPaging(Criteria cri);
	
	public List<Category> getCategories();
	
	public List<ProductVO> getProductByDetailCat(String categoryId);
	
	public int updateProduct(ProductVO product); 

	public ProductVO findProductById(String id);
	
	public int registerProduct(ProductVO product);
	
	public int deleteProductById(String ProductId);
	
	public ProductVO getAddInfoListofProduct(String id);

	public List<Category> getcategoryList();

	public ProductVO getAddInfoOfProduct(ProductVO product); 
}
