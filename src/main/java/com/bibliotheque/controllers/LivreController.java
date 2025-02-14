package com.bibliotheque.controllers;

import com.bibliotheque.models.Livre;
import com.bibliotheque.services.LivreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


// Controlleur de test de l'entité Livres

@RestController
@RequestMapping("/api/livres")
public class LivreController {

    @Autowired
    private LivreService livreService;

    // Récupérer tous les livres
    @GetMapping
    public List<Livre> getAllLivres() {
        return livreService.getAllLivres();
    }
    // Récupérer un livre par l'ID
    @GetMapping("/{id}")
    public Optional<Livre> getLivreById(@PathVariable Long id) {
        return livreService.getLivreById(id);
    }
    // Ajouter un livre
    @PostMapping
    public Livre createLivre(@RequestBody Livre livre) {
        return livreService.saveLivre(livre);
    }
    // Modifier un livre
    @PutMapping("/{id}")
    public Livre updateLivre(@PathVariable Long id, @RequestBody Livre livreDetails) {
        return livreService.updateLivre(id, livreDetails);
    }
    // Supprimer un livre
    @DeleteMapping("/{id}")
    public void deleteLivre(@PathVariable Long id) {
        livreService.deleteLivre(id);
    }
}