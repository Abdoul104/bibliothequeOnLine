package com.bibliotheque.services;

import com.bibliotheque.models.Livre;
import com.bibliotheque.models.Emprunt;
import com.bibliotheque.repositories.LivreRepository;
import com.bibliotheque.repositories.EmpruntRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LivreService {

    @Autowired
    private LivreRepository livreRepository;

    @Autowired
    private EmpruntRepository empruntRepository; 

    public List<Livre> getAllLivres() {
        return livreRepository.findAll();
    }

    public Optional<Livre> getLivreById(Long id) {
        return livreRepository.findById(id);
    }

    public Livre saveLivre(Livre livre) {
        return livreRepository.save(livre);
    }

    public void rendreLivre(Long empruntId) {
        Emprunt emprunt = empruntRepository.findById(empruntId).orElseThrow();
        emprunt.setStatut("Terminé");
        empruntRepository.save(emprunt);
    }

    public Livre updateLivre(Long id, Livre livreDetails) {
        Optional<Livre> livreOptional = livreRepository.findById(id);

        if (livreOptional.isPresent()) {
            Livre livre = livreOptional.get();
            livre.setTitre(livreDetails.getTitre());
            livre.setAuteur(livreDetails.getAuteur());
            livre.setAnneePublication(livreDetails.getAnneePublication());
            return livreRepository.save(livre);
        } else {
            throw new RuntimeException("Livre non trouvé avec l'ID : " + id);
        }
    }

    public void deleteLivre(Long id) {
        // 🔹 Vérification si le livre est lié à un emprunt
        if (empruntRepository.existsByLivreId(id)) {
            throw new RuntimeException("❌ Ce livre ne peut pas être supprimé car il est lié à un emprunt !");
        }
        livreRepository.deleteById(id);
    }
}
