package com.petcare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InicioController {

    @GetMapping({"/", "/inicio"})
    public String inicio() {
        return "inicio";
    }

    @GetMapping("/create")
    public String create() {
        return "create";
    }

    @GetMapping("/read")
    public String read() {
        return "read";
    }

    @GetMapping("/update")
    public String update() {
        return "update";
    }

    @GetMapping("/delete")
    public String delete() {
        return "delete";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/publicidad")
    public String publicidad() {
        return "publicidad";
    }

    @GetMapping("/contacto")
    public String contacto() {
        return "contacto";
    }
}
