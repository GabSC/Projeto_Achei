package acheiWeb;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import jrr.achei.model.base.service.BaseUsuarioService;
import jrr.achei.model.entity.Cliente;
import jrr.achei.model.entity.Profissional;
import jrr.achei.model.entity.Usuario;
import jrr.achei.model.service.UsuarioService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView efetuarLoginCliente(@RequestParam("email") String email, @RequestParam("senha") String senha, HttpSession session) {

        BaseUsuarioService bUS = new UsuarioService();
        try {
            Usuario usuario = bUS.login(email, senha);
            if (usuario == null) {
                return new ModelAndView("redirect:/index");
            } else if (usuario instanceof Cliente) {
                session.setAttribute("usuarioLogado", usuario);
                return new ModelAndView("redirect:/busca");
            } else if (usuario instanceof Profissional) {
                session.setAttribute("usuarioLogado", usuario);
                return new ModelAndView("redirect:/editar/" + usuario.getId() + "/"
                        + "");
            }

        } catch (Exception ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
