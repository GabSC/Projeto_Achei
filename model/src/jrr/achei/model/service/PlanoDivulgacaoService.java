package jrr.achei.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jrr.achei.model.ConnectionManager;
import jrr.achei.model.base.service.BasePlanoDivulgacaoService;
import jrr.achei.model.criteria.PlanoDivulgacaoCriteria;
import jrr.achei.model.dao.PlanoDivulgacaoDAO;
import jrr.achei.model.entity.PlanoDivulgacao;

public class PlanoDivulgacaoService implements BasePlanoDivulgacaoService {

    @Override
    public void create(PlanoDivulgacao entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            PlanoDivulgacaoDAO planoDAO = new PlanoDivulgacaoDAO();
            planoDAO.create(conn, entity);
            conn.commit();
            conn.close();

        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public PlanoDivulgacao readById(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        PlanoDivulgacao plano = null;
        try {
            PlanoDivulgacaoDAO planodao = new PlanoDivulgacaoDAO();
            plano = planodao.readById(conn, id);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return plano;
    }

    @Override
    public void update(PlanoDivulgacao entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            PlanoDivulgacaoDAO planoDAO = new PlanoDivulgacaoDAO();
            planoDAO.update(conn, entity);
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
            PlanoDivulgacaoDAO planoDAO = new PlanoDivulgacaoDAO();
            planoDAO.delete(conn, id);
            conn.commit();
            conn.close();

        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public List<PlanoDivulgacao> readByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Long countByCriteria(Map<Long, Object> criteria) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Long count = 0L;
        try {
            PlanoDivulgacaoDAO planodao = new PlanoDivulgacaoDAO();

            if (criteria == null) {
                criteria = new HashMap<>();
            }
            criteria.put(PlanoDivulgacaoCriteria.NOME_EQ, Boolean.TRUE);
            count = planodao.countByCriteria(conn, criteria);
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
            criteria.put(PlanoDivulgacaoCriteria.NOME_EQ, nome);

            Float preco = (Float) fields.get("preco");
            if (preco == null && preco < 0) {
                criteria.put(PlanoDivulgacaoCriteria.PRECO_EQ, preco);
            }
            List<PlanoDivulgacao> planoList = this.readByCriteria(criteria, null, null);
            if (!planoList.isEmpty()) {
                errors.put("nome", "Este valor é necessário para usar o serviço!");
            }
        }
        return errors;
    }
}


