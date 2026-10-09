package com.petcare.controller;

import com.petcare.model.Categoria;
import com.petcare.service.ICategoriaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/categorias")
public class CategoriaController {

    private final ICategoriaService service;

    public CategoriaController(ICategoriaService service) {
        this.service = service;
    }

    @PostMapping("/guardar")
    public String guardar(@RequestParam String nombre,
                          @RequestParam String descripcion,
                          RedirectAttributes redirect) {
        if (!datosValidos(nombre, descripcion)) {
            redirect.addFlashAttribute("error", "Completa el nombre y la descripción de la categoría.");
            return "redirect:/categorias#registrar-categoria";
        }

        Categoria categoria = new Categoria();
        categoria.setNombre(nombre.trim());
        categoria.setDescripcion(descripcion.trim());
        service.guardar(categoria);
        redirect.addFlashAttribute("mensaje", "Categoría registrada.");
        return "redirect:/categorias#registrar-categoria";
    }

    @PostMapping("/actualizar")
    public String actualizar(@RequestParam Long id,
                             @RequestParam String nombre,
                             @RequestParam String descripcion,
                             RedirectAttributes redirect) {
        Categoria categoria = service.buscar(id);
        if (categoria == null || !datosValidos(nombre, descripcion)) {
            redirect.addFlashAttribute("error", "No se pudo actualizar la categoría.");
            return "redirect:/categorias";
        }

        categoria.setNombre(nombre.trim());
        categoria.setDescripcion(descripcion.trim());
        service.guardar(categoria);
        redirect.addFlashAttribute("mensaje", "Categoría actualizada.");
        return "redirect:/categorias";
    }

    @PostMapping("/desactivar")
    public String desactivar(@RequestParam Long id, RedirectAttributes redirect) {
        service.desactivar(id);
        redirect.addFlashAttribute("mensaje", "Categoría desactivada.");
        return "redirect:/categorias";
    }

    private boolean datosValidos(String nombre, String descripcion) {
        return nombre != null && !nombre.isBlank()
                && descripcion != null && !descripcion.isBlank();
    }
}

