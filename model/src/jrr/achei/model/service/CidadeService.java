package jrr.achei.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jrr.achei.model.ConnectionManager;
import jrr.achei.model.base.service.BaseCidadeService;
import jrr.achei.model.criteria.CidadeCriteria;
import jrr.achei.model.dao.CidadeDAO;
import jrr.achei.model.entity.Cidade;

public class CidadeService implements BaseCidadeService {

    @Override
    public void create(Cidade entity) throws Exception {

        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            CidadeDAO cidadeDAO = new CidadeDAO();
            cidadeDAO.create(conn, entity);
            conn.commit();
            conn.close();

        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public Cidade readById(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Cidade cidade = null;
        try {
            CidadeDAO cidadedao = new CidadeDAO();
            cidade = cidadedao.readById(conn, id);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return cidade;
    }

    @Override
    public void update(Cidade entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            CidadeDAO cidadeDAO = new CidadeDAO();
            cidadeDAO.update(conn, entity);
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
            CidadeDAO cidadeDAO = new CidadeDAO();
            cidadeDAO.delete(conn, id);
            conn.commit();
            conn.close();

        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public List<Cidade> readByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();

        List<Cidade> listaCidades = null;

        try {
            CidadeDAO dao = new CidadeDAO();
            listaCidades = dao.readByCriteria(conn, criteria, limit, offset);

            conn.commit();
            conn.close();
        } catch (Exception e) {

            conn.rollback();
            conn.close();

        }

        return listaCidades;
    }

    @Override
    public Long countByCriteria(Map<Long, Object> criteria) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Long count = 0L;
        try {
            CidadeDAO dao = new CidadeDAO();

            if (criteria == null) {
                criteria = new HashMap<>();
            }
            criteria.put(CidadeCriteria.NOME_EQ, Boolean.TRUE);
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
            criteria.put(CidadeCriteria.NOME_EQ, nome);

            List<Cidade> cidadeList = this.readByCriteria(criteria, null, null);
            if (!cidadeList.isEmpty()) {
                errors.put("nome", "Este valor já se encontra em uso!");
            }
        }
        return errors;
    }
}
