package jrr.achei.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jrr.achei.model.ConnectionManager;
import jrr.achei.model.base.service.BaseProfissionalService;
import jrr.achei.model.criteria.ProfissionalCriteria;
import jrr.achei.model.criteria.UsuarioCriteria;
import jrr.achei.model.dao.UsuarioDAO;
import jrr.achei.model.entity.Profissional;

public class ProfissionalService implements BaseProfissionalService {

    @Override
    public void create(Profissional entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            UsuarioDAO uDAO = new UsuarioDAO();
            uDAO.create(conn, entity);
            conn.commit();
            conn.close();

        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }

    }

    @Override
    public Profissional readById(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Profissional profissional = null;
        try {
            UsuarioDAO usuariodao = new UsuarioDAO();
            profissional = (Profissional) usuariodao.readById(conn, id);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return profissional;
    }

    @Override
    public void update(Profissional entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            UsuarioDAO dao = new UsuarioDAO();
            dao.update(conn, entity);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public void delete(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            UsuarioDAO dao = new UsuarioDAO();
            dao.delete(conn, id);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public List<Profissional> readByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        List<Profissional> profissonalList = null;
        try {
            UsuarioDAO dao = new UsuarioDAO();
            if (criteria == null) {
                criteria = new HashMap<>();
            }
            criteria.put(UsuarioCriteria.PROFISSIONAL, Boolean.TRUE);
            profissonalList = (List) dao.readByCriteria(conn, criteria, limit, offset);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return profissonalList;
    }

    @Override
    public Long countByCriteria(Map<Long, Object> criteria) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Long count = 0L;
        try {
            UsuarioDAO dao = new UsuarioDAO();

            if (criteria == null) {
                criteria = new HashMap<>();
            }
            criteria.put(UsuarioCriteria.PROFISSIONAL, Boolean.TRUE);
            count = dao.countByCriteria(conn, criteria);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return count;
    }

    @Override
    public Map<String, String> validate(Map<String, Object> fields) throws Exception {

        Map<String, String> errors = new HashMap<>();
        Long id = (Long) fields.get("id");
        String nome = (String) fields.get("nome");
        if (nome == null || nome.trim().isEmpty()) {
            errors.put("nome", "Campo Obrigatório!");
        } else {
            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(ProfissionalCriteria.NOME_EQ, nome);
        }

        Long nota = (Long) fields.get("nota");
        if (nota < 0 && nota > 5) {
            errors.put("nota", "Campo Obrigatório!");
        } else {
            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(ProfissionalCriteria.NOTA_EQ, nota);

            List<Profissional> profissionalList = this.readByCriteria(criteria, null, null);
            if (!profissionalList.isEmpty()) {
                errors.put("nota", "Este valor é necessário para avaliaçao!");
            }
        }
        return errors;

    }
}
