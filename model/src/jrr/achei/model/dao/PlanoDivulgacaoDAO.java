package jrr.achei.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import jrr.achei.model.base.BaseDAO;
import jrr.achei.model.criteria.PlanoDivulgacaoCriteria;
import jrr.achei.model.entity.PlanoDivulgacao;

public class PlanoDivulgacaoDAO implements BaseDAO<PlanoDivulgacao> {

    @Override
    public void create(Connection conn, PlanoDivulgacao entity) throws Exception {
        String sql = "INSERT INTO planodivulgacao(nome, prazo, datahora, preco, descricao) VALUES (?, ?, ?, ?, ?)returning id ;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setLong(++i, entity.getPrazo());
        ps.setDate(++i, (Date) entity.getDataHora());
        ps.setBigDecimal(++i, entity.getPreco());
        ps.setString(++i, entity.getDescricao());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            entity.setId(rs.getLong("id"));
        }
        rs.close();
        ps.close();

    }

    @Override
    public PlanoDivulgacao readById(Connection conn, Long id) throws Exception {
        String sql = "SELECT id, nome, prazo, datahora, preco, descricao FROM planodivulgacao where id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        PlanoDivulgacao plano = null;
        if (rs.next()) {
            plano = new PlanoDivulgacao();
            plano.setId(rs.getLong("id"));
            plano.setNome(rs.getString("nome"));
            plano.setPrazo(rs.getLong("prazo"));
            plano.setDataHora(rs.getDate("datahora"));
            plano.setPreco(rs.getBigDecimal("preco"));
            plano.setDescricao(rs.getString("descricao"));
        }
        rs.close();
        ps.close();
        return plano;
    }

    @Override
    public List<PlanoDivulgacao> readByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception {

        String sql = "SELECT id, nome, prazo, datahora, preco, descricao FROM planodivulgacao WHERE id = ?;";

        sql += applyCriteria(criteria);

        if (limit != null && limit > 0) {
            sql += " limit " + limit;
        }
        if (offset != null && offset >= 0) {
            sql += " offset " + offset;
        }

        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(sql);
        List<PlanoDivulgacao> planoList = new ArrayList<>();
        while (rs.next()) {
            PlanoDivulgacao plano = new PlanoDivulgacao();
            plano.setId(rs.getLong("id"));
            plano.setNome(rs.getString("nome"));
            plano.setPrazo(rs.getLong("prazo"));
            plano.setDataHora(rs.getDate("datahora"));
            plano.setPreco(rs.getBigDecimal("preco"));
            plano.setDescricao(rs.getString("descricao"));
            planoList.add(plano);
        }
        return planoList;

    }

    @Override
    public void update(Connection conn, PlanoDivulgacao entity) throws Exception {
        String sql = "UPDATE planodivulgacao SET id=?, nome=?, prazo=?, datahora=?, preco=?, descricao=? WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setLong(++i, entity.getPrazo());
        ps.setDate(++i, (Date) entity.getDataHora());
        ps.setBigDecimal(++i, entity.getPreco());
        ps.setString(++i, entity.getDescricao());
        ps.setLong(++i, entity.getId());
        ps.execute();
        ps.close();
    }

    @Override
    public Long countByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String sql = "SELECT count(*) count FROM planodivulgacao WHERE 1=1 ";
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
    public void delete(Connection conn, Long id) throws Exception {
        String sql = "DELETE FROM planodivulgacao WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public String applyCriteria(Map<Long, Object> criteria) throws Exception {
        String sql = "";
        String nomeEQ = (String) criteria.get(PlanoDivulgacaoCriteria.NOME_EQ);
        if (nomeEQ != null && !nomeEQ.isEmpty()) {
            sql += " AND nome '" + nomeEQ + "'";
        }

        Long precoEQ = (Long) criteria.get(PlanoDivulgacaoCriteria.PRECO_EQ);
        if ( precoEQ >0) {
            sql += " AND preco '" + precoEQ + " '";
        }

        Long idNE = (Long) criteria.get(PlanoDivulgacaoCriteria.ID_NE);
        if (idNE != null && idNE > 0) {
            sql += " AND id != '" + idNE + "'";
        }

        return sql;
    }

}
