package jrr.achei.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jrr.achei.model.ConnectionManager;
import jrr.achei.model.base.service.BaseUsuarioService;
import jrr.achei.model.criteria.UsuarioCriteria;
import jrr.achei.model.dao.UsuarioDAO;
import jrr.achei.model.entity.Usuario;

public class UsuarioService implements BaseUsuarioService {

    @Override
    public Usuario login(String email, String senha) throws Exception {

        Connection conn = ConnectionManager.getInstance().getConnection();

        Usuario user = null;

        Map<Long, Object> criteria = new HashMap<>();

        criteria.put(UsuarioCriteria.SENHA_EQ, senha);
        criteria.put(UsuarioCriteria.EMAIL_EQ, email);

        UsuarioDAO uDao = new UsuarioDAO();

        List<Usuario> listaDeUsuarios = uDao.readByCriteria(conn, criteria, 0L, 0L);

        if (listaDeUsuarios.size() == 1) {
            Usuario aux = listaDeUsuarios.get(0);
            user = aux;
        }

        conn.close();

        return user;
    }

}
