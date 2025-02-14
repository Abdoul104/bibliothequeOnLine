package com.bibliotheque.repositories;

import com.bibliotheque.models.Emprunt;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;


public interface EmpruntRepository extends JpaRepository<Emprunt, Long> {
    boolean existsByLivreId(Long livreId);  // 🔹 Vérifie si un emprunt est lié à un livre
    List<Emprunt> findByUtilisateurId(Long utilisateurId);  // 🔹 Récupère tous les emprunts d'un utilisateur
}
