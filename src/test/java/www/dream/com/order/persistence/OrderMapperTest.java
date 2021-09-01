package www.dream.com.order.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import www.dream.com.order.model.CartVO;
import www.dream.com.order.model.OrderVO;
import www.dream.com.order.service.OrderService;
import www.dream.com.product.model.ProductAdditionalInfo;
import www.dream.com.product.model.ProductVO;
import www.dream.com.product.persistence.ProductMapper;
import www.dream.com.product.service.ProductService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class OrderMapperTest {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductMapper productMapper;

	//@Test
	public void test010updateCart() {
		try {
			List<ProductVO> product = new ArrayList<>();
			List<ProductAdditionalInfo> pIList = new ArrayList<>();
			
			// 상품 부가정보의 정보 중 quantity를 정의, 수량을 ajax를 통해 받음 Type, 갯수, id
			ProductAdditionalInfo productAddInfo = new ProductAdditionalInfo("quantity", "35","87"); 
			
			CartVO cart = new CartVO("admin");
			cart.setProducts(product);
			System.out.println(cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test001putProductinCart() {
		try {
			//새로운 ProductId와 Quantity를 담을 Map
			
			CartVO cart = orderService.getCartByUserId("admin");
			cart.setProducts(productMapper.getAddInfoeachProducts(cart.getProducts())); 
			System.out.println(cart);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void test001getProductsAndAddInfo() {
		try {
			List<OrderVO> orders = orderService.getOrdersByUserId("admin");
			
			orders.forEach(order->{
				order.setProduct(productMapper.getAddInfoOfProduct(order.getProduct()));
				System.out.println(order);
			});
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
