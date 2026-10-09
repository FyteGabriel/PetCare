package com.petcare.controller;

import com.petcare.model.Cita;
import com.petcare.model.Mascota;
import com.petcare.model.Servicio;
import com.petcare.service.ICitaService;
import com.petcare.service.IMascotaService;
import com.petcare.service.IServicioService;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/citas")
public class CitaController {

    private final ICitaService service;
    private final IMascotaService mascotaService;
    private final IServicioService servicioService;

    public CitaController(ICitaService service,
                          IMascotaService mascotaService,
                          IServicioService servicioService) {
        this.service = service;
        this.mascotaService = mascotaService;
        this.servicioService = servicioService;
    }

    @PostMapping("/guardar")
    public String guardar(@RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fecha,
                          @RequestParam String hora,
                          @RequestParam String motivo,
                          @RequestParam Long mascotaId,
                          @RequestParam Long servicioId,
                          RedirectAttributes redirect) {
        Mascota mascota = mascotaService.buscar(mascotaId);
        Servicio servicio = servicioService.buscar(servicioId);

        if (fecha == null || fecha.isBefore(LocalDate.now()) || hora.isBlank() || motivo.isBlank()) {
            redirect.addFlashAttribute("error", "Indica una fecha futura, hora y motivo.");
            return "redirect:/citas#agendar-cita";
        }
        if (mascota == null || servicio == null || !mascota.isActivo() || !servicio.isActivo()) {
            redirect.addFlashAttribute("error", "Selecciona una mascota y un servicio activos.");
            return "redirect:/citas#agendar-cita";
        }
        if (horarioOcupado(fecha, hora)) {
            redirect.addFlashAttribute("error", "Ya existe una cita agendada en ese horario.");
            return "redirect:/citas#agendar-cita";
        }

        Cita cita = new Cita();
        cita.setFecha(fecha);
        cita.setHora(hora);
        cita.setMotivo(motivo.trim());
        cita.setMascota(mascota);
        cita.setServicio(servicio);
        service.guardar(cita);
        redirect.addFlashAttribute("mensaje", "Cita agendada.");
        return "redirect:/citas#agendar-cita";
    }

    @PostMapping("/atender")
    public String atender(@RequestParam Long id, RedirectAttributes redirect) {
        service.atender(id);
        redirect.addFlashAttribute("mensaje", "Cita marcada como atendida.");
        return "redirect:/citas";
    }

    @PostMapping("/cancelar")
    public String cancelar(@RequestParam Long id, RedirectAttributes redirect) {
        service.cancelar(id);
        redirect.addFlashAttribute("mensaje", "Cita cancelada.");
        return "redirect:/citas";
    }

    private boolean horarioOcupado(LocalDate fecha, String hora) {
        return service.listar().stream()
                .anyMatch(cita -> "AGENDADA".equals(cita.getEstado())
                        && fecha.equals(cita.getFecha())
                        && hora.equals(cita.getHora()));
    }
}

