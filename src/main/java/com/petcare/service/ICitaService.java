package com.petcare.service;

import com.petcare.model.Cita;
import java.util.List;

public interface ICitaService {
    List<Cita> listar();
    Cita buscar(Long id);
    Cita guardar(Cita cita);
    void atender(Long id);
    void cancelar(Long id);
}

