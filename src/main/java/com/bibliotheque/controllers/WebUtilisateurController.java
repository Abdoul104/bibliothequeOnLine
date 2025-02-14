package com.bibliotheque.controllers;

import com.bibliotheque.models.Utilisateur;
import com.bibliotheque.services.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

// Controlleur pour la gestion de l'affichage de Utilisateur

@Controller
@RequestMapping("/utilisateurs")
public class WebUtilisateurController {

    @Autowired
    private UtilisateurService utilisateurService;

    // Afficher la liste des utilisateurs
    @GetMapping
    public String afficherUtilisateurs(Model model) {
        model.addAttribute("utilisateurs", utilisateurService.getAllUtilisateurs());
        return "utilisateurs";
    }

    // Formulaire d'ajout d'un utilisateur
    @GetMapping("/ajouter")
    public String afficherFormulaireAjout(Model model) {
        model.addAttribute("utilisateur", new Utilisateur());
        return "ajouterUtilisateur";
    }

    // Ajout d'un utilisateur
    @PostMapping("/ajouter")
    public String ajouterUtilisateur(@ModelAttribute Utilisateur utilisateur, RedirectAttributes redirectAttributes) {
        utilisateurService.saveUtilisateur(utilisateur);
        redirectAttributes.addFlashAttribute("message", "📖 Enregistrement réussi !");
        return "redirect:/utilisateurs";
    }

    // Modifier d'un utilisateur
    @GetMapping("/modifier/{id}")
    public String afficherFormulaireModification(@PathVariable Long id, Model model) {
        Optional<Utilisateur> utilisateurOpt = utilisateurService.getUtilisateurById(id);
        if (utilisateurOpt.isPresent()) {
            model.addAttribute("utilisateur", utilisateurOpt.get());
            return "ajouterUtilisateur";
        }
        return "redirect:/utilisateurs";
    }

   // Supprimer un utilisateur avec gestion d'erreur
    @GetMapping("/supprimer/{id}")
    public String supprimerUtilisateur(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            utilisateurService.deleteUtilisateur(id);
            redirectAttributes.addFlashAttribute("message", "✅ Utilisateur supprimé avec succès !");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("errorMessage", "❌ " + e.getMessage());
        }
        return "redirect:/utilisateurs";
}
}

