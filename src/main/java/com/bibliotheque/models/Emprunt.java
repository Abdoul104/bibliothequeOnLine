package com.bibliotheque.models;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "emprunts")
public class Emprunt {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "utilisateur_id", nullable = false)
    private Utilisateur utilisateur;

    @ManyToOne
    @JoinColumn(name = "livre_id", nullable = false)
    private Livre livre;

    private LocalDate dateEmprunt = LocalDate.now();
    private LocalDate dateRetourPrevue;
    private String statut; // "En cours" ou "Terminé"

    // Constructeur
    public Emprunt() {} // Constructeur vide obligatoire pour Hibernate

    // Constructeur parametrer
    public Emprunt(Utilisateur utilisateur, Livre livre, LocalDate dateEmprunt, LocalDate dateRetourPrevue, String statut) {
        this.utilisateur = utilisateur;
        this.livre = livre;
        this.dateEmprunt = dateEmprunt;
        this.dateRetourPrevue = dateRetourPrevue;
        this.statut = statut;
    } 

    // Getters and Setters
    public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }

    public Utilisateur getUtilisateur(){
        return utilisateur;
    }

    public void setUtilisateur(Utilisateur utilisateur){
        this.utilisateur = utilisateur;
    }

    public Livre getLivre(){
        return livre; 
    }

    public void setLivre(Livre livre){
        this.livre = livre;
    }

    public LocalDate getDateEmprunt(){
        return dateEmprunt;
    }

    public void setDateEmprunt(LocalDate dateEmprunt){
        this.dateEmprunt = dateEmprunt;
    }

    public LocalDate getDateRetourPrevue(){
        return dateRetourPrevue;
    }

    public  void setDateRetourPrevue(LocalDate dateRetourPrevue){
        this.dateRetourPrevue = dateRetourPrevue;
    }

    public String getStatut(){
        return statut; 
    }

    public void setStatut(String statut){
        this.statut = statut;
    }
}