package com.petcare.service;

import com.petcare.model.Cliente;
import java.util.List;

public interface IClienteService {
    List<Cliente> listar();
    Cliente buscar(Long id);
    Cliente guardar(Cliente cliente);
    void desactivar(Long id);
}

