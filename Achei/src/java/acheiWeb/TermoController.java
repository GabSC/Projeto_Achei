package acheiWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TermoController {

    @RequestMapping(value = "/{tipo}/termo", method = RequestMethod.GET)
    public ModelAndView termoGet(@PathVariable String tipo) {

        ModelAndView mv = new ModelAndView("termo/termo");
        return mv;
    }

    @RequestMapping(value = "/{tipo}/termo", method = RequestMethod.POST)
    public ModelAndView termoPost(@PathVariable String tipo) {
        ModelAndView mv = new ModelAndView("redirect:/cadastros/" + tipo);

        return mv;

    }

}
