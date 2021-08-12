package www.dream.com.juso.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/juso/*")
public class JusoController {

    @GetMapping(value="juso")
    public void vv() {
    }
    
}