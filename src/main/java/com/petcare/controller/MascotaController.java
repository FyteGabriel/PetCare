package com.petcare.controller;

import com.petcare.model.Cliente;
import com.petcare.model.Mascota;
import com.petcare.service.IClienteService;
import com.petcare.service.IMascotaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/mascotas")
public class MascotaController {

    private final IMascotaService service;
    private final IClienteService clienteService;

    public MascotaController(IMascotaService service, IClienteService clienteService) {
        this.service = service;
        this.clienteService = clienteService;
    }

    @PostMapping("/guardar")
    public String guardar(@RequestParam String nombre,
                          @RequestParam String especie,
                          @RequestParam String raza,
                          @RequestParam Long clienteId,
                          RedirectAttributes redirect) {
        Cliente cliente = clienteService.buscar(clienteId);
        if (cliente == null || !cliente.isActivo() || !datosValidos(nombre, especie, raza)) {
            redirect.addFlashAttribute("error", "Completa los datos y selecciona un dueño activo.");
            return "redirect:/mascotas#registrar-mascota";
        }

        Mascota mascota = new Mascota();
        mascota.setNombre(nombre.trim());
        mascota.setEspecie(especie.trim());
        mascota.setRaza(raza.trim());
        mascota.setCliente(cliente);
        service.guardar(mascota);
        redirect.addFlashAttribute("mensaje", "Mascota registrada.");
        return "redirect:/mascotas#registrar-mascota";
    }

    @PostMapping("/actualizar")
    public String actualizar(@RequestParam Long id,
                             @RequestParam String nombre,
                             @RequestParam String especie,
                             @RequestParam String raza,
                             @RequestParam Long clienteId,
                             RedirectAttributes redirect) {
        Mascota mascota = service.buscar(id);
        Cliente cliente = clienteService.buscar(clienteId);
        if (mascota == null || cliente == null || !cliente.isActivo()
                || !datosValidos(nombre, especie, raza)) {
            redirect.addFlashAttribute("error", "No se pudo actualizar la mascota.");
            return "redirect:/mascotas";
        }

        mascota.setNombre(nombre.trim());
        mascota.setEspecie(especie.trim());
        mascota.setRaza(raza.trim());
        mascota.setCliente(cliente);
        service.guardar(mascota);
        redirect.addFlashAttribute("mensaje", "Mascota actualizada.");
        return "redirect:/mascotas";
    }

    @PostMapping("/desactivar")
    public String desactivar(@RequestParam Long id, RedirectAttributes redirect) {
        service.desactivar(id);
        redirect.addFlashAttribute("mensaje", "Mascota desactivada.");
        return "redirect:/mascotas";
    }

    private boolean datosValidos(String nombre, String especie, String raza) {
        return nombre != null && !nombre.isBlank()
                && especie != null && !especie.isBlank()
                && raza != null && !raza.isBlank();
    }
}

