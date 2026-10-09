package com.petcare.controller;

import com.petcare.model.Cita;
import com.petcare.service.ICitaService;
import com.petcare.service.IClienteService;
import com.petcare.service.IMascotaService;
import com.petcare.service.IServicioService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    private final IClienteService clienteService;
    private final IMascotaService mascotaService;
    private final IServicioService servicioService;
    private final ICitaService citaService;

    public DashboardController(IClienteService clienteService,
                               IMascotaService mascotaService,
                               IServicioService servicioService,
                               ICitaService citaService) {
        this.clienteService = clienteService;
        this.mascotaService = mascotaService;
        this.servicioService = servicioService;
        this.citaService = citaService;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        List<Cita> citas = citaService.listar();

        model.addAttribute("clientesActivos", clienteService.listar().stream()
                .filter(cliente -> cliente.isActivo()).count());
        model.addAttribute("mascotasActivas", mascotaService.listar().stream()
                .filter(mascota -> mascota.isActivo()).count());
        model.addAttribute("serviciosActivos", servicioService.listar().stream()
                .filter(servicio -> servicio.isActivo()).count());
        model.addAttribute("citasPendientes", contarEstado(citas, "AGENDADA"));
        model.addAttribute("citasAtendidas", contarEstado(citas, "ATENDIDA"));
        model.addAttribute("citasCanceladas", contarEstado(citas, "CANCELADA"));
        model.addAttribute("citas", citas);
        return "dashboard";
    }

    private long contarEstado(List<Cita> citas, String estado) {
        return citas.stream().filter(cita -> estado.equals(cita.getEstado())).count();
    }
}

