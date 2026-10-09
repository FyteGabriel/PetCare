package com.petcare.service;

import com.petcare.model.Mascota;
import com.petcare.repository.MascotaRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class MascotaService implements IMascotaService {

    private final MascotaRepository repository;

    public MascotaService(MascotaRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<Mascota> listar() {
        return repository.findAll();
    }

    @Override
    public Mascota buscar(Long id) {
        return id == null ? null : repository.findById(id).orElse(null);
    }

    @Override
    public Mascota guardar(Mascota mascota) {
        return repository.save(mascota);
    }

    @Override
    public void desactivar(Long id) {
        Mascota mascota = buscar(id);
        if (mascota != null) {
            mascota.setActivo(false);
            repository.save(mascota);
        }
    }
}

