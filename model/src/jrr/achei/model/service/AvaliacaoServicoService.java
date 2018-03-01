package jrr.achei.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jrr.achei.model.ConnectionManager;
import jrr.achei.model.base.service.BaseAvaliacaoServicoService;
import jrr.achei.model.criteria.AvaliacaoCriteria;
import jrr.achei.model.dao.AvaliacaoServicoDAO;
import jrr.achei.model.entity.AvaliacaoServico;

public class AvaliacaoServicoService implements BaseAvaliacaoServicoService {

    @Override
    public void create(AvaliacaoServico entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();

        try {
            AvaliacaoServicoDAO avaliacaoDAO = new AvaliacaoServicoDAO();
            avaliacaoDAO.create(conn, entity);
            conn.commit();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }

    }

    @Override
    public AvaliacaoServico readById(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();

        AvaliacaoServico avaliacao = null;
        try {
            AvaliacaoServicoDAO avaliacaoDAO = new AvaliacaoServicoDAO();
            avaliacao = avaliacaoDAO.readById(conn, id);
            conn.commit();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return avaliacao;
    }

    @Override
    public void update(AvaliacaoServico entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            AvaliacaoServicoDAO avaliacaoDAO = new AvaliacaoServicoDAO();
            avaliacaoDAO.update(conn, entity);
            conn.commit();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
    }

    @Override
    public void delete(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            AvaliacaoServicoDAO avaliacaoDAO = new AvaliacaoServicoDAO();
            avaliacaoDAO.delete(conn, id);
            conn.commit();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
    }

    @Override
    public List<AvaliacaoServico> readByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        List<AvaliacaoServico> avaliacaoList = null;
        try {
            AvaliacaoServicoDAO avaliacaoDAO = new AvaliacaoServicoDAO();
            avaliacaoList = avaliacaoDAO.readByCriteria(conn, criteria, limit, offset);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return avaliacaoList;
    }

    @Override
    public Long countByCriteria(Map<Long, Object> criteria) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Long count = 0L;
        try {
            AvaliacaoServicoDAO avaliacaoDAO = new AvaliacaoServicoDAO();
            avaliacaoDAO.countByCriteria(conn, criteria);
            conn.commit();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return count;
    }

    @Override
    public Map<String, String> validate(Map<String, Object> fields) throws Exception {
    
        Map<String, String> errors = new HashMap<>();

        Long id = (Long) fields.get("id");
        Long nota = (Long) fields.get("nota");
        if (nota < 0 && nota > 5 ) {
            errors.put("nota", "Campo Obrigatório!");
        } else {
            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(AvaliacaoCriteria.NOTA_EQ, nota);
            
            
            List<AvaliacaoServico> avaliacaoList
                    = this.readByCriteria(criteria, null, null);
            if (!avaliacaoList.isEmpty()) {
                errors.put("nota", "Este valor é necessário para avaliaçao!");
            }
        }
        return errors;
    }

}
