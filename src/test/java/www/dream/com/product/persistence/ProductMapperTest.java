package www.dream.com.product.persistence;

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


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductMapperTest {
	@Autowired
	private ProductMapper productMapper;
	
	
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
	public void test000GetCate() {
		try {
			Category target = new Category(1);
			List<ProductVO> tt = productMapper.getProductByDetailCat(target);
			tt.forEach(t->{
				System.out.println(t);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
