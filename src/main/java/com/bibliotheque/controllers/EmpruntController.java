
package com.bibliotheque.controllers;

import com.bibliotheque.models.Emprunt;
import com.bibliotheque.services.EmpruntService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/emprunts")
public class EmpruntController {

    @Autowired
    private EmpruntService empruntService;

    @GetMapping
    public List<Emprunt> getAllEmprunts() {
        return empruntService.getAllEmprunts();
    }   

    @GetMapping("/{id}")
    public Optional<Emprunt> getEmpruntById(@PathVariable Long id) {
        return empruntService.getEmpruntById(id);
    }

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

    @PutMapping("/modifier/{id}")
    public String modifierEmprunt(@PathVariable Long id, @RequestBody Emprunt empruntDetails) {
        return empruntService.modifierEmprunt(id, empruntDetails);
    }

    @PostMapping("/rendre/{id}")
    public String rendreLivre(@PathVariable Long id) {
        return empruntService.rendreLivre(id);
    }

    // @DeleteMapping("/{id}")
    // public String supprimerEmprunt(@PathVariable Long id) {
    //     return empruntService.supprimerEmprunt(id);
    // }
}

