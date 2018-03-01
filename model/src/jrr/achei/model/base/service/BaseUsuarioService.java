package jrr.achei.model.base.service;

import jrr.achei.model.entity.Usuario;

public interface BaseUsuarioService {

    public Usuario login(String email, String senha) throws Exception;

}
