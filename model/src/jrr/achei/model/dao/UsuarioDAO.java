package jrr.achei.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import jrr.achei.model.base.BaseDAO;
import jrr.achei.model.criteria.UsuarioCriteria;
import jrr.achei.model.entity.Categoria;
import jrr.achei.model.entity.Cidade;
import jrr.achei.model.entity.Usuario;
import jrr.achei.model.entity.Cliente;
import jrr.achei.model.entity.PlanoDivulgacao;
import jrr.achei.model.entity.Profissional;

public class UsuarioDAO implements BaseDAO<Usuario> {

    @Override
    public void create(Connection conn, Usuario entity) throws Exception {
        String sql = "INSERT INTO usuario( nome, email, senha,foto) VALUES(?, ?, MD5(?),?)RETURNING id;";
        int i = 0;
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(++i, entity.getNome());
        ps.setString(++i, entity.getEmail());
        ps.setString(++i, entity.getSenha());
        ps.setString(++i, entity.getFoto());
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            entity.setId(rs.getLong("id"));

        }

        rs.close();
        ps.close();

        if (entity instanceof Cliente) {

            this.createCliente(conn, (Cliente) entity);

        } else if (entity instanceof Profissional) {

            this.createProfissional(conn, (Profissional) entity);
        }
    }

    @Override
    public Usuario readById(Connection conn, Long id) throws Exception {
        String sql = "SELECT usuario.*, profissionalautonomo.usuario_fk,cliente.usuario_fk FROM usuario";
        sql += "left join profissionalautonomo on usuario.id = profissionalautonomo.usuario_fk";
        sql += "left join planodivulgacao on profissionalautonomo.planodivulgacao_fk = planodivulgacao.id";
        sql += "left join cliente on usuario.id=cliente.usuario_fk ";
        sql += "left join cidade on profissionalautonomo.cidade_fk=cidade.id ";
        sql += "left join categoriaprofissional on categoriaprofissional.categoria_fk = categoria_fk ";
        sql += "and categoriaprofissional.profissionalautonomo_fk = profissionalautonomo_fk WHERE id=?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        Usuario usuario = null;
        while (rs.next()) {
            if (usuario == null) {
                if (rs.getLong("profissional") > 0) {
                    usuario = new Profissional();
                } else {
                    usuario = new Cliente();
                }
            }
            usuario.setId(rs.getLong("id"));
            usuario.setNome(rs.getString("nome"));
            usuario.setEmail(rs.getString("email"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setSenha(rs.getString("foto"));
            if (usuario instanceof Profissional) {
                int i = 0;
                ((Profissional) usuario).setCartaoVisitas(rs.getString("cartaovisitas"));
                ((Profissional) usuario).setCnpj(rs.getString("cnpj"));
                ((Profissional) usuario).setCpf(rs.getString("cpf"));
                ((Profissional) usuario).setDescricao(rs.getString("descricao"));
                ((Profissional) usuario).setPreco(rs.getFloat("preco"));
                ((Profissional) usuario).setStatus(rs.getBoolean("status"));
                ((Profissional) usuario).setTelefoneCelular(rs.getString("telefonecelular"));
                ((Profissional) usuario).setTelefoneFixo(rs.getString("telefonefixo"));
                ((Profissional) usuario).setDataHora(rs.getDate("datahora"));
               if (rs.getLong("categoria_fk") > 0) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getLong("categoria.id"));
                categoria.setNome(rs.getString("categoria.nome"));
                categoria.setDescricao(rs.getString("categoria.descricao"));
               ((Profissional) usuario).setCategoria(categoria);
               }
                  if (rs.getLong("planodivulgacao_fk") > 0) {
                PlanoDivulgacao plano= new PlanoDivulgacao();
                plano.setId(rs.getLong("plano.id"));
                plano.setNome(rs.getString("plano.nome"));
                plano.setPrazo(rs.getLong("plano.prazo"));
                plano.setDataHora(rs.getDate("plano.datahora"));
                plano.setPreco(rs.getBigDecimal("plano.preco"));
                plano.setDescricao(rs.getString("plano.descricao"));
               ((Profissional) usuario).setPlanoDivulgacao(plano);
               }
                
                  if (rs.getLong("cidade_fk") > 0) {
                Cidade cidade= new Cidade();
                cidade.setId(rs.getLong("cidade.id"));
                cidade.setNome(rs.getString("cidade.nome"));
                cidade.setUf(rs.getString("cidade.uf"));
               
               ((Profissional) usuario).setCidade(cidade);
               }

            }

        }

        rs.close();
        ps.close();
        return usuario;
    }

    @Override
    public void update(Connection conn, Usuario entity) throws Exception {

        String sql = "UPDATE usuario SET nome=?, email=?, senha=?, foto=? WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setString(++i, entity.getEmail());
        ps.setString(++i, entity.getSenha());
        ps.setString(++i, entity.getFoto());
        ps.setLong(++i, entity.getId());

        ps.execute();
        ps.close();

        if (entity instanceof Profissional) {

            this.updateProfissional(conn, (Profissional) entity);

        }

    }

    private void updateProfissional(Connection conn, Profissional entity) throws SQLException {

        String sql = "UPDATE profissionalautonomo SET cidade_fk=?, planodivulgacao_fk=?, \n"
                + "descricao=?, telefonecelular=?, telefonefixo=?, cartaovisita=?, statusdisponibilidade=?, datahora=?, preco=? \n"
                + "WHERE id=?;";

        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setLong(++i, entity.getCidade().getId());
        ps.setLong(++i, entity.getPlanoDivulgacao().getId());
        ps.setString(++i, entity.getDescricao());
        ps.setString(++i, entity.getTelefoneCelular());
        ps.setString(++i, entity.getTelefoneFixo());
        ps.setString(++i, entity.getCartaoVisitas());
        ps.setBoolean(++i, entity.getStatus());
        ps.setDate(++i, entity.getDataHora());
        ps.setFloat(++i, entity.getPreco());

        ps.setLong(++i, entity.getId());
        ps.execute();
        ps.close();

    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {

        String sql = "DELETE FROM usuario WHERE id=?;";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ps.execute();

    }

    private void createCliente(Connection conn, Cliente entity) throws Exception {

        String sql = "INSERT INTO cliente(cpf, usuario_fk) VALUES (?, ?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getCpf());
        ps.setLong(++i, entity.getId());

        ps.execute();

        ps.close();

    }

    private void createProfissional(Connection conn, Profissional entity) throws Exception {

        String sql = "INSERT INTO profissionalautonomo(usuario_fk, cidade_fk, planodivulgacao_fk, cnpj,";
        sql += " cpf, descricao";
        sql += " telefonecelular, telefonefixo, cartaovisita, statusdisponibilidade,datahora, preco)";
        sql += " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setLong(++i, entity.getId());
        ps.setLong(++i, entity.getCidade().getId());
        ps.setLong(++i, entity.getPlanoDivulgacao().getId());
        ps.setString(++i, entity.getCnpj());
        ps.setString(++i, entity.getCpf());
        ps.setString(++i, entity.getDescricao());
        ps.setLong(++i, Long.parseLong(entity.getTelefoneCelular()));
        ps.setLong(++i, Long.parseLong(entity.getTelefoneFixo()));
        ps.setString(++i, entity.getCartaoVisitas());
        ps.setBoolean(++i, entity.getStatus());
        ps.setDate(++i, entity.getDataHora());
        ps.setFloat(++i, entity.getPreco());

        ps.execute();

        ps.close();

    }

    @Override
    public List<Usuario> readByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception {

        String sql = "SELECT usuario.* ,profissionalautonomo.usuario_fk profissional,cliente.usuario_fk cliente FROM usuario LEFT JOIN\n"
                + "profissionalautonomo ON profissionalautonomo.usuario_fk = usuario.id LEFT JOIN cliente ON cliente.usuario_fk = usuario.id WHERE 1=1";

        sql += applyCriteria(criteria);

        if (limit != null && limit > 0) {
            sql += " limit " + limit;
        }
        if (offset != null && offset >= 0) {
            sql += " offset " + offset;
        }

        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(sql);

        List<Usuario> usuarioList = new ArrayList<>();

        while (rs.next()) {

            Usuario usuario = null;
            if (rs.getLong("profissional") > 0) {
                usuario = new Profissional();
            } else {
                usuario = new Cliente();
            }
            usuario.setNome(rs.getString("nome"));
            usuario.setEmail(rs.getString("email"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setFoto(rs.getString("foto"));
            if (usuario instanceof Profissional) {

                ((Profissional) usuario).setCartaoVisitas("cartaovisita");
                Categoria categoria = new Categoria();
                ((Profissional) usuario).setCategoria(categoria);
                Cidade cidade = new Cidade();
                ((Profissional) usuario).setCidade(cidade);
                ((Profissional) usuario).setCnpj("cnpj");
                ((Profissional) usuario).setCpf("cpf");
                //((Profissional) usuario).setDataHora("dataHora"));
                ((Profissional) usuario).setDescricao("descricao");
                PlanoDivulgacao planoDivulgacao = new PlanoDivulgacao();
                ((Profissional) usuario).setPlanoDivulgacao(planoDivulgacao);
                ((Profissional) usuario).setPreco(Float.NaN);
                ((Profissional) usuario).setStatus(Boolean.TRUE);
                ((Profissional) usuario).setTelefoneCelular("telefonecelular");
                ((Profissional) usuario).setTelefoneFixo("telefonefixo");
            }
            usuarioList.add(usuario);
        }
        return usuarioList;
    }

    @Override
    public Long countByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String sql = "SELECT count(*) count from usuario left join profissional on usuario.id = profissional.usuario_fk "
                + "left join cliente on cliente.usuario_fk = usuario.id";

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

        Boolean profissional = (Boolean) criteria.get(UsuarioCriteria.PROFISSIONAL);

        if (profissional != null) {
            if (profissional) {
                sql += " and profissional is not null";
            } else {
                sql += " and profissional is null";
            }
        }

        Boolean cliente = (Boolean) criteria.get(UsuarioCriteria.CLIENTE);
        if (cliente != null) {
            if (cliente) {
                sql += " and cliente is not null";
            } else {
                sql += " and cliente is null";
            }
        }

        String email = (String) criteria.get(UsuarioCriteria.EMAIL_EQ);
        if (email != null) {
            sql += " and email ='" + email + "'";
        }

        String senha = (String) criteria.get(UsuarioCriteria.SENHA_EQ);
        if (senha != null) {
            sql += " and senha = MD5('" + senha + "')";
        }

        return sql;
    }

}
