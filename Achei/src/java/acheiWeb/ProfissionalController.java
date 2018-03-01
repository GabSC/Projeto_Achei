package acheiWeb;

import java.util.logging.Level;
import java.util.logging.Logger;
import jrr.achei.model.entity.Profissional;
import jrr.achei.model.service.ProfissionalService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProfissionalController {

    @RequestMapping(value = "/cadastros/profissional", method = RequestMethod.GET)
    public ModelAndView profissionalGet() {

        ModelAndView mv = new ModelAndView("cadastros/profissional/form");

        return mv;
    }

    @RequestMapping(value = "/cadastros/profissional", method = RequestMethod.POST)
    public ModelAndView profissionalPost(@ModelAttribute Profissional profissional) {

        ProfissionalService s = new ProfissionalService();
        try {
            s.create(profissional);
        } catch (Exception ex) {
            Logger.getLogger(ProfissionalController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return new ModelAndView("redirect:/cadastros/profissional");

    }

    @RequestMapping(value = "/web/planos", method = RequestMethod.GET)
    public ModelAndView getPlanos() throws Exception {

        ModelAndView mv = new ModelAndView();
        return mv;
    }

    @RequestMapping(value = "/web/planos", method = RequestMethod.POST)
    public ModelAndView postPlanos() throws Exception {

        ModelAndView mv = new ModelAndView();
        return mv;
    }

    @RequestMapping(value = "/profissional/{id}/editar", method = RequestMethod.GET)
    public ModelAndView editarProfissionalGet(@PathVariable Long id) throws Exception {

        ModelAndView mv = new ModelAndView("editar/profissional/editarProfissional");

        return mv;
    }

    @RequestMapping(value = "/profissional/{id}/editar", method = RequestMethod.POST)
    public ModelAndView editarProfissionalPost(@ModelAttribute Profissional profissional) {

        ProfissionalService s = new ProfissionalService();
        try {
            s.create(profissional);
        } catch (Exception ex) {
            Logger.getLogger(ProfissionalController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        ModelAndView mv = new ModelAndView("editar/profissional/editarProfissional");

        return mv;
    }

}
