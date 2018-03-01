package acheiWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NavbarController {
    
     @RequestMapping(value = "/ajuda", method= RequestMethod.GET)
    public ModelAndView AjudaGet() {

        ModelAndView mv = new ModelAndView("/ajuda/ajuda");

        return mv;
    }

    @RequestMapping(value = "/ajuda", method = RequestMethod.POST)
    public ModelAndView AjudaPost(){
    
    ModelAndView mv = new ModelAndView("/redirect:/ajuda/ajuda");
    
    return mv;
    
    }
    
     @RequestMapping(value = "/sobre", method= RequestMethod.GET)
    public ModelAndView SobreGet() {

        ModelAndView mv = new ModelAndView("/sobre/sobre");

        return mv;
    }

    @RequestMapping(value = "/cursos", method = RequestMethod.GET)
    public ModelAndView CursosGet(){
    
    ModelAndView mv = new ModelAndView("/cursosQualificacoes/cursos");
    
    return mv;
    
    }
    
   
}
