package com.petcare.controller;

import com.petcare.model.Cliente;
import com.petcare.service.IClienteService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/clientes")
public class ClienteController {

    private final IClienteService service;

    public ClienteController(IClienteService service) {
        this.service = service;
    }

    @PostMapping("/guardar")
    public String guardar(@RequestParam String nombre,
                          @RequestParam String telefono,
                          @RequestParam String correo,
                          @RequestParam(defaultValue = "false") boolean vip,
                          RedirectAttributes redirect) {
        if (!datosValidos(nombre, telefono, correo)) {
            redirect.addFlashAttribute("error", "Completa los datos del cliente y usa un correo válido.");
            return "redirect:/clientes#registrar-cliente";
        }

        Cliente cliente = new Cliente();
        cliente.setNombre(nombre.trim());
        cliente.setTelefono(telefono.trim());
        cliente.setCorreo(correo.trim());
        cliente.setVip(vip);
        service.guardar(cliente);
        redirect.addFlashAttribute("mensaje", "Cliente registrado.");
        return "redirect:/clientes#registrar-cliente";
    }

    @PostMapping("/actualizar")
    public String actualizar(@RequestParam Long id,
                             @RequestParam String nombre,
                             @RequestParam String telefono,
                             @RequestParam String correo,
                             @RequestParam(defaultValue = "false") boolean vip,
                             RedirectAttributes redirect) {
        Cliente cliente = service.buscar(id);
        if (cliente == null || !datosValidos(nombre, telefono, correo)) {
            redirect.addFlashAttribute("error", "No se pudo actualizar el cliente.");
            return "redirect:/clientes";
        }

        cliente.setNombre(nombre.trim());
        cliente.setTelefono(telefono.trim());
        cliente.setCorreo(correo.trim());
        cliente.setVip(vip);
        service.guardar(cliente);
        redirect.addFlashAttribute("mensaje", "Cliente actualizado.");
        return "redirect:/clientes";
    }

    @PostMapping("/desactivar")
    public String desactivar(@RequestParam Long id, RedirectAttributes redirect) {
        service.desactivar(id);
        redirect.addFlashAttribute("mensaje", "Cliente desactivado.");
        return "redirect:/clientes";
    }

    private boolean datosValidos(String nombre, String telefono, String correo) {
        return nombre != null && !nombre.isBlank()
                && telefono != null && !telefono.isBlank()
                && correo != null && correo.contains("@");
    }
}

