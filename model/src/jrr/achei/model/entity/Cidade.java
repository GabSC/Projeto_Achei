package jrr.achei.model.entity;

import jrr.achei.model.base.BaseEntity;

public class Cidade extends BaseEntity{
    
    private String nome;
    private String uf;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }
    
    
    
}
