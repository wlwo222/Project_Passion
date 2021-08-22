package www.dream.com.homes.control;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import www.dream.com.common.dto.Criteria;
import www.dream.com.product.persistence.ProductMapper;
import www.dream.com.product.service.ProductService;

@Controller
@RequestMapping("/homes/*")
public class HomesController {
	@Autowired
	ProductMapper productMapper;
	@Autowired
	ProductService productService;
	
	
	
	//  /homes/index 
	@GetMapping(value="index")
	public void index(Model model, @RequestParam("pageNumber") String pageNumber,  
			@ModelAttribute("pagenation") Criteria userCriteria){
		// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
		System.out.println(userCriteria);
		userCriteria.setTotal(productService.getTotalCount());
		model.addAttribute("productList", productService.getAddInfoeachProducts(productService.getListByPaging(userCriteria)));
	}
	
	//  /homes/productDetail?productId= 현재는 테스트를 위해서 /homes/productDetail 까지만. 
	@GetMapping(value="productDetail")
	public void productDetail(@RequestParam("productId")String productId, Model model){
		model.addAttribute("product", productMapper.findProductById(productId));
	}
}
