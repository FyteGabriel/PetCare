package com.petcare.service;

import com.petcare.model.Categoria;
import java.util.List;

public interface ICategoriaService {
    List<Categoria> listar();
    Categoria buscar(Long id);
    Categoria guardar(Categoria categoria);
    void desactivar(Long id);
}

