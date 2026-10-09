package com.petcare.service;

import com.petcare.model.Categoria;
import com.petcare.repository.CategoriaRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class CategoriaService implements ICategoriaService {

    private final CategoriaRepository repository;

    public CategoriaService(CategoriaRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<Categoria> listar() {
        return repository.findAll();
    }

    @Override
    public Categoria buscar(Long id) {
        return id == null ? null : repository.findById(id).orElse(null);
    }

    @Override
    public Categoria guardar(Categoria categoria) {
        return repository.save(categoria);
    }

    @Override
    public void desactivar(Long id) {
        Categoria categoria = buscar(id);
        if (categoria != null) {
            categoria.setActivo(false);
            repository.save(categoria);
        }
    }
}

