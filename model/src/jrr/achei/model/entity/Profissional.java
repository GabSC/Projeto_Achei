package jrr.achei.model.entity;

import java.sql.Date;

public class Profissional extends Usuario {

    private Cidade cidade;
    private PlanoDivulgacao planoDivulgacao;
    private String cpf;
    private String cnpj;
    private String telefoneCelular;
    private String telefoneFixo;
    private String cartaoVisitas;
    private Boolean status;
    private Float preco;
    private Date dataHora;
    private String descricao;
    private Categoria categoria;
    private Date dataInicio;
    private Date dataFim;

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }

    public PlanoDivulgacao getPlanoDivulgacao() {
        return planoDivulgacao;
    }

    public void setPlanoDivulgacao(PlanoDivulgacao planoDivulgacao) {
        this.planoDivulgacao = planoDivulgacao;
    }

    public String getTelefoneCelular() {

        return telefoneCelular;
    }

    public void setTelefoneCelular(String telefoneCelular) {
        this.telefoneCelular = telefoneCelular;
    }

    public String getTelefoneFixo() {
        return telefoneFixo;
    }

    public void setTelefoneFixo(String telefoneFixo) {
        this.telefoneFixo = telefoneFixo;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Float getPreco() {
        return preco;
    }

    public void setPreco(Float preco) {
        this.preco = preco;
    }

    public Date getDataHora() {
        return dataHora;
    }

    public void setDataHora(Date dataHora) {
        this.dataHora = dataHora;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCartaoVisitas() {
        return cartaoVisitas;
    }

    public void setCartaoVisitas(String cartaoVisitas) {
        this.cartaoVisitas = cartaoVisitas;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Date getDataFim() {
        return dataFim;
    }

    public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
    }

}
