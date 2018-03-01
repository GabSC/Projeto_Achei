package jrr.achei.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import jrr.achei.model.base.BaseDAO;
import jrr.achei.model.criteria.CidadeCriteria;
import jrr.achei.model.entity.Cidade;

public class CidadeDAO implements BaseDAO<Cidade> {

    @Override
    public void create(Connection conn, Cidade entity) throws Exception {

        String sql = "INSERT INTO cidade(nome, uf) VALUES (?, ?) returning id;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setString(++i, entity.getUf());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            entity.setId(rs.getLong("id"));
        }
        rs.close();
        ps.close();

    }

    @Override
    public Cidade readById(Connection conn, Long id) throws Exception {
          String sql = "SELECT id, nome,uf FROM cidade WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        Cidade cidade = null;
        if (rs.next()) {
            cidade = new Cidade();
            cidade.setId(rs.getLong("id"));
            cidade.setNome(rs.getString("nome"));
            cidade.setUf(rs.getString("uf"));
            
        }
        rs.close();
        ps.close();
        return cidade;
    }

    @Override
    public List<Cidade> readByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        String sql = "SELECT nome,uf FROM cidade WHERE 1=1";

        sql += applyCriteria(criteria);

        if (limit != null && limit > 0) {
            sql += " limit " + limit;
        }
        if (offset != null && offset >= 0) {
            sql += " offset " + offset;
        }

        Statement s = conn.createStatement();

        ResultSet rs = s.executeQuery(sql);

        List<Cidade> listaCidades = new ArrayList<>();

        while (rs.next()) {
            Cidade cidade = new Cidade();

            cidade.setId(rs.getLong("id"));
            cidade.setNome(rs.getString("nome"));
            cidade.setUf(rs.getString("uf"));
            listaCidades.add(cidade);
        }
        return listaCidades;
    }

    @Override
    public void update(Connection conn, Cidade entity) throws Exception {

        String sql = "UPDATE cidade SET id=?, nome=?, uf=? WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setString(++i, entity.getUf());
        ps.setLong(++i, entity.getId());
        ps.execute();
        ps.close();

    }

    @Override
    public Long countByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String sql = "SELECT count(*) count FROM cidade WHERE 1=1 ";
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
        String sql = "DELETE FROM cidade WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public String applyCriteria(Map<Long, Object> criteria) throws Exception {
        String sql = "";
        String nomeILike = (String) criteria.get(CidadeCriteria.NOME_ILIKE);
        if (nomeILike != null && !nomeILike.isEmpty()) {
            sql += " AND produto.nome ILIKE '" + nomeILike + "%'";
        }

        String nomeEQ = (String) criteria.get(CidadeCriteria.NOME_EQ);
        if (nomeEQ != null && !nomeEQ.isEmpty()) {
            sql += " AND produto.nome = '" + nomeEQ + "'";
        }
        return sql;
    }
}
