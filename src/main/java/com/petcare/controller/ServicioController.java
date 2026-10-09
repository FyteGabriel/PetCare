package com.petcare.controller;

import com.petcare.model.Categoria;
import com.petcare.model.Servicio;
import com.petcare.service.ICategoriaService;
import com.petcare.service.IServicioService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/servicios")
public class ServicioController {

    private final IServicioService service;
    private final ICategoriaService categoriaService;

    public ServicioController(IServicioService service, ICategoriaService categoriaService) {
        this.service = service;
        this.categoriaService = categoriaService;
    }

    @PostMapping("/guardar")
    public String guardar(@RequestParam String nombre,
                          @RequestParam Double precio,
                          @RequestParam Long categoriaId,
                          RedirectAttributes redirect) {
        Categoria categoria = categoriaService.buscar(categoriaId);
        if (categoria == null || !categoria.isActivo() || !datosValidos(nombre, precio)) {
            redirect.addFlashAttribute("error", "Completa el servicio, indica un precio válido y una categoría activa.");
            return "redirect:/servicios#registrar-servicio";
        }

        Servicio servicio = new Servicio();
        servicio.setNombre(nombre.trim());
        servicio.setPrecio(precio);
        servicio.setCategoria(categoria);
        service.guardar(servicio);
        redirect.addFlashAttribute("mensaje", "Servicio registrado.");
        return "redirect:/servicios#registrar-servicio";
    }

    @PostMapping("/actualizar")
    public String actualizar(@RequestParam Long id,
                             @RequestParam String nombre,
                             @RequestParam Double precio,
                             @RequestParam Long categoriaId,
                             RedirectAttributes redirect) {
        Servicio servicio = service.buscar(id);
        Categoria categoria = categoriaService.buscar(categoriaId);
        if (servicio == null || categoria == null || !categoria.isActivo()
                || !datosValidos(nombre, precio)) {
            redirect.addFlashAttribute("error", "No se pudo actualizar el servicio.");
            return "redirect:/servicios";
        }

        servicio.setNombre(nombre.trim());
        servicio.setPrecio(precio);
        servicio.setCategoria(categoria);
        service.guardar(servicio);
        redirect.addFlashAttribute("mensaje", "Servicio actualizado.");
        return "redirect:/servicios";
    }

    @PostMapping("/desactivar")
    public String desactivar(@RequestParam Long id, RedirectAttributes redirect) {
        service.desactivar(id);
        redirect.addFlashAttribute("mensaje", "Servicio desactivado.");
        return "redirect:/servicios";
    }

    private boolean datosValidos(String nombre, Double precio) {
        return nombre != null && !nombre.isBlank()
                && precio != null && precio > 0;
    }
}

