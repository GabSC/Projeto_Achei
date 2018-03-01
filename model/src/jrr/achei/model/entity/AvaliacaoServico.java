package jrr.achei.model.entity;

import java.sql.Timestamp;
import jrr.achei.model.base.BaseEntity;

public class AvaliacaoServico extends BaseEntity {

    private Integer nota;

    private Timestamp dataHora;

    private Cliente cliente;

    private Profissional profissional;

    public Integer getNota() {
        return nota;
    }

    public void setNota(Integer nota) {
        this.nota = nota;
    }

    public Timestamp getDataHora() {
        return dataHora;
    }

    public void setDataHora(Timestamp dataHora) {
        this.dataHora = dataHora;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Profissional getProfissional() {
        return profissional;
    }

    public void setProfissional(Profissional profissional) {
        this.profissional = profissional;
    }

}
