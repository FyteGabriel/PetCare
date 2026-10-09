package com.petcare.controller;

import com.petcare.service.ICategoriaService;
import com.petcare.service.ICitaService;
import com.petcare.service.IClienteService;
import com.petcare.service.IMascotaService;
import com.petcare.service.IServicioService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class InicioController {

    private final IClienteService clienteService;
    private final IMascotaService mascotaService;
    private final ICategoriaService categoriaService;
    private final IServicioService servicioService;
    private final ICitaService citaService;

    public InicioController(IClienteService clienteService,
                            IMascotaService mascotaService,
                            ICategoriaService categoriaService,
                            IServicioService servicioService,
                            ICitaService citaService) {
        this.clienteService = clienteService;
        this.mascotaService = mascotaService;
        this.categoriaService = categoriaService;
        this.servicioService = servicioService;
        this.citaService = citaService;
    }

    @GetMapping({"/", "/inicio"})
    public String inicio() {
        return "inicio";
    }

    @GetMapping("/create")
    public String create(Model model) {
        cargarListas(model);
        return "create";
    }

    @GetMapping("/read")
    public String read(Model model) {
        cargarListas(model);
        return "read";
    }

    @GetMapping("/update")
    public String update(@RequestParam(required = false) Long clienteId,
                         @RequestParam(required = false) Long mascotaId,
                         @RequestParam(required = false) Long categoriaId,
                         @RequestParam(required = false) Long servicioId,
                         @RequestParam(required = false) Long citaId,
                         Model model) {
        cargarListas(model);
        model.addAttribute("clienteEditar", clienteService.buscar(clienteId));
        model.addAttribute("mascotaEditar", mascotaService.buscar(mascotaId));
        model.addAttribute("categoriaEditar", categoriaService.buscar(categoriaId));
        model.addAttribute("servicioEditar", servicioService.buscar(servicioId));
        model.addAttribute("citaEditar", citaService.buscar(citaId));
        return "update";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam(required = false) Long clienteId,
                         @RequestParam(required = false) Long mascotaId,
                         @RequestParam(required = false) Long categoriaId,
                         @RequestParam(required = false) Long servicioId,
                         @RequestParam(required = false) Long citaId,
                         Model model) {
        model.addAttribute("clienteEliminar", clienteService.buscar(clienteId));
        model.addAttribute("mascotaEliminar", mascotaService.buscar(mascotaId));
        model.addAttribute("categoriaEliminar", categoriaService.buscar(categoriaId));
        model.addAttribute("servicioEliminar", servicioService.buscar(servicioId));
        model.addAttribute("citaEliminar", citaService.buscar(citaId));
        return "delete";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String ingresar(@RequestParam String correo,
                           @RequestParam String clave,
                           RedirectAttributes redirect) {
        if (correo == null || !correo.contains("@") || clave == null || clave.isBlank()) {
            redirect.addFlashAttribute("error", "Ingresa un correo y una contraseña.");
            return "redirect:/login";
        }
        redirect.addFlashAttribute("mensaje", "Sesión de demostración iniciada.");
        return "redirect:/dashboard";
    }

    @GetMapping("/publicidad")
    public String publicidad() {
        return "publicidad";
    }

    @GetMapping("/contacto")
    public String contacto() {
        return "contacto";
    }

    private void cargarListas(Model model) {
        model.addAttribute("clientes", clienteService.listar());
        model.addAttribute("mascotas", mascotaService.listar());
        model.addAttribute("categorias", categoriaService.listar());
        model.addAttribute("servicios", servicioService.listar());
        model.addAttribute("citas", citaService.listar());
    }

    @GetMapping("/categorias")
    public String categorias(@RequestParam(required = false) Long id,
                         @RequestParam(defaultValue = "editar") String accion, Model model) {
        cargarListas(model);
        model.addAttribute("categoria" + ("desactivar".equals(accion) ? "Eliminar" : "Editar"), categoriaService.buscar(id));
        return "categorias";
    }

    @GetMapping("/servicios")
    public String servicios(@RequestParam(required = false) Long id,
                         @RequestParam(defaultValue = "editar") String accion, Model model) {
        cargarListas(model);
        model.addAttribute("servicio" + ("desactivar".equals(accion) ? "Eliminar" : "Editar"), servicioService.buscar(id));
        return "servicios";
    }

    @GetMapping("/clientes")
    public String clientes(@RequestParam(required = false) Long id,
                         @RequestParam(defaultValue = "editar") String accion, Model model) {
        cargarListas(model);
        model.addAttribute("cliente" + ("desactivar".equals(accion) ? "Eliminar" : "Editar"), clienteService.buscar(id));
        return "clientes";
    }

    @GetMapping("/mascotas")
    public String mascotas(@RequestParam(required = false) Long id,
                         @RequestParam(defaultValue = "editar") String accion, Model model) {
        cargarListas(model);
        model.addAttribute("mascota" + ("desactivar".equals(accion) ? "Eliminar" : "Editar"), mascotaService.buscar(id));
        return "mascotas";
    }

    @GetMapping("/citas")
    public String citas(@RequestParam(required = false) Long id,
                         @RequestParam(defaultValue = "editar") String accion, Model model) {
        cargarListas(model);
        model.addAttribute("cita" + ("desactivar".equals(accion) ? "Eliminar" : "Editar"), citaService.buscar(id));
        return "citas";
    }
}
