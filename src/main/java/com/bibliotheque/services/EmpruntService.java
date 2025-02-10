package com.bibliotheque.services;

import com.bibliotheque.models.Emprunt;
import com.bibliotheque.models.Livre;
import com.bibliotheque.models.Utilisateur;
import com.bibliotheque.repositories.EmpruntRepository;
import com.bibliotheque.repositories.LivreRepository;
import com.bibliotheque.repositories.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class EmpruntService {

    @Autowired
    private EmpruntRepository empruntRepository;

    @Autowired
    private LivreRepository livreRepository;

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    public List<Emprunt> getAllEmprunts() {
        return empruntRepository.findAll();
    }

    public Optional<Emprunt> getEmpruntById(Long id) {
        return empruntRepository.findById(id);
    }

    public String emprunterLivre(Long utilisateurId, Long livreId, LocalDate dateEmprunt, LocalDate dateRetourPrevue, String statut) {
        Optional<Utilisateur> utilisateurOpt = utilisateurRepository.findById(utilisateurId);
        Optional<Livre> livreOpt = livreRepository.findById(livreId);
    
        if (utilisateurOpt.isPresent() && livreOpt.isPresent()) {
            Livre livre = livreOpt.get();
            if (!livre.isDisponible()) {
                return "Ce livre est déjà emprunté.";
            }
    
            Emprunt emprunt = new Emprunt();
            emprunt.setUtilisateur(utilisateurOpt.get());
            emprunt.setLivre(livre);
            emprunt.setDateEmprunt(dateEmprunt != null ? dateEmprunt : LocalDate.now()); // Si null, prend la date actuelle
            emprunt.setDateRetourPrevue(dateRetourPrevue != null ? dateRetourPrevue : LocalDate.now().plusWeeks(2)); // Par défaut 2 semaines
            emprunt.setStatut(statut != null ? statut : "En cours");
    
            livre.setDisponible(false);
            livreRepository.save(livre);
            empruntRepository.save(emprunt);
    
            return "Livre emprunté avec succès.";
        }
        return "Utilisateur ou livre introuvable.";
    }

    public String modifierEmprunt(Long id, Emprunt empruntDetails) {
        Optional<Emprunt> empruntOpt = empruntRepository.findById(id);
    
        if (empruntOpt.isPresent()) {
            Emprunt emprunt = empruntOpt.get();
    
            emprunt.setDateEmprunt(empruntDetails.getDateEmprunt());
            emprunt.setDateRetourPrevue(empruntDetails.getDateRetourPrevue());
            emprunt.setStatut(empruntDetails.getStatut());
    
            empruntRepository.save(emprunt);
            return "Emprunt mis à jour avec succès.";
        }
        return "Emprunt introuvable.";
    }

    public String rendreLivre(Long id) {
        Optional<Emprunt> empruntOpt = empruntRepository.findById(id);
    
        if (empruntOpt.isPresent()) {
            Emprunt emprunt = empruntOpt.get();
    
            // Vérifier si le livre est déjà rendu
            if ("Terminé".equals(emprunt.getStatut())) {
                return "Ce livre a déjà été rendu.";
            }
    
            emprunt.setStatut("Terminé");
            emprunt.getLivre().setDisponible(true); // Rendre le livre disponible
    
            livreRepository.save(emprunt.getLivre()); // Sauvegarder l'état du livre
            empruntRepository.save(emprunt); // Sauvegarder l'emprunt mis à jour
    
            return "Livre rendu avec succès.";
        }
        return "Emprunt introuvable.";
    }

    // public String supprimerEmprunt(Long id) {
    //     empruntRepository.deleteById(id);
    //     return "Emprunt supprimer avec succès.";
    // }
}
