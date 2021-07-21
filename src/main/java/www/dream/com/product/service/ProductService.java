package www.dream.com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
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
		
}
