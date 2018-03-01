package acheiWeb;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import jrr.achei.model.criteria.CategoriaCriteria;
import jrr.achei.model.entity.Categoria;
import jrr.achei.model.service.CategoriaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServicosController {
    
    @RequestMapping(value = "/servicos", method = RequestMethod.GET)
    public ModelAndView categoriaGet(String nome, String descricao, Long limit, Long offset) {
        
        ModelAndView mv = new ModelAndView("/servicosExistentes/servicos");
        
        CategoriaService CS = new CategoriaService();
        try {
            Map<Long, Object> criteriaMap = new HashMap<>();
            criteriaMap.put(CategoriaCriteria.NOME_ILIKE, nome);
            criteriaMap.put(CategoriaCriteria.DESCRICAO_ILIKE, descricao);
            List<Categoria> categoriaList = CS.readByCriteria(criteriaMap, limit, offset);
            mv.addObject("categoriaList", categoriaList);
            mv.addObject("limit", limit);
            mv.addObject("offset", offset);
        } catch (Exception ex) {
            Logger.getLogger(ClienteController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return mv;
        
    }
    
}
