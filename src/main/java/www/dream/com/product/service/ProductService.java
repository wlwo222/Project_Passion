package www.dream.com.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import www.dream.com.common.category.model.Category;
import www.dream.com.common.dto.Criteria;
import www.dream.com.product.model.ProductVO;
import www.dream.com.product.persistence.ProductMapper;
@Service
@NoArgsConstructor
@AllArgsConstructor
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	
	public List<ProductVO> getList(){
		return productMapper.getList();	
	} 
	
	public ProductVO getAddInfoOfProduct(ProductVO product) {
		return productMapper.getAddInfoOfProduct(product);
	}

	public List<ProductVO> getListByPaging(Criteria userCriteria) {
		return productMapper.getListByPaging(userCriteria);
	}
	
	public List<ProductVO> getAddInfoeachProducts(List<ProductVO> products){
		return productMapper.getAddInfoeachProducts(products);
	}
	
	public long getTotalCount() {
		return productMapper.getTotalCount();
	}
	
	/* Category*/
	public List<Category> getCategories(){
		return productMapper.getCategories();
	}
	
	public List<ProductVO> getProductByDetailCat(String categoryId){
		return productMapper.getProductByDetailCat(categoryId);
	}
	
	public int updateProduct(ProductVO product) {
		return productMapper.updateProduct(product);
	}

	public ProductVO findProductById(String id) {
		return productMapper.findProductById(id);
	}
	
	public int registerProduct(ProductVO product) {
		return productMapper.registerProduct(product);
	}
	
	public int deleteProductById(String ProductId) {
		return productMapper.deleteProductById(ProductId);
	}
	
	public ProductVO getAddInfoListofProduct(String id) {
		return productMapper.getAddInfoListofProduct(id);
	}

	public Map<String, List<Category>> getUpperAndSubcategories(){
		
		Map<String, List<Category>> Categories = new HashMap<>();
		List<Category> upperCategories = new ArrayList<>();
		List<Category> subCategories = new ArrayList<>();
		productMapper.getcategoryList().forEach(category->{
			//카테고리 길이를 조사해서 상위 카테고리와 하위 카테고리를 나눕니다.
			if(category.getCategoryId().length() < 3) {
				upperCategories.add(category);
			} else {
				subCategories.add(category);
			}
		});
		Categories.put("subCategories", subCategories);
		Categories.put("upperCategories", upperCategories);
		
		return Categories;
	}


}
