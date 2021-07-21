package www.dream.com.product.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import www.dream.com.product.model.ProductVO;
import www.dream.com.product.persistence.ProductMapper;
import www.dream.com.product.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	ProductMapper productMapper;
	
		//LRCUD
		@GetMapping(value="listByProduct")
		public void listPostBySearch(Model model){
			model.addAttribute("productList", productMapper.getList());
		}
		
		@GetMapping(value="registerProduct")
    	public void registerProduct(Model model) {
    		model.addAttribute("categoryList", productMapper.getCategories());
    	}

    	@PostMapping(value="registerProduct")
    	public void registerProduct(ProductVO newProduct) {
    		productMapper.registerProduct(newProduct);
    	}
		
		@GetMapping(value="updateProduct")
		public void updateProduct(@RequestParam("ProductId") String ProductId, Model model){
			model.addAttribute("Product", productMapper.findProductById(ProductId));
		}
		
		@PostMapping(value="updateProduct")
		public void updateProduct(ProductVO product){
			System.out.println(product);
		 	productMapper.updateProduct(product);
		}
		//delete
		@PostMapping(value="listByProduct")
		public void deleteProduct(String ProductId){
		 	productMapper.deleteProductById(ProductId);
		}
}