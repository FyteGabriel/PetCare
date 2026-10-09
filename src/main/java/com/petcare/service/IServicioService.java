package com.petcare.service;

import com.petcare.model.Servicio;
import java.util.List;

public interface IServicioService {
    List<Servicio> listar();
    Servicio buscar(Long id);
    Servicio guardar(Servicio servicio);
    void desactivar(Long id);
}

