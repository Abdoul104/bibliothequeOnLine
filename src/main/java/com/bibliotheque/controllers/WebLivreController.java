package com.bibliotheque.controllers;

import com.bibliotheque.models.Livre;
import com.bibliotheque.services.LivreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

// Controlleur pour la gestion de l'affichage de Livres


@Controller
public class WebLivreController {

    @Autowired
    private LivreService livreService;

    @GetMapping("/")
    public String home() {
        return "index"; 
    }

    // Récupérer tous les livres
    @GetMapping("/livres")
    public String afficherLivres(Model model) {
        model.addAttribute("livres", livreService.getAllLivres());
        return "livres";
    }

    // Afficher le formulaire d'ajout
    @GetMapping("/livres/ajouter")
    public String AfficherFormulaireAjout(Model model) {
        model.addAttribute("livre", new Livre());
        return "ajouterLivre";
    }

    // Ajouter un livre
    @PostMapping("/livres/ajouter")
    public String ajouterLivre(@ModelAttribute Livre livre, RedirectAttributes redirectAttributes){
        livreService.saveLivre(livre);
        redirectAttributes.addFlashAttribute("message", "📖 Enregistrement réussi !");
        return "redirect:/livres";
    }

    // Afficher le formulaire de modification
    @GetMapping("/livres/modifier/{id}")
    public String afficherFormulaireModification(@PathVariable Long id, Model model) {
        Optional<Livre> livreOpt = livreService.getLivreById(id);
        if (livreOpt.isPresent()){
            model.addAttribute("livre", livreOpt.get());
            return "ajouterLivre"; // Réutilise le même formulaire
        } else {
            return "redirect:/livres"; // Redirection si ID invalide
        }
    }

    // Supprimer un livre
    // @GetMapping("/livres/supprimer/{id}")
    // public String supprimerLivre(@PathVariable Long id) {
    //     livreService.deleteLivre(id);
    //     return "redirect:/livres";
    // }

    @GetMapping("livres/supprimer/{id}")
    public String supprimerLivre(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            livreService.deleteLivre(id);
            redirectAttributes.addFlashAttribute("message", "📖 Livre supprimé avec succès !");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/livres";
    }

}
