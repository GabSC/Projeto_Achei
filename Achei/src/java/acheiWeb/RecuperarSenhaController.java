package acheiWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecuperarSenhaController {

    @RequestMapping(value = "/recuperarSenha", method = RequestMethod.GET)
    public ModelAndView recuperarSenhaGet() {

        ModelAndView mv = new ModelAndView("/RecuperarSenha/recuperarSenha");

        return mv;
    }

    @RequestMapping(value = "/RecuperarSenha", method = RequestMethod.POST)
    public ModelAndView recuperarSenhaPost() {

        ModelAndView mv = new ModelAndView("redirect:/RecuperarSenha/recuperarSenha");

        return mv;
    }
}
