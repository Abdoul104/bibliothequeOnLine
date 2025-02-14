
package com.bibliotheque.controllers;

import com.bibliotheque.models.Emprunt;
import com.bibliotheque.services.EmpruntService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


// Controlleur de test de l'entité Emprunt

@RestController
@RequestMapping("/api/emprunts")
public class EmpruntController {

    @Autowired
    private EmpruntService empruntService;

    // Récupérer tous les emprunts
    @GetMapping
    public List<Emprunt> getAllEmprunts() {
        return empruntService.getAllEmprunts();
    }   
    // Récupérer un emprunt par l'ID
    @GetMapping("/{id}")
    public Optional<Emprunt> getEmpruntById(@PathVariable Long id) {
        return empruntService.getEmpruntById(id);
    }
    // Emprunter un livre
    @PostMapping("/ajouter")
    public String emprunterLivre(@RequestBody Emprunt emprunt) {
        return empruntService.emprunterLivre(
            emprunt.getUtilisateur().getId(),
            emprunt.getLivre().getId(),
            emprunt.getDateEmprunt(),
            emprunt.getDateRetourPrevue(),
            emprunt.getStatut()
        );
    }
    // Modifier un livre emprunté
    @PutMapping("/modifier/{id}")
    public String modifierEmprunt(@PathVariable Long id, @RequestBody Emprunt empruntDetails) {
        return empruntService.modifierEmprunt(id, empruntDetails);
    }
    // Rendre un livre emprunté
    @PostMapping("/rendre/{id}")
    public String rendreLivre(@PathVariable Long id) {
        return empruntService.rendreLivre(id);
    }
}

