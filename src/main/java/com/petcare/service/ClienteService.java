package com.petcare.service;

import com.petcare.model.Cliente;
import com.petcare.repository.ClienteRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class ClienteService implements IClienteService {

    private final ClienteRepository repository;

    public ClienteService(ClienteRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<Cliente> listar() {
        return repository.findAll();
    }

    @Override
    public Cliente buscar(Long id) {
        return id == null ? null : repository.findById(id).orElse(null);
    }

    @Override
    public Cliente guardar(Cliente cliente) {
        return repository.save(cliente);
    }

    @Override
    public void desactivar(Long id) {
        Cliente cliente = buscar(id);
        if (cliente != null) {
            cliente.setActivo(false);
            repository.save(cliente);
        }
    }
}

