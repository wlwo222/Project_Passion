package www.dream.com.order.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@GetMapping(value="myOrder")
	public void getOrder() {
		
	}

}
