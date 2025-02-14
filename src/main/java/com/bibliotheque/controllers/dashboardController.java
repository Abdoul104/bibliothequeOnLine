package com.bibliotheque.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

// Controlleur pour la gestion de l'affichage du Dashboard

@Controller
public class dashboardController {

    @GetMapping("/dashboard")
    public String afficherDashboard(Model model) {
        return "dashboard";  // Retourne la vue JSP "dashboard.jsp"
    }
}
