package com.bibliotheque.controllers;

import com.bibliotheque.models.Emprunt;
import com.bibliotheque.services.EmpruntService;
import com.bibliotheque.services.LivreService;
import com.bibliotheque.services.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

// Controlleur pour la gestion de l'affichage de Emprunts

@Controller
@RequestMapping("/emprunts")
public class WebEmpruntController {

    @Autowired
    private EmpruntService empruntService;

    @Autowired
    private LivreService livreService;

    @Autowired
    private UtilisateurService utilisateurService;

    // Afficher la liste des emprunts
    @GetMapping
    public String afficherEmprunts(Model model) {
        List<Emprunt> emprunts = empruntService.getAllEmprunts();
        model.addAttribute("emprunts", emprunts);
        return "emprunts";
    }

    // Formulaire d'ajout/modification
    @GetMapping("/ajouter")
    public String formulaireAjoutEmprunt(Model model) {
        model.addAttribute("emprunt", new Emprunt());
        model.addAttribute("utilisateurs", utilisateurService.getAllUtilisateurs());
        model.addAttribute("livres", livreService.getAllLivres());
        return "formulaireEmprunt";
    }

    // Formulaire de modification
    @GetMapping("/modifier/{id}")
    public String formulaireModifierEmprunt(@PathVariable Long id, Model model) {
        Optional<Emprunt> empruntOpt = empruntService.getEmpruntById(id);
        if (empruntOpt.isPresent()) {
            model.addAttribute("emprunt", empruntOpt.get());
            model.addAttribute("utilisateurs", utilisateurService.getAllUtilisateurs());
            model.addAttribute("livres", livreService.getAllLivres());
            return "formulaireEmprunt";
        }
        return "redirect:/emprunts";
    }

    // Ajouter ou modifier un emprunt
    @PostMapping("/sauvegarder")
    public String ajouterOuModifierEmprunt(@RequestParam(required = false) Long id,
                                           @RequestParam Long utilisateurId, 
                                           @RequestParam Long livreId, 
                                           @RequestParam String dateRetourPrevue,
                                           @RequestParam String statut,
                                           RedirectAttributes redirectAttributes) {  // 🔹 Ajout du paramètre
    
        if (id == null) {
            // Ajout d'un nouvel emprunt
            empruntService.emprunterLivre(utilisateurId, livreId, LocalDate.now(), LocalDate.parse(dateRetourPrevue), statut);
            redirectAttributes.addFlashAttribute("message", "📖 Emprunt ajouté avec succès !");
        } else {
            // Modification d'un emprunt existant
            Optional<Emprunt> empruntOpt = empruntService.getEmpruntById(id);
            if (empruntOpt.isPresent()) {
                Emprunt emprunt = empruntOpt.get();
                emprunt.setDateRetourPrevue(LocalDate.parse(dateRetourPrevue));
                emprunt.setStatut(statut);
                empruntService.modifierEmprunt(id, emprunt);
                redirectAttributes.addFlashAttribute("message", "📖 Emprunt modifié avec succès !");
            }
        }
    
        return "redirect:/emprunts";
    }    

    // Rendre un livre emprunter
    @GetMapping("/rendre/{id}")
    public String rendreLivre(@PathVariable Long id, RedirectAttributes redirectAttributes) {  // 🔹 Ajout du paramètre
        empruntService.rendreLivre(id);
        redirectAttributes.addFlashAttribute("message", "📖 Livre rendu avec succès !");
        return "redirect:/emprunts";
    }

}
