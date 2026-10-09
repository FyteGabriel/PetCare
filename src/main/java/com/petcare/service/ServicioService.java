package com.petcare.service;

import com.petcare.model.Servicio;
import com.petcare.repository.ServicioRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class ServicioService implements IServicioService {

    private final ServicioRepository repository;

    public ServicioService(ServicioRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<Servicio> listar() {
        return repository.findAll();
    }

    @Override
    public Servicio buscar(Long id) {
        return id == null ? null : repository.findById(id).orElse(null);
    }

    @Override
    public Servicio guardar(Servicio servicio) {
        return repository.save(servicio);
    }

    @Override
    public void desactivar(Long id) {
        Servicio servicio = buscar(id);
        if (servicio != null) {
            servicio.setActivo(false);
            repository.save(servicio);
        }
    }
}

