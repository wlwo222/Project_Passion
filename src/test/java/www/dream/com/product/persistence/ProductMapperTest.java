package www.dream.com.product.persistence;

import java.util.ArrayList;
import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import www.dream.com.common.category.model.Category;
import www.dream.com.product.model.ProductVO;
import www.dream.com.product.service.ProductService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductMapperTest {
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	ProductService productService;
	
	
	//@Test
	public void test000GetList() {
		try {
			productMapper.getList().forEach(p->{
				System.out.println(p);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test000GetAddInfo() {
		try {
			ProductVO product1 = new ProductVO("227");
			ProductVO product2 = new ProductVO("228");
			ProductVO product3 = new ProductVO("229");
			
			List<ProductVO> products = new ArrayList<>();
			products.add(product1);
			products.add(product2);
			products.add(product3);
			
			products = productMapper.getAddInfoeachProducts(products);
			
			products.forEach(p->{
				System.out.println(p);
			});
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void test003GetCategories() {
		try {
			List<Category> subCategories = productService.getUpperAndSubcategories().get("subCategories");
			subCategories.forEach(categories->{
				System.out.println(categories);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
