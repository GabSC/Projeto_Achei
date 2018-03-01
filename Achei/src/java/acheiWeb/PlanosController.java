package acheiWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PlanosController {
    
     @RequestMapping(value = "/planos",method = RequestMethod.GET)
    public ModelAndView planosGet(){
        
        ModelAndView mv  = new ModelAndView("planos/planos");
        
        return mv;
    }
    
    @RequestMapping(value = "/planos/planos",method = RequestMethod.POST)
    public ModelAndView planosPost(){
        
        ModelAndView mv  = new ModelAndView("redirect:/planos/planos");
        
        return mv;
    }
    
    
}
