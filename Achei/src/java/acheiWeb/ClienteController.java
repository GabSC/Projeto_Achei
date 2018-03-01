package acheiWeb;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jrr.achei.model.entity.Cliente;
import jrr.achei.model.service.ClienteService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClienteController {

    @RequestMapping(value = "/cadastros/cliente", method = RequestMethod.GET)
    public ModelAndView clienteGet() {

        ModelAndView mv = new ModelAndView("cadastros/cliente/form");

        return mv;
    }

    @RequestMapping(value = "/cadastros/cliente", method = RequestMethod.POST)
    public ModelAndView clientePost(@ModelAttribute Cliente cliente) {

        ClienteService ls = new ClienteService();
        try {
            ls.create(cliente);
        } catch (Exception ex) {
            Logger.getLogger(ClienteController.class.getName()).log(Level.SEVERE, null, ex);
        }

        ModelAndView mv = new ModelAndView("redirect:/"); 
        return mv;

    }

    @RequestMapping(value = "/cadastros/cliente/lista", method = RequestMethod.GET)
    public ModelAndView getClienteList() throws Exception {
        
        ClienteService s = new ClienteService();
        List<Cliente> clienteList = s.readByCriteria(null, Long.MIN_VALUE, Long.MIN_VALUE);
        ModelAndView mv = new ModelAndView("cadastros/cliente/list");
        mv.addObject("clienteList", clienteList);
        return mv;
    }

    @RequestMapping(value = "/cliente/{id}/editar", method = RequestMethod.GET)
    public ModelAndView getClienteForm(@PathVariable Long id) throws Exception {
        
        ClienteService s = new ClienteService();
        Cliente cliente = new Cliente();

        cliente = s.readById(id);

        ModelAndView mv = new ModelAndView("editar/cliente/editarCliente");
        mv.addObject("cliente", cliente);

        return mv;
    }

    @RequestMapping(value = "/cliente/{id}/editar", method = RequestMethod.POST)
    public ModelAndView postClienteForm(@ModelAttribute Cliente cliente) {

        ClienteService s = new ClienteService();
        
        try {
            s.update(cliente);
        } catch (Exception ex) {
            Logger.getLogger(ClienteController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new ModelAndView("redirect:editar/cliente/editarCliente");
    }

    

}
