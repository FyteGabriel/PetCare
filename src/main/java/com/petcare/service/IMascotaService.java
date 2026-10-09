package com.petcare.service;

import com.petcare.model.Mascota;
import java.util.List;

public interface IMascotaService {
    List<Mascota> listar();
    Mascota buscar(Long id);
    Mascota guardar(Mascota mascota);
    void desactivar(Long id);
}

