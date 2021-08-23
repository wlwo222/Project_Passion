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
    public void index(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
    	model.addAttribute("productList", productService.getAddInfoeachProducts(productService.getListByPaging(userCriteria)));
		userCriteria.setTotal(productService.getTotalCount());
    }
    
    //  /homes/productDetail?productId= 현재는 테스트를 위해서 /homes/productDetail 까지만. 
    @GetMapping(value="productDetail")
    public void productDetail(@RequestParam("productId")String productId, Model model){
        model.addAttribute("product", productMapper.findProductById(productId));
    }
    
//  /homes/hood 
	@GetMapping(value="top/hood")
	public void hood(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
		// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
		model.addAttribute("hood", productService.getProductByDetailCat("20000g"));
		userCriteria.setTotal(productService.getTotalCount());
	}
	
	// /homes/longsleeves 
	@GetMapping(value="top/longsleeves")
	public void longsleeves(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
		// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
		model.addAttribute("longsleeves", productService.getProductByDetailCat("20000b"));
		userCriteria.setTotal(productService.getTotalCount());
	}
	
	// /homes/mantoman
	@GetMapping(value="top/mantoman")
	public void mantoman(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
		// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
		model.addAttribute("mantoman", productService.getProductByDetailCat("20000f"));
		userCriteria.setTotal(productService.getTotalCount());
	}
		
	// /homes/pique
	@GetMapping(value="top/pique")
	public void pique(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
		// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
		model.addAttribute("pique", productService.getProductByDetailCat("20000e"));
		userCriteria.setTotal(productService.getTotalCount());
	}
	
	// /homes/shirt
	@GetMapping(value="top/shirt")
	public void shirt(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
		// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
		model.addAttribute("shirt", productService.getProductByDetailCat("20000d"));
		userCriteria.setTotal(productService.getTotalCount());
	}
	
	// /homes/shortsleeve
	@GetMapping(value="top/shortsleeve")
	public void shortsleeve(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
		// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
		model.addAttribute("shortsleeve", productService.getProductByDetailCat("20000a"));
		userCriteria.setTotal(productService.getTotalCount());
	}
	
	// /homes/sleeveless
	@GetMapping(value="top/sleeveless")
	public void sleeveless(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
			// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
			model.addAttribute("sleeveless", productService.getProductByDetailCat("20000c"));
			userCriteria.setTotal(productService.getTotalCount());
	}
		
		
	// /homes/sweater
	@GetMapping(value="top/sweater")
	public void sweater(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
			// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
			model.addAttribute("sweater", productService.getProductByDetailCat("20000h"));
			userCriteria.setTotal(productService.getTotalCount());
	}
    
    // /homes/baseballcap
    @GetMapping(value="hat/baseballcap")
    public void baseballcap(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("baseballcap", productService.getProductByDetailCat("10000a"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="hat/beanie")
    public void beanie(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("beanie", productService.getProductByDetailCat("10000f"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="hat/beret")
    public void beret(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("beret", productService.getProductByDetailCat("10000b"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="hat/fedora")
    public void fedora(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("fedora", productService.getProductByDetailCat("10000d"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="hat/otherhats")
    public void otherhats(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("otherhats", productService.getProductByDetailCat("10000e"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="hat/trooper")
    public void trooper(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("trooper", productService.getProductByDetailCat("10000c"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="outer/cardigan")
    public void cardigan(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("cardigan", productService.getProductByDetailCat("50000e"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="outer/hoodzipup")
    public void hoodzipup(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("hoodzipup", productService.getProductByDetailCat("50000a"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="outer/seasoncoat")
    public void seasoncoat(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("seasoncoat", productService.getProductByDetailCat("50000b"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="outer/jacket")
    public void jacket(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("jacket", productService.getProductByDetailCat("50000d"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="outer/otherouter")
    public void otherouter(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("otherouter", productService.getProductByDetailCat("50000f"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    
    @GetMapping(value="outer/wintercoat")
    public void wintercoat(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("wintercoat", productService.getProductByDetailCat("50000c"));
        userCriteria.setTotal(productService.getTotalCount());
    }
    

 	// /homes/pants
 	@GetMapping(value="pants/pants")
 	public void pants(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
 	// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
 	model.addAttribute("pants", productService.getProductByDetailCat("30000a"));
 	userCriteria.setTotal(productService.getTotalCount());
 			}
 	// /homes/slacks
 	@GetMapping(value="pants/slacks")
 	public void slacks(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
 	// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
 	model.addAttribute("slacks", productService.getProductByDetailCat("30000e"));
 	userCriteria.setTotal(productService.getTotalCount());
 				}
 	
 		// /homes/suit
 	@GetMapping(value="pants/suit")
 	public void suit(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
 	// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
 	model.addAttribute("suit", productService.getProductByDetailCat("30000c"));
 	userCriteria.setTotal(productService.getTotalCount());
 				}
 	
 	// /homes/training
 	@GetMapping(value="pants/training")
 	public void training(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
 	// model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
 	model.addAttribute("training", productService.getProductByDetailCat("30000d"));
 	userCriteria.setTotal(productService.getTotalCount());
 				}
 	
 	@GetMapping(value="shoes/sandalsslippersboots")
    public void sandalsslippersboots(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("sandalsslippersboots", productService.getProductByDetailCat("40000c"));
        userCriteria.setTotal(productService.getTotalCount());
    }
 	
 	@GetMapping(value="shoes/shoes")
    public void shoes(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("shoes", productService.getProductByDetailCat("40000a"));
        userCriteria.setTotal(productService.getTotalCount());
    }
 	
 	@GetMapping(value="shoes/sneakers")
    public void sneakers(Model model,@RequestParam("pageNumber") String pageNumber, @RequestParam("amount") String amount,
			@ModelAttribute("pagenation") Criteria userCriteria){
        // model이라는 인터페이스에 jsp에 전달해줄 속성을 집어넣는 것 1(모델명) : 1(모델값)
        model.addAttribute("sneakers", productService.getProductByDetailCat("40000b"));
        userCriteria.setTotal(productService.getTotalCount());
    }
 }
    