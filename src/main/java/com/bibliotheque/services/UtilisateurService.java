package com.bibliotheque.services;

import com.bibliotheque.models.Utilisateur;
import com.bibliotheque.repositories.EmpruntRepository;
import com.bibliotheque.repositories.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UtilisateurService {

    private final UtilisateurRepository utilisateurRepository;
    private final EmpruntRepository empruntRepository;

    @Autowired
    public UtilisateurService(UtilisateurRepository utilisateurRepository, EmpruntRepository empruntRepository) {
        this.utilisateurRepository = utilisateurRepository;
        this.empruntRepository = empruntRepository;
    }

    public List<Utilisateur> getAllUtilisateurs() {
        return utilisateurRepository.findAll();
    }

    public Optional<Utilisateur> getUtilisateurById(Long id) {
        return utilisateurRepository.findById(id);
    }

    public Utilisateur saveUtilisateur(Utilisateur utilisateur) {
        return utilisateurRepository.save(utilisateur);
    }

    public Utilisateur updateUtilisateur(Long id, Utilisateur utilisateur) {
        return utilisateurRepository.findById(id).map(existingUtilisateur -> {
            existingUtilisateur.setNom(utilisateur.getNom());
            existingUtilisateur.setEmail(utilisateur.getEmail());
            existingUtilisateur.setnumeroTelephone(utilisateur.getnumeroTelephone());
            return utilisateurRepository.save(existingUtilisateur);
        }).orElseThrow(() -> new RuntimeException("Utilisateur non trouvé avec l'ID : " + id));
    }

    public void deleteUtilisateur(Long id) {
        if (!empruntRepository.findByUtilisateurId(id).isEmpty()) {
            throw new RuntimeException("Impossible de supprimer cet utilisateur, il a encore des emprunts actifs.");
        }
        utilisateurRepository.deleteById(id);
    }
}
