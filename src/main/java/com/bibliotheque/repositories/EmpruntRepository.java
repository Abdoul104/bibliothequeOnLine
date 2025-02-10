package com.bibliotheque.repositories;

import com.bibliotheque.models.Emprunt;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmpruntRepository extends JpaRepository<Emprunt, Long> {
    //
}