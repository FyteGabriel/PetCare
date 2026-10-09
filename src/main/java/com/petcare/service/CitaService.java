package com.petcare.service;

import com.petcare.model.Cita;
import com.petcare.repository.CitaRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class CitaService implements ICitaService {

    private final CitaRepository repository;

    public CitaService(CitaRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<Cita> listar() {
        return repository.findAll();
    }

    @Override
    public Cita buscar(Long id) {
        return id == null ? null : repository.findById(id).orElse(null);
    }

    @Override
    public Cita guardar(Cita cita) {
        return repository.save(cita);
    }

    @Override
    public void atender(Long id) {
        cambiarEstado(id, "ATENDIDA");
    }

    @Override
    public void cancelar(Long id) {
        cambiarEstado(id, "CANCELADA");
    }

    private void cambiarEstado(Long id, String estado) {
        Cita cita = buscar(id);
        if (cita != null) {
            cita.setEstado(estado);
            repository.save(cita);
        }
    }
}

