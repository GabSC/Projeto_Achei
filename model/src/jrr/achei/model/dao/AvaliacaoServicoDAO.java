package jrr.achei.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import jrr.achei.model.base.BaseDAO;
import jrr.achei.model.criteria.AvaliacaoCriteria;
import jrr.achei.model.entity.AvaliacaoServico;
import jrr.achei.model.entity.Cliente;
import jrr.achei.model.entity.Profissional;

public class AvaliacaoServicoDAO implements BaseDAO<AvaliacaoServico> {

    @Override
    public void create(Connection conn, AvaliacaoServico entity) throws Exception {

        String sql = "INSERT INTO avaliacaoservico(profissionalautonomo_fk, cliente_fk, nota, datahora) VALUES (?, ?, ?, ?) RETURNING id;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;

        if (entity.getProfissional() != null) {
            ps.setLong(++i, entity.getProfissional().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }
        if (entity.getCliente() != null) {
            ps.setLong(++i, entity.getCliente().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }
        if (entity.getNota() != null) {
            ps.setInt(++i, entity.getNota());
        } else {
            ps.setNull(++i, Types.INTEGER);
        }
        if (entity.getDataHora() != null) {
            ps.setTimestamp(++i, entity.getDataHora());
        } else {
            ps.setNull(++i, Types.TIMESTAMP);
        }

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            entity.setId(rs.getLong("id"));
        }

        rs.close();
        ps.close();

    }

    @Override
    public AvaliacaoServico readById(Connection conn, Long id) throws Exception {
        String sql = "SELECT id, profissionalautonomo_fk, cliente_fk, nota, datahora FROM avaliacaoservico WHERE id =?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        AvaliacaoServico avaliacao = null;
        if (rs.next()) {
            avaliacao = new AvaliacaoServico();
            avaliacao.setId(rs.getLong("id"));
            Profissional profissional = new Profissional();
            profissional.setId(rs.getLong("profissionalautonomo_fk"));
            avaliacao.setProfissional(profissional);
            Cliente cliente = new Cliente();
            cliente.setId(rs.getLong("cliente_fk"));
            avaliacao.setCliente(cliente);
            avaliacao.setNota(rs.getInt("nota"));
            avaliacao.setDataHora(rs.getTimestamp("datahora"));

        }
        rs.close();
        ps.close();
        return avaliacao;
    }

    @Override
    public void update(Connection conn, AvaliacaoServico entity) throws Exception {
        String query = "UPDATE avaliacaoservico SET id=?, profissionalautonomo_fk=?, cliente_fk=?, nota=?, datahora=? WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;

        if (entity.getProfissional() != null) {
            ps.setLong(++i, entity.getProfissional().getId());
        }

        if (entity.getCliente() != null) {
            ps.setLong(++i, entity.getCliente().getId());
        }
        if (entity.getNota() != null) {
            ps.setInt(++i, entity.getNota());
        } else {
            ps.setNull(++i, Types.INTEGER);
        }
        if (entity.getDataHora() != null) {
            ps.setTimestamp(++i, entity.getDataHora());
        } else {
            ps.setNull(++i, Types.TIMESTAMP);
        }

        ps.setLong(++i, entity.getId());
        ps.execute();
        ps.close();

    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        String query = "DELETE FROM avaliacao WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public List<AvaliacaoServico> readByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception {

        String query = "SELECT id, profissionalautonomo_fk, cliente_fk, nota, datahora FROM avaliacaoservico where 1=1;";

        String NotaEq = (String) criteria.get(AvaliacaoCriteria.NOTA_EQ);
        if (NotaEq != null && !NotaEq.isEmpty()) {
            query += "and avaliacao.nota = '" + NotaEq + "'";
        }

        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        List<AvaliacaoServico> avaliacaoList = new ArrayList<>();
        while (rs.next()) {
            AvaliacaoServico avaliacao = new AvaliacaoServico();
            avaliacao.setId(rs.getLong("id"));
            avaliacao.setDataHora(rs.getTimestamp("datahora"));
            avaliacao.setNota(rs.getInt("nota"));
            Profissional profissional = new Profissional();
            avaliacao.setProfissional(profissional);
            Cliente cliente = new Cliente();
            avaliacao.setCliente(cliente);
        }
        return avaliacaoList;

    }

    @Override
    public Long countByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
         String sql = "SELECT count(*) count FROM avaliacaoservico WHERE 1=1 ";
        sql += applyCriteria(criteria);
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(sql);
        Long count = 0L;
        if (rs.next()) {
            count = rs.getLong("count");
        }
        rs.close();
        s.close();
        return count;
    }

    @Override
    public String applyCriteria(Map<Long, Object> criteria) throws Exception {
           String sql = "";
               
        String NotaEQ = (String) criteria.get(AvaliacaoCriteria.NOTA_EQ);
        if (NotaEQ != null && !NotaEQ.isEmpty()) {
            sql += " AND Nota = '" + NotaEQ + "'";
        }      
        return sql;
    }

}
