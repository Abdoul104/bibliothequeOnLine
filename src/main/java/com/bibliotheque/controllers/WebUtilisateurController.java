package com.bibliotheque.controllers;

import com.bibliotheque.models.Utilisateur;
import com.bibliotheque.services.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/utilisateurs")
public class WebUtilisateurController {

    @Autowired
    private UtilisateurService utilisateurService;

    @GetMapping
    public String afficherUtilisateurs(Model model) {
        model.addAttribute("utilisateurs", utilisateurService.getAllUtilisateurs());
        return "utilisateurs";
    }

    @GetMapping("/ajouter")
    public String afficherFormulaireAjout(Model model) {
        model.addAttribute("utilisateur", new Utilisateur());
        return "ajouterUtilisateur";
    }

    @PostMapping("/ajouter")
    public String ajouterUtilisateur(@ModelAttribute Utilisateur utilisateur) {
        utilisateurService.saveUtilisateur(utilisateur);
        return "redirect:/utilisateurs";
    }

    @GetMapping("/modifier/{id}")
    public String afficherFormulaireModification(@PathVariable Long id, Model model) {
        Optional<Utilisateur> utilisateurOpt = utilisateurService.getUtilisateurById(id);
        if (utilisateurOpt.isPresent()) {
            model.addAttribute("utilisateur", utilisateurOpt.get());
            return "ajouterUtilisateur";
        }
        return "redirect:/utilisateurs";
    }

    @GetMapping("/supprimer/{id}")
    public String supprimerUtilisateur(@PathVariable Long id) {
        utilisateurService.deleteUtilisateur(id);
        return "redirect:/utilisateurs";
    }
}

