package www.dream.com.homes.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/homes/*")
public class HomesController {
	
	@GetMapping(value="index")
	public void hhhh(){
	}
	
}
